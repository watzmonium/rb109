def prime_check(number)
  2.upto(number) do |num|
    if number % num == 0 && num != number
      return true
    end
  end
  false
end

def odd_not_prime(number)
  odd_unprime = 1
  1.upto(number) do |num|
    if num.odd? && prime_check(num)
      odd_unprime += 1 
    end
  end
  odd_unprime
end

p odd_not_prime(15)
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20

=begin
PROBLEM --------------------
determine how many positive ints less than or equal to x are odd but not prime
x is between 1 and 10000


EXAMPLES -------------------

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20


DATA STRUCTURES ------------




ALGORITHM ------------------





=end