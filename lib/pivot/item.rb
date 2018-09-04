module Pivot
  class Item
    attr_accessor :name, :assignee, :points

    VALID_CODES = ["EREC","AZR"].freeze

    def initialize(name:, assignee: "", points:)
      @name = name
      @assignee = assignee
      @points = points
    end

    def +(item)
      points + item.points
    end

    def project_code
      name.split("-")[0]
    end

    def valid?
      VALID_CODES.include?(project_code)
    end
  end
end
