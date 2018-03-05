class ChecklistItemsController < ApplicationController
  def change_status
    @checklist_item = ChecklistItem.find(params[:id])
    @checklist_item.toggle!(:complete)
    flash[:info] = "Status has been toggled!"
    redirect_to project_checklist_path(:project_id => params[:project_id])
  end
  def new
    @project = Project.find(params[:project_id])
    @checklist_item = ChecklistItem.new
  end
  def create
    @project = Project.find(params[:project_id])
    respond_to do |format|
     @project.checklist.checklist_items.create!(checklist_item_params)
     flash[:success] = "Checklist item successfully added."
     format.html { redirect_to project_checklist_path(@project), notice: 'Item successfully added' }
     format.json { render json: @project, status: :created, location: @project }
    end
  end
  def update
    @project = Project.find(params[:project_id])
    @checklist_item = ChecklistItem.find(params[:id])
    respond_to do |format|
      if @checklist_item.update(checklist_item_params)
        format.html { redirect_to project_checklist_path(@project), notice: "Checklist item successfully updated." }
        format.json { render json: @project, status: :created, location: @project }
      end
    end
  end
  def edit
    @project = Project.find(params[:project_id])
    @checklist_item = ChecklistItem.find(params[:id])
  end
  def destroy
    @checklist_item = ChecklistItem.find(params[:id])
    @checklist_item.destroy
    flash[:danger] = "Checklist Item was successfully deleted"
    redirect_to project_checklist_path(:project_id => params[:project_id])
  end
  private 
    def checklist_item_params
    params.require(:checklist_item).permit(:description)
  end
end