#!/usr/bin/env ruby
# encoding: UTF-8

class Application

    require 'highline/import'

    VERSION = "0.1"

    class Foundation

        module SSH
            def self.connect server
                exec "ssh #{server}"
            end
        end

        module Bookmarks
            def self.config
            
                path = "#{ENV['HOME']}/.ssh/config"

                if File.exist?(path)
                    begin
                        # read and build config array
                        config = []
                        c = File.readlines(path).map &:split
                        c.reject!(&:empty?)
                        
                        # create chunks
                        c.each do |b|
                            config << {} if b[0] == "Host"
                            config.last.merge!("#{b[0]}".downcase.to_sym => b[1])
                        end
                        
                        return config

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
            servers = Bookmarks.config
            show_menu servers, "host"
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
