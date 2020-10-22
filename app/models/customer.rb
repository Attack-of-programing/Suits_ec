class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 多重度の設定
  has_many :shippings,dependent: :destroy
<<<<<<< HEAD
  
=======
  has_many :cart_items,dependent: :destroy
  
  # バリデーションチェック
>>>>>>> 5fd908575959246a2bef8082c7e18aa760b585bf
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
<<<<<<< HEAD
  
  def active_for_authentication?
   super && (self.is_deleted == false)
  end
  #ログインするときに退会済のユーザーを弾く為のメソッド
  
  
=======

  def full_name
    self.last_name + self.first_name
  end

  def full_name_kana
    self.last_name_kana + self.first_name_kana
  end

>>>>>>> 5fd908575959246a2bef8082c7e18aa760b585bf
end
