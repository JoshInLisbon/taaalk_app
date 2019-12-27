class ParticipantMailer < ApplicationMailer
  default from: 'noreply@taaalk.co'

  def unregistered_participant
    @p_email = params[:p_email]
    @tlk = params[:tlk]
    mail(to: @p_email, subject: "Invite to Taaalk from #{@tlk.user.username}")
  end
end
