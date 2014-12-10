class ControlsController < ApplicationController
  before_action :set_control, only: [:show, :edit, :update, :destroy]

  # GET /controls
  # GET /controls.json
  def index
    @controls_borrowed = Control.borrowed
    @controls_returned = Control.returned.order(returned_at: :desc).paginate(:page => params[:page],:per_page => 10)
  end

  def returns
  end

  def get_control
    equipment = Equipment.find_by(
                  code_name: params['code_name'],
                  available: false
                )

    if equipment
      control = Control.find_by(equipment_id: equipment.id, returned_at: nil)

      if control
        equipment.available = true
        control.returned_at = Time.now

        if equipment.save! && control.save!
          redirect_to action: 'index'
        else
          render 'returns'
        end
      end
    else
      render 'returns'
    end
  end
 
  # GET /controls/1
  # GET /controls/1.json
  def show
    @user = User.find(@control.user_id)
    @equipment = Equipment.find(@control.equipment_id)
  end

  # GET /controls/new
  def new
    @control = Control.new
  end

  # GET /controls/1/edit
  def edit
  end

  # POST /controls
  # POST /controls.json
  def create
    @user = User.find_by(id_number: params['id_number'])
    @equipment = Equipment.find_by(code_name: params['code_name'])
    @control = Control.new    
    
    if !@user.nil? && !@equipment.nil? && @equipment.available?
      @equipment.available = false
      @equipment.save
      @control = Control.new(user_id: @user.id, equipment_id: @equipment.id)
      
      if @control.save
        head :ok
      else
        render :unprocessable_entity
      end
    else
      render :unprocessable_entity
    end
  end

  # PATCH/PUT /controls/1
  # PATCH/PUT /controls/1.json
  def update
    respond_to do |format|
      if @control.update(control_params)
        format.html { redirect_to @control, notice: 'Control was successfully updated.' }
        format.json { render :show, status: :ok, location: @control }
      else
        format.html { render :edit }
        format.json { render json: @control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /controls/1
  # DELETE /controls/1.json
  def destroy
    @equipment = Equipment.find(@control.equipment_id)
    @equipment.available = true
    @equipment.save    
    @control.destroy
    respond_to do |format|
      format.html { redirect_to controls_url, notice: 'Control was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_control
      @control = Control.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def control_params
      params.fetch(:control, {}).permit(:returned_at, :id_number, :code_name)
    end
end
