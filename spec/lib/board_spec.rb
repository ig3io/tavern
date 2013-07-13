require 'spec_helper'

describe Tavern::Board do

  let(:status_list) { [:todo, :done] }
  let(:priorities) { [:low, :normal, :high] }
  
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

end
