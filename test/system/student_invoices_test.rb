require "application_system_test_case"

class StudentInvoicesTest < ApplicationSystemTestCase
  setup do
    @student_invoice = student_invoices(:one)
  end

  test "visiting the index" do
    visit student_invoices_url
    assert_selector "h1", text: "Student Invoices"
  end

  test "creating a Student invoice" do
    visit student_invoices_url
    click_on "New Student Invoice"

    fill_in "Invoice", with: @student_invoice.invoice
    fill_in "Operation", with: @student_invoice.operation
    fill_in "Solde", with: @student_invoice.solde
    fill_in "Status", with: @student_invoice.status
    fill_in "Student", with: @student_invoice.student_id
    click_on "Create Student invoice"

    assert_text "Student invoice was successfully created"
    click_on "Back"
  end

  test "updating a Student invoice" do
    visit student_invoices_url
    click_on "Edit", match: :first

    fill_in "Invoice", with: @student_invoice.invoice
    fill_in "Operation", with: @student_invoice.operation
    fill_in "Solde", with: @student_invoice.solde
    fill_in "Status", with: @student_invoice.status
    fill_in "Student", with: @student_invoice.student_id
    click_on "Update Student invoice"

    assert_text "Student invoice was successfully updated"
    click_on "Back"
  end

  test "destroying a Student invoice" do
    visit student_invoices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student invoice was successfully destroyed"
  end
end
