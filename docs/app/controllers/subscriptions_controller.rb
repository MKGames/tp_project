class SubscriptionsController < ApplicationController

#before_action: user_signed_in?

  def signup
	@user = current_user
	answer = params[:answer]
		if answer == '2'
		@user.standart_subscriber = true
		@user.subscription_date = Time.now
		@user.save
		session[:passed_variable] = @user
		redirect_to documents_path, notice: "The user #{@user.email} is subscribed now."
		elsif answer == '4'
		@user.tear2_subscriber = true
		@user.tear2_time = Time.now
		@user.save
		session[:passed_variable] = @user
		redirect_to documents_path, notice: "The user #{@user.email} is subscribed now."
		elsif answer == '6'
		@user.tear3_subscriber = true
		@user.tear3_time = Time.now
		@user.save
		session[:passed_variable] = @user
		redirect_to documents_path, notice: "The user #{@user.email} is subscribed now."
		end
	#if @user.standart_subscriber = true && @user.tear2_subscriber = true && @user.tear3_subscriber = true
	#	redirect_to documents_path, notice: "User already has all subscribtions! #{@user.subscription_date}"
	#end
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

