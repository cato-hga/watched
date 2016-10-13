class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
  	@watched_episodes = current_user.watched_episodes
  	@completed_seasons = current_user.complete_seasons
  end
end
