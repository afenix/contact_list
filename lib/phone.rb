class Phone

  attr_reader(:cell, :work, :pager)

  @@numbers_master = []

  define_method(:initialize) do |numbers|
    @cell = numbers[:cell]
    @work = numbers[:work]
    @pager = numbers[:pager]
  end

  define_singleton_method(:all) do
    @@numbers_master
  end

  define_singleton_method(:clear) do
    @@numbers_master = []
  end

  define_method(:save) do
    @@numbers_master.push(self)
    self
  end

  define_method(:add_cell) do |cell|
    @cell = cell
  end

  define_method(:add_work) do |work|
    @work = work
  end

  define_method(:add_pager) do |pager|
    @pager = pager
  end

end
