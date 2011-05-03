class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :zip, :email, :password, :password_confirmation, :remember_me

  #validations
  validates_presence_of :role
  validates_presence_of :full_name

  # hooks
  before_validation :set_role

  belongs_to :role


  def role_symbols
    [role.name.to_sym]
  end



  private

  # before_validation
  def set_role
    self.role ||= Role.find_by_name("cousin")
  end
end
