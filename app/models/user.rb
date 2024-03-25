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
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#
class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  rolify

  after_create :assign_default_role

  devise(
    :database_authenticatable,
    :recoverable,
    :rememberable,
    :validatable,
    :registerable
  )

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

  def super_admin?
    has_role?(:super_admin)
  end

  def admin?
    has_role?(:admin)
  end

  def assign_default_role
    add_role(:partner) if roles.blank?
  end
end
