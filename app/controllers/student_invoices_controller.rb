class StudentInvoicesController < ApplicationController
  before_action :set_student_invoice, only: [:show, :edit, :update, :destroy]

  # GET /student_invoices
  def index
    @student_invoices = StudentInvoice.all
  end

  # GET /student_invoices/1
  def show
  end

  # GET /student_invoices/new
  def new
    @student_invoice = StudentInvoice.new
  end

  # GET /student_invoices/1/edit
  def edit
  end

  # POST /student_invoices
  def create
    @student_invoice = StudentInvoice.new(student_invoice_params)

    if @student_invoice.save
      redirect_to @student_invoice, notice: 'Student invoice was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /student_invoices/1
  def update
    if @student_invoice.update(student_invoice_params)
      redirect_to @student_invoice, notice: 'Student invoice was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /student_invoices/1
  def destroy
    @student_invoice.destroy
    redirect_to student_invoices_url, notice: 'Student invoice was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_invoice
      @student_invoice = StudentInvoice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_invoice_params
      params.require(:student_invoice).permit(:solde, :operation, :invoice, :status, :student_id)
    end
end
