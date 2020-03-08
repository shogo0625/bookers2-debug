class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		@comment = current_user.book_comments.new(book_comment_params)
		@comment.book_id = @book.id
		if @comment.save
			render 'index'
		end
	end
	def destroy
		@book = Book.find(params[:book_id])
		@comment = current_user.book_comments.find(params[:id])
		if @comment.destroy
			render 'index'
		end
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end