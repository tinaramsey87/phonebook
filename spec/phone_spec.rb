require('rspec')
require('pry')
require('phone')
require('contact')

describe(Phone) do

  before() do
    Phone.clear()
  end

  describe('#home') do
    it('returns home number') do
      test_home = Phone.new({:home => "5033331234", :work => "1234567890", :cell => "7763614270"})
      expect(test_home.home()).to(eq("5033331234"))
    end
  end

  describe('#work') do
    it('returns work number') do
      test_work = Phone.new({:home => "5033331234", :work => "1234567890", :cell => "7763614270"})
      expect(test_work.work()).to(eq("1234567890"))
    end
  end

  describe('#cell') do
    it('returns cell number') do
      test_cell = Phone.new({:home => "5033331234", :work => "1234567890", :cell => "7763614270"})
      expect(test_cell.cell()).to(eq("7763614270"))
    end
  end

  describe('#add') do
    it('adds a new phone number to the list of numbers for a contact') do
      test_cell = Phone.new({:home => "5033331234", :work => "1234567890", :cell => "7763614270"})
      test_cell.add()
      expect(Phone.list()).to(eq([test_cell]))
    end
  end

  describe('.list') do
    it('holds saved phone numbers for a contact; is empty at first') do
      expect(Phone.list()).to(eq([]))
    end
  end

  describe('.clear') do  ##change words
    it('clears the list of phone numbers') do
      test_cell = Phone.new({:home => "5033331234", :work => "1234567890", :cell => "7763614270"})
      test_cell.add()
      Phone.clear()
      expect(Phone.list()).to(eq([]))
    end
  end

end
