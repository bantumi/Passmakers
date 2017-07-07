class CamprighesController < ApplicationController
  before_action :set_camprighe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /camprighes
  # GET /camprighes.json
  def index
    @camprighes = Camprighe.all
  end

  # GET /camprighes/1
  # GET /camprighes/1.json
  def show
  end

  # GET /camprighes/new
  def new
    @camprighe = Camprighe.new
  end

  # GET /camprighes/1/edit
  def edit
  end

  # POST /camprighes
  # POST /camprighes.json
  def create
    @camprighe = Camprighe.new(camprighe_params)

    respond_to do |format|
      if @camprighe.save
        format.html { redirect_to @camprighe, notice: 'Camprighe was successfully created.' }
        format.json { render :show, status: :created, location: @camprighe }
      else
        format.html { render :new }
        format.json { render json: @camprighe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camprighes/1
  # PATCH/PUT /camprighes/1.json
  def update
    respond_to do |format|
      if @camprighe.update(camprighe_params)
        format.html { redirect_to @camprighe, notice: 'Camprighe was successfully updated.' }
        format.json { render :show, status: :ok, location: @camprighe }
      else
        format.html { render :edit }
        format.json { render json: @camprighe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camprighes/1
  # DELETE /camprighes/1.json
  def destroy
    @camprighe.destroy
    respond_to do |format|
      format.html { redirect_to camprighes_url, notice: 'Camprighe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camprighe
      @camprighe = Camprighe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camprighe_params
      params.require(:camprighe).permit(:camp_id, :contact_id)
    end
end
