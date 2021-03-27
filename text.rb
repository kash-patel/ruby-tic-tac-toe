require "rainbow/refinement"

using Rainbow

module TextFunctions
  
  def format_text (text)
    " " + text + " "
  end

  def alert (text)
    puts format_text(text).bg(:green).black
  end
  
  def warn (text)
    puts format_text(text).bg(:yellow).black
  end
  
  def error (text)
    puts format_text(text).bg(:red).black
  end

end