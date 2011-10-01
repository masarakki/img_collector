require 'spec_helper'

describe "board_threads/edit.html.erb" do
  before(:each) do
    @board_thread = assign(:board_thread, stub_model(BoardThread))
  end

  it "renders the edit board_thread form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => board_threads_path(@board_thread), :method => "post" do
    end
  end
end
