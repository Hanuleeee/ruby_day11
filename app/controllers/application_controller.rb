class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_signed_in?, :current_user # 이거 여기에쓰면 활용가능
  
  # 현재 로그인 된 상태니? -> 조건문으로 사용 가능
  def user_signed_in?
    session[:current_user].present?
  end
  
  # 로그인이 되어있지 않으면 로그인하는 페이지로 이동 시켜줘
  def authenticate_user!
    redirect_to '/sign_in' unless user_signed_in?
  end
  
  # 현재 로그인 된 사람이 누구니?
  def current_user
    # 현재 로그인됐니?
    @current_user = User.find(session[:current_user]) if user_signed_in?
      # 됐다면 로그인 한 사람은 누구니? (조건문 실행문 한줄이라면(if앞으로옴) end가 필요없음 )
  end
end
