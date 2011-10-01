require 'spec_helper'

describe "board_threads/show.html.erb" do
  before(:each) do
    @board_thread = assign(:board_thread, stub_model(BoardThread))
  end

  it "renders attributes in <p>" do
    render
  end
end
