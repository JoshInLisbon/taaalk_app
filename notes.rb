! # Devise

# skip_before_action :authenticate_user!, only: :index

# To verify if a user is signed in, use the following helper:
# user_signed_in?

# For the current signed-in user, this helper is available:
# current_user

# You can access the session for this scope:
# user_session

# What if I want to add a first_name and last_name at sign up?

# class ApplicationController < ActionController::Base
#   # [...]
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   def configure_permitted_parameters
#     # For additional fields in app/views/devise/registrations/new.html.erb
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

#     # For additional in app/views/devise/registrations/edit.html.erb
#     devise_parameter_sanitizer.permit(:account_update, keys: [:username])
#   end
# end

! # Inivites from instance creations (from Kokoon)

# create_table "rentals", force: :cascade do |t|
#     t.bigint "flat_id"
#     t.date "start_date"
#     t.date "end_date"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.integer "tenant_id"
! #     t.string "tenant_email"
#     t.boolean "pending", default: true
#     t.integer "price_cents", default: 0, null: false
#     t.index ["flat_id"], name: "index_rentals_on_flat_id"
#   end

# def create
#   @rental = Rental.new(rental_params)
#   @rental.flat = @flat
#   authorize @flat
#   if @rental.save
#     UserMailer.with(rental: @rental).invitation.deliver_now
#     redirect_to flat_path(@flat)
#   else
#     render 'new'
#   end
# end

! # Mailer

class ParticipantsMailer < ApplicationMailer
  default from: 'noreply@taaalk.co'

  def unregistered_participant
    @p_email = params[:p_email]
    @tlk = params[:tlk]
    mail(to: @p_email, subject: "Invite to Taaalk from #{@tlk.user.username}")
  end
end

# views/participants_mailer/unregistered_participant.html.erb

<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <h1>Welcome to Taaalk.com</h1>
    <p>
      You have successfully signed up to example.com,
      your username is: <%= link_to nil, "https://taaalk.co/tlk/#{@tlk.slug}" %>.<br>
    </p>
    <p>Thanks for joining and have a great day!</p>
  </body>
</html>
