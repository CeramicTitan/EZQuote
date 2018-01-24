class ProjectsController < ApplicationController
  before_action :require_user
  def index
    @projects = current_user.projects.paginate(page: params[:page], per_page: 10)
  end
  def show
    @project = Project.find(params[:id])
    @project_images = @project.images.each_slice(2)
  end
  def new
    @project = Project.new
  end
  def edit
     @project = Project.find(params[:id])  
  end
  def update
    @project = Project.find(params[:id])  
    if @project.update(project_params)
      flash[:success] = "Project was successfully updated"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end
  def upload
    @project = Project.find(params[:'project-id'])
    respond_to do |format|
    if params[:images]
        params[:images].values.each { |image|
           @project.images.create!(image: image)
          }
    end
     format.html { redirect_to project_path(@project), notice: 'Project was successfully created.' }
     format.json { render json: @project, status: :created, location: @project }
    end
  end
 def create
  @project = current_user.projects.new(project_params)

  respond_to do |format|
    if @project.save
      @checklist = Checklist.create!(:project_id => @project.id)
      if params[:images]
        params[:images].values.each { |image|
           @project.images.create!(image: image)
        }
      end

      format.html { redirect_to project_path(@project), notice: 'Project was successfully created.' }
      format.json { render json: @project, status: :created, location: @project }
    else
      format.html { render action: "new" }
      format.json { render json: @project.errors, status: :unprocessable_entity }
    end
  end
 end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:danger] = "Project was successfully deleted"
    redirect_to projects_path
  end
  end
  private
    def project_params
      params.require(:project).permit(:name,:description, :link_to_sample, :budget)
    end
  