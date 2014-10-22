class SoundBitesController < ApplicationController
  before_action :set_sound_bite, only: [:show, :edit, :update, :destroy]

  # GET /sound_bites
  # GET /sound_bites.json
  def index
    @sound_bites = SoundBite.all
  end

  def comment
   Post.find(params[:id]).comments.create(params[:comment])
   redirect_to :action => "show", :id => params[:id]
end

  # GET /sound_bites/1
  # GET /sound_bites/1.json
  def show
  end

  # GET /sound_bites/new
  def new
    @sound_bite = SoundBite.new
  end

  # GET /sound_bites/1/edit
  def edit
  end

  # POST /sound_bites
  # POST /sound_bites.json
  def create
    @sound_bite = SoundBite.new(sound_bite_params)

    respond_to do |format|
      if @sound_bite.save
        format.html { redirect_to @sound_bite, notice: 'Sound bite was successfully created.' }
        format.json { render :show, status: :created, location: @sound_bite }
      else
        format.html { render :new }
        format.json { render json: @sound_bite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sound_bites/1
  # PATCH/PUT /sound_bites/1.json
  def update
    respond_to do |format|
      if @sound_bite.update(sound_bite_params)
        format.html { redirect_to @sound_bite, notice: 'Sound bite was successfully updated.' }
        format.json { render :show, status: :ok, location: @sound_bite }
      else
        format.html { render :edit }
        format.json { render json: @sound_bite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sound_bites/1
  # DELETE /sound_bites/1.json
  def destroy
    @sound_bite.destroy
    respond_to do |format|
      format.html { redirect_to sound_bites_url, notice: 'Sound bite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sound_bite
      @sound_bite = SoundBite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sound_bite_params
      params.require(:sound_bite).permit(:title, :transcript, :length, :audiofile, :recording_date)
    end
end
