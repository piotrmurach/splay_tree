# coding: utf-8

require 'spec_helper'

RSpec.describe SplayTree, 'new' do
  it "creates tree" do
    tree = described_class.new

    expect(tree.empty?).to be(true)
    expect(tree.size).to eq(0)
    expect(tree['a']).to eq(nil)

    tree['a'] = 1
    expect(tree.empty?).to be(false)
    expect(tree.size).to eq(1)
    expect(tree['a']).to eq(1)
    expect(tree.dump).to eq('a')

    tree['b'] = 2
    expect(tree.size).to eq(2)
    expect(tree.dump).to eq('(b a -)')

    tree['c'] = 3
    expect(tree.size).to eq(3)
    expect(tree.dump).to eq('(c (b a -) -)')

    tree['d'] = 4
    expect(tree.size).to eq(4)
    expect(tree.dump).to eq('(d (c (b a -) -) -)')
  end

  it "raises error when defualt and block given" do
    expect {
      SplayTree.new(0) { :unknown }
    }.to raise_error(ArgumentError)
  end

  it "defaults to value" do
    tree = SplayTree.new(0)
    expect(tree['a']).to eq(0)
    expect(tree['b']).to eq(0)
  end

  it "default to block" do
    tree = SplayTree.new { ['a'] }
    expect(tree[1]).to eq(['a'])
    expect(tree[2]).to eq(['a'])
  end
end
