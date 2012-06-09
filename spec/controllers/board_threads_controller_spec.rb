require 'spec_helper'

describe BoardThreadsController do

  describe "GET index" do
    it "assigns all board_threads as @board_threads" do
      board_threads = FactoryGirl.create_list(:board_thread, 3)
      get :index
      assigns(:board_threads).should == board_threads
    end
  end

  describe "GET show" do
    before do
      @board_thread = FactoryGirl.create(:board_thread)
    end
    it "assigns the requested board_thread as @board_thread" do
      get :show, :id => @board_thread.id
      assigns(:board_thread).should == @board_thread
    end
    it "assign @type" do
      get :show, :id => @board_thread.id
      assigns(:type).should == :finished
    end
  end

  describe "GET queue" do
    before do
      @board_thread = FactoryGirl.create(:board_thread)
    end
    it "assigns the requested board_thread as @board_thread" do
      get :queue, :id => @board_thread.id
      assigns(:board_thread).should == @board_thread
    end
    it "assign @type" do
      get :queue, :id => @board_thread.id
      assigns(:type).should == :queued
    end
  end

  describe "POST create" do
    let(:url) { "http://kilauea.bbspink.com/test/read.cgi/megami/1330282190/" }
    describe "with valid url" do
      before do
        @mock_thread = Mona::Thread.from_url(url)
        @mock_thread.should_receive(:reload) { true }
        @mock_thread.should_receive(:title) { 'unko' }
        Mona::Thread.stub(:from_url) { @mock_thread }
      end

      it "creates a new BoardThread" do
        expect {
          post :create, :board_thread => {:url => url }
        }.to change(BoardThread, :count).by(1)
      end

      it "assigns a newly created board_thread as @board_thread" do
        post :create, :board_thread => {:url => url }
        assigns(:board_thread).should be_a(BoardThread)
        assigns(:board_thread).should be_persisted
      end

      it "redirects to the created board_thread" do
        post :create, :board_thread => {:url => url }
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
      board_thread = FactoryGirl.create(:board_thread)
      expect {
        delete :destroy, :id => board_thread.id.to_s
      }.to change(BoardThread, :count).by(-1)
    end

    it "redirects to the board_threads list" do
      board_thread = FactoryGirl.create(:board_thread)
      delete :destroy, :id => board_thread.id.to_s
      response.should redirect_to(root_url)
    end
  end

end
