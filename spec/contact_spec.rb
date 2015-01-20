require('rspec')
require('pry')
require('contact')

describe(Contact) do

  before() do
    Contact.clear()
  end

  describe("#name") do
    it("returns the name of the contact") do
      test_digits = Phone.new({:cell => "503-222-2222", :work => "503-876-1234", :pager => "800-111-1234"})
      test_contact = Contact.new({:name => "Nealy Pearson", :phone_numbers => test_digits})
      expect(test_contact.name()).to(eq("Nealy Pearson"))
    end
  end

  describe("#phone_numbers") do
    it("returns the phone numbers of the contact") do
      test_digits = Phone.new({:cell => "503-222-2222", :work => "503-876-1234", :pager => "800-111-1234"})
      test_contact = Contact.new({:name => "Nealy Pearson", :phone_numbers => test_digits})
      expect(test_contact.phone_numbers()).to(eq(test_digits))
    end
  end

  describe(".all") do
    it("at first is empty") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the object to the entry") do
      test_digits = Phone.new({:cell => "503-222-2222", :work => "503-876-1234", :pager => "800-111-1234"})
      test_contact = Contact.new({:name => "Nealy Pearson", :phone_numbers => test_digits})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".clear") do
    it("clears the contacts array") do
      test_digits = Phone.new({:cell => "503-222-2222", :work => "503-876-1234", :pager => "800-111-1234"})
      test_contact = Contact.new({:name => "Nealy Pearson", :phone_numbers => test_digits})
      test_digits2 = Phone.new({:cell => "503-111-1111", :work => "503-234-1234", :pager => "800-777-8765"})
      test_contact2 = Contact.new({:name => "Beverly Hills", :phone_numbers => test_digits2})
      Contact.clear()
      expect(Contact.all).to(eq([]))
    end
  end

end
