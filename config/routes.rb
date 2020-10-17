Rails.application.routes.draw do

  #管理者deviseのコントローラーのパスを任意のパスに変更
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  #会員deviseのコントローラーのパスを任意のパスに変更
  devise_for :customers,controllers: {
    registrations: 'customer/registrations',
    sessions: 'customer/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #ルートパスを会員のTOPページに設定
  root 'customer/homes#top'
  #about ページのルーティング
  get '/about' => 'customer/homes#about'
  #管理者トップページのルーティング
  get '/admin' => 'admin/homes#top'

  

end
