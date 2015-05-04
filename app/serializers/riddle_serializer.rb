class RiddleSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer, :points, :lat, :lon, :user_id
end
