require "test_helper"

describe Employee do

  should belong_to(:company)

  it "must be invalid if no name and no company" do
    value(Employee.new).wont_be :valid?
  end

  let(:employee) { FactoryGirl.create(:employee) }

  it "must be valid" do
    value(employee).must_be :valid?
  end

  it "must have a identifier" do
    value(employee.identifier).must_match /([A-Z]{4})-([A-Z]{4})-([A-Z]{4})/
  end

  it "must not generate new identifier when already exists" do
    identifier = employee.identifier
    employee.touch
    value(employee.identifier).must_equal identifier
  end

  it "must touch the company it belongs to when edited" do
    updated_at = employee.company.updated_at
    employee.touch
    value(employee.company.updated_at).wont_equal updated_at
  end
end
