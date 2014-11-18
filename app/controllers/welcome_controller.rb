class WelcomeController < ApplicationController

  def index

    @user = User.new

    if params.has_key?(:referral_code)
      referrer = User.where(referral_code: params[:referral_code]).first!

      if referrer.present?
        @user.referrer_id = referrer.id
      end
    end

  end

  def signup

    @user = User.new(user_params)
    @user.referral_code = SecureRandom.uuid

    if @user.save
      redirect_to action: :signup_success, referral_code: @user.referral_code
    else
      render action: :index
    end

  end

  def signup_success
    referral_code = params[:referral_code]
    base_url = request.host

    @referral_url = "#{base_url}/?referral_code=#{referral_code}"
  end

  private
  def user_params
    params.require(:user).permit(:email, :referrer_id)
  end

end
