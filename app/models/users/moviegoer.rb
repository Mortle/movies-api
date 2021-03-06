# frozen_string_literal: true

# == Schema Information
#
# Table name: moviegoers
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_moviegoers_on_confirmation_token    (confirmation_token) UNIQUE
#  index_moviegoers_on_email                 (email) UNIQUE
#  index_moviegoers_on_reset_password_token  (reset_password_token) UNIQUE
#  index_moviegoers_on_uid_and_provider      (uid,provider) UNIQUE
#
module Users
  class Moviegoer < ActiveRecord::Base
    self.table_name = :moviegoers

    extend Devise::Models
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    include DeviseTokenAuth::Concerns::User

    has_many :ratings, as: :creator, dependent: :destroy

    validates :email, presence: true

    def cinema_owner?
      false
    end
  end
end
