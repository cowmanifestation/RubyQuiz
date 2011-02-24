class MadLibs
  def initialize(filename)
    @file = filename

    run
  end

  def get_substitutions(sentence, prompts)
    prompts.each do |prompt|
      if prompt[0]
        @keywords << prompt[0]
        print prompt[1] + ": "
        substitution = gets.chomp
        [prompt[0] + ":" + prompt[1], prompt[0]].each do |p|
          substitute(sentence, p, substitution)
        end
      else
        unless @keywords.include?(prompt[1])
          print prompt[1] + ": "
          substitution = gets.chomp
          substitute(sentence, prompt[1], substitution)
        end
      end
    end
  end

  def substitute(sentence, pattern, substitution)
    sentence.gsub!(/\(\(#{pattern}\)\)/, substitution)
  end

  def run
    File.open(@file) do |file|
      file.each do |line|
        sentence = line
        prompts = sentence.scan(/\(\((?:(\w+):)?([\w\s]+)\)\)/)
        @keywords = []

        get_substitutions(sentence, prompts)

        puts sentence

        print "Continue? (y/n)"
        answer = gets
        if answer == "n\n"
          exit
        end
      end
    end
  end
end

m = MadLibs.new("sentences.txt")
