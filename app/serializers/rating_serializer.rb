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
class RatingSerializer
  include JSONAPI::Serializer

  attributes :value, :source

  attribute :creator do
    {
      creator_type: creator&.type,
      creator_id: creator&.id
    }
  end
end
