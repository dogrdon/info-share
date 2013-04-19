class CommentsController < ApplicationController
#todo: commentable = find_commentable for the other methods?  
  def index
    @commentable = find_commentable
    @comments = @commentable.all
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @video = Video.find(self.params[:id])
    @comment = @video.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to video_path(@video.id)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to @comment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to comments_url
  end
  
  private
  
  def find_commentable
    params.each do |name, value|
      if name =- /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
