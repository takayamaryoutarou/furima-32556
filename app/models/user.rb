class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
   
   
   validates :name                
   validates :birthday           
   validates :first_name,         format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Kanji / Hiragana / Katakana input characters." }
   validates :last_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Kanji / Hiragana / Katakana input characters." }
   validates :first_name_kana,    format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Katakana input characters." }
   validates :last_name_kana,     format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Katakana input characters." }
  end
  has_many :items

  has_many :purchase

  validates :password,  format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Encrypted password is invalid. Please enter alphanumeric characters." }
end
