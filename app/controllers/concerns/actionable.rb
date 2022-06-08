# Handle generic CRUD operations
module Actionable
  extend ActiveSupport::Concern

  module ClassMethods
    attr_reader :model_clazz, :model_clazz_pluralize, :permitted_params

    private

    def actionable(model_clazz, permitted_params)
      @model_clazz = model_clazz.to_s.classify.constantize
      @model_clazz_pluralize = model_clazz.to_s.pluralize
      @permitted_params = permitted_params
    end
  end

  included do
    before_action :get_instance, only: %i[show edit update destroy]
  end

  def index
    @objects = policy_scope(self.class.model_clazz)
  end

  def new
    @object = self.class.model_clazz.new
  end

  def create
    @object = self.class.model_clazz.new(permit_params)

    if @object.save
      redirect_to objects_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @object.update(category_params)
      redirect_to object_path(@object)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @object.destroy!

    redirect_to objects_path
  end

  private

  def objects_path
    "/#{model_clazz_pluralize}"
  end

  def object_path(obj)
    "#{objects_path}/#{obj.id}"
  end

  def get_instance
    @object = authorize self.class.model_clazz.find(params[:id])
  end

  def permit_params
    params.require(@model_clazz.to_sym).permit(*permitted_params)
  end
end