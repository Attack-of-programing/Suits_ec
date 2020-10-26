class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 多重度の設定
  has_many :shippings,dependent: :destroy
  has_many :cart_items,dependent: :destroy
  has_many :orders,dependent: :destroy
  
  
  # バリデーションチェック

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postcode, presence: true, length: { is: 7 }, format: { with: /\A[0-9]+\z/ }
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

  def full_name
    self.last_name + self.first_name
  end

  def full_name_kana
    self.last_name_kana + self.first_name_kana
  end

  
  def active_for_authentication?
   super && (self.is_deleted == false)
  end
  #ログインするときに退会済のユーザーを弾く為のメソッド
  
end
