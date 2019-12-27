class Tlk < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_many :messages

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, DateTime.now.to_date]
    ]
  end
end
