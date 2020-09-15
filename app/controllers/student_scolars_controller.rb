class StudentScolarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_scolar, only: [:update, :destroy]

  # POST /student_scolars
  def create
    promo = current_user.promos.friendly.find(params[:promo_id])
    classroom = promo.classrooms.friendly.find(params[:classroom_id])
    student = classroom.students.find(params[:student_id])
    student_scolar = student.student_scolars.new(student_scolar_params)
    student_scolar.status = "not-started" #Vers Iniatial
    student_scolar.save
    redirect_to promo_classroom_path(promo, classroom)

  end

  # GET /student_scolars
  def index
    @student_scolars = StudentScolar.all
  end

  # GET /student_scolars/1
  def show
  end

  # GET /student_scolars/new
  def new
    @student_scolar = StudentScolar.new
  end

  # GET /student_scolars/1/edit
  def edit
  end


  # PATCH/PUT /student_scolars/1
  def update
    if @student_scolar.update(student_scolar_params)
      redirect_to @student_scolar, notice: 'student scolar was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /student_scolars/1

  def destroy
    promo = current_user.promos.freindly.find(params[:promo_id])
    classroom = promo.classrooms.freindly.find(params[:classroom_id])
    student = classroom.students.freindly.find(params[:student_id])
    student_scolar = student.student_scolars.find(params[:id])
    student_scolar.destroy
    redirect_to promo_page_path(promo, page)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_scolar
      @student_scolar = StudentScolar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_scolar_params
      params.require(:student_scolar).permit(:total, :status, :student_id)
    end

end
