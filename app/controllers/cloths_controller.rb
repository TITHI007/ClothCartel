class ClothsController < ApplicationController
  before_action :set_cloth, only: %i[ show edit update destroy ]
  before_action :set_location, only: %i[new edit]
  # GET /cloths or /cloths.json
  def index
    location_id = current_user.locations.pluck(:id)
    @cloths = Cloth.where(location_id: location_id)
  end

  # GET /cloths/1 or /cloths/1.json
  def show
    cloth = Cloth.find(params[:id])
    if cloth.image != nil
      @img = Base64.decode64(cloth.image)
    end
  end

  # GET /cloths/new
  def new
    @cloth = Cloth.new
    # @locations=current_user.locations
  end

  # GET /cloths/1/edit
  def edit
  end

  # POST /cloths or /cloths.json
  def create
    @cloth = Cloth.new(cloth_params)
    clothImage = params[:cloth][:image]
    @cloth.image = Base64.strict_encode64(clothImage.read)
    # @cloth.location_id =current_user.locations.sample.id
    respond_to do |format|
      if @cloth.save
        ClothMailer.with(user: current_user, cloth: @cloth).cloth_created.deliver_later
        format.html { redirect_to cloth_url(@cloth), notice: "Cloth was successfully created." }
        format.json { render :show, status: :created, location: @cloth }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cloths/1 or /cloths/1.json
  def update
    clothImage = params[:cloth][:image]
    if clothImage != nil
      @cloth.image = Base64.strict_encode64(clothImage.read)
    end
    respond_to do |format|
      if @cloth.update(cloth_params)
        format.html { redirect_to cloth_url(@cloth), notice: "Cloth was successfully updated." }
        format.json { render :show, status: :ok, location: @cloth }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cloths/1 or /cloths/1.json
  def destroy
    @cloth.destroy!

    respond_to do |format|
      format.html { redirect_to cloths_url, notice: "Cloth was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cloth
      @cloth = Cloth.find(params[:id])
    end

    def set_location
      @locations = current_user.locations
    end
      # Only allow a list of trusted parameters through.
    def cloth_params
      params.require(:cloth).permit(:name, :description, :cost, :location_id)
    end
end
