class Contact

  attr_reader(:name, :phone_numbers)

  @@all_contacts = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone_numbers = attributes.fetch(:phone_numbers)
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_singleton_method(:clear) do
    @@all_contacts = []
  end

  define_method(:save) do
    @@all_contacts.push(self)
    self
  end

  define_singleton_method(:find) do |contact_name|
    found_contact = nil
    @@all_contacts.each() do |contact|
      if contact.name() == contact_name
        found_contact = contact
      end
    end
    found_contact
  end
end
