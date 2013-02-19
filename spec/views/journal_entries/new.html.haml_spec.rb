require 'spec_helper'

describe "journal_entries/new" do
  before(:each) do
    assign(:journal_entry, stub_model(JournalEntry,
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new journal_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => journal_entries_path, :method => "post" do
      assert_select "textarea#journal_entry_body", :name => "journal_entry[body]"
    end
  end
end
