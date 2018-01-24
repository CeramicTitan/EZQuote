class ChecklistsController < ApplicationController
  def show
    @project = Project.find(params[:project_id])
    @checklist = @project.checklist
  end
end