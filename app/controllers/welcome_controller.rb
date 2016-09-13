class WelcomeController < ApplicationController
  # Index action to retrieve all posts
  def index
    @posts = Post.all.limit(3).order('created_at desc')
  end
end
