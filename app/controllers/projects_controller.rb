class ProjectsController < ApplicationController
  before_action :require_user
  def index
  end
  def new
    @project = Project.new
  end
  def edit
  end
 def create
    @project = Project.new(project_params)

  respond_to do |format|
    #upload images before saving project
      if params[:images]
          @project.images.create!(params[:images])
      end
    if @project.save

      format.html { redirect_to @project, notice: 'Project was successfully created.' }
      format.json { render json: @project, status: :created, location: @project }
    else
      format.html { render action: "new" }
      format.json { render json: @project.errors, status: :unprocessable_entity }
    end
  end
end
  def destroy
  end
  private
    def project_params
      params.require(:project).permit(:project_name,:project_description, :link_to_sample, :budget, :images)
    end

end