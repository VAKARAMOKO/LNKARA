class ClassroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_promo
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]
  before_action :set_base_breadcrumbs, only: [:show, :new, :edit]
  # GET /classrooms
  def index
    @classrooms = Classroom.all
  end

  # GET /classrooms/1
  def show
    add_breadcrumb(@classroom.title)
    @student = @classroom.students.build
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  def create
    @classroom = @promo.classrooms.build(classroom_params)

    if @classroom.save
      redirect_to promo_classroom_path(@promo, @classroom), notice: 'Classroom was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /classrooms/1
  def update
    if @classroom.update(classroom_params)
      redirect_to promo_classroom_path(@promo, @classroom), notice: 'Classroom was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /classrooms/1
  def destroy
    @classroom.destroy
    redirect_to @promo, notice: 'Classroom was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

     # e.g. /promos/5/classrooms
    def set_promo
      @promo = current_user.promos.find(params[:promo_id])
    end

    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def classroom_params
      params.require(:classroom).permit(:title, :slug, :promo_id)
    end

    def set_base_breadcrumbs
      add_breadcrumb('Promos', promos_path)
      add_breadcrumb(@promo.title, promo_path(@promo))
    end
end
