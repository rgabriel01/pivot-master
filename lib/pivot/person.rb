module Pivot
  class Person
    attr_accessor :email, :first_name, :last_name, :items

    def initialize(email:, first_name:, last_name:)
      @email = email
      @first_name = first_name
      @last_name = last_name
      @items = []
    end

    def add_item(item, &block)
      item.assignee = @email
      @items.push(item)
      block.call if block_given?
    end
  end
end
