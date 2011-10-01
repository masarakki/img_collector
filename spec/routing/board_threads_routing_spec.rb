require "spec_helper"

describe BoardThreadsController do
  describe "routing" do
    it "root" do
      get("/").should route_to("board_threads#index")
    end

    it "routes to #index" do
      get("/board_threads").should route_to("board_threads#index")
    end

    it "routes to #show" do
      get("/board_threads/1").should route_to("board_threads#show", :id => "1")
    end

    it "routes to #create" do
      post("/board_threads").should route_to("board_threads#create")
    end

    it "routes to #destroy" do
      delete("/board_threads/1").should route_to("board_threads#destroy", :id => "1")
    end

  end
end
