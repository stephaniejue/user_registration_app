class UsersController < ApplicationController
  def index
    @user = User.find(cookies[:user])
    @phones = @user.phones

    @empty_string = ""
    @phones.each do |phone|
      @empty_string + phone.number
    end
  end

  def register
    @user = User.new
    @phone1 = Phone.new
    @phone2 = Phone.new
    @phone3 = Phone.new
    if params[:user_id].present? && params[:password].present?
      @user.name = params[:name]
      @user.address = params[:address]
      @user.city = params[:city]
      @user.state = params[:state]
      @user.postal_code = params[:postal_code]
      @user.country = params[:country]
      @user.email = params[:email]

      @phone1.number = params[:phone1]
      @phone1.description = params[:phone1_description]

      @phone2.number = params[:phone2]
      @phone2.description = params[:phone2_description]

      @phone3.number = params[:phone3]
      @phone3.description = params[:phone3_description]

      @user.phones << @phone1 << @phone2 << @phone3

      @user.user_id = params[:user_id]
      @user.password = params[:password]
      if @user.save
        cookies[:user] = @user.id
        redirect_to '/users/confirm'
      else
        redirect_to '/users/register'
      end
    end
  end

  def confirm
    @user = User.find(cookies[:user])
    @phones = @user.phones
  end

  def login
    if params[:user_id].present? && params[:password].present?
      @user = User.find_by_user_id(params[:user_id])
      if !@user.nil? && (params[:password] == @user.password)
        cookies[:user] = @user.id
        redirect_to '/users/index'
      else
        flash.now[:alert] = "Login failed, try again"
      end
    end
  end
end
