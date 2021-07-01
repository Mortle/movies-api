# frozen_string_literal: true

# == Schema Information
#
# Table name: ratings
#
#  id           :bigint           not null, primary key
#  creator_type :string
#  source       :string
#  system       :boolean
#  value        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  creator_id   :integer
#
class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :creator, polymorphic: true

  scope :system, -> { where(system: true) }
  scope :not_system, -> { where(system: false) }
end