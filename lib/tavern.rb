require "tavern/version"

module Tavern
  
  class Task
    attr_accessor :status, :priority, :text, :tags
    STATUS = [:todo, :done]
    PRIORITY = [:low, :normal, :high]

    self.class_eval do
      STATUS.each do |s|
        define_method("#{s}?") { self.status == s }
        define_method("#{s}!") { self.status = s }
      end
      PRIORITY.each do |p|
        define_method("#{p}?") { self.priority == p }
        define_method("#{p}!") { self.priority = p }
      end
    end

    def initialize(text, *tags)
      self.status = :todo
      self.priority = :normal
      self.text = text
      self.tags = tags || []
    end

  end

end
