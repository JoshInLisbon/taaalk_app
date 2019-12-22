class Message < ApplicationRecord
  belongs_to :participant
  belongs_to :user
  belongs_to :tlk
  has_rich_text :content

  def create
    Message.create!(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
