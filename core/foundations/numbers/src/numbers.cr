# TODO: Write documentation for `Numbers`
module Numbers
  VERSION = "0.1.0"

  def self.sum_first_n_rec(n : Int32)
    if n == 0
      0
    else
      n + self.sum_first_n_rec(n - 1)
    end
  end

  def self.factorial_rec(n : Int32)
    if n == 0
      1
    else
      n * self.factorial_rec(n - 1)
    end
  end

  def self.fibonacci_rec(n : Int32)
    if n <= 1
      n
    else
      self.fibonacci_rec(n - 1) + self.fibonacci_rec(n - 2)
    end
  end

  def self.largest_common_divisor_rec(a : Int32, b : Int32)
    if b == 0
      a
    else
      self.largest_common_divisor_rec(b, a % b)
    end
  end

  def self.least_common_multiple_rec(a : Int32, b : Int32)
    (a * b) / self.largest_common_divisor_rec(a, b)
  end

  def self.sum_first_n_acc(n : Int32)
    self.sum_first_n_help(n, 0)
  end

  def self.sum_first_n_help(n : Int32, acc : Int32)
    if n == 0
      acc
    else
      self.sum_first_n_help(n - 1, n + acc)
    end
  end

  def self.factorial_acc(n : Int32)
    self.factorial_help(n, 1)
  end

  def self.factorial_help(n : Int32, acc : Int32)
    if n == 0
      acc
    else
      self.factorial_help(n - 1, n * acc)
    end
  end

  def self.fibonacci_acc(n : Int32)
    self.fibonacci_help(n, 0, 1)
  end

  def self.fibonacci_help(n : Int32, acc2 : Int32, acc1 : Int32) : Int32
    if n == 0
      acc2
    else
      self.fibonacci_help(n - 1, acc1, acc2 + acc1)
    end
  end

  def self.sum_first_n_iter(n : Int32)
    acc = 0
    (1..n).each do |i|
      acc += i
    end
    acc
  end

  def self.factorial_iter(n : Int32)
    acc = 1
    (1..n).each do |i|
      acc *= i
    end
    acc
  end

  def self.fibonacci_iter(n : Int32)
    if n < 1
      0
    else
      acc1 = 0
      acc2 = 1
      (1..n).each do |i|
        temp = acc1
        acc1 = acc2
        acc2 = temp + acc2
      end
      acc1
    end
  end

  def self.largest_common_divisor_iter(a : Int32, b : Int32)
    while b != 0
      temp = b
      b = a % b
      a = temp
    end
    a
  end

  def self.least_common_multiple_iter(a : Int32, b : Int32)
    (a * b) / self.largest_common_divisor_iter(a, b)
  end
end
