class TracksController < ApplicationController
  before_action :require_user

  def index
    @tracks = Track.all
    render :index
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      @album = @track.album
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def new
    @album = Album.find(params[:album_id])
    @track = Track.new(album_id: params[:album_id])
    render :new
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find()
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to album_url(@track.album_id)
  end

  private

  def track_params
    params.require(:track).permit(:title , :album_id , :ord , :bonus , :lyrics)
  end

end
