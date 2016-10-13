module SeasonData

  # Returns an array of season id's for each season that the user has watched all of the episodes.
  # => [4, 2, 3]
  def complete_seasons
    completed_seasons = []
    total_episodes_per_season.each do |episode_data|
      matching_data = season_data.select { |season_hash| season_hash[:season] == episode_data[:season] && season_hash[:episodes_watched] == episode_data[:total_episodes] }
      completed_seasons << matching_data.first[:season] if matching_data.present?
    end
    completed_seasons
  end

  # Returns an Array of hashes that return the season_id and how many total episodes that season has
  # => [{:season=>4, :total_episodes=>8}, {:season=>3, :total_episodes=>10}, {:season=>2, :total_episodes=>10}]
  def total_episodes_per_season
    season_data.map do |season|
      season_episode_count = Season.find(season[:season]).episodes.count
      {
          season: season[:season],
          total_episodes: season_episode_count
      }
    end
  end

  # Returns an organized array of hashes of how many episodes have been watched per season
  # => [{:season=>4, :episodes_watched=>7}, {:season=>3, :episodes_watched=>5}, {:season=>2, :episodes_watched=>1}]
  def season_data
    episode_data_grouped_by_season.map do |season|
      {
          season: season[0],
          episodes_watched: season[1].count
      }
    end
  end

private

  # Groups episode_data by seasons
  # Example:
  # {4=>
  #      [{:season_id=>4, :episode_number=>2},
  #       {:season_id=>4, :episode_number=>1},
  #       {:season_id=>4, :episode_number=>3},
  #       {:season_id=>4, :episode_number=>4},
  #       {:season_id=>4, :episode_number=>5},
  #       {:season_id=>4, :episode_number=>6},
  #       {:season_id=>4, :episode_number=>7}],
  #  3=>
  #      [{:season_id=>3, :episode_number=>2},
  #       {:season_id=>3, :episode_number=>3},
  #       {:season_id=>3, :episode_number=>6},
  #       {:season_id=>3, :episode_number=>9},
  #       {:season_id=>3, :episode_number=>7}],
  #  2=>[{:season_id=>2, :episode_number=>7}]}
  #
  def episode_data_grouped_by_season
    @episode_data_by_season ||= episode_data.group_by { |episode_data| episode_data[:season_id] }
  end

  # Returns an Array of Hashes of all episodes watched with season number and episode number
  #
  # Example
  # => [{:season_id=>4, :episode_number=>2},
  #     {:season_id=>4, :episode_number=>1},
  #     {:season_id=>4, :episode_number=>3},
  #     {:season_id=>4, :episode_number=>4},
  #     {:season_id=>4, :episode_number=>5},
  #     {:season_id=>4, :episode_number=>6},
  #     {:season_id=>4, :episode_number=>7},
  #     {:season_id=>3, :episode_number=>2},
  #     {:season_id=>3, :episode_number=>3},
  #     {:season_id=>3, :episode_number=>6},
  #     {:season_id=>3, :episode_number=>9},
  #     {:season_id=>3, :episode_number=>7},
  #     {:season_id=>2, :episode_number=>7}]
  def episode_data
    watched_episodes.map do |watched_ep|
      {
          season_id: watched_ep.episode.season_id,
          episode_number: watched_ep.episode.number
      }
    end
  end

end