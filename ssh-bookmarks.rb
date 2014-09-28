#!/usr/bin/env ruby
# encoding: UTF-8

class Application

    require 'highline/import'

    VERSION = "0.1.1"

    class Foundation

        module SSH
            def self.connect server
                exec "ssh #{server}"
            end
        end

        module Bookmarks
          
            def self.skip? block

              @skipped = 0 unless defined? @skipped 

              case block[0]
                when "#"
                  # skip every comment block and skip full block if exception is set 
                  @skipped = 1 if block[1] == "hidden"; true
                when "Host"
                  @skipped > 0 && @skipped < 2 ? (@skipped += 1; true) : (@skipped = 0; false) 
                else
                  @skipped == 0 ? false : true 
                end
            end


            def self.config
            
                path = "#{ENV['HOME']}/.ssh/config"

                if File.exist?(path)
                    begin
                        # read and build config array
                        blocks = []
                        
                        c = File.readlines(path).map &:split
                        c.reject! &:empty?
                        
                        # create chunks
                        c.each do |block|
                           unless skip? block
                              blocks << {} if block[0] == "Host"
                              blocks.last.merge!("#{block[0]}".downcase.to_sym => block[1])
                           end
                        end

                        return blocks

                    rescue => err
                        abort "Configuration file read error: #{err}"
                    end
                else
                    abort "Error: no configuration file is found.\nExpected path: #{path}"
                end

            end
        end
    end

    class Interface < Foundation
        
        def initialize
          begin
              servers = Bookmarks.config
              show_menu servers, "host"
          rescue SystemExit, Interrupt, EOFError
            puts "\nexiting..."
          end
        end
        
        def show_menu(list, title)
            
            t = title.to_sym
            choose do |menu|
                menu.prompt = "Please choose the server which you would like to connect?  "
                list.each do |item|
                    menu.choice(item[t]) { SSH.connect item[t] }
                end
            end
        end
    end

    Interface.new
end
