class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    #passwordは英数字混合
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    #sei,meiは漢字、ひらがな、カタカナのみ
    validates :sei,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :mei,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    #kana_sei,kana_meiはカタカナのみ
    validates :kana_sei,format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :kana_mei,format: {with: /\A[ァ-ヶー－]+\z/ }
  end
end