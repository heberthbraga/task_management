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

    flash[:notice] = { 
      title: 'Discussion moved', 
      body: 'Lorem ipsum dolor sit amet consectetur adipisicing elit oluptatum tenetur.',
      timeout: 5,
      countdown: true
    }
  end

  def new
    @object = self.class.model_clazz.new
  end

  def create
    @object = self.class.model_clazz.new(permit_params)

    if @object.save
      respond_to do |format|
        format.html { redirect_to objects_path, success: "#{self.class.model_clazz} successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @object.update(permit_params)
      respond_to do |format|
        format.html { redirect_to objects_path, success: "#{self.class.model_clazz} successfully updated." }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @object.destroy!

    respond_to do |format|
      format.html { redirect_to objects_path, success: 'Deleted!' }
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