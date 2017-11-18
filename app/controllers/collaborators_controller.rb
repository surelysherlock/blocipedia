class CollaboratorsController < ApplicationController

  def index 
    @collaborators = Collaborator.all 
  end 

  def show
    @collaborator = Collaborator.find(params[:id])
  end

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
  end

  def create 
    @wiki = Wiki.find(params[:wiki_id])
    @wiki.collaborators.email = params[:collaborator][:email]
    
    if @collaborator.save
      flash[:notice] = "Collaborator added"
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end


  def edit
    @collaborator = Collaborator.find(params[:id])
  end

  def update

  end
end
