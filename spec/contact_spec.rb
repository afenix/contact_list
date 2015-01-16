require('rspec')
require('pry')
require('contact')

describe(Contact) do

  before() do
    Contact.clear()
  end

  describe("#contact") do
    it("returns the name of the contact") do
      test_name = Contact.new({:name => "Nealy Pearson", :number => 503-777-7777})
      expect(test_name.name()).to(eq("Nealy Pearson"))
    end
  end

  describe("#number") do
    it("returns the number of the contact") do
      test_number = Contact.new({:name => "Nealy Pearson", :number => 503-777-7777})
      expect(test_number.number()).to(eq(503-777-7777))
    end
  end

  describe(".all") do
    it("at first is empty") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the object to the entry") do
      test_save = Contact.new({:name => "Nealy Pearson", :number => "503-777-7777"})
      test_save.save()
      expect(Contact.all()).to(eq([test_save]))
    end
  end

  describe("#uid") do
    it("assigns a numeric id") do
      test_id = Contact.new({:name => "Van Halen", :number => "503-333-3333"}).save()
      expect(test_id.uid()).to(eq(1))
    end
  end

  describe(".clear") do
    it("it clears the contacts array") do
      test_clear = Contact.new({:name => "Van Halen", :number => "503-333-3333"}).save()
      Contact.clear()
      expect(Contact.all).to(eq([]))
    end
  end

  describe(".find") do
    it("returns the object from the master when searched for") do
      test_find1 = Contact.new({:name => "Nealy Pearson", :number => "503-777-7777"}).save()
      test_find2 = Contact.new({:name => "Kaia Papaya", :number => "888-888-8888"}).save()
      expect(Contact.search(test_find1.uid())).to(eq(test_find1))
    end
  end

  describe("#add_phone") do
    it("adds a new phone number to a contact") do
      test_contact = Contact.new({:name => "Nealy Pearson", :number => "503-777-7777"}).save()
      test_phone = Phone.new({:phone_number => "503-222-2222", :type => "Work"})
      test_contact.add_phone(test_phone)
  binding.pry
      expect(test_contact.number_add()).to(eq([test_phone]))
    end
  end
end

# describe(Phone) do
#
#     before() do
#       Phone.clear()
#     end
#
#     describe(".all") do
#       it("at first is empty") do
#         expect(Phone.all()).to(eq([]))
#       end
#     end
#
#     describe(".clear") do
#       it("it clears the phone array") do
#         test_clear = Phone.new({:phone_number => "503-222-2222", :type => "Work"}).save()
#         Phone.clear()
#         expect(Phone.all).to(eq([]))
#       end
#     end
# end
