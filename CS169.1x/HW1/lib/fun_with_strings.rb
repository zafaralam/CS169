module FunWithStrings
  def palindrome?
    # your code here
    s = self.gsub(/(\W|\b)+/i,"").downcase
    s == s.reverse

  end

  def blank?
    self.gsub(/\s/i,"") == ""
  end

  def count_words
    # your code here
    self.split(/\W+/).inject({}) do |hash, word|

      unless word.blank?
        hash[word.downcase] ||= 0
        hash[word.downcase]  += 1
      #puts "#{hash} : #{word}"
      end
      hash
    end
  end

  def anagram_groups
    # your code here
    words = Array.new(0)
    self.split(/\W+/).each do |w|
	words.push(w)
    end
    
    words.inject({ }) do |hash, word|
    	hash[word.downcase.sum] ||= []
    	hash[word.downcase.sum] << word
    	hash
    end.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

puts 'scream cars for four scar creams'.anagram_groups
puts 'x'.anagram_groups
