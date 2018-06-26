class UserController < ApplicationController
  def index
    @Users = User.all
    @current_user = User.find(session[:current_user]) if session[:current_user] # 꺼내서 쓸 때 
  end

  def sign_up

  end
  
  def create
    new = User.new
    new.user_id = params[:user_id]
    new.password = params[:password]
    new.ip_address = request.ip
    new.save
    
    redirect_to "/user/#{new.id}"
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
 
  def update
    user = User.find(params[:id])
    user.user_id = params[:user_id]
    user.password = params[:password]
    user.ip_address = request.ip
    user.save
    
    redirect_to "/users"
  end
  
  def sign_in
    @sign_up ="안돼 돌아가 배고파.."
      # 로그인 되어있는지 확인하고, 
      # 로그인 되어있으면 원래 페이지로 돌아가기
    session.delete(:user_id)
  end
  
  def login
    #유저가 입력한 ID,PW를 바탕으로 실제로 로그인이 이루어지는 곳
    id = params[:user_id]
    pw = params[:password]
    user = User.find_by_user_id(id) #find는 id column밖에 못찾음 Thus, user_id로 찾기위해서 find_by_user_id를 사용
    # If. where을 사용해서 찾으면, if !user.empty?라고 해야함 
    if !user.nil? and user.password.eql?(pw)   # or if !user.present? 
      # 해당 user_id로 가입한 유저가 있고, 패스워드도 일치하는 경우
      session[:current_user] = user.id
      flash[:success] = "로그인에 성공했습니다."
      redirect_to '/users'
    else
    # 가입한 user_id가 없거나, 패스워드가 틀린 경우
    flash[:error] = "가입된 유저가 아니거나, 비밀번호가 틀립니다."
    redirect_to '/sign_in'
    end
  end
  
  def logout
      session.delete(:current_user)
      flash[:success] = "로그아웃에 성공했습니다."
      redirect_to '/users'
  end
end