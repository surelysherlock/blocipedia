class WikisController < ApplicationController
  def index
      @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
      @wiki = Wiki.new
  end

  def create
      @wiki = Wiki.create(wiki_params)
      @wiki.title = params[:wiki][:title]
      @wiki.body = params[:wiki][:body]

      @wiki.user = current_user

      if @wiki.save
        flash[:notice] = "Wiki was saved"
        redirect_to @wiki
      else
        flash.now[:alert] = "Error saving Wiki"
        render :new
      end 
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :user)
  end
end
