class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    message.save!
    tlk = Tlk.friendly.find(params['message']['tlk_id'])
    redirect_to "/tlk/#{tlk[:slug]}"
  end

  private

  def message_params
    params.require(:message).permit(:content, :tlk_id, :participant_id)
  end
end
