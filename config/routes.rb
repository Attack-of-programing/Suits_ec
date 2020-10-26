Rails.application.routes.draw do

  # ルートパスを会員TOPページに設定
  root 'customer/homes#top'
  # 会員TOPページ
  get '/admin' => 'admin/homes#top'
  # 会員紹介ページ
  get '/about' => 'customer/homes#about', as: 'about'


  
  devise_for :customers,skip: :all
  devise_scope :customer do
    #サインアップ
    get 'customers/sign_up' =>'customers/registrations#new', as: :new_customer_registration
    post 'customers'=>'customers/registrations#create', as: :customer_registration
    #ログイン、ログアウト
    get 'customers/sign_in'=>'customers/sessions#new',as: :new_customer_session
    post 'customers/sign_in'=>'customers/sessions#create',as: :customer_session
    delete 'customers/sign_out' =>'customers/sessions#destroy', as: :destroy_customer_session
  end
  
  # 管理者ログイン画面のルーティング
  # セッションパス修正admin→admins
  # devise_for :admins, controllers: {
  #   sessions: 'admins/sessions'
  # }
  
  devise_for :admins,skip: :all
  devise_scope :admin do
    #ログイン、ログアウト
    get 'admins/sign_in'=>'admins/sessions#new',as: :new_admin_session
    post 'admins/sign_in'=>'admins/sessions#create',as: :admin_session
    delete 'admins/sign_out' =>'admins/sessions#destroy', as: :destroy_admin_session
  end
  

  # 管理者側の各機能のルーティング
  # namespaseでURLとコントローラのパスの頭に「/admin」が入るようにする
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :products, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :order_products, only: [:update]
  end

  # 会員側のルーティング
  # scope moduleでコントローラのパスのみ頭に「/customer」が入るようにする
  scope module: :customer do
    # 今回は他会員の情報を利用しないため、resource(単数形)にすることでURLに:idを含めないようにする
    resource :customers, only: [:show,:edit,:update] do
      # RESTfulなURL以外は個別にcollectionで設定する
      collection do
        # URLとコントローラアクション名が一致しない場合のみ、個別にコントローラのパスを指定する
        get 'withdrawal' => 'customers#withdrawal_show'
        patch 'withdrawal'
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      # RESTfulなURL以外は個別にcollectionで設定する
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
    resources :products, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      # RESTfulなURL以外は個別にcollectionで設定する
      collection do
        # URLとコントローラアクション名が一致しない場合のみ、個別にコントローラのパスを指定する
        delete '' => 'cart_items#destroy_all'
      end
    end
    resources :shippings, only: [:index, :edit, :create, :update, :destroy]
    resources :order_products, only: [:update]
  end

end
