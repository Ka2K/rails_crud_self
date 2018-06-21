class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  #method를 만들어놓고 helper_mothod로 하면 전역에서 사용하겠다는 의미. "VIEW"에서 편하게 메소드 호출을 하기위해서.
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
    # session에 저장되어 있는 경우
    # @user에 user를 찾아서 저장한다.
    # ||= 으로 저장하는 이유는 @user가 비어있는 경우에만 저장하기 위해서 (Sql문을 계속 돌리지 않기 위해서)
  end

  def authorize
    # 접근하고자 하는 사람이 실제로 권한이 있는지 없는지 확인 => login 유무를 통해서 확인 가능
    if current_user.nil?
      flash[:alert] = "로그인을 해주세요."
      redirect_to '/'
    end
  end

end
