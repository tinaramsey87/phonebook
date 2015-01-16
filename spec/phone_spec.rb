require('rspec')
require('phone')
require('contact')

describe(Phone) do

  describe('#add_number') do
    it('adds an additional number to a contact') do
      test_number = Phone.new({:number2 => "5033331234"})
      test_contact = Contact.new({:name => "Peter", :number => "9716451564"})
      test_number.add_number(test_contact)
      expect(test_number.contacts()).to(eq([test_contact]))
    end
  end
end
