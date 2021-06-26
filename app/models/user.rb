class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/ }
         
       with_options presence: true do
         validates :nickname
         validates :birth_date

         with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
          validates :last_name 
          validates :first_name
         end

         with_options  format: { with: /\A[ァ-ヶ]+\z/} do
          validates :last_name_kana
          validates :first_name_kana
         end
       end
  
  has_many :items
  
end
