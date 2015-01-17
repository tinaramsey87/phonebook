class Phone

  attr_reader(:new_number, :type)

  @@numbers = []

  define_method(:initialize) do |attributes|
    @new_number = attributes.fetch(:new_number)
    @type = attributes.fetch(:type)
    @phone_id = @@numbers.length().+(1)

  end

  define_method(:phone_id) do
    @phone_id
  end

  define_method(:add) do
    @@numbers.push(self)

  end

  define_singleton_method(:list) do
    @@numbers

  end

  define_singleton_method(:clear) do
    @@numbers = []

  end

  define_singleton_method(:find) do |id|
    found_number = nil
    @@numbers.each() do |number|
      if number.phone_id().eql?(id)
        found_number = number
      end
    end
    found_number
  end

end
