require('rspec')
require('pry')
require('phone')
require('contact')

describe(Phone) do

  before() do
    Phone.clear()
  end

  describe('#new_number') do
    it('returns home number') do
      test_home = Phone.new({:new_number => "5033331234", :type => "cell"})
      expect(test_home.new_number()).to(eq("5033331234"))
    end
  end

  describe('#type') do
    it('returns the type of number') do
      test_home = Phone.new({:new_number => "5033331234", :type => "cell"})
      expect(test_home.type()).to(eq("cell"))
    end
  end

  describe('#phone_id') do
    it('assigns an id number to each phone number') do
      test_home = Phone.new({:new_number => "5033331234", :type => "cell"})
      test_home.add()
      expect(test_home.phone_id()).to(eq(1))
    end
  end

  describe('#add') do
    it('adds a new phone number to the list of numbers for a contact') do
      test_home = Phone.new({:new_number => "5033331234", :type => "cell"})
      test_home.add()
      expect(Phone.list()).to(eq([test_home]))
    end
  end

  describe('.list') do
    it('holds saved phone numbers for a contact; is empty at first') do
      expect(Phone.list()).to(eq([]))
    end
  end

  describe('.clear') do  ##change words
    it('clears the list of phone numbers') do
      test_home = Phone.new({:new_number => "5033331234", :type => "cell"})
      test_home.add()
      Phone.clear()
      expect(Phone.list()).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a phone number based on the unique id number') do
      test_home = Phone.new({:new_number => "5033331234", :type => "cell"})
      test_home.add()
      test_work = Phone.new({:new_number => "5033334321", :type => "work"})
      test_work.add()
      expect(Phone.find(test_home.phone_id())).to(eq(test_home))
    end
  end

end
