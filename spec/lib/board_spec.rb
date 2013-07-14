require 'spec_helper'

describe Tavern::Board do

  let(:status_list) { [:todo, :done] }
  let(:priorities) { [:low, :normal, :high] }
  
  let(:tasks) do
    list = []
    Tavern::PRIORITY.each do |priority|
      Tavern::STATUS.each do |status|
        list << Tavern::Task.new("a thing", priority: priority, status: status)
      end
    end
    list
  end
  
  subject(:board) { Tavern::Board.new }

  its(:tasks) { should be_empty }

  context "#add" do

    let(:task) { double }
    
    it "should add a new task" do
      expect { board.add(task) }.to change { board.tasks.count }.by(1)
    end

  end

  it "should respond to each possible status" do
    status_list.each do |status|
      should respond_to(status)
    end
  end

  it "should respond to each possible priority" do
    priorities.each do |priority|
      should respond_to(priority)
    end
  end

  context "#priority" do

    before { board.add(*tasks) }

    it "should return a non empty array if there are matches" do
      Tavern::PRIORITY.each do |priority|
        board.send(priority).count.should be > 0
      end
    end

    it "should return the array of tasks that match the specified priority" do
      Tavern::PRIORITY.each do |priority|
        board.send(priority).should include(*tasks.select { |task|
          task.send("#{priority}?")
        })
      end
    end

  end

  context "#status" do

    before { board.add(*tasks) }

    it "should return a non empty array if there are matches" do
      Tavern::STATUS.each do |status|
        board.send(status).count.should be > 0
      end
    end

    it "should return the array of tasks that match the specified status" do
      Tavern::STATUS.each do |status|
        board.send(status).should include(*tasks.select { |task|
          task.send("#{status}?")
        })
      end
    end

  end

  context "#remove" do

      let(:task) { double(text: "to delete", priority: :low, status: :done) }

      it "should remove an existing task" do
        board.add(task)
        expect { board.delete(task) }.to change { board.tasks.include?(task) }.from(true).to(false)
      end

      it "should raise a TavernError if the task is not included in tasks" do
        expect { board.delete(task) }.to raise_exception(Tavern::TavernError)
      end
  
  end

end
