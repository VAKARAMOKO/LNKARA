require 'test_helper'

class StudentInvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_invoice = student_invoices(:one)
  end

  test "should get index" do
    get student_invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_student_invoice_url
    assert_response :success
  end

  test "should create student_invoice" do
    assert_difference('StudentInvoice.count') do
      post student_invoices_url, params: { student_invoice: { invoice: @student_invoice.invoice, operation: @student_invoice.operation, solde: @student_invoice.solde, status: @student_invoice.status, student_id: @student_invoice.student_id } }
    end

    assert_redirected_to student_invoice_url(StudentInvoice.last)
  end

  test "should show student_invoice" do
    get student_invoice_url(@student_invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_invoice_url(@student_invoice)
    assert_response :success
  end

  test "should update student_invoice" do
    patch student_invoice_url(@student_invoice), params: { student_invoice: { invoice: @student_invoice.invoice, operation: @student_invoice.operation, solde: @student_invoice.solde, status: @student_invoice.status, student_id: @student_invoice.student_id } }
    assert_redirected_to student_invoice_url(@student_invoice)
  end

  test "should destroy student_invoice" do
    assert_difference('StudentInvoice.count', -1) do
      delete student_invoice_url(@student_invoice)
    end

    assert_redirected_to student_invoices_url
  end
end
