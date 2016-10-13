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

class Episode < ApplicationRecord
  belongs_to :season
  # has_many :watched_episodes
  # has_many :users, through: :watched_episodes
end
