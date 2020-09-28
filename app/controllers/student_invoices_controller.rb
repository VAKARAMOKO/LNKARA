class StudentInvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_invoice, only: [:update, :destroy]


  # POST /student_invoices
  def create
    promo = curent_user.promos.friendly.find(params[:promo_id])
    classroom = promo.classrooms.friendly.find(params[:classroom_id])
    student = classroom.students.friendly.find(params[:student_id])
    student_invoice = student.student_invoices.new(student_invoice_params)
    student_invoice.status= "not-started"
    student_invoice.save
    redirect_to promo_classroom_path(promo, classroom)
  end

  def update
     if @student_invoice.update(student_invoice_params)
      redirect_to @student_invoice, notice: 'paiement was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /student_invoices/1
  def destroy
    promo = current_user.promos.friendly.find(params[:promo_id])
    classroom = promo.classrooms.friendly.find(params[:classroom_id])
    student = classrom.students.friendly.find(params[student_id])
    student_invoice = student.student_invoices.find(params[:id])
    student_invoice.destroy
    redirect_to promo_classroom_path(promo, classroom)
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
