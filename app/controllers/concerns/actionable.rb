# Handle common CRUD actions
module Actionable
  extend ActiveSupport::Concern

  module ClassMethods
    attr_reader :model_clazz, :model_clazz_pluralize, :permitted_params, :clazz_symbol

    private

    def actionable(clazz_symbol, permitted_params)
      @clazz_symbol = clazz_symbol
      @model_clazz = clazz_symbol.to_s.classify.constantize
      @model_clazz_pluralize = model_clazz.to_s.pluralize
      @permitted_params = permitted_params
    end
  end

  included do
    before_action :get_instance, only: %i[show edit update destroy]
  end

  def index
    @objects = policy_scope(self.class.model_clazz)

    respond_to do |format|
      format.html { render :index }
      format.turbo_stream
    end
  end

  def new
    @object = self.class.model_clazz.new
  end

  def create
    @object = self.class.model_clazz.new(permit_params)

    respond_to do |format|
      if @object.save
        message = { title: "#{self.class.model_clazz} was successfully created." }
  
        format.html { redirect_to objects_path, success: message }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @object.update(permit_params)
        message = { title: "#{self.class.model_clazz} was successfully updated." }

        format.html { redirect_to objects_path, success: message }
        format.turbo_stream { flash.now[:success] = message }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @object.destroy!

    respond_to do |format|
      message = { title: "#{self.class.model_clazz} was deleted." }

      format.html { redirect_to objects_path, success: flash }
      format.turbo_stream { flash.now[:success] = message }
    end
  end

  private

  def objects_path
    "/#{self.class.model_clazz_pluralize.downcase}"
  end

  def object_path(obj)
    "#{objects_path}/#{obj.id}"
  end

  def get_instance
    @object = authorize self.class.model_clazz.find(params[:id])
  end

  def permit_params
    params.require(self.class.clazz_symbol).permit(*self.class.permitted_params)
  end
end