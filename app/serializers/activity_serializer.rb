class ActivitySerializer
  include JSONAPI::Serializer
  
  attributes :id, :name

  attribute :category_name do |object|
    object.category.name
  end

  attribute :completed do |object, params|
    params[:completed_activity_ids].include?(object.id)
  end
end
