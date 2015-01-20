require('rspec')
require('pry')
require('contact')
require('phone')

describe(Phone) do

  before() do
    Phone.clear()
  end

  describe(".all") do
    it("at first is empty") do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("it clears the phone array") do
      test_clear = Phone.new({:phone_number => "503-222-2222", :type => "Work", :contact_id => 1}).save()
      Phone.clear()
      expect(Phone.all).to(eq([]))
    end
  end

  describe(".find") do
    it("returns the object from the master when searched for") do
      test_find1 = Phone.new({:phone_number => "503-222-2222", :type => "Work", :contact_id => 1}).save()
      test_find2 = Phone.new({:phone_number => "503-333-3333", :type => "Cell", :contact_id => 2}).save()
      expect(Phone.find(test_find1.contact_id())).to(eq(test_find1))
    end
  end

  describe("#contact_id") do
    it("let's you read the contact_id out") do
      test_id = Phone.new({:phone_number => "503-222-2222", :type => "Work", :contact_id => 1})
      expect(test_id.contact_id()).to(eq(1))
    end
  end

  describe("#save") do
    it("saves the object to the entry") do
      test_save = Phone.new({:phone_number => "503-777-7777", :type => "Cell", :contact_id => 1})
      test_save.save()
      expect(Phone.all()).to(eq([test_save]))
    end
  end
end
