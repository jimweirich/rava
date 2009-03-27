module Rava
  class Out
    def println(string)
      $stdout.puts(string)
    end
  end
  OUT = Out.new

  class Err
    def println(string)
      $stderr.puts(string)
    end
  end
  ERR = Err.new
end

module System
  def self.out
    Rava::OUT
  end
  def self.err
    Rava::ERR
  end
end
