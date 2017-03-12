class Bot < ApplicationRecord
  resourcify

  has_many :bot_instances

  validates :name, length: { minimum: 3 }

  def eligible_collaborators
    User.where.not(:id => User.with_role(:owner, self).pluck(:id))
        .where.not(:id => User.with_role(:collaborator, self).pluck(:id))
        .order(:username)
        .map{ |u| [u.username, u.id] }
  end

  def preferred_instance
    BotInstance.where(bot: self)
               .where('last_ping > ?', 3.minutes.ago)
               .first
  end
end
