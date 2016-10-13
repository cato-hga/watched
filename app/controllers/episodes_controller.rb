class EpisodesController < ApplicationController
  before_action :authenticate_user!

  def index
    @episodes = Episode.order released_at: :desc
  end

  def marked_as_watched 
  	@episode = Episode.find(params[:id])
  	@watched_episode = WatchedEpisode.new
  	@watched_episode.user_id = current_user.id
  	@watched_episode.episode_id = @episode.id
  	if @watched_episode.save
  		redirect_to root_url
  	else
  		render root
  	end
  end
end
