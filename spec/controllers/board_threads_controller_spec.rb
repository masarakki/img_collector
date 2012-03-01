require 'spec_helper'

describe BoardThreadsController do

  # This should return the minimal set of attributes required to create a valid
  # BoardThread. As you add validations to BoardThread, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      title: 'unko',
      hostname: 'localhost',
      board_key: 'board_001',
      thread_key: 'thread_001',
    }
  end

  describe "GET index" do
    it "assigns all board_threads as @board_threads" do
      board_thread = BoardThread.create! valid_attributes
      get :index
      assigns(:board_threads).should eq([board_thread])
    end
  end

  describe "GET show" do
    it "assigns the requested board_thread as @board_thread" do
      board_thread = BoardThread.create! valid_attributes
      get :show, :id => board_thread.id.to_s
      assigns(:board_thread).should eq(board_thread)
    end
  end

  describe "POST create" do
    describe "with valid url" do
      before do
        @mock_thread = Mona::Thread.from_url("http://kilauea.bbspink.com/test/read.cgi/megami/1330282190/")
        @mock_thread.should_receive(:reload) { true }
        @mock_thread.should_receive(:title) { 'unko' }
        Mona::Thread.stub(:from_url).with("valid_url") { @mock_thread }
      end

      it "creates a new BoardThread" do
        expect {
          post :create, :board_thread => {:url => 'valid_url' }
        }.to change(BoardThread, :count).by(1)
      end

      it "assigns a newly created board_thread as @board_thread" do
        post :create, :board_thread => {:url => 'valid_url' }
        assigns(:board_thread).should be_a(BoardThread)
        assigns(:board_thread).should be_persisted
      end

      it "redirects to the created board_thread" do
        post :create, :board_thread => {:url => 'valid_url' }
        response.should redirect_to(BoardThread.last)
      end
    end

    describe "with invalid url" do

      it "assigns a newly created but unsaved board_thread as @board_thread" do
        BoardThread.any_instance.stub(:save).and_return(false)
        post :create, :board_thread => {}
        assigns(:board_thread).should be_a_new(BoardThread)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested board_thread" do
      board_thread = BoardThread.create! valid_attributes
      expect {
        delete :destroy, :id => board_thread.id.to_s
      }.to change(BoardThread, :count).by(-1)
    end

    it "redirects to the board_threads list" do
      board_thread = BoardThread.create! valid_attributes
      delete :destroy, :id => board_thread.id.to_s
      response.should redirect_to(root_url)
    end
  end

end
