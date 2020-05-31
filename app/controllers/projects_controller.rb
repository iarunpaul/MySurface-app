class ProjectsController < ApplicationController
  
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  	@project = Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  	@project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    
	  if @project.save
	    flash[:success] = "Project created successfully."
	    redirect_to root_path
	  else
	    flash[:danger] = "Something went wrong, please try again."
	    render "new"
	  end

  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update

  		@project = Project.find(params[:id])
   
      if @project.update_attributes(project_params)
       flash[:success] = "Project updated successfully."
       redirect_to root_path
      else
       flash[:danger] = "Data not changed."
       redirect_to root_path
      end	
    
  end

  

  
  private
       # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description)
    end


end
