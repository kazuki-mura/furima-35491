class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/ }
         validates :nickname, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/}
         validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/}
         validates :birth_date, presence: true
         

end
