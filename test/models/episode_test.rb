# == Schema Information
#
# Table name: episodes
#
#  id          :integer          not null, primary key
#  title       :string
#  season_id   :integer
#  number      :integer
#  plot        :text
#  released_at :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class EpisodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
