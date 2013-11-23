object @lifelist
attributes :id, :edition_id
child :lifelist_items, :object_root => false do
  attributes :id, :title, :lifelist_category_id
end