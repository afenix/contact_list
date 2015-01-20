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

  define_method(:number_add) do
    @number_add
  end

  define_method(:add_phone) do |new_number|
    @number_add.push(new_number)
  end
end
