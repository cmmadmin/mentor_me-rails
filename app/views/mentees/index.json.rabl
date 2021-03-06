collection @mentees
attributes :id, :avatar_url, :birth_date, :email, :major, :name, :phone, :notes, :created_at, :updated_at
node(:avatar_mobile_url){|m| m.avatar_url(:mobile_medium)}
node(:avatar_thumb_url){|m| m.avatar_url(:thumb)}

#if locals[:show_profile]
	child :active_profile => :active_profile do
	  attributes :id, :mentee_id, :edition_id, :created_at, :updated_at, :develop_goal_ids, :develop_item_ids
	  child :answers, :object_root => false do
	  	attributes :id, :text_value, :number_value, :boolean_value, :mentee_profile_id, :question_id, :created_at, :updated_at
	  end
	end
#end