class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  # Index action to render all Projects
  def index
    @projects = Project.all.order('created_at desc')
  end

  # New action to create new projects
  def new
    @project = Project.new
  end

  #Create action to save new projects into the db
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project successfully saved"
      redirect_to @project
    else
      flash[:alert] = "Ooops!Something went wrong"
      render 'new'
    end
  end

  # Show action to render a project after retireving its id
  def show
  end

  # Edit action to edit projects
  def edit
  end

  # Update action to update old projects with new projects
  def update
    if  @project.update(project_params)
      flash[:notice] = "Project successfully updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  # Destroy action to permanently remove a project from a database
  def destroy
    @project.destroy
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :link,:slug)
  end
  def find_project
    @project = Project.friendly.find(params[:id])
  end
end
