class Phone  #Vehicle

  attr_reader(:home, :work, :cell)

  @@numbers = []

  define_method(:initialize) do |attributes|
    @home = attributes.fetch(:home)
    @work = attributes.fetch(:work)
    @cell = attributes.fetch(:cell)

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

end
