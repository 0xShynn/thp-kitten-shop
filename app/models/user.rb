class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders
  has_many :items, through: :orders

  after_create :welcome_send
  before_save  :default_values

  # Création du cart associé à l'utilisateur en même temps que l'inscription
  after_create do 
    id = User.all.last.id
    Cart.create!(user_id: id)
  end

  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now!
  end

  def default_values
    self.is_admin = false
    true
  end
end

