# coding: utf-8
class SongsController < ApplicationController
  KEYS = {
    'ハ長調' => 'C',
    'ト長調' => 'G',
    'ニ長調' => 'D',
    'イ長調' => 'A',
    'ホ長調' => 'E',
    'ロ長調' => 'B',
    '嬰ヘ長調' => 'Fs',
    '嬰ハ長調' => 'Cs',
    '変イ長調' => 'Af',
    '変ホ長調' => 'Ef',
    '変ロ長調' => 'Bf',
    'ヘ長調' => 'F',
    'イ短調' => 'Am',
    'ホ短調' => 'Em',
    'ロ短調' => 'Bm',
    '嬰ヘ短調' => 'Fsm',
    '嬰ハ短調' => 'Csm',
    '嬰ト短調' => 'Gsm',
    '嬰ニ短調' => 'Dsm',
    '嬰イ短調' => 'Asm',
    'ヘ短調' => 'Fm',
    'ハ短調' => 'Cm',
    'ト短調' => 'Gm',
    'ニ短調' => 'Dm'
  }

  # GET /songs
  # GET /songs.json
  def index
    @songs = { }
    
    cmp_names = Composer.pluck(:name)
    cmp_ids = Composer.pluck(:id)
    cmps = cmp_names.zip(cmp_ids)
    
    cmps.each do |cmp|
      @songs[cmp[0]] = Song.where('composer_id = ?', cmp[1]) 
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new
    @composers = Composer.all
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(params[:song])

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.iphone { redirect_to @song, notice: 'Song was successfully updated.' }
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.iphone { redirect_to songs_url }
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end
end
