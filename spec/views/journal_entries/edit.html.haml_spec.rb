require 'spec_helper'

describe "journal_entries/edit" do
  before(:each) do
    @journal_entry = assign(:journal_entry, stub_model(JournalEntry,
      :body => "MyText"
    ))
  end

  it "renders the edit journal_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => journal_entries_path(@journal_entry), :method => "post" do
      assert_select "textarea#journal_entry_body", :name => "journal_entry[body]"
    end
  end
end
