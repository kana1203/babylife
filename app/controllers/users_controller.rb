class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = current_user.name
    @posts = user.posts
  end

end
