# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  birthdate              :date             not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           default(""), not null
#  phone                  :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  slug                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  portfolio_id           :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_portfolio_id          (portfolio_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#
class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  rolify

  after_create :assign_default_role
  before_validation :validate_birthdate

  has_many :contributions
  belongs_to :portfolio

  devise(
    :database_authenticatable,
    :recoverable,
    :rememberable,
    :validatable
  )

  validates :name, presence: true, length: { minimum: 3, maximum: 40 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP },
                    length: { minimum: 3, maximum: 50 }
  validates :phone, presence: true, uniqueness: true, format: { with: /\A\+?[0-9]{10,15}\z/ },
                    length: { minimum: 10, maximum: 15 }
  validates :birthdate, presence: true
  validates :portfolio, presence: true

  def current_role
    roles&.first
  end

  def role
    roles&.order(:id)&.first&.name
  end

  def role_add(role)
    roles.destroy_all
    add_role(role)
  end

  def admin?
    has_role?(:admin)
  end

  def partner?
    has_role?(:partner)
  end

  private

  def assign_default_role
    add_role(:partner) if roles.blank?
  end

  def validate_birthdate
    return if birthdate.blank?

    errors.add(:birthdate, "can't be greater than today's date") if birthdate > Date.today
  end
end
