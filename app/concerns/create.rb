require 'pry'
module Create

def create_by_name(name)
  new_item = self.new
  new_item.name = name
  new_item
end

end