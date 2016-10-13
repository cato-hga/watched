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

require 'test_helper'

class WatchedEpisodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
