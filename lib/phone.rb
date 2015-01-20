class Phone

  attr_reader(:phone_number, :type, :contact_id)

  @@numbers_master = []

  define_method(:initialize) do |attributes|
    @phone_number = attributes.fetch(:phone_number)
    @type = attributes.fetch(:type)
    @contact_id = @@numbers_master.length() + 1
  end

  define_singleton_method(:all) do
    @@numbers_master
  end

  define_singleton_method(:clear) do
    @@numbers_master = []
  end

  define_singleton_method(:find) do |id|
    found_phone = nil
    @@numbers_master.each() do |number|
      if number.contact_id().eql?(id.to_i())
        found_phone = number
      end
    end
    found_phone
  end

  define_method(:save) do
    @@numbers_master.push(self)
    self
  end
end
