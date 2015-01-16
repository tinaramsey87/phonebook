require('rspec')
require('pry')
require('contact')

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
end
