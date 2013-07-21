object @mentee
attributes :id, :avatar_url, :birth_date, :email, :major, :name, :phone, :notes
node(:avatar_mobile_url){|m| m.avatar_url(:mobile_medium)}
node(:avatar_thumb_url){|m| m.avatar_url(:thumb)}
child :mentee_profiles, :object_root => false do
  attributes :id, :mentee_id, :edition_id, :created_at, :updated_at
end