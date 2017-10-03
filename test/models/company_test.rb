require "test_helper"

describe Company do

  it "must be invalid if no name" do
    value(Company.new).wont_be :valid?
  end

  let(:company) { FactoryGirl.create(:company) }

  it "must be valid" do
    value(company).must_be :valid?
  end

  it "must have a identity" do
    value(company.identity).must_match /([A-Z]{4})\:([A-Z]{4})/
  end

  it "must not generate new identity when already exists" do
    identity = company.identity
    company.touch
    value(company.identity).must_equal identity
  end

  it "must destroy all its employees when destroyed" do
    company.employees.create(first_name: 'test', last_name: 'name')
    value(Employee.count).must_equal 1
    company.destroy
    value(Employee.count).must_equal 0
  end
end
