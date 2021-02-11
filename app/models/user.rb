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
    with_options format: {with: /\A[ぁ-んァ-ン一-龥々]/} do
      validates :sei
      validates :mei
    end
    #kana_sei,kana_meiはカタカナのみ
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :kana_sei
      validates :kana_mei
    end
  end
end