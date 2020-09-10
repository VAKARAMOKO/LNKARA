class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_promo_and_classroom_path, only: [:creaete, :update]

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

    @student = classroom.students.create
    redirect_to promo_classroom_path(promo, classroom)
  end

  # PATCH/PUT /students/1
  def update

    @student = classroom.students.find(params[:id])
    student.update(student_params)
    redirect_to promo_classroom_path(promo, classroom)
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    #refactoring
    def set_promo_and_classroom_path
      @promo = current_user.promos.find(params[:promo_id])
      @classroom = current_user.classrooms.find(params[:classroom_id])
    end

    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:name, :contact, :mat_nat, :mat_school, :classroom_id)
    end
end
