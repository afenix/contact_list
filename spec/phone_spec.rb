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
      test_clear = Phone.new({:cell => "503-222-2222", :work => "503-876-1234", :pager => "888-666-1234"}).save()
      Phone.clear()
      expect(Phone.all).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the object to the entry") do
      test_save = Phone.new({:cell => "503-777-7777", :work => "503-777-1234", :pager => "800-111-1234"})
      test_save.save()
      expect(Phone.all()).to(eq([test_save]))
    end
  end

  describe("#cell") do
    it("returns the cell number") do
      test_cell = Phone.new({:cell => "503-222-2222", :work => "503-876-1234", :pager => "800-111-1234"})
      expect(test_cell.cell()).to(eq("503-222-2222"))
    end
  end

  describe("#work") do
    it("returns the work number") do
      test_work = Phone.new({:cell => "503-222-2222", :work => "503-876-1234", :pager => "800-111-1234"})
      expect(test_work.work()).to(eq("503-876-1234"))
    end
  end

  describe("#pager") do
    it("returns the pager number") do
      test_pager = Phone.new({:cell => "503-222-2222", :work => "503-876-1234", :pager => "800-111-1234"})
      expect(test_pager.pager()).to(eq("800-111-1234"))
    end
  end

  describe("#add_cell") do
    it("will add a cell phone number") do
      test_numbers = Phone.new({:work => "503-476-9203", :pager => "888-647-9308"})
      test_numbers.add_cell("503-364-9283")
      expect(test_numbers.cell()).to(eq("503-364-9283"))
    end
  end

  describe("#add_work") do
    it("will add a work phone number") do
      test_numbers = Phone.new({:cell => "503-476-9203", :pager => "888-647-9308"})
      test_numbers.add_work("503-123-4567")
      expect(test_numbers.work()).to(eq("503-123-4567"))
    end
  end

  describe("#add_pager") do
    it("will add a pager number") do
      test_numbers = Phone.new({:cell => "503-476-9203", :work => "888-647-9308"})
      test_numbers.add_pager("503-123-4567")
      expect(test_numbers.pager()).to(eq("503-123-4567"))
    end
  end
end
