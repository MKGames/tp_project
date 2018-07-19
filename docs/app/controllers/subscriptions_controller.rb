class SubscriptionsController < ApplicationController
subscriptions

before_action: user_signed_in?

  def signup
	answer = params[:answer]
	@user = User.current_user
	if @user.standart_subscriber == false
		if answer == '3'
		@user.standart_subscriber = true
		@user.save
		else
    		render(html: "<script>alert('Wrong answer!')</script>".html_safe,
        	layout: 'application')
		end
	else
		render(html: "<script>alert('User already has a standart subscription!')</script>".html_safe,
        	layout: 'application')
	end
  end

  def expire
  end

  def remove
  end
end
