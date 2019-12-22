class TlksController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @tlks = Tlk.all
  end
end
