require_relative 'spec_helper'

describe Ssh::Bookmarks::Config do
    it "should return the config file" do
      config = Ssh::Bookmarks::Config.new
      config.data.should be_kind_of(Array)
    end
end
