module Pivot
  class Tracker
    def self.count(items)
      items.count
    end

    def self.item_for(items, assignee)
      sorted_items = self.sort_pivots(items)
      sorted_items.detect{|item| item[:assignee] == assignee}
    end

    def self.pivoted?(items, assignee)
      self.unique_assignees(items)
        .map{|item| item[:assignee]}
        .include?(assignee)
    end

    def self.total_points(items, assignee: '' )
      total = if assignee.empty?
        self.unique_assignees(items)
          .map{|item| item[:points]}
          .reduce(:+)
      else
        items
          .select{|item| item[:assignee] == assignee}
          .map{|item| item[:points]}
          .reduce(:+)
      end
      total
    end

    def self.unique_assignees(items)
      self.sort_pivots(items).uniq{|item| item[:assignee]}
    end

    def self.sort_pivots(items)
      items.sort_by{|item| item[:name]}
    end
  end
end
