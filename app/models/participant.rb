class Participant < ApplicationRecord
  belongs_to :tlk
  belongs_to :user
  has_many :messages
end
