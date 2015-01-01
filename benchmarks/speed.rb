# coding: utf-8

require 'benchmark/ips'
require 'splay_tree'
require 'securerandom'

def generate_key(size)
  SecureRandom.hex(size)
end

def insert_key(tree)
  key = generate_key(10)
  tree[key] = 1
  key
end

def run(bench, object)
  name = object.class.name

  key = nil

  bench.report("#{name} insert") do
    key = insert_key(object)
  end

  bench.report("#{name} find") do
    object[key]
  end

  bench.report("#{name} delete") do
    object.delete(key)
  end
end

Benchmark.ips do |bench|
  bench.config(time: 5, warmpu: 2)

  run(bench, SplayTree.new)
  run(bench, Hash.new)
end
