require 'pry'
module Findable

  def find_by_name(name)
    found_item = nil
    all = self.all

    all.each do |item|
      if item.name == name
        found_item = item
      end
    end

    found_item
  end



end