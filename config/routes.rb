Rails.application.routes.draw do
  
  # ルートパスを会員TOPページに設定
  root 'customer/homes#top'
  # 会員TOPページ
  get '/admin' => 'admin/homes#top'
  # 会員紹介ページ
  get '/about' => 'customer/homes#about', as: 'about'
  
  
  # devise関連のコントローラのルーティングを任意のパスに変更
  devise_for :customers, controllers: {
    registrations: 'customer/registrations',
    sessions: 'customer/sessions'
  }
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  
  
end
