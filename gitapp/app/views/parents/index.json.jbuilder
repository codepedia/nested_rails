json.array!(@parents) do |parent|
  json.extract! parent, :id, :name , :lname
  json.url parent_url(parent, format: :json)
end
