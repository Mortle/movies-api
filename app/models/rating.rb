# frozen_string_literal: true

# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Rating < ApplicationRecord
  belongs_to :movie
end
