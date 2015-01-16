require('rspec')
require('pry')
require('contact')

describe(Contact) do
  describe('#name') do
    it('returns the name of the contact') do
      test_person = Contact.new({:name => "Peter", :number => "9716451564"})
      expect(test_person.name()).to(eq("Peter"))
    end
  end

  
end
