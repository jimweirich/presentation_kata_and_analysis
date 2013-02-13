require 'rspec/given'
require 'roman_numeral_converter'

RSpec::Given.use_natural_assertions

describe RomanNumeralConverter do
  Given(:converter) { RomanNumeralConverter.new }

  def convert(n)
    converter.convert(n)
  end

  Then { convert(1) == "I" }
  Then { convert(2) == "II" }
  Then { convert(4) == "IV" }
  Then { convert(5) == "V" }
  Then { convert(6) == "VI" }
  Then { convert(9) == "IX" }
  Then { convert(10) == "X" }
  Then { convert(20) == "XX" }
  Then { convert(40) == "XL" }
  Then { convert(50) == "L" }
  Then { convert(90) == "XC" }
  Then { convert(100) == "C" }
  Then { convert(400) == "CD" }
  Then { convert(500) == "D" }
  Then { convert(900) == "CM" }
  Then { convert(1000) == "M" }

  Then { convert(2013) == "MMXIII" }
  Then { convert(1949) == "MCMXLIX" }
  Then { convert(3999) == "MMMCMXCIX" }

  describe "converting zero" do
    When(:result) { convert(0) }
    Then { result.should have_failed(ArgumentError, /zero/) }
  end

end
