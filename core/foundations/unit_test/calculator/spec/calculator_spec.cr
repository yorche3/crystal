require "./spec_helper"

describe Calculator do
  # TODO: Write tests

  it "Addition test" do
    Calculator.addition(2, 3).should eq 5
  end

  it "Subtraction test" do
    Calculator.subtraction(5, 3).should eq 2
  end

  it "Multiplication test" do
    Calculator.multiplication(4, 3).should eq 12
  end

  it "Division test" do
    Calculator.division(10, 3).should eq 3
  end

  it "Modulus test" do
    Calculator.modulus(10, 3).should eq 1
  end
end
