class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    unless User.find_by(email: params[:email])
      # User.create로 하지 않는 이유는 new/save로 해야 true/false로 저장을 함..?
      # app/models/user.rb에  'has_secure_password' 해줬음...
      @user = User.new(username: params[:username],
                       email: params[:email],
                       # migration 파일에는 password_digest column으로 설정해줬지만 두개로 나눠서 해석한다.?
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
      if @user.save
        #가입이 되면, true -> 저장이 되고
        flash[:notice] = "가입을 축하합니다."
        redirect_to '/'
      else
        #비밀번호가 달라서 가입이 안되면, false -> 저장이 안됨
        flash[:alert] = "비밀번호가 다릅니다."
        redirect_to :back
      end
    else
      flash[:alert] = "이미 등록된 이메일입니다."
      redirect_to :back
    end
  end
  #   # 1. email 검증 User.find_by(email: 값)
  #   unless User.find_by(email: params[:email])
  #   # 1-1. 맞으면, 비밀번호 확인
  #     if params[:password] == params[:password_confirmation]
  #   # 1-1-1. 비밀번호가 같으면 가입
  #       user = User.create(username: params[:username],
  #                   email: params[:email],
  #                   password: params[:password])
  #       flash[:notice] = "#{user.username}님 회원가입을 축하합니다."
  #       redirect_to '/'
  #   # 1-1-1. 비밀번호가 틀리면, flash 메세지로 비밀번호가 일치하지 않습니다. redirect
  #     else
  #       flash[:alert] = "비밀번호가 일치하지 않습니다."
  #       redirect_to :back
  #     end
  #   # 1-2. 틀리면, flash 메세지로 가입된 이메일입니다. redirect_to :back
  #   else
  #     flash[:alert] = "가입된 이메일입니다."
  #     redirect_to :back
  #   end
  # end

  def login
  end

  def loginprocess
      #1. 이메일이 가입되었는지 확인
      user = User.find_by(email: params[:email])
      #1-1. 가입이 되었으면, 비밀번호 확인
      if user
        if user.authenticate(params[:password])
      #1-1-1. 비밀번호가 일치하면, 로그인
        session[:user_id] = user.id # session에 많은 정보를 저장하면 서버에 부하가 심하기 떄문에 id값만 저장하기.
        flash[:notice] = "#{user.username}님 로그인되셨습니다."
        redirect_to '/'
      #1=1=2. 비밀번호가 다르면, flash 메세지로 비밀번호가 일치하지 않습니다. redirect
        else
          flash[:alert] = "비밀번호가 다릅니다."
          redirect_to :back
        end
      #1-2. 가입이 안되었으면, flash + 가입하는 곳으로 보내기
      else
      flash[:alert] = "가입되지 않은 이메일입니다."
      redirect_to '/signup'
    end
  end

  def logout
    session.clear
    flash[:notice] = "로그아웃 되셨습니다."
    redirect_to '/'
  end

  def posts
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
