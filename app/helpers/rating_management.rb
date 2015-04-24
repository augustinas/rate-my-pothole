module RatingManagement
  def total_flags(pothole)
    Pothole.first(id: pothole.id).votes.length
  end

  def user_flagged?(user_id, pothole)
    user_votes = User.first(id: user_id).votes
    return true if user_votes.first(pothole_id: pothole.id)
    false
  end

  def weighted_score(pothole)
    Pothole.first(id: pothole.id).votes.inject(0) do |sum, vote|
      vote_value =  1 / (Time.now - vote.created_at.to_time)
      sum += vote_value
    end
  end
end
