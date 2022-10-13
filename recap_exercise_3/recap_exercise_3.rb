

def no_dupes?(arr)
    counts = Hash.new(0)
    arr.each { |ele| counts[ele] += 1 }
    counts.select! { |k, v| v == 1}
    counts.keys
end


# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(array)
    i = 0 
    while i < array.length - 1
        return false if array[i] == array[i + 1]
        i += 1
    end
    true
end
 
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true
 
 
 
def char_indices(str)
    indices = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |char, i| indices[char] << i }
    indices
end
 
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
 
 
def longest_streak(str)
    i = 0 
    #count = 0 
    max = 0 
    streakers = []
    while i < str.length 
        count = 0 
        char = str[i]
        while char == str[i]
            count += 1
            i += 1
        end

        if count >= max 
            max = count 
            streakers << char * count
        end
    end
    streakers[-1]
end
 
 
 p longest_streak('a')           # => 'a'
 p longest_streak('accccbbb')    # => 'cccc'
 p longest_streak('aaaxyyyyyzz') # => 'yyyyy
 p longest_streak('aaabbb')      # => 'bbb'
 p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    factors = []
    (2...num).each { |i| factors << i if prime?(i) && num % i == 0 }
    return true if factors.length == 2 && factors[0] * factors[1] == num
    return true if factors.length == 1 && factors[0] * factors[0] == num
    false
end

def prime?(num)
    (2...num).none? { |i| num % i == 0 }
end

#  Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

 
def vigenere_cipher(str, arr)
    alph = ("a".."z").to_a
    cipher = ""
    str.each_char.with_index do |char, i|
        idx = alph.index(char)
        new_idx = idx + arr[i % arr.length]
        cipher += alph[new_idx % 26]
    end
    cipher
end

#  Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
 
 
def vowel_rotate(str)
    vowels = []
    letters = str.split("")

    letters.each_with_index { |char, i| vowels << char if "aeiou".include?(char)}
    rotated = vowels.rotate(-1)
    letters.each_with_index do |char, i|
        if "aeiou".include?(char)
            letters[i] = rotated.shift
        end
    end
    letters.join("")
end
 
 
#  Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"
 
class String
    def select(&prc)
        return "" if prc.nil?
        self.split("").select { |char| prc.call(char) }.join("")
    end
 
# Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select                                     # => ""
 
    def map!(&blk)
        self.each_char.with_index do |char, i|
            self[i] = blk.call(char, i)
        end
        self
    end
#  Examples
#    word_1 = "Lovelace"
#    word_1.map! do |ch| 
#        if ch == 'e'
#            '3'
#        elsif ch == 'a'
#            '4'
#        else
#            ch
#        end
#    end
#    p word_1        # => "Lov3l4c3"
#    
#    word_2 = "Dijkstra"
#    word_2.map! do |ch, i|
#        if i.even?
#            ch.upcase
#        else
#            ch.downcase
#        end
#    end
#    p word_2        # => "DiJkStRa"
end 
 
 
def multiply(num1, num2)
    return 0 if num1 == 0 || num2 == 0 
    
    if num2 > 0
        num1 + multiply(num1, num2 - 1)
    else
        -num1 + multiply(num1, num2 + 1)
    end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18


def lucas_sequence(num)
  return [] if  num == 0 
  return [2] if num == 1
  return [2, 1] if num == 2

    arr = lucas_sequence(num - 1)
    shovel = arr[-1] + arr[-2]
    arr << shovel


end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]



def prime_factorization(num)
    (2...num).each do |i|
        if num % i == 0 
            j = num / i
            return [*prime_factorization(i), *prime_factorization(j)]
        end
    end

    [ num ]
end


# prime_factorization(12)     # => [2, 2, 3]
# prime_factorization(24)     # => [2, 2, 2, 3]
# prime_factorization(25)     # => [5, 5]
# prime_factorization(60)     # => [2, 2, 3, 5]
# prime_factorization(7)      # => [7]
# prime_factorization(11)     # => [11]
# prime_factorization(2017)   # => [2017]