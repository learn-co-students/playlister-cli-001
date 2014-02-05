module Findable
  def find_by_name(name)
    self.all.find { |obj| obj.name == name }
  end

  def create_by_name(name)
    self.new.tap { |obj| obj.name = name }
  end
end
