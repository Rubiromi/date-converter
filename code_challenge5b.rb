class NumberConverter
  def initialize
    @numbers = {
      zero: 0,
      one: 1,
      two: 2,
      three: 3,
      four: 4,
      five: 5,
      six: 6,
      seven: 7,
      eight: 8,
      nine: 9,
      ten: 10,
      eleven: 11,
      twelve: 12,
      thirteen: 13,
      fourteen: 14,
      fifteen: 15,
      sixteen: 16,
      seventeen: 17,
      eighteen: 18,
      nineteen: 19,
      twenty: 20,
      thirty: 30,
      forty: 40,
      fifty: 50,
      sixty: 60,
      seventy: 70,
      eighty: 80,
      ninety: 90,
      hundred: 100,
      thousand: 1000,
    }
  end

  def convert(num)
    res = 0

    # Remove ands
    num.gsub!(' and', '')

    # Process thousands
    if num =~ /[\w]+ thousand/
      thousands = num.scan(/[\w]+ thousand/)[0].split
      num = num.split(/[\w]+ thousand/).map(&:strip)
      num.delete('')
      num = num[0]
      res += (@numbers[thousands[0].to_sym] * @numbers[thousands[1].to_sym])
    end

    # Process hundreds
    if num =~ /[\w]+ hundred/
      hundreds = num.scan(/[\w]+ hundred/)[0].split
      num = num.split(/[\w]+ hundred/).map(&:strip)
      num.delete('')
      num = num[0]
      res += (@numbers[hundreds[0].to_sym] * @numbers[hundreds[1].to_sym])
    end

    # Process ones and tens
    unless num.nil?
      num = num.split
      num.each { |n| res += @numbers[n.to_sym] }
    end

    res
  end
end

nc = NumberConverter.new
numbers = [
  'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
  'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty',
  'twenty one', 'twenty two', 'twenty three', 'twenty four', 'twenty five', 'twenty six', 'twenty seven', 'twenty eight', 'twenty nine', 'thirty',
  'thirty one', 'thirty two', 'thirty three', 'thirty four', 'thirty five', 'thirty six', 'thirty seven', 'thirty eight', 'thirty nine', 'forty',
  'forty one', 'forty two', 'forty three', 'forty four', 'forty five', 'forty six', 'forty seven', 'forty eight', 'forty nine', 'fifty',
  'ninety one', 'ninety two', 'ninety nine', 'one hundred',
  'one hundred and one',
  'one thousand two hundred and seventeen',
  'seven thousand five hundred and one'
]

numbers.each { |num| puts nc.convert(num) }
