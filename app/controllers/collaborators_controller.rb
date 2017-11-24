class CollaboratorsController < ApplicationController

  def index 
    @collaborators = Collaborator.all 
  end 

  def show
    @collaborator = Collaborator.find(params[:wiki_id])
  end

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
  end

  def create 
    @wiki = Wiki.find(params[:wiki_id])
    collaborator = @wiki.collaborators.new(collaborator_params)
    
    if collaborator.save
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

  def destroy
    @collaborator = Collaborator.find(params[:wiki_id])

    if @collaborator.destroy
      flash[:notice] = "\"#{@collaborator.email}\" was removed from collaborators."
      redirect_to wiki_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  def update

  end

  private
  def collaborator_params
    params.require(:collaborator).permit(:email)
  end
end
