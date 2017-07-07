class CamptestaController < ApplicationController
  before_action :set_camptestum, only: [:show, :edit, :update, :destroy , :addClienti]
  before_action :authenticate_user!

  # GET /camptesta
  # GET /camptesta.json
  def index
    @camptesta = Camptestum.all
  end

  def addClienToCampaign
      @contatto = Contact.find(params[:user_id])
      @campagna = Camptestum.find(params[:camp_id])

      @campriga = Camprighe.new
      @campriga.camp_id = @campagna.id
      @campriga.contact_id =  @contatto.id
      respond_to do |format|
        if @campriga.save
          format.html { redirect_to "/camptesta/#{@campagna.id}/addClienti", notice: 'campriga was successfully Updated.' }
          format.json { render :addClienToCampaign, status: :created, location: @campagna }
        else
          format.html { render :new }
          format.json { render json: @campagna.errors, status: :unprocessable_entity }
        end
      end
  end

  def removeClienToCampaign
      contatto = Contact.find(params[:user_id])
      campagna = Camptestum.find(params[:camp_id])

      campRiga = Camprighe.where("contact_id = ? AND camp_id = ? ",contatto.id,campagna.id).first

      Camprighe.destroy(campRiga.id)
      respond_to do |format|
        format.html { redirect_to "/camptesta/#{campagna.id}/addClienti", notice: 'campriga was successfully Updated.' }
        format.json { render :addClienToCampaign, status: :created, location: @campagna }
      end
  end

  def addClienti
    @contacts = Contact.where("user_id = ?",current_user.id).order("updated_at DESC")
  end



  # GET /camptesta/1
  # GET /camptesta/1.json
  def show
  end

  # GET /camptesta/new
  def new
    @camptestum = Camptestum.new
  end

  def another_create

  end

  # GET /camptesta/1/edit
  def edit
  end

  # POST /camptesta
  # POST /camptesta.json
  def create
    @camptestum = Camptestum.new(camptestum_params)

    respond_to do |format|
      if @camptestum.save
        format.html { redirect_to @camptestum, notice: 'Camptestum was successfully created.' }
        format.json { render :show, status: :created, location: @camptestum }
      else
        format.html { render :new }
        format.json { render json: @camptestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camptesta/1
  # PATCH/PUT /camptesta/1.json
  def update
    respond_to do |format|
      if @camptestum.update(camptestum_params)
        format.html { redirect_to @camptestum, notice: 'Camptestum was successfully updated.' }
        format.json { render :show, status: :ok, location: @camptestum }
      else
        format.html { render :edit }
        format.json { render json: @camptestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camptesta/1
  # DELETE /camptesta/1.json
  def destroy
    @camptestum.destroy
    respond_to do |format|
      format.html { redirect_to camptesta_url, notice: 'Camptestum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camptestum
      @camptestum = Camptestum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camptestum_params
      params.require(:camptestum).permit(:descrizione, :user_id, :tipo)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camprighe_params
      params.require(:camprighe).permit(:camp_id, :contact_id)
    end
end
