# coding: utf-8

require 'spec_helper'

RSpec.describe SplayTree, '.to_hash' do
  it "exports tree as hash" do
    tree = SplayTree.new
    hash = {'a' => 1, 'ab' => 2, 'abc' => 3, 'abd' => 4, 'ac' => 5, 'b' => 6}
    hash.each { |k, v| tree[k] = v }
    expect(tree.to_hash).to eq(hash)
  end
end
