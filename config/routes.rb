Rails.application.routes.draw do
  resources :themes
    # 지금이 형태가 가장 restful하게 짜여진 route
    root 'board#index'
    get '/boards' => 'board#index'
    get '/board/new' => 'board#new'
    get '/board/:id' => 'board#show'
    post '/boards' => 'board#create'
    get '/board/:id/edit' => 'board#edit'
    put '/board/:id' => 'board#update'    # PUT은 해당 자원이 통채로 교체되는 것(수정)을 의미하며 PATCH는 해당 자원의 일부분만 변경되는 것을 의미
    patch '/board/:id' => 'board#update'  # 똑같은 모양인데 http요청방식에따라 부른다? 왜 둘다쓰는거야근데?
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
end
