class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :destroy ,:update]
  # POST /comments
  # POST /comments.json
  def create

    @movie = Movie.find(params[:movie_id ])
    @comment = @movie.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to movies_path(@movie), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to movies_path(@movie), notice: 'Comment was not  created.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
#redirect_to movies_path(@comment.movie_id) ,notice: 'Deleted successfully.'//movies_url, notice: 'Movie was successfully destroyed.'
  def destroy
    #@comment = @movie.comments.new(comment_params)
    @comment.destroy
      respond_to do |format| 
        #format.html {  redirect_to movies_url, notice: 'Movie was successfully destroyed.'} 
        #format.json { head :no_content } 
      end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :author, :content, :rating, :movie_id)
    end
end
