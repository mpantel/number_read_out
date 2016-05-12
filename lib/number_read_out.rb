require "number_read_out/version"

module NumberReadOut

  SpokenNumbers = {en: {male: {hundreds: ['ONE HUNDRED', 'ONE HUNDRED', 'TWO HUNDRED', 'THREE HUNDRED', 'FOUR HUNDRED', 'FIVE HUNDRED', 'SIX HUNDRED', 'SEVEN HUNDRED', 'EIGHT HUNDRED', 'NINE HUNDRED'],
                               dozens: ['', 'TEN', 'TWENTY', 'THIRTY', 'FORTY', 'FIFTY', 'SIXTY', 'SEVENTY', 'EIGHT', 'NINETY','TEN', 'ELEVEN', 'TWELVE', 'THIRTEEN', 'FOURTEEN', 'FIFTEEN', 'SIXTEEN', 'SEVENTEEN', 'EIGHTEEN', 'NINETEEN'],
                               monads: ['', 'ONE', 'TWO', 'THREE', 'FOUR', 'FIVE', 'SIX', 'SEVEN', 'EIGHT', 'NINE'],
  },
                        female: {hundreds: ['ONE HUNDRED', 'ONE HUNDRED', 'TWO HUNDRED', 'THREE HUNDRED', 'FOUR HUNDRED', 'FIVE HUNDRED', 'SIX HUNDRED', 'SEVEN HUNDRED', 'EIGHT HUNDRED', 'NINE HUNDRED'],
                                 dozens: ['', 'TEN', 'TWENTY', 'THIRTY', 'FORTY', 'FIFTY', 'SIXTY', 'SEVENTY', 'EIGHT', 'NINETY','TEN', 'ELEVEN', 'TWELVE', 'THIRTEEN', 'FOURTEEN', 'FIFTEEN', 'SIXTEEN', 'SEVENTEEN', 'EIGHTEEN', 'NINETEEN'],
                                 monads: ['', 'ONE', 'TWO', 'THREE', 'FOUR', 'FIVE', 'SIX', 'SEVEN', 'EIGHT', 'NINE'],
                        },
                        units_singular: [ 'THOUSAND', 'THOUSAND', 'MILLION', 'BILLION', 'TRILLION', 'QUADRILLION'],
                        units_plural: [ 'THOUSAND', 'THOUSAND', 'MILLION', 'BILLION', 'TRILLION', 'QUADRILLION']
  },
                   gr: {male: {hundreds: ['EKATON', 'EKATO', 'ΔΙΑΚΟΣΙA', 'ΤΡΙΑΚΟΣΙΑ', 'ΤΕΤΡΑΚΟΣΙΑ', 'ΠΕΝΤΑΚΟΣΙΑ', 'ΕΞΑΚΟΣΙΑ', 'ΕΠΤΑΚΟΣΙΑ', 'ΟΚΤΑΚΟΣΙΑ', 'ΕΝΝΙΑΚΟΣΙΑ'],
                               dozens: ['', 'ΔΕΚΑ', 'ΕΙΚΟΣΙ', 'ΤΡΙΑΝΤΑ', 'ΣΑΡΑΝΤΑ', 'ΠΕΝΗΝΤΑ', 'ΕΞΗΝΤΑ', 'ΕΒΔΟΜΗΝΤΑ', 'ΟΓΔΟΝΤΑ', 'ΕΝΕΝΗΝΤΑ','ΔΕΚΑ', 'ΕΝΤΕΚΑ', 'ΔΩΔΕΚΑ', 'ΔΕΚΑΤΡΙΑ', 'ΔΕΚΑΤΕΣΣΕΡΑ', 'ΔΕΚΑΠΕΝΤΕ', 'ΔΕΚΑΕΞΙ', 'ΔΕΚΑΕΠΤΑ', 'ΔΕΚΑΟΚΤΩ', 'ΔΕΚΑΕΝΝΕΑ'],
                               monads: ['', 'ΕΝΑ', 'ΔΥΟ', 'ΤΡΙΑ', 'ΤΕΣΣΕΡΑ', 'ΠΕΝΤΕ', 'ΕΞΙ', 'ΕΠΤΑ', 'ΟΚΤΩ', 'ΕΝΝΕΑ'],
                   },
                        female: {hundreds: ['EKATON', 'EKATO', 'ΔΙΑΚΟΣΙEΣ', 'ΤΡΙΑΚΟΣΙEΣ', 'ΤΕΤΡΑΚΟΣΙEΣ', 'ΠΕΝΤΑΚΟΣΙEΣ', 'ΕΞΑΚΟΣΙEΣ', 'ΕΠΤΑΚΟΣΙEΣ', 'ΟΚΤΑΚΟΣΙEΣ', 'ΕΝΝΙΑΚΟΣΙEΣ'],
                                 dozens: ['', 'ΔΕΚΑ', 'ΕΙΚΟΣΙ', 'ΤΡΙΑΝΤΑ', 'ΣΑΡΑΝΤΑ', 'ΠΕΝΗΝΤΑ', 'ΕΞΗΝΤΑ', 'ΕΒΔΟΜΗΝΤΑ', 'ΟΓΔΟΝΤΑ', 'ΕΝΕΝΗΝΤΑ','ΔΕΚΑ', 'ΕΝΤΕΚΑ', 'ΔΩΔΕΚΑ', 'ΔΕΚΑΤΡΕΙΣ', 'ΔΕΚΑΤΕΣΣΕΡΙΣ', 'ΔΕΚΑΠEΝΤΕ', 'ΔΕΚΑΕΞΙ', 'ΔΕΚΑΕΠΤΑ', 'ΔΕΚΑΟΚΤΩ', 'ΔΕΚΑΕΝΝΕΑ'],
                                 monads: ['', 'ΜΙΑ', 'ΔΥΟ', 'ΤΡΕΙΣ', 'ΤΕΣΣΕΡΙΣ', 'ΠΕΝΤΕ', 'ΕΞΙ', 'ΕΠΤΑ', 'ΟΚΤΩ', 'ΕΝΝΕΑ'],
                        },
                        units_singular: ['ΧΙΛΙΕΣ', 'ΧΙΛΙΑ', 'ΕΚΑΤΟΜΥΡΙΟ', 'ΔΙΣΕΚΑΤΟΜΥΡΙΟ', 'ΤΡΙΣΕΚΑΤΟΜΥΡΙΟ', 'ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΟ'],
                        units_plural: [ 'ΧΙΛΙΑΔΕΣ', 'ΧΙΛΙΑΔΕΣ', 'ΕΚΑΤΟΜΥΡΙΑ', 'ΔΙΣΕΚΑΤΟΜΥΡΙΑ', 'ΤΡΙΣΕΚΑΤΟΜΥΡΙΑ', 'ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΑ']
                   }
  }

  SpokenCurrencies = {en: {euro: ['EURO','EUROCENTS','EUROCENTS', 'AND','-'],drachmas:['DRACHMAS','CENTS','CENTS','AND','-']},
                      gr: {euro: ['ΕΥΡΩ','ΕΥΡΩΛΕΠΤΟ','ΕΥΡΩΛΕΠΤΑ', 'ΚΑΙ',''],drachmas:['ΔΡΑΧΜΕΣ','ΛΕΠΤΟ','ΛΕΠΤΑ', 'ΚΑΙ','']}}

  PartOfNumber = [:hundreds, :thousands, :millions, :billions, :trillions, :quadrillions]

  def self.decimal_part_to_text(douplet,currency = :euro,lang = :gr)
    return '' if douplet == 0

    raise ArgumentError.new("Wrong douplet #{douplet}") if douplet > 99

    dozens, monads = douplet.divmod 10

    if douplet >10 and douplet < 20
      textual = SpokenNumbers[lang][:male][:dozens][douplet]
    else
      textual = SpokenNumbers[lang][:male][:dozens][dozens]
      if monads != 0
        textual += SpokenCurrencies[lang][currency][4] if dozens >1 # add dash (-) if needed
        textual += SpokenNumbers[lang][:male][:monads][monads]
      end
    end
    textual + ' ' +( SpokenCurrencies[lang][currency][douplet == 1 ? 1:2]  )
  end

  def self.triplet_to_text(
      triplet,
          part_of_number,
          currency = :euro,
          lang = :gr)
    return '' if triplet == 0
    raise ArgumentError.new("Wrong triplet #{triplet}") if triplet > 999
    hundreds, teens = triplet.divmod 100
    dozens, monads = teens.divmod 10

    genus = (([:hundreds, :thousands].include? part_of_number) and currency != :euro) ? :female : :male

    textual = ''

    if hundreds != 0
      hundreds_corrector = (teens != 0 and hundreds==1) ? 1 : 0
      textual += SpokenNumbers[lang][genus][:hundreds][hundreds - hundreds_corrector ]
      if teens >0
        textual += ' '
        textual += SpokenCurrencies[:en][:euro][3] + ' ' if lang == :en
      end
    end

    if teens != 0
      if teens >10 and teens < 20
        textual += SpokenNumbers[lang][genus][:dozens][teens]
      else
        textual += SpokenNumbers[lang][genus][:dozens][dozens]
        if monads != 0
          textual +=SpokenCurrencies[lang][currency][4] if dozens >1
          textual += SpokenNumbers[lang][genus][:monads][monads] unless lang == :gr and part_of_number==:thousands and monads==1
          textual += ' ' if ((monads >1 or lang == :en) and part_of_number==:thousands) or  not [ :hundreds, :thousands].include? part_of_number
        else
          textual += ' ' unless  part_of_number == :hundreds
        end
      end
    end

    units = ((hundreds == 1 or monads==1) and dozens==0) ? :units_singular : :units_plural

    if  part_of_number != :hundreds
      thousands_corrector = (units == :units_singular && genus == :female) ? 1 : 0
      textual += SpokenNumbers[lang][units][PartOfNumber.index(part_of_number) - thousands_corrector]
    end
    textual += ' ' if triplet >0
    textual

  end

  def self.full_currency_text(amount_str, currency= :euro,lang= :gr)

    raise ArgumentError.new("Parameter amount: expecting string") unless amount_str.is_a?(String)

    dots = amount_str.count('.')
    commas = amount_str.count(',')
    raise ArgumentError.new("Parameter amount: too many dots or commas") if dots >1 or commas >1

    # split integer, decimal part
    integer_part_of_number,decimal_part_of_number = amount_str.split(dots==1? '.': ',')

    integer_part_of_number = integer_part_of_number.to_i
    raise ArgumentError.new("Integer part too long") if integer_part_of_number > 999999999999999999

    decimal_part_of_number = (decimal_part_of_number ? decimal_part_of_number[0..1].to_i : 0)
    decimal_part_text = decimal_part_to_text(decimal_part_of_number, currency,lang)

    integer_part_text = ''
    PartOfNumber.each do |part_of_number|
      integer_part_of_number, triplet = integer_part_of_number.divmod(1000)
      break if integer_part_of_number == 0 and triplet == 0
      integer_part_text =  triplet_to_text(triplet, part_of_number, currency,lang) + integer_part_text
      integer_part_text +=  SpokenCurrencies[lang][currency][0] if integer_part_of_number == 0
    end
    raise ArgumentError.new("Number too long to parse...") if integer_part_of_number >0

    integer_part_text + ((integer_part_text !='' and decimal_part_text !='')?  ' ' + SpokenCurrencies[lang][currency][3] + ' ' : '')  +decimal_part_text

  end

end
