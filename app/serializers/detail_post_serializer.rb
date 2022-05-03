class DetailPostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :writer
  has_many :comments
end
