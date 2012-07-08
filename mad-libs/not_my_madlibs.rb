keys = Hash.new { |h, k|
  puts "Give me #{k.sub(/\A([^:]+):/, "")}:"
  h[$1]=$stdin.gets.chomp
}

puts "", $*[0].split(".")[0].gsub("_", " "),
  IO.read($*[0]).gsub(/\(\(([^)]+)\)\)/) { keys[$1] }
