class PracticesController < ApplicationController
  # GET /practices
  # GET /practices.json
  def index
    @practices = {}
    days = Practice.pluck(:practice_begin).map{|t| Date.strptime(t.to_s, "%Y-%m-%d") }.uniq.sort{|a,b| (-1) * (a <=> b)}
    days.each do |day|
      @practices[day] = Practice.where('practice_begin > ? AND practice_begin < ?', day, day.tomorrow)
    end
  end

  # GET /practices/1
  # GET /practices/1.json
  def show
    @practice = Practice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @practice }
    end
  end

  # GET /practices/new
  # GET /practices/new.json
  def new
    t = Time.now
    default = {
      :practice_begin => t,
      :practice_end => t + 1.hour
    }
    @songs = Song.all
    @practice = Practice.new(default)
    #@practice.song_memo.create
  end

  # GET /practices/1/edit
  def edit
    @practice = Practice.find(params[:id])
  end

  # POST /practices
  # POST /practices.json
  def create
    @practice = Practice.new(practice_params)
    p @practice
    #@song_memo = SongMemo.new(song_memo_params)
    
    respond_to do |format|
      if @practice.save!
        format.html { redirect_to '/practices', notice: 'Practice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @practice }
      else
        @songs = Song.all
        format.html { render action: 'new' }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /practices/1
  # PUT /practices/1.json
  def update
    @practice = Practice.find(params[:id])

    respond_to do |format|
      if @practice.update_attributes(params[:practice])
        format.html { redirect_to @practice, notice: 'Practice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practices/1
  # DELETE /practices/1.json
  def destroy
    @practice = Practice.find(params[:id])
    @practice.destroy

    respond_to do |format|
      format.html { redirect_to practices_url }
      format.json { head :no_content }
    end
  end
end
