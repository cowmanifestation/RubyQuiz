class MadLibs
  def initialize(filename)
    @file = File.new(filename)

    run
  end

  def get_prompts(sentence)
    sentence.scan(/\(\((?:(\w+):)?([\w\s]+)\)\)/)
  end

  def get_substitution(prompt)
    print prompt + ": "
    substitution = STDIN.gets.chomp
    return substitution
  end

  def substitute(sentence, keywords, prompts)
    prompts.each do |prompt|
      if prompt[0]
        keywords << prompt[0]
        substitution = get_substitution(prompt[1])
        [prompt[0] + ":" + prompt[1], prompt[0]].each do |p|
          replace(sentence, p, substitution)
        end
      else
        unless keywords.include?(prompt[1])
          substitution = get_substitution(prompt[1])
          replace(sentence, prompt[1], substitution)
        end
      end
    end
  end

  def replace(sentence, pattern, substitution)
    sentence.gsub!(/\(\(#{pattern}\)\)/, substitution)
  end

  def ask_if_continuing
    print "Continue? (y/n) "
    answer = gets
    if answer == "n\n"
      exit
    end
  end


  def run
    @file.each do |line|
      keywords = []
      prompts = get_prompts(line)

      substitute(line, keywords, prompts)

      puts line

      unless @file.eof?
        ask_if_continuing
      end
    end
  end
end

m = MadLibs.new(ARGV[0])
