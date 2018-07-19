class SubscriptionsController < ApplicationController

#before_action: user_signed_in?

  def signup
	@user = current_user
	
	if @user.standart_subscriber == false
		#handle_asynchronously :deliver
    		#render 'signup'
    		#render partial: 'signup', locals: { answer: @answer}
		answer = params[:answer]
		if answer == '4'
		@user.standart_subscriber = true
		@user.subscription_date = Time.now
		@user.save
		session[:passed_variable] = @user
		#handle_asynchronously :expire, :run_at => Proc.new { 24.hours.from_now }
		redirect_to documents_path, notice: "The user #{@user.email} is subscribed now."
		#else
    		#render(html: "<script>alert('Wrong answer!')</script>".html_safe,
        	#layout: 'application')
		end
	else
		redirect_to documents_path, notice: "User already has a standart subscription! #{@user.subscription_date}"
	end
  end

  def expire
	@user = session[:passed_variable]
	@user.standart_subscriber = false
	@user.subscription_date = nil
	@user.save
  end

  def remove
  end
end

