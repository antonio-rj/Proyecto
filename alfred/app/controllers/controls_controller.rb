
# Controlador para el historial.

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
                ) # Extrae el equipo de la base de datos

    if equipment # Verifica que haya encontrado el equipo
      control = Control.find_by(equipment_id: equipment.id, returned_at: nil) # Extrae el prestamo de la base de datos

      if control # Verifica que haya encontrado el prestamo
        equipment.available = true # Cambia la disponibilidad del equipo
        control.returned_at = Time.now # Extrae la fecha con que fue devuelto el dispositivo

        if equipment.save! && control.save!
          redirect_to action: 'index' # Vuelve a la pagina del historial si se actualizo correctamente la devolucion
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
    @user = User.find_by(id_number: params['id_number']) # Extrae el usuario
    @equipment = Equipment.find_by(code_name: params['code_name']) # Extrae el equipo
    @control = Control.new    
    respond_to do |format|
      if !@user.nil? && !@equipment.nil? && @equipment.available? # Revisa si el equipo se encuentra disponible; ademas, de que el usuario y el equipo existan en la base de datos
        @equipment.available = false # Cambia el estado del equipo a "No disponible".
        @equipment.save # Actualiza la disponibilidad del equipo
        @control = Control.new(user_id: @user.id, equipment_id: @equipment.id)
        puts '******************************** IF 1'  # Debug, se creo la entrada correctamente 
        if @control.save
          format.html { redirect_to @control, notice: 'Control was successfully created.' }
          format.js   { head :ok }
          puts '******************************** IF 2'  # Debug, se guardo la entrada correctamente
        else
          format.html { render :new }
          format.js   { render :unprocessable_entity }
          puts '******************************** IF 3'  # Debug, no se guardo la entrada correctamente
        end
      else
        puts '********************************** entro'  # Debug, no se pudo crear entrada
        format.html { render :unprocessable_entity }
        format.js   { render :unprocessable_entity }
      end
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
    @equipment = Equipment.find(@control.equipment_id) # Extrae el equipo que se encontraba en prestamo.
    @equipment.available = true # Coloca como disponible el equipo.
    @equipment.save    
    @control.destroy # Borra la entrada del historial.
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
