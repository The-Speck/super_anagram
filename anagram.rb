def good_anagram?(first, second)
  hash1 = Hash.new(0)

  first.each_char {|let| hash1[let] += 1}
  second.each_char {|let| hash1[let] -= 1}

  hash1.any?{|_,v| v > 0}
end

t = Time.now
10_000_000.times{
  good_anagram?("elvis", "lives")
}
p Time.now - t
# ====> 38.4 @ 10_000_000



def better_anagram?(first, second)
  f = first.chars
  s = second.chars
  f.sort == s.sort
end

t = Time.now
10_000_000.times{
  better_anagram?("elvis", "lives")
}
p Time.now - t
# ====> 23.0 @ 10_000_000



def best_anagram?(first, second)
  f = first.unpack('C*')
  s = second.unpack('C*')
  f == (f | s)
end

t = Time.now
10_000_000.times{
  best_anagram?("elvis", "lives")
}
p Time.now - t
# ===> 14.6 @ 10_000_000
