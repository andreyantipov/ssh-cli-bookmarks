require 'ssh/bookmarks/version'

module SSH
  # Initialize ssh connection
  # @param server [String] name of server
  def self.connect(server)
    exec "ssh #{server}"
  end

  module Bookmarks
    # This class handle the configuration file
    class Config
      # Constant which stored path of ssh config file
      PATH = "#{ENV['HOME']}/.ssh/config"
      # Constant which stored of array custom options of ssh config
      OPTIONS = %w(hidden)

      # load and initialize parsing configuration file
      def initialize
        new = File.readlines(PATH).map(&:split)
        @data = construct new
      rescue => err
        abort "Error: config is invalid.\nReason: #{err}"
      end

      # Parse and build configuration
      # @param raw [Array] original data ssh config file
      # @return [Hash] container of parsed config
      def construct(raw)
        container = []
        raw.each_with_index do |block, index|
          next if block.empty? || comment?(block)
          if block[0] == 'Host'
            container << {}
            container.last.merge!(options: options(raw, index))
          end
          container.last.merge!(block[0].downcase.to_sym => block[1]) if defined? container
        end
        container
      end

      # Parse options placed in comments which allowed in OPTIONS constant
      # @param raw [Array] original data of ssh config file
      # @param index [Integer] index which used for definition of membership of comments
      # @return [Array] list of options for specific group which is found in specific range
      def options(raw, index)
        @prev_index = 0 unless defined? @prev_index
        options = {}
        index += 1 if index > 0
        # catch options between range
        raw[@prev_index..index].each do |opt|
          if comment?(opt) && option?(opt)
            options.merge!(opt[1].downcase.to_sym => true)
          end
        end
        @prev_index = index
        options
      end

      # Determine whether the block in the list of allowed
      # @param block [String] the testable string 
      # @return [Boolean] returns the current state of block 
      def option?(block)
        OPTIONS.include?(block[1])
      end

      # Determine whether the block is comment?
      # @param block [String] the testable string
      # @return [Boolean] return current state of block
      def comment?(block)
        block[0] == '#' ? true : false
      end

      # Determine whether the config is exist
      # @return [Boolean] return true if config exist or abort the process
      def exist?
        # ssh configuration file
        if File.exist?(PATH)
          return true
        else
          abort "Error: no configuration file is found.\nExpected path: #{path}"
        end
      end

      attr_reader :data
      private :exist?, :comment?, :option?, :construct, :options
    end
  end
end
