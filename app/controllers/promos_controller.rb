class PromosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_promo, only: [:show, :edit, :update, :destroy]
    before_action :set_base_breadcrumbs, only: [:show, :new, :edit]
  # GET /promos
  def index
    @promos = current_user.promos
  end

  # GET /promos/1
  def show
    add_breadcrumb(@promo.title)
  end

  # GET /promos/new
  def new
    @promo = current_user.promos.build
  end

  # GET /promos/1/edit
  def edit
  end

  # POST /promos
  def create
    #@promo.code_school = current_user.code_school
    @promo = current_user.promos.build(promo_params)

    if @promo.save
      redirect_to @promo, notice: 'Promo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /promos/1
  def update
    if @promo.update(promo_params)
      redirect_to @promo, notice: 'Promo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /promos/1
  def destroy
    @promo.destroy
    redirect_to promos_url, notice: 'Promo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promo
      @promo = Promo.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def promo_params
      params.require(:promo).permit(:title)
    end

    def set_base_breadcrumbs
      add_breadcrumb('Proms', promos_path)
    end
end
