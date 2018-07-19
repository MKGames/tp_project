class SubscriptionsController < ApplicationController

#before_action: user_signed_in?

  def signup
	@user = current_user
	
	if @user.standart_subscriber == false
	
    		#render 'signup'
    		#render partial: 'signup', locals: { answer: @answer}
		answer = params[:answer]
		if answer == '4'
		@user.standart_subscriber = true
		@user.save
		redirect_to documents_path, notice: "The user #{@user.email} is subscribed now."
		#else
    		#render(html: "<script>alert('Wrong answer!')</script>".html_safe,
        	#layout: 'application')
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
