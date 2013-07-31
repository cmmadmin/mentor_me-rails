node(:mentees) do
  @mentees.map do |mentee|
    partial 'mentees/show', :object => mentee, :locals => {:show_profile => true}
  end
end

node(:editions) do
  @editions.map do |edition|
    partial 'editions/show', :object => edition, :locals => {:show_questions => true}
  end
end


# this.mentees.reset(<%= j render(template: 'mentees/index', 
# 	formats: :json, collection: @mentees, :locals => {:show_profile => true}).html_safe %>)