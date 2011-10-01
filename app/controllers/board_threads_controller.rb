class BoardThreadsController < ApplicationController
  # GET /board_threads
  # GET /board_threads.json
  def index
    @board_threads = BoardThread.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @board_threads }
    end
  end

  # GET /board_threads/1
  # GET /board_threads/1.json
  def show
    @board_thread = BoardThread.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @board_thread }
    end
  end

  # POST /board_threads
  # POST /board_threads.json
  def create
    @board_thread = BoardThread.new(params[:board_thread])

    respond_to do |format|
      if @board_thread.save
        format.html { redirect_to @board_thread, notice: 'Board thread was successfully created.' }
        format.json { render json: @board_thread, status: :created, location: @board_thread }
      else
        format.html { render action: "index" }
        format.json { render json: @board_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_threads/1
  # DELETE /board_threads/1.json
  def destroy
    @board_thread = BoardThread.find(params[:id])
    @board_thread.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :ok }
    end
  end
end
