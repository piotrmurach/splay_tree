# frozen_string_literal: true

require "spec_helper"

RSpec.describe SplayTree, "#default" do
  it "sets the default value on initialize" do
    tree = SplayTree.new("foo")
    expect(tree.default).to eq("foo")
    expect(tree["a"]).to eq("foo")
    expect(tree.default_proc).to eq(nil)
  end

  it "sets the default value on assigment" do
    tree = SplayTree.new
    tree.default = "foo"
    expect(tree.default).to eq("foo")
    expect(tree["a"]).to eq("foo")
    expect(tree.default_proc).to eq(nil)
  end

  it "sets the default_proc to be executed on each key lookup" do
    block = -> { "foo" }
    tree = SplayTree.new(&block)
    expect(tree.default).to eq(SplayTree::UndefinedValue)
    expect(tree.default_proc).to eq(block)
    expect(tree["a"]).to eq("foo")
  end
end
