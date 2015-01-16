class Contact

  attr_reader(:name, :number, :uid)

  @@contacts_master = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @number = attributes.fetch(:number)
    @uid = @@contacts_master.length() + 1
    @number_add = []
  end

  define_singleton_method(:all) do
    @@contacts_master
  end

  define_singleton_method(:clear) do
    @@contacts_master = []
  end

  define_method(:save) do
    @@contacts_master.push(self)
    self
  end

  define_singleton_method(:search) do |uid|
    found_contact = nil
    @@contacts_master.each() do |contact|
      if contact.uid() == uid
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:add_phone) do |phone_number|
    @number_add.push(phone_number)
  end
end

class Phone

  attr_reader(:phone_number, :type, :uid)

  @@numbers_master = []

  define_method(:initialize) do |attributes|
    @phone_number = attributes.fetch(:phone_number)
    @type = attributes.fetch(:type)
    @uid = @@numbers_master.length() + 1
  end

  define_singleton_method(:all) do
    @@numbers_master
  end

  define_singleton_method(:clear) do
    @@numbers_master = []
  end
end
