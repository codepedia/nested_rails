class ChildrenController < ApplicationController
  before_action :find_parent
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
     @children = @parent.children
  end

  def show
  end

  def new
     @child = Child.new
  end

  def edit
  end

  def create
    @child = @parent.children.new(child_params)

    if @child.save
      redirect_to parent_child_path(@parent, @child), notice: 'Child was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @child = @parent.Child.find(params[:id])
        format.html { redirect_to [@parent, @child], notice: 'Child was successfully updated.' }
        format.json { render :show, status: :ok, location: @child }
      else
        format.html { render :edit }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @child.destroy
    respond_to do |format|
      format.html { redirect_to parent_children_path(@parent) , notice: 'Child was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_child
       @child = @parent.children.find(params[:id])
    end

    def child_params
      params.require(:child).permit(:name)
    end
end
