require 'spec_helper'

describe Tavern::Task do

  let(:text) { "text" }
  let(:tags) { [:work, :c, :review] }

  subject(:task) { Tavern::Task.new text }

  its(:text) { should == text }

  it { should be_todo }

  it { should_not be_done }

  its(:status) { should == :todo }

  it "can be set 'done'" do
    expect { task.done! }.to change { task.status }.from(:todo).to(:done)
  end
  
  it { should be_normal }

  its(:priority) { should == :normal }

  it "can be prioritized" do
    expect { task.low! }.to change { task.priority }.from(:normal).to(:low)
  end

  it "can be deprioritized" do
    expect { task.high! }.to change {task.priority }.from(:normal).to(:high)
  end

  context 'with done status' do

    before { task.done! }

    its(:status) { should == :done }

    it { should be_done }

    it { should_not be_todo }

    it "can be set back to 'todo'" do
      expect { task.todo! }.to change { task.status }.from(:done).to(:todo)  
    end

  end

  shared_examples_for 'tagged' do
    it "contains the assigned tags" do
      tags.each do |tag|
        tagged.tags.should include(tag)
      end
    end
  end

  context 'with tags added later' do
    it_behaves_like 'tagged' do 
      let(:tagged) do
        task = Tavern::Task.new(text)
        task.tags = tags
        task
      end
    end
  end

  context 'with tags on initialization' do
    it_behaves_like 'tagged' do
      let(:tagged) {
        Tavern::Task.new(text, *tags)
      }
    end
  end

end
