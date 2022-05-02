class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :writer
  belongs_to :post
end
