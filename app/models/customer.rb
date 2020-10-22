class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 多重度の設定
  has_many :shippings,dependent: :destroy
  has_many :cart_items,dependent: :destroy
  
end
