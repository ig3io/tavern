require "tavern/version"

module Tavern

  STATUS = [:todo, :done]
  PRIORITY = [:low, :normal, :high]

  class TavernError < StandardError; end

  class Board

    attr_reader :tasks

    self.class_eval do
      STATUS.each do |status|
        define_method status do
          tasks.select { |task| task.send("#{status}?") }
        end
      end
      PRIORITY.each do |priority|
        define_method priority do
          tasks.select { |task| task.send("#{priority}?") }
        end
      end
    end
    
    def initialize
      @tasks = []
    end

    def add(*tasks)
      tasks.each { |task| @tasks << task }
    end

    def delete(*tasks)
      tasks.each do |task|
        @tasks.delete(task) do
          raise TavernError, "#{task} is not included in #{self} tasks"
        end
      end
    end

  end
  
  class Task
    attr_accessor :status, :priority, :text, :tags

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

    def initialize(text, options = {}, *tags)
      self.status = options[:status] ||:todo
      self.priority = options[:priority] || :normal
      self.text = text
      self.tags = tags || []
    end

  end

end
