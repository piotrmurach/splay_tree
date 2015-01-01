# coding: utf-8

require 'spec_helper'

RSpec.describe SplayTree, '.each' do
  subject(:tree) { described_class.new }

  before {
    tree['a'] = 1
    tree['b'] = 2
    tree['c'] = 3
  }

  it "enumartes all pairs" do
    yielded = []
    expect {
      tree.each { |k, v| yielded << [k, v] }
    }.to change { yielded }.from([]).to([['a', 1], ['b', 2], ['c', 3]])
    expect(tree.to_a).to eq(yielded)
  end

  it "enumerates all keys" do
    yielded = []
    expect {
      tree.each_key { |k| yielded << k }
    }.to change { yielded }.from([]).to(['a', 'b', 'c'])

    result = tree.each_key
    expect(result.to_a).to eq(yielded)
  end

  it "enumerates all values" do
    yielded = []
    expect {
      tree.each_value { |v| yielded << v }
    }.to change { yielded }.from([]).to([1, 2, 3])

    result = tree.each_value
    expect(result.to_a).to eq(yielded)
  end

  it "populates all keys" do
    expect(tree.keys).to eq(['a', 'b', 'c'])
  end

  it "populates all values" do
    expect(tree.values).to eq([1, 2, 3])
  end
end
