# coding: utf-8

require 'spec_helper'

RSpec.describe SplayTree, 'insert' do
  it "overrides existing value" do
    tree = described_class.new
    tree['a'] = 1
    tree['a'] = 2
    expect(tree.size).to eq(1)
    expect(tree['a']).to eq(2)
  end

  it "balances out the leaves" do
    tree = described_class.new
    tree['a'] = 1
    tree['b'] = 2
    tree['c'] = 3
    tree['d'] = 4
    tree['e'] = 5
    expect(tree.dump).to eq('(e (d (c (b a -) -) -) -)')
    expect(tree['c']).to eq(3)
    expect(tree.dump).to eq('(c (b a -) (d - e))')
  end

  it "inserts items to the left" do
    tree = described_class.new
    tree['c'] = 1
    tree['b'] = 2
    # zig right
    expect(tree.dump).to eq('(b - c)')
    tree['a'] = 3
    # zig right
    expect(tree.dump).to eq('(a - (b - c))')
  end

  it "inserts items to the right" do
    tree = described_class.new
    tree['a'] = 1
    expect(tree.dump).to eq('a')
    tree['b'] = 2
    # zig left
    expect(tree.dump).to eq('(b a -)')
    tree['c'] = 3
    # zig left
    expect(tree.dump).to eq('(c (b a -) -)')
  end

  it "inserts to the left and the right" do
    tree = described_class.new
    expect(tree.dump).to eq('')
    tree['g'] = 1
    tree['a'] = 2
    # zig right
    expect(tree.dump).to eq('(a - g)')
    tree['w'] = 3
    expect(tree.dump).to eq('(w (a - g) -)')
    # zig-zag right
    tree['d'] = 4
    expect(tree.dump).to eq('(d a (w g -))')
  end

  it "builds the tree correctly" do
    tree = described_class.new
    tree['b'] = 1
    tree['a'] = 2
    expect(tree.dump).to eq("(a - b)")
    tree['e'] = 3
    expect(tree.dump).to eq("(e (a - b) -)")
    tree['f'] = 4
    expect(tree.dump).to eq("(f (e (a - b) -) -)")
    tree['g'] = 5
    expect(tree.dump).to eq("(g (f (e (a - b) -) -) -)")
    tree['i'] = 6
    expect(tree.dump).to eq("(i (g (f (e (a - b) -) -) -) -)")
    tree['d'] = 7
    expect(tree.dump).to eq("(d (a - b) (i (g (f e -) -) -))")
  end
end
