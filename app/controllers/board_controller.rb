class BoardController < ApplicationController
  # filter
  before_action :set_post, only: [:show, :edit, :update, :destroy] # only ~일때만, set_post를 먼저 실행
  # before_action :set_post, except: [:index, :new, :create]
  # 로그인 된 상태에서만 접속할 수 있는 페이지는?
  # 목차, show만 로그인 하지않은 상태에서 볼 수 있게
  # 나머지는 반드시 로그인이 필요하게
  before_action :authenticate_user!, except: [:index, :show]
  
  
  def index
    @posts = Post.all
    @current_user = current_user
    @title = "여기는 제목"
    p current_user #application_controller에서 정의된 method
  end

  def show
  end

  def new
  end
  
  def create
    # new + save를 한꺼번에 진행하는 create 메서드
    post = Post.create(post_params)
    #post.title = params[:title]
    #post.contents = params[:contents]
    #post.user_id = current_user.id # 외래키 #current_user도 하나의 메소드인데 변수처럼 사용가능
    #post.save
    # post를 등록할 때 이글을 작성한 사람은 현재 로그인되어 있는 유저이다.
  
    redirect_to "/board/#{post.id}"
  end

  def edit
  end
  
  def update
    # 원래 있던 내용물을 바로 update시킴
    @post.update(post_params)
    #@post.title = params[:title]
    #@post.contents = params[:contents]
    #@post.save
    redirect_to "/board/#{@post.id}"
  end
  
  def destroy
    @post.destroy
    redirect_to '/boards'
  end
  
  def set_post
    @post = Post.find(params[:id]) # 반복되는거 한번만 쓰고 method로 지정해서 씀
  end

  private
  
  def post_params
    {title: params[:title], contents: params[:contents], user_id: current_user.id}
  end
  
end
