require 'spec_helper'

describe "board_threads/new.html.erb" do
  before(:each) do
    assign(:board_thread, stub_model(BoardThread).as_new_record)
  end

  it "renders new board_thread form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => board_threads_path, :method => "post" do
    end
  end
end
