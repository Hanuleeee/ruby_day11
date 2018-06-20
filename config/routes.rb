Rails.application.routes.draw do
    # 지금이 형태가 가장 restful하게 짜여진 route
    root 'board#index'
    get '/boards' => 'board#index'
    get '/board/new' => 'board#new'
    get '/board/:id' => 'board#show'
    post '/boards' => 'board#create'
    get '/board/:id/edit' => 'board#edit'
    put '/board/:id' => 'board#update'    # 다 지우고 다시등록
    patch '/board/:id' => 'board#update'  # 똑같은 모양인데 http요청방식에따라 부른다?
    delete '/board/:id' => 'board#destroy'
    
    #User
  
    #전체목록
  get '/users' => 'user#index'
  #회원가입
  get '/user/sign_up' => 'user#sign_up'
  get '/sign_in' => 'user#sign_in'
  post '/sign_in' => 'user#login'
  get '/logout' => 'user#logout'
  post '/users' => 'user#create'
  #해당 회원 정보 보여주기
  get '/user/:id'  => 'user#show'
  #정보수정
  get '/user/:id/edit' => 'user#edit'
  put '/user/:id'  =>'user#update'
  patch '/user/:id' =>'user#update'

    # 카페
    get '/cafes' => 'cafe#index'
    get '/'
end
