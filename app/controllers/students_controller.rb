class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update, :destroy]


  # GET /students
  def index
    @students = Student.all
  end

  # GET /students/1
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end


  # POST /students
  def create
    promo = current_user.promos.friendly.find(params[:promo_id])
    classroom = promo.classrooms.friendly.find(params[:classroom_id])
    student = classroom.students.create
    redirect_to promo_classroom_path(promo, classroom)
  end

  # PATCH/PUT /students/1
  def update
    promo = current_user.promos.friendly.find(params[:promo_id])
    classroom = promo.classrooms.friendly.find(params[:classroom_id])
    student = classroom.students.friendly.find(params[:id])
    student.update(student_params)
    redirect_to promo_page_path(promo, classroom)
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    def set_student
      @student = Student.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:name, :contact, :mat_nat, :mat_school, :slug, :classroom_id)
    end
end
