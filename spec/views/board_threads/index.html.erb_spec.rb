require 'spec_helper'

describe "board_threads/index.html.erb" do
  before(:each) do
    assign(:board_threads, [
      stub_model(BoardThread),
      stub_model(BoardThread)
    ])
  end

  it "renders a list of board_threads" do
    render
  end
end
