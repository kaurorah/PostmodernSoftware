class CommentsController < ApplicationController
  # def create
  # end

  # before_action :set_sound_bite, only: [:show, :edit, :update, :destroy]

  # GET /sound_bites
  # GET /sound_bites.json
  def index
    @comments = Comment.all
  end

  # GET /sound_bites/1
  # GET /sound_bites/1.json
  def show
  end

  # GET /sound_bites/new
  def new
    @comment = Comment.new
  end

  # GET /sound_bites/1/edit
  def edit
  end

  # POST /sound_bites
  # POST /sound_bites.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sound_bites/1
  # PATCH/PUT /sound_bites/1.json
  # def update
  #   respond_to do |format|
  #     if @sound_bite.update(sound_bite_params)
  #       format.html { redirect_to @sound_bite, notice: 'Sound bite was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @sound_bite }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @sound_bite.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /sound_bites/1
  # # DELETE /sound_bites/1.json
  # def destroy
  #   @sound_bite.destroy
  #   respond_to do |format|
  #     format.html { redirect_to sound_bites_url, notice: 'Sound bite was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_sound_bite
    #   @sound_bite = SoundBite.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :sound_bite_id)
    end

end
