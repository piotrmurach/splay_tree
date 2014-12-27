# coding: utf-8

class SplayTree
  # A single tree node representation
  class Node
    include Comparable

    UndefinedValue = Module.new

    attr_reader :key

    attr_reader :value

    attr_accessor :left

    attr_accessor :right

    def initialize(key, value)
      @key, @value = key, value
      @left = @right = Node::EMPTY
    end

    def empty?
      false
    end

    def size
      left.size + 1 + right.size
    end

    def <=>(other)
      @key <=> other.key
    end

    def dump
      left = @left.dump
      right = @right.dump
      if !@left.empty? || !@right.empty?
        '(' + [@key, left || '-', right || '-'].compact.join(' ') + ')'
      else
        @key || ''
      end
    end

    # Rotate right
    #
    #     Y         X
    #    / \       / \
    #   X   C  => A   Y
    #  / \           / \
    # A   B         B   C
    #
    # @api private
    def rotate_right
      tmp       = @left
      @left     = tmp.right
      tmp.right = self
      tmp
    end

    # Rotate left
    #
    #   Y            X
    #  / \          / \
    # A   X   =>   Y   C
    #    / \      / \
    #   B   C    A   B
    #
    # @api private
    def rotate_left
      tmp      = @right
      @right   = tmp.left
      tmp.left = self
      tmp
    end

    # Insert new root
    #
    # @api private
    def insert(key, value)
      case key <=> @key
      when -1
        @left = @left.insert(key, value)
        rotate_right
      when 0
        @value = value
        self
      when 1
        @right = @right.insert(key, value)
        rotate_left
      else
        fail TypeError, "Cannot compare: #{key} with #{@key}"
      end
    end

    class EmptyNode < Node
      def initialize
      end

      def empty?
        true
      end

      def size
        0
      end

      def to_s
      end

      def dump
      end

      def insert(key, value)
        Node.new(key, value)
      end
    end # EmptyNode

    EMPTY = Node::EmptyNode.new.freeze
  end # Node
end # SplayTree
