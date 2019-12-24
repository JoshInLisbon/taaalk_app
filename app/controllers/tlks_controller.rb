class TlksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @tlks = Tlk.all
  end

  def show
    @tlk = Tlk.includes(:participants, :messages).find(params[:id])
    @user_participants = Participant.where(tlk: @tlk, user: current_user)
    # pundit if statment?
    @message = Message.new()
  end
end
