# coding: utf-8

require 'spec_helper'

RSpec.describe SplayTree, 'delete' do
  it "removes element from the tree" do
    tree = SplayTree.new
    tree['a'] = 1
    tree['ab'] = 2
    tree['abc'] = 3
    tree['abd'] = 4
    tree['ac'] = 5
    tree['b'] = 6

    expect(tree.size).to eq(6)
    expect(tree.dump).to eq('(b (ac (abd (abc (ab a -) -) -) -) -)')
    expect(tree.delete('xxx')).to eq(nil)

    expect(tree.delete('abd')).to eq(4)
    expect(tree.dump).to eq('(abc (ab a -) (ac - b))')
    expect(tree.size).to eq(5)

    expect(tree.delete('ab')).to eq(2)
    expect(tree.dump).to eq('(a - (abc - (ac - b)))')
    expect(tree.size).to eq(4)

    expect(tree.delete('a')).to eq(1)
    expect(tree.dump).to eq('(abc - (ac - b))')
    expect(tree.size).to eq(3)

    expect(tree.delete('abc')).to eq(3)
    expect(tree.dump).to eq('(ac - b)')
    expect(tree.size).to eq(2)

    expect(tree.delete('ac')).to eq(5)
    expect(tree.dump).to eq('b')
    expect(tree.size).to eq(1)

    expect(tree.delete('b')).to eq(6)
    expect(tree.dump).to eq('')
    expect(tree.size).to eq(0)
  end
end
