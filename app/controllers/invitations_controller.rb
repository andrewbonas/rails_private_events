class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new
    @invitation.save
  end
  

end
