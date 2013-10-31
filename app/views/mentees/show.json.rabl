object @mentee
attributes :id, :avatar_url, :birth_date, :email, :major, :name, :phone, :notes, :created_at, :updated_at
node(:avatar_mobile_url){|m| m.avatar_url(:mobile_medium)}
node(:avatar_thumb_url){|m| m.avatar_url(:thumb)}

if locals[:show_profile]
	child :active_profile => :active_profile do
	  attributes :id, :mentee_id, :edition_id, :snapshot_state, :develop_state, :lifelist_state, :created_at, :updated_at
	  child :answers, :object_root => false do
	  	attributes :id, :text_value, :number_value, :boolean_value, :mentee_profile_id, :question_id, :created_at, :updated_at
	  end
    child :lifelist_picks, :object_root => false do
      attributes :id, :mentee_profile_id, :lifelist_item_id
    end
	end
end