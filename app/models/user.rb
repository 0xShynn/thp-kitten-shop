class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders
  has_many :items, through: :orders
  has_one_attached :avatar
  
  before_create :default_values
  after_create :send_welcome_email_to_user, :send_new_user_email_to_admin

  # Création du cart associé à l'utilisateur en même temps que l'inscription
  after_create do 
    id = User.all.last.id
    Cart.create!(user_id: id)
  end

  def send_welcome_email_to_user
    UserMailer.welcome_email_to_user(self).deliver_now!
  end

  def send_new_user_email_to_admin
    AdminMailer.new_user_email_to_admin(self).deliver_now!
  end

  private

  def default_values
    self.is_admin ||= false
  end

end

