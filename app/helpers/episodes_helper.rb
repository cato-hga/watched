module EpisodesHelper
	def episode_watched?(episode)
	  current_user.episodes.pluck(:episode_id).include?(episode.id)
	end
end
