require "test_helper"

describe Employee do
  let(:employee) { Employee.new }

  it "must be valid" do
    value(employee).must_be :valid?
  end
end
