class TlksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @tlks = Tlk.includes(:participants)
  end

  def show
    @tlk = Tlk.includes(:participants, :messages).friendly.find(params[:id])
    @user_participants = Participant.where(tlk: @tlk, user: current_user)
    @message = Message.new()
  end

  def new
    @tlk = Tlk.new()
  end

  def create
    @tlk = Tlk.new(tlk_params)
    @tlk.user = current_user
    @tlk.save!
    create_self_participant
    create_external_participants
    redirect_to "/tlk/#{@tlk.slug}"
  end

  private

  def tlk_params
    params.require(:tlk).permit(:title, :description)
  end

  def create_self_participant
    self_params = params.require(:tlk).permit(:name, :bio)
    participant = Participant.new(self_params)
    participant.user = current_user
    participant.email = current_user.email
    participant.pending = false
    participant.tlk = @tlk
    participant.save!
  end

  def create_external_participants
    @p_email = params.require(:tlk).permit(:p_email)[:p_email]
    if User.find_by_email(@p_email)
      # ParticipantMailer.with(tlk: @tlk).unregistered_participant.deliver_later
      puts "nothing"
    else
      # ParticipantsMailer.with(tlk: @tlk, p_email: @p_email).unregistered_participant.deliver_now
    end
  end

end
