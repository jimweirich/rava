
class Object
  alias rava_original_method_missing method_missing

  def method_missing(sym, *args, &block)
    new_sym = sym.to_s
    if new_sym =~ /[A-Z]/
      new_sym = rava_case(new_sym)
      send(new_sym, *args, &block)
    else
      rava_original_method_missing(sym, *args, &block)
    end
  end

  private

  def rava_case(string)
    string.gsub(/([A-Z]+[a-z]*)/) { |m| "_" + m.downcase }
  end

  def new(klass, *args)
    klass.new(*args)
  end
end
