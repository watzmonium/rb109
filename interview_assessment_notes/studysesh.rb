LETTERS = ('A'..'Z').to_a + ('a'..'z').to_a

def find_missing_letter(array)
  sliced_arr = []
  LETTERS.each_with_index do |letter, idx|
    if letter == array[0]
      sliced_arr = LETTERS.slice(idx, array.length)
    end
  end
  sliced_arr.difference(array)[0]
end

p find_missing_letter(["a","b","c","d","f"]) == 'e'
p find_missing_letter(["O","Q","R","S"])  == 'P'
p find_missing_letter(["b","d"]) == 'c'
p find_missing_letter(["a","b","d"]) == 'c'
p find_missing_letter(["b","d","e"]) == 'c'



=begin
PROBLEM --------------------
input - an array of consecutive letters as input
output - the missing letter in the sequence
always one letter missing and at least two letters missing, only uppercase


EXAMPLES -------------------
p find_missing_letter(["a","b","c","d","f"]) == "e"
p find_missing_letter(["O","Q","R","S"]) == "P"
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"

DATA STRUCTURES ------------
array of letters to use as comparison


ALGORITHM ------------------
compare the first entry of the array to the LETTERS array
when they match, slice the array there by the length of the input array
when the letters don't match, return that entry in the LETTERS array


=end