# TODO: Write documentation for `Calculator`
module Calculator
  VERSION = "0.1.0"

  # TODO: Put your code here
  def self.addition(a : Int32, b : Int32) : Int32
    a + b
  end

  def self.subtraction(a : Int32, b : Int32) : Int32
    a - b
  end

  def self.multiplication(a : Int32, b : Int32) : Int32
    result = 0
    (1..b).each do |i|
      result = addition(result, a)
    end
    result
  end

  def self.division(a : Int32, b : Int32) : Int32
    quotient = 0
    remainder = a
    while remainder >= b
      remainder = subtraction(remainder, b)
      quotient = addition(quotient, 1)
    end
    quotient
  end

  def self.modulus(a : Int32, b : Int32) : Int32
    quotient = division(a, b)
    subtraction(a, multiplication(b, quotient))
  end
end