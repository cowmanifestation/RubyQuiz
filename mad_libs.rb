class MadLibs
  @sentence = "My ((name: a relative)) is like a ((type of animal)) with a ((adjective)) ((a body part)).  Everyone ((present tense action)) my ((name)) for it."

  #@sentence.scan(/\(\((?:(\w+):)?([\w\s]+)\)\)/)

  @prompts = @sentence.scan(/\(\((?:(\w+):)?([\w\s]+)\)\)/)

  #[["name", " a relative"], [nil, "type of animal"], [nil, "adjective"], 
  #[nil, "body part"], [nil, "present tense action"], [nil, "name"]]

  @keywords = []

  def substitute(pattern, substitution)
    @sentence.gsub!(/\(\(#{pattern}\)\)/, substitution)
  end

  def run
    puts @prompts
=begin
    @prompts.each do |prompt|
      if prompt[0]
        @keywords << prompt[0]
        print prompt[1] + ": "
        substitution = gets.chomp
        [prompt[0] + ":" + prompt[1], prompt[0]].each do |p|
          substitute(p, substitution)
        end
      else
        unless @keywords.include?(prompt[1])
          print prompt[1] + ": "
          substitution = gets.chomp
          substitute(prompt[1], substitution)
        end
      end
    end

    puts @sentence
=end
  end
end

m = MadLibs.new
m.run

