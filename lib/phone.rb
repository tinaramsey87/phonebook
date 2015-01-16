class Phone

  attr_reader(:number2)

  define_method(:initialize) do |attributes|
    @number2 = attributes.fetch(:number2)
    @contacts = []

  end

  define_method(:contacts) do
    @contacts
  end

  define_method(:add_number) do |number|
    @contacts.push(number)
  end

end
