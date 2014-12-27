# SplayTree

> Self balancing binary tree that keeps lookup operations fast by optimizing frequently accessed keys. Useful for implementing caches and garbage collection algorithms.

## Features

* Familiar hash like access
* Easy instantiation with default value

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'splay_tree'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install splay_tree

## Usage

```ruby
tree = SplayTree.new
tree['a'] = 1
tree['b'] = 2
```

## Interface

### insert

### fetch

### delete

## Contributing

1. Fork it ( https://github.com/peter-murach/splay_tree/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2014 Piotr Murach. See LICENSE for further details.
