# frozen_string_literal: true

require "spec_helper"

RSpec.describe SplayTree, "#fetch" do
  it "removes element from the tree" do
    tree = SplayTree.new
    tree["aa"] = 1
    tree["ab"] = 2
    tree["bb"] = 3
    tree["bc"] = 4
    tree["a"] = 5
    tree["abc"] = 6

    expect(tree.size).to eq(6)
    expect(tree.dump).to eq("(abc (a - (ab aa -)) (bc bb -))")

    expect(tree.delete("abc")).to eq(6)
    expect(tree.dump).to eq("(ab (a - aa) (bc bb -))")
    expect(tree["aa"]).to eq(1)
    expect(tree["ab"]).to eq(2)
    expect(tree["bb"]).to eq(3)
    expect(tree["bc"]).to eq(4)
    expect(tree["a"]).to eq(5)
    expect(tree["abc"]).to eq(nil)

    expect(tree.delete("ab")).to eq(2)
    expect(tree.dump).to eq("(aa a (bb - bc))")
    expect(tree["aa"]).to eq(1)
    expect(tree["ab"]).to eq(nil)
    expect(tree["bb"]).to eq(3)
    expect(tree["bc"]).to eq(4)
    expect(tree["a"]).to eq(5)
    expect(tree["abc"]).to eq(nil)
  end

  it "checks for key existance" do
    tree = SplayTree.new
    tree["a"] = 1
    expect(tree.key?("a")).to eq(true)
  end

  it "fails to retrieve a value based on a key of a different type" do
    tree = SplayTree.new
    obj = Module.new
    tree["a"] = 1
    expect { tree[obj] = 2 }.to raise_error(TypeError)
  end

  it "retrieves values based on keys of the same type" do
    tree = SplayTree.new
    tree[:a] = 1
    tree[:b] = 2
    expect(tree[:a]).to eq(1)
    expect(tree[:b]).to eq(2)
    expect(tree[:x]).to eq(nil)
  end
end
