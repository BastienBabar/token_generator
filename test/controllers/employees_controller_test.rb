require "test_helper"

describe EmployeesController do
  let(:employee) { employees :one }

  it "gets index" do
    get employees_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_employee_url
    value(response).must_be :success?
  end

  it "creates employee" do
    expect {
      post employees_url, params: { employee: { first_name: employee.first_name, identifier: employee.identifier, last_name: employee.last_name } }
    }.must_change "Employee.count"

    must_redirect_to employee_path(Employee.last)
  end

  it "shows employee" do
    get employee_url(employee)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_employee_url(employee)
    value(response).must_be :success?
  end

  it "updates employee" do
    patch employee_url(employee), params: { employee: { first_name: employee.first_name, identifier: employee.identifier, last_name: employee.last_name } }
    must_redirect_to employee_path(employee)
  end

  it "destroys employee" do
    expect {
      delete employee_url(employee)
    }.must_change "Employee.count", -1

    must_redirect_to employees_path
  end
end
