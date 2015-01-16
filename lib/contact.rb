class Contact

  attr_reader(:name, :number)

  @@contacts = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @number = attributes.fetch(:number)
    @id = @@contacts.length().+(1)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:list) do
    @@contacts
  end

  define_method(:add) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end


end
