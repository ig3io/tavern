require 'tavern'

include Tavern

a = Task.new "test the gem", priority: :high, tags: [:test, :tavern]
b = Task.new "slay some dragons", tags: [:gaming, :fus!]

board = Board.new
board.add(a, b)

board.todo.each do |task|
  puts task.text
end
