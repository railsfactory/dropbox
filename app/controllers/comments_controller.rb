class CommentsController < ApplicationController
	def create
		@gallery = current_user.galleries.find(params[:gallery_id])
		comment = @gallery.comments.create
		comment.comment = params[:comment][:comment]
		comment.user = current_user
		comment.save
		render 'create.js.erb'
	end
end
