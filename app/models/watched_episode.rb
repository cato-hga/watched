# == Schema Information
#
# Table name: watched_episodes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  episode_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WatchedEpisode < ApplicationRecord
	belongs_to :episode
	belongs_to :user
end
