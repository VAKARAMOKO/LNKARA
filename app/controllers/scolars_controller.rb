class ScolarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_scolar, only: [:update, :destroy]


  # POST /scolars
  def create
    promo = current_user.promos.find(params[:promo_id])
    classroom = promo.classrooms.find(params[:classroom_id])
    student = classroom.students.find(params[:student_id])
    scolar = student.scolars.new(scolar_params)
    scolar.status = 'not-started'
    scolar.save
    redirect_to promo_classroom_path(promo, classroom)
  end

  # PATCH/PUT /scolars/1
  def update

    if @scolar.update(scolar_params)
      redirect_to @scolar, notice: 'Scolar was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /scolars/1
  def destroy
    promo = current_user.promos.find(params[:promo_id])
    classroom = promo.classrooms.find(params[:classroom_id])
    student = classroom.students.find(params[:student_id])
    scolar =student.scolars.find(params[:id])
    scolar.destroy
    redirect_to promo_page_path(promo, classroom)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scolar
      @scolar = Scolar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scolar_params
      params.require(:scolar).permit(:total, :status, :student_id)
    end
end
