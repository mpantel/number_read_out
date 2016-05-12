require 'test_helper'

class NumberReadOutTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NumberReadOut::VERSION
  end

  def test_amount_generation_gr
    tests = [
        {amount: '1',currency: :euro,lang: :gr,result: 'ΕΝΑ ΕΥΡΩ'},
        {amount: '1.01',currency: :euro,lang: :gr,result: 'ΕΝΑ ΕΥΡΩ ΚΑΙ ΕΝΑ ΕΥΡΩΛΕΠΤΟ'},
        {amount: '1.01',currency: :drachmas,lang: :gr,result: 'ΜΙΑ ΔΡΑΧΜΕΣ ΚΑΙ ΕΝΑ ΛΕΠΤΟ'},
        {amount: '10.01',currency: :euro,lang: :gr,result: 'ΔΕΚΑ ΕΥΡΩ ΚΑΙ ΕΝΑ ΕΥΡΩΛΕΠΤΟ'},
        {amount: '10.01',currency: :drachmas,lang: :gr,result: 'ΔΕΚΑ ΔΡΑΧΜΕΣ ΚΑΙ ΕΝΑ ΛΕΠΤΟ'},
        {amount: '10.11',currency: :euro,lang: :gr,result: 'ΔΕΚΑ ΕΥΡΩ ΚΑΙ ΕΝΤΕΚΑ ΕΥΡΩΛΕΠΤΑ'},
        {amount: '10.11',currency: :drachmas,lang: :gr,result: 'ΔΕΚΑ ΔΡΑΧΜΕΣ ΚΑΙ ΕΝΤΕΚΑ ΛΕΠΤΑ'},
        {amount: '10.13',currency: :euro,lang: :gr,result: 'ΔΕΚΑ ΕΥΡΩ ΚΑΙ ΔΕΚΑΤΡΙΑ ΕΥΡΩΛΕΠΤΑ'},
        {amount: '10.13',currency: :drachmas,lang: :gr,result: 'ΔΕΚΑ ΔΡΑΧΜΕΣ ΚΑΙ ΔΕΚΑΤΡΙΑ ΛΕΠΤΑ'},
        {amount: '10.21',currency: :euro,lang: :gr,result: 'ΔΕΚΑ ΕΥΡΩ ΚΑΙ ΕΙΚΟΣΙΕΝΑ ΕΥΡΩΛΕΠΤΑ'},
        {amount: '10.21',currency: :drachmas,lang: :gr,result: 'ΔΕΚΑ ΔΡΑΧΜΕΣ ΚΑΙ ΕΙΚΟΣΙΕΝΑ ΛΕΠΤΑ'},
        {amount: '13.99',currency: :euro,lang: :gr,result: 'ΔΕΚΑΤΡΙΑ ΕΥΡΩ ΚΑΙ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΕΥΡΩΛΕΠΤΑ'},
        {amount: '13.99',currency: :drachmas,lang: :gr,result: 'ΔΕΚΑΤΡΕΙΣ ΔΡΑΧΜΕΣ ΚΑΙ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΛΕΠΤΑ'},
        {amount: '1',currency: :drachmas,lang: :gr,result: 'ΜΙΑ ΔΡΑΧΜΕΣ'},
        {amount: '2',currency: :euro,lang: :gr,result: 'ΔΥΟ ΕΥΡΩ'},
        {amount: '3',currency: :euro,lang: :gr,result: 'ΤΡΙΑ ΕΥΡΩ'},
        {amount: '3',currency: :drachmas,lang: :gr,result: 'ΤΡΕΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '4',currency: :euro,lang: :gr,result: 'ΤΕΣΣΕΡΑ ΕΥΡΩ'},
        {amount: '4',currency: :drachmas,lang: :gr,result: 'ΤΕΣΣΕΡΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '5',currency: :euro,lang: :gr,result: 'ΠΕΝΤΕ ΕΥΡΩ'},
        {amount: '6',currency: :euro,lang: :gr,result: 'ΕΞΙ ΕΥΡΩ'},
        {amount: '7',currency: :euro,lang: :gr,result: 'ΕΠΤΑ ΕΥΡΩ'},
        {amount: '8',currency: :euro,lang: :gr,result: 'ΟΚΤΩ ΕΥΡΩ'},
        {amount: '9',currency: :euro,lang: :gr,result: 'ΕΝΝΕΑ ΕΥΡΩ'},
        {amount: '10',currency: :euro,lang: :gr,result: 'ΔΕΚΑ ΕΥΡΩ'},
        {amount: '11',currency: :euro,lang: :gr,result: 'ΕΝΤΕΚΑ ΕΥΡΩ'},
        {amount: '12',currency: :euro,lang: :gr,result: 'ΔΩΔΕΚΑ ΕΥΡΩ'},
        {amount: '13',currency: :euro,lang: :gr,result: 'ΔΕΚΑΤΡΙΑ ΕΥΡΩ'},
        {amount: '13',currency: :drachmas,lang: :gr,result: 'ΔΕΚΑΤΡΕΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '14',currency: :euro,lang: :gr,result: 'ΔΕΚΑΤΕΣΣΕΡΑ ΕΥΡΩ'},
        {amount: '14',currency: :drachmas,lang: :gr,result: 'ΔΕΚΑΤΕΣΣΕΡΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '15',currency: :euro,lang: :gr,result: 'ΔΕΚΑΠΕΝΤΕ ΕΥΡΩ'},
        {amount: '16',currency: :euro,lang: :gr,result: 'ΔΕΚΑΕΞΙ ΕΥΡΩ'},
        {amount: '17',currency: :euro,lang: :gr,result: 'ΔΕΚΑΕΠΤΑ ΕΥΡΩ'},
        {amount: '18',currency: :euro,lang: :gr,result: 'ΔΕΚΑΟΚΤΩ ΕΥΡΩ'},
        {amount: '19',currency: :euro,lang: :gr,result: 'ΔΕΚΑΕΝΝΕΑ ΕΥΡΩ'},
        {amount: '20',currency: :euro,lang: :gr,result: 'ΕΙΚΟΣΙ ΕΥΡΩ'},
        {amount: '21',currency: :euro,lang: :gr,result: 'ΕΙΚΟΣΙΕΝΑ ΕΥΡΩ'},
        {amount: '21',currency: :drachmas,lang: :gr,result: 'ΕΙΚΟΣΙΜΙΑ ΔΡΑΧΜΕΣ'},
        {amount: '22',currency: :euro,lang: :gr,result: 'ΕΙΚΟΣΙΔΥΟ ΕΥΡΩ'},
        {amount: '23',currency: :euro,lang: :gr,result: 'ΕΙΚΟΣΙΤΡΙΑ ΕΥΡΩ'},
        {amount: '23',currency: :drachmas,lang: :gr,result: 'ΕΙΚΟΣΙΤΡΕΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '24',currency: :euro,lang: :gr,result: 'ΕΙΚΟΣΙΤΕΣΣΕΡΑ ΕΥΡΩ'},
        {amount: '24',currency: :drachmas,lang: :gr,result: 'ΕΙΚΟΣΙΤΕΣΣΕΡΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '25',currency: :euro,lang: :gr,result: 'ΕΙΚΟΣΙΠΕΝΤΕ ΕΥΡΩ'},
        {amount: '26',currency: :euro,lang: :gr,result: 'ΕΙΚΟΣΙΕΞΙ ΕΥΡΩ'},
        {amount: '27',currency: :euro,lang: :gr,result: 'ΕΙΚΟΣΙΕΠΤΑ ΕΥΡΩ'},
        {amount: '28',currency: :euro,lang: :gr,result: 'ΕΙΚΟΣΙΟΚΤΩ ΕΥΡΩ'},
        {amount: '29',currency: :euro,lang: :gr,result: 'ΕΙΚΟΣΙΕΝΝΕΑ ΕΥΡΩ'},
        {amount: '30',currency: :euro,lang: :gr,result: 'ΤΡΙΑΝΤΑ ΕΥΡΩ'},
        {amount: '40',currency: :euro,lang: :gr,result: 'ΣΑΡΑΝΤΑ ΕΥΡΩ'},
        {amount: '50',currency: :euro,lang: :gr,result: 'ΠΕΝΗΝΤΑ ΕΥΡΩ'},
        {amount: '60',currency: :euro,lang: :gr,result: 'ΕΞΗΝΤΑ ΕΥΡΩ'},
        {amount: '70',currency: :euro,lang: :gr,result: 'ΕΒΔΟΜΗΝΤΑ ΕΥΡΩ'},
        {amount: '80',currency: :euro,lang: :gr,result: 'ΟΓΔΟΝΤΑ ΕΥΡΩ'},
        {amount: '90',currency: :euro,lang: :gr,result: 'ΕΝΕΝΗΝΤΑ ΕΥΡΩ'},
        {amount: '100',currency: :euro,lang: :gr,result: 'EKATO ΕΥΡΩ'},
        {amount: '101',currency: :euro,lang: :gr,result: 'EKATON ΕΝΑ ΕΥΡΩ'},
        {amount: '101',currency: :drachmas,lang: :gr,result: 'EKATON ΜΙΑ ΔΡΑΧΜΕΣ'},
        {amount: '102',currency: :euro,lang: :gr,result: 'EKATON ΔΥΟ ΕΥΡΩ'},
        {amount: '103',currency: :euro,lang: :gr,result: 'EKATON ΤΡΙΑ ΕΥΡΩ'},
        {amount: '103',currency: :drachmas,lang: :gr,result: 'EKATON ΤΡΕΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '104',currency: :euro,lang: :gr,result: 'EKATON ΤΕΣΣΕΡΑ ΕΥΡΩ'},
        {amount: '104',currency: :drachmas,lang: :gr,result: 'EKATON ΤΕΣΣΕΡΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '105',currency: :euro,lang: :gr,result: 'EKATON ΠΕΝΤΕ ΕΥΡΩ'},
        {amount: '106',currency: :euro,lang: :gr,result: 'EKATON ΕΞΙ ΕΥΡΩ'},
        {amount: '107',currency: :euro,lang: :gr,result: 'EKATON ΕΠΤΑ ΕΥΡΩ'},
        {amount: '108',currency: :euro,lang: :gr,result: 'EKATON ΟΚΤΩ ΕΥΡΩ'},
        {amount: '109',currency: :euro,lang: :gr,result: 'EKATON ΕΝΝΕΑ ΕΥΡΩ'},
        {amount: '110',currency: :euro,lang: :gr,result: 'EKATON ΔΕΚΑ ΕΥΡΩ'},
        {amount: '111',currency: :euro,lang: :gr,result: 'EKATON ΕΝΤΕΚΑ ΕΥΡΩ'},
        {amount: '112',currency: :euro,lang: :gr,result: 'EKATON ΔΩΔΕΚΑ ΕΥΡΩ'},
        {amount: '113',currency: :euro,lang: :gr,result: 'EKATON ΔΕΚΑΤΡΙΑ ΕΥΡΩ'},
        {amount: '113',currency: :drachmas,lang: :gr,result: 'EKATON ΔΕΚΑΤΡΕΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '114',currency: :euro,lang: :gr,result: 'EKATON ΔΕΚΑΤΕΣΣΕΡΑ ΕΥΡΩ'},
        {amount: '114',currency: :drachmas,lang: :gr,result: 'EKATON ΔΕΚΑΤΕΣΣΕΡΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '115',currency: :euro,lang: :gr,result: 'EKATON ΔΕΚΑΠΕΝΤΕ ΕΥΡΩ'},
        {amount: '116',currency: :euro,lang: :gr,result: 'EKATON ΔΕΚΑΕΞΙ ΕΥΡΩ'},
        {amount: '117',currency: :euro,lang: :gr,result: 'EKATON ΔΕΚΑΕΠΤΑ ΕΥΡΩ'},
        {amount: '118',currency: :euro,lang: :gr,result: 'EKATON ΔΕΚΑΟΚΤΩ ΕΥΡΩ'},
        {amount: '119',currency: :euro,lang: :gr,result: 'EKATON ΔΕΚΑΕΝΝΕΑ ΕΥΡΩ'},
        {amount: '120',currency: :euro,lang: :gr,result: 'EKATON ΕΙΚΟΣΙ ΕΥΡΩ'},
        {amount: '121',currency: :euro,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΕΝΑ ΕΥΡΩ'},
        {amount: '121',currency: :drachmas,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΜΙΑ ΔΡΑΧΜΕΣ'},
        {amount: '122',currency: :euro,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΔΥΟ ΕΥΡΩ'},
        {amount: '123',currency: :euro,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΤΡΙΑ ΕΥΡΩ'},
        {amount: '123',currency: :drachmas,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΤΡΕΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '124',currency: :euro,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΤΕΣΣΕΡΑ ΕΥΡΩ'},
        {amount: '124',currency: :drachmas,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΤΕΣΣΕΡΙΣ ΔΡΑΧΜΕΣ'},
        {amount: '125',currency: :euro,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΠΕΝΤΕ ΕΥΡΩ'},
        {amount: '126',currency: :euro,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΕΞΙ ΕΥΡΩ'},
        {amount: '127',currency: :euro,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΕΠΤΑ ΕΥΡΩ'},
        {amount: '128',currency: :euro,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΟΚΤΩ ΕΥΡΩ'},
        {amount: '129',currency: :euro,lang: :gr,result: 'EKATON ΕΙΚΟΣΙΕΝΝΕΑ ΕΥΡΩ'},
        {amount: '130',currency: :euro,lang: :gr,result: 'EKATON ΤΡΙΑΝΤΑ ΕΥΡΩ'},
        {amount: '140',currency: :euro,lang: :gr,result: 'EKATON ΣΑΡΑΝΤΑ ΕΥΡΩ'},
        {amount: '150',currency: :euro,lang: :gr,result: 'EKATON ΠΕΝΗΝΤΑ ΕΥΡΩ'},
        {amount: '160',currency: :euro,lang: :gr,result: 'EKATON ΕΞΗΝΤΑ ΕΥΡΩ'},
        {amount: '170',currency: :euro,lang: :gr,result: 'EKATON ΕΒΔΟΜΗΝΤΑ ΕΥΡΩ'},
        {amount: '180',currency: :euro,lang: :gr,result: 'EKATON ΟΓΔΟΝΤΑ ΕΥΡΩ'},
        {amount: '190',currency: :euro,lang: :gr,result: 'EKATON ΕΝΕΝΗΝΤΑ ΕΥΡΩ'},
        {amount: '200',currency: :euro,lang: :gr,result: 'ΔΙΑΚΟΣΙA ΕΥΡΩ'},
        {amount: '300',currency: :euro,lang: :gr,result: 'ΤΡΙΑΚΟΣΙΑ ΕΥΡΩ'},
        {amount: '400',currency: :euro,lang: :gr,result: 'ΤΕΤΡΑΚΟΣΙΑ ΕΥΡΩ'},
        {amount: '500',currency: :euro,lang: :gr,result: 'ΠΕΝΤΑΚΟΣΙΑ ΕΥΡΩ'},
        {amount: '600',currency: :euro,lang: :gr,result: 'ΕΞΑΚΟΣΙΑ ΕΥΡΩ'},
        {amount: '700',currency: :euro,lang: :gr,result: 'ΕΠΤΑΚΟΣΙΑ ΕΥΡΩ'},
        {amount: '800',currency: :euro,lang: :gr,result: 'ΟΚΤΑΚΟΣΙΑ ΕΥΡΩ'},
        {amount: '900',currency: :euro,lang: :gr,result: 'ΕΝΝΙΑΚΟΣΙΑ ΕΥΡΩ'},
        {amount: '1000',currency: :euro,lang: :gr,result: 'ΧΙΛΙΑ ΕΥΡΩ'},
        {amount: '1000',currency: :drachmas,lang: :gr,result: 'ΧΙΛΙΕΣ ΔΡΑΧΜΕΣ'},
        {amount: '1001',currency: :euro,lang: :gr,result: 'ΧΙΛΙΑ ΕΝΑ ΕΥΡΩ'},
        {amount: '1001',currency: :drachmas,lang: :gr,result: 'ΧΙΛΙΕΣ ΜΙΑ ΔΡΑΧΜΕΣ'},
        {amount: '1001001',currency: :euro,lang: :gr,result: 'ΕΝΑ ΕΚΑΤΟΜΥΡΙΟ ΧΙΛΙΑ ΕΝΑ ΕΥΡΩ'},
        {amount: '1001001',currency: :drachmas,lang: :gr,result: 'ΕΝΑ ΕΚΑΤΟΜΥΡΙΟ ΧΙΛΙΕΣ ΜΙΑ ΔΡΑΧΜΕΣ'},
        {amount: '1000001001',currency: :euro,lang: :gr,result: 'ΕΝΑ ΔΙΣΕΚΑΤΟΜΥΡΙΟ ΧΙΛΙΑ ΕΝΑ ΕΥΡΩ'},
        {amount: '1000001001',currency: :drachmas,lang: :gr,result: 'ΕΝΑ ΔΙΣΕΚΑΤΟΜΥΡΙΟ ΧΙΛΙΕΣ ΜΙΑ ΔΡΑΧΜΕΣ'},
        {amount: '2000',currency: :euro,lang: :gr,result: 'ΔΥΟ ΧΙΛΙΑΔΕΣ ΕΥΡΩ'},
        {amount: '2000',currency: :drachmas,lang: :gr,result: 'ΔΥΟ ΧΙΛΙΑΔΕΣ ΔΡΑΧΜΕΣ'},
        {amount: '1000000',currency: :euro,lang: :gr,result: 'ΕΝΑ ΕΚΑΤΟΜΥΡΙΟ ΕΥΡΩ'},
        {amount: '1000000',currency: :drachmas,lang: :gr,result: 'ΕΝΑ ΕΚΑΤΟΜΥΡΙΟ ΔΡΑΧΜΕΣ'},
        {amount: '2000000',currency: :euro,lang: :gr,result: 'ΔΥΟ ΕΚΑΤΟΜΥΡΙΑ ΕΥΡΩ'},
        {amount: '2000000',currency: :drachmas,lang: :gr,result: 'ΔΥΟ ΕΚΑΤΟΜΥΡΙΑ ΔΡΑΧΜΕΣ'},
        {amount: '1000000000',currency: :euro,lang: :gr,result: 'ΕΝΑ ΔΙΣΕΚΑΤΟΜΥΡΙΟ ΕΥΡΩ'},
        {amount: '1000000000',currency: :drachmas,lang: :gr,result: 'ΕΝΑ ΔΙΣΕΚΑΤΟΜΥΡΙΟ ΔΡΑΧΜΕΣ'},
        {amount: '2000000000',currency: :euro,lang: :gr,result: 'ΔΥΟ ΔΙΣΕΚΑΤΟΜΥΡΙΑ ΕΥΡΩ'},
        {amount: '2000000000',currency: :drachmas,lang: :gr,result: 'ΔΥΟ ΔΙΣΕΚΑΤΟΜΥΡΙΑ ΔΡΑΧΜΕΣ'},
        {amount: '1000000000000',currency: :euro,lang: :gr,result: 'ΕΝΑ ΤΡΙΣΕΚΑΤΟΜΥΡΙΟ ΕΥΡΩ'},
        {amount: '1000000000000',currency: :drachmas,lang: :gr,result: 'ΕΝΑ ΤΡΙΣΕΚΑΤΟΜΥΡΙΟ ΔΡΑΧΜΕΣ'},
        {amount: '2000000000000',currency: :euro,lang: :gr,result: 'ΔΥΟ ΤΡΙΣΕΚΑΤΟΜΥΡΙΑ ΕΥΡΩ'},
        {amount: '2000000000000',currency: :drachmas,lang: :gr,result: 'ΔΥΟ ΤΡΙΣΕΚΑΤΟΜΥΡΙΑ ΔΡΑΧΜΕΣ'},
        {amount: '1000000000000000',currency: :euro,lang: :gr,result: 'ΕΝΑ ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΟ ΕΥΡΩ'},
        {amount: '1000000000000000',currency: :drachmas,lang: :gr,result: 'ΕΝΑ ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΟ ΔΡΑΧΜΕΣ'},
        {amount: '2000000000000000',currency: :euro,lang: :gr,result: 'ΔΥΟ ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΑ ΕΥΡΩ'},
        {amount: '2000000000000000',currency: :drachmas,lang: :gr,result: 'ΔΥΟ ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΑ ΔΡΑΧΜΕΣ'},
        {amount: '1234567890123456,12',currency: :euro,lang: :gr,result: 'ΕΝΑ ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΟ ΔΙΑΚΟΣΙA ΤΡΙΑΝΤΑΤΕΣΣΕΡΑ ΤΡΙΣΕΚΑΤΟΜΥΡΙΑ ΠΕΝΤΑΚΟΣΙΑ ΕΞΗΝΤΑΕΠΤΑ ΔΙΣΕΚΑΤΟΜΥΡΙΑ ΟΚΤΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑ ΕΚΑΤΟΜΥΡΙΑ EKATON ΕΙΚΟΣΙΤΡΙΑ ΧΙΛΙΑΔΕΣ ΤΕΤΡΑΚΟΣΙΑ ΠΕΝΗΝΤΑΕΞΙ ΕΥΡΩ ΚΑΙ ΔΩΔΕΚΑ ΕΥΡΩΛΕΠΤΑ'},
        {amount: '1234567890123456,12',currency: :drachmas,lang: :gr,result: 'ΕΝΑ ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΟ ΔΙΑΚΟΣΙA ΤΡΙΑΝΤΑΤΕΣΣΕΡΑ ΤΡΙΣΕΚΑΤΟΜΥΡΙΑ ΠΕΝΤΑΚΟΣΙΑ ΕΞΗΝΤΑΕΠΤΑ ΔΙΣΕΚΑΤΟΜΥΡΙΑ ΟΚΤΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑ ΕΚΑΤΟΜΥΡΙΑ EKATON ΕΙΚΟΣΙΤΡΕΙΣ ΧΙΛΙΑΔΕΣ ΤΕΤΡΑΚΟΣΙEΣ ΠΕΝΗΝΤΑΕΞΙ ΔΡΑΧΜΕΣ ΚΑΙ ΔΩΔΕΚΑ ΛΕΠΤΑ'},
        {amount: '9999999999999999,99',currency: :euro,lang: :gr,result: 'ΕΝΝΕΑ ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΤΡΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΔΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΧΙΛΙΑΔΕΣ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΕΥΡΩ ΚΑΙ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΕΥΡΩΛΕΠΤΑ'},
        {amount: '9999999999999999,99',currency: :drachmas,lang: :gr,result: 'ΕΝΝΕΑ ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΤΡΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΔΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙEΣ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΧΙΛΙΑΔΕΣ ΕΝΝΙΑΚΟΣΙEΣ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΔΡΑΧΜΕΣ ΚΑΙ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΛΕΠΤΑ'},
        {amount: '999999999999999999,99',currency: :euro,lang: :gr,result: 'ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΤΡΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΔΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΧΙΛΙΑΔΕΣ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΕΥΡΩ ΚΑΙ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΕΥΡΩΛΕΠΤΑ'},
        {amount: '999999999999999999,99',currency: :drachmas,lang: :gr,result: 'ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΤΕΤΡΑΚΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΤΡΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΔΙΣΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙΑ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΕΚΑΤΟΜΥΡΙΑ ΕΝΝΙΑΚΟΣΙEΣ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΧΙΛΙΑΔΕΣ ΕΝΝΙΑΚΟΣΙEΣ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΔΡΑΧΜΕΣ ΚΑΙ ΕΝΕΝΗΝΤΑΕΝΝΕΑ ΛΕΠΤΑ'}

    ]

    tests.each do |t|
      assert_equal t[:result ],NumberReadOut.full_currency_text(t[:amount],t[:currency],t[:lang])
    end

  end

  def test_amount_generation_en
    tests = [
        {amount: '1',currency: :euro,lang: :en,result: 'ONE EURO'},
        {amount: '1.01',currency: :euro,lang: :en,result: 'ONE EURO AND ONE EUROCENTS'},
        {amount: '1.01',currency: :drachmas,lang: :en,result: 'ONE DRACHMAS AND ONE CENTS'},
        {amount: '10.01',currency: :euro,lang: :en,result: 'TEN EURO AND ONE EUROCENTS'},
        {amount: '10.01',currency: :drachmas,lang: :en,result: 'TEN DRACHMAS AND ONE CENTS'},
        {amount: '1',currency: :drachmas,lang: :en,result: 'ONE DRACHMAS'},
        {amount: '2',currency: :euro,lang: :en,result: 'TWO EURO'},
        {amount: '3',currency: :euro,lang: :en,result: 'THREE EURO'},
        {amount: '4',currency: :euro,lang: :en,result: 'FOUR EURO'},
        {amount: '5',currency: :euro,lang: :en,result: 'FIVE EURO'},
        {amount: '6',currency: :euro,lang: :en,result: 'SIX EURO'},
        {amount: '7',currency: :euro,lang: :en,result: 'SEVEN EURO'},
        {amount: '8',currency: :euro,lang: :en,result: 'EIGHT EURO'},
        {amount: '9',currency: :euro,lang: :en,result: 'NINE EURO'},
        {amount: '10',currency: :euro,lang: :en,result: 'TEN EURO'},
        {amount: '11',currency: :euro,lang: :en,result: 'ELEVEN EURO'},
        {amount: '12',currency: :euro,lang: :en,result: 'TWELVE EURO'},
        {amount: '13',currency: :euro,lang: :en,result: 'THIRTEEN EURO'},
        {amount: '14',currency: :euro,lang: :en,result: 'FOURTEEN EURO'},
        {amount: '15',currency: :euro,lang: :en,result: 'FIFTEEN EURO'},
        {amount: '16',currency: :euro,lang: :en,result: 'SIXTEEN EURO'},
        {amount: '17',currency: :euro,lang: :en,result: 'SEVENTEEN EURO'},
        {amount: '18',currency: :euro,lang: :en,result: 'EIGHTEEN EURO'},
        {amount: '19',currency: :euro,lang: :en,result: 'NINETEEN EURO'},
        {amount: '20',currency: :euro,lang: :en,result: 'TWENTY EURO'},
        {amount: '21',currency: :euro,lang: :en,result: 'TWENTY-ONE EURO'},
        {amount: '22',currency: :euro,lang: :en,result: 'TWENTY-TWO EURO'},
        {amount: '23',currency: :euro,lang: :en,result: 'TWENTY-THREE EURO'},
        {amount: '24',currency: :euro,lang: :en,result: 'TWENTY-FOUR EURO'},
        {amount: '25',currency: :euro,lang: :en,result: 'TWENTY-FIVE EURO'},
        {amount: '26',currency: :euro,lang: :en,result: 'TWENTY-SIX EURO'},
        {amount: '27',currency: :euro,lang: :en,result: 'TWENTY-SEVEN EURO'},
        {amount: '28',currency: :euro,lang: :en,result: 'TWENTY-EIGHT EURO'},
        {amount: '29',currency: :euro,lang: :en,result: 'TWENTY-NINE EURO'},
        {amount: '30',currency: :euro,lang: :en,result: 'THIRTY EURO'},
        {amount: '40',currency: :euro,lang: :en,result: 'FORTY EURO'},
        {amount: '50',currency: :euro,lang: :en,result: 'FIFTY EURO'},
        {amount: '60',currency: :euro,lang: :en,result: 'SIXTY EURO'},
        {amount: '70',currency: :euro,lang: :en,result: 'SEVENTY EURO'},
        {amount: '80',currency: :euro,lang: :en,result: 'EIGHT EURO'},
        {amount: '90',currency: :euro,lang: :en,result: 'NINETY EURO'},
        {amount: '100',currency: :euro,lang: :en,result: 'ONE HUNDRED EURO'},
        {amount: '101',currency: :euro,lang: :en,result: 'ONE HUNDRED AND ONE EURO'},
        {amount: '102',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWO EURO'},
        {amount: '103',currency: :euro,lang: :en,result: 'ONE HUNDRED AND THREE EURO'},
        {amount: '104',currency: :euro,lang: :en,result: 'ONE HUNDRED AND FOUR EURO'},
        {amount: '105',currency: :euro,lang: :en,result: 'ONE HUNDRED AND FIVE EURO'},
        {amount: '106',currency: :euro,lang: :en,result: 'ONE HUNDRED AND SIX EURO'},
        {amount: '107',currency: :euro,lang: :en,result: 'ONE HUNDRED AND SEVEN EURO'},
        {amount: '108',currency: :euro,lang: :en,result: 'ONE HUNDRED AND EIGHT EURO'},
        {amount: '109',currency: :euro,lang: :en,result: 'ONE HUNDRED AND NINE EURO'},
        {amount: '110',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TEN EURO'},
        {amount: '111',currency: :euro,lang: :en,result: 'ONE HUNDRED AND ELEVEN EURO'},
        {amount: '112',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWELVE EURO'},
        {amount: '113',currency: :euro,lang: :en,result: 'ONE HUNDRED AND THIRTEEN EURO'},
        {amount: '114',currency: :euro,lang: :en,result: 'ONE HUNDRED AND FOURTEEN EURO'},
        {amount: '115',currency: :euro,lang: :en,result: 'ONE HUNDRED AND FIFTEEN EURO'},
        {amount: '116',currency: :euro,lang: :en,result: 'ONE HUNDRED AND SIXTEEN EURO'},
        {amount: '117',currency: :euro,lang: :en,result: 'ONE HUNDRED AND SEVENTEEN EURO'},
        {amount: '118',currency: :euro,lang: :en,result: 'ONE HUNDRED AND EIGHTEEN EURO'},
        {amount: '119',currency: :euro,lang: :en,result: 'ONE HUNDRED AND NINETEEN EURO'},
        {amount: '120',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWENTY EURO'},
        {amount: '121',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWENTY-ONE EURO'},
        {amount: '122',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWENTY-TWO EURO'},
        {amount: '123',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWENTY-THREE EURO'},
        {amount: '124',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWENTY-FOUR EURO'},
        {amount: '125',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWENTY-FIVE EURO'},
        {amount: '126',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWENTY-SIX EURO'},
        {amount: '127',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWENTY-SEVEN EURO'},
        {amount: '128',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWENTY-EIGHT EURO'},
        {amount: '129',currency: :euro,lang: :en,result: 'ONE HUNDRED AND TWENTY-NINE EURO'},
        {amount: '130',currency: :euro,lang: :en,result: 'ONE HUNDRED AND THIRTY EURO'},
        {amount: '140',currency: :euro,lang: :en,result: 'ONE HUNDRED AND FORTY EURO'},
        {amount: '150',currency: :euro,lang: :en,result: 'ONE HUNDRED AND FIFTY EURO'},
        {amount: '160',currency: :euro,lang: :en,result: 'ONE HUNDRED AND SIXTY EURO'},
        {amount: '170',currency: :euro,lang: :en,result: 'ONE HUNDRED AND SEVENTY EURO'},
        {amount: '180',currency: :euro,lang: :en,result: 'ONE HUNDRED AND EIGHT EURO'},
        {amount: '190',currency: :euro,lang: :en,result: 'ONE HUNDRED AND NINETY EURO'},
        {amount: '200',currency: :euro,lang: :en,result: 'TWO HUNDRED EURO'},
        {amount: '300',currency: :euro,lang: :en,result: 'THREE HUNDRED EURO'},
        {amount: '400',currency: :euro,lang: :en,result: 'FOUR HUNDRED EURO'},
        {amount: '500',currency: :euro,lang: :en,result: 'FIVE HUNDRED EURO'},
        {amount: '600',currency: :euro,lang: :en,result: 'SIX HUNDRED EURO'},
        {amount: '700',currency: :euro,lang: :en,result: 'SEVEN HUNDRED EURO'},
        {amount: '800',currency: :euro,lang: :en,result: 'EIGHT HUNDRED EURO'},
        {amount: '900',currency: :euro,lang: :en,result: 'NINE HUNDRED EURO'},
        {amount: '1000',currency: :euro,lang: :en,result: 'ONE THOUSAND EURO'},
        {amount: '1000',currency: :drachmas,lang: :en,result: 'ONE THOUSAND DRACHMAS'},
        {amount: '1001',currency: :euro,lang: :en,result: 'ONE THOUSAND ONE EURO'},
        {amount: '1001',currency: :drachmas,lang: :en,result: 'ONE THOUSAND ONE DRACHMAS'},
        {amount: '2000',currency: :euro,lang: :en,result: 'TWO THOUSAND EURO'},
        {amount: '1000000',currency: :euro,lang: :en,result: 'ONE MILLION EURO'},
        {amount: '2000000',currency: :euro,lang: :en,result: 'TWO MILLION EURO'},
        {amount: '1000000000',currency: :euro,lang: :en,result: 'ONE BILLION EURO'},
        {amount: '2000000000',currency: :euro,lang: :en,result: 'TWO BILLION EURO'},
        {amount: '1000000000000',currency: :euro,lang: :en,result: 'ONE TRILLION EURO'},
        {amount: '2000000000000',currency: :euro,lang: :en,result: 'TWO TRILLION EURO'},
        {amount: '1000000000000000',currency: :euro,lang: :en,result: 'ONE QUADRILLION EURO'},
        {amount: '2000000000000000',currency: :euro,lang: :en,result: 'TWO QUADRILLION EURO'},
        {amount: '1234567890123456,12',currency: :euro,lang: :en,result: 'ONE QUADRILLION TWO HUNDRED AND THIRTY-FOUR TRILLION FIVE HUNDRED AND SIXTY-SEVEN BILLION EIGHT HUNDRED AND NINETY MILLION ONE HUNDRED AND TWENTY-THREE THOUSAND FOUR HUNDRED AND FIFTY-SIX EURO AND TWELVE EUROCENTS'},
        {amount: '9999999999999999,99',currency: :euro,lang: :en,result: 'NINE QUADRILLION NINE HUNDRED AND NINETY-NINE TRILLION NINE HUNDRED AND NINETY-NINE BILLION NINE HUNDRED AND NINETY-NINE MILLION NINE HUNDRED AND NINETY-NINE THOUSAND NINE HUNDRED AND NINETY-NINE EURO AND NINETY-NINE EUROCENTS'},
        {amount: '999999999999999999,99',currency: :euro,lang: :en,result: 'NINE HUNDRED AND NINETY-NINE QUADRILLION NINE HUNDRED AND NINETY-NINE TRILLION NINE HUNDRED AND NINETY-NINE BILLION NINE HUNDRED AND NINETY-NINE MILLION NINE HUNDRED AND NINETY-NINE THOUSAND NINE HUNDRED AND NINETY-NINE EURO AND NINETY-NINE EUROCENTS'}

    ]

    tests.each do |t|

      assert_equal t[:result ],NumberReadOut.full_currency_text(t[:amount],t[:currency],t[:lang])

    end

  end

end
