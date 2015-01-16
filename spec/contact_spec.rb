require('rspec')
require('pry')
require('contact')
require('phone')

describe(Contact) do

  before() do
    Contact.clear()
  end

  describe('#name') do
    it('returns the name of the contact') do
      test_person = Contact.new({:name => "Peter", :number => "9716451564"})
      expect(test_person.name()).to(eq("Peter"))
    end
  end

  describe('#number') do
    it('returns the number of the contact') do
      test_person = Contact.new({:name => "Peter", :number => "9716451564"})
      expect(test_person.number()).to(eq("9716451564"))
    end
  end

  describe('#add') do
    it('adds the contact to the list of contacts') do
      test_person = Contact.new({:name => "Peter", :number => "9716451564"})
      test_person.add()
      expect(Contact.list()).to(eq([test_person]))
    end
  end

  describe('#id') do
    it('returns a contact by id number') do
      test_person = Contact.new({:name => "Peter", :number => "9716451564"})
      test_person.add()
      expect(test_person.id()).to(eq(1))
    end
  end

  describe('.list') do
    it('holds saved contacts; is empty at first') do
      expect(Contact.list()).to(eq([]))
    end
  end

  describe('.clear') do
    it('clears the list of saved contacts') do
      test_person = Contact.new({:name => "Peter", :number => "9716451564"})
      test_person.add()
      Contact.clear()
      expect(Contact.list()).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a contact based on the unique id number') do
      test_person = Contact.new({:name => "Peter", :number => "9716451564"})
      test_person.add()
      test_person2 = Contact.new({:name => "Robin", :number => "5039923463"})
      test_person2.add()
      expect(Contact.find(test_person.id())).to(eq(test_person))
    end
  end

  describe('#numbers') do
    it('is an array of phone numbers for a contact; it is empty at first') do
      test_person = Contact.new({:name => "Peter", :number => "9716451564"})
      expect(test_person.numbers()).to(eq([]))
    end
  end

  describe('#add_home') do
    it('adds a home number to the phone numbers for a contact') do
      test_home = Phone.new({:home => "5033331234", :work => "1234567890", :cell => "7763614270"})
      test_contact = Contact.new({:name => "Peter", :number => "9716451564"})
      test_contact.add_home(test_home.home())
      expect(test_contact.numbers()).to(eq(["5033331234"]))
    end
  end

  describe('#add_work') do
    it('adds a work number to the phone numbers for a contact') do
      test_work = Phone.new({:home => "5033331234", :work => "1234567890", :cell => "7763614270"})
      test_contact = Contact.new({:name => "Peter", :number => "9716451564"})
      test_contact.add_work(test_work.work())
      expect(test_contact.numbers()).to(eq(["1234567890"]))
    end
  end

  describe('#add_cell') do
    it('adds a cell number to the phone numbers for a contact') do
      test_cell = Phone.new({:home => "5033331234", :work => "1234567890", :cell => "7763614270"})
      test_contact = Contact.new({:name => "Peter", :number => "9716451564"})
      test_contact.add_cell(test_cell.cell())
      expect(test_contact.numbers()).to(eq(["7763614270"]))
    end
  end

end
