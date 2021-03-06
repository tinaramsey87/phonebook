class Contact
  
  attr_reader(:name)

  @@contacts = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = @@contacts.length().+(1)
    @numbers = []
  end

  define_method(:id) do
    @id
  end

  define_method(:numbers) do
    @numbers
  end

  define_singleton_method(:list) do
    @@contacts
  end

  define_method(:add) do
    @@contacts.push(self)
  end

  define_method(:add_number) do |number|
    @numbers.push(number)

  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end

end
