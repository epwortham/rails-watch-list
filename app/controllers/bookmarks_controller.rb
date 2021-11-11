
class BookmarksController < ApplicationController
  # new, create, destroy
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
      if @bookmark.save
        redirect_to list_path(@list)
      else
        render :new
      end
  end

  def destroy
    @list = list.destroy(params[:list_id])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end


# class BookmarksController < ApplicationController
#   def new
#     @bookmark = Bookmark.new
#   end

#   def create
#     @bookmark = Bookmark.new(bookmark_params)
#     if @bookmark.save
#       redirect_to bookmarks_path(@bookmark)
#     else
#       render 'new.html.erb'
#     end
#   end

#   def destroy

#   end

#   private

#   def bookmark_params
#     params.require(:bookmark).permit(:comment)
#   end
# end
