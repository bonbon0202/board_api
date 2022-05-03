class DetailPostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :writer
end
