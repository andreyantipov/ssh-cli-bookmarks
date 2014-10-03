require_relative '../spec_helper'

describe SSH::Bookmarks::Config do
    it "should return the config file" do
      config = SSH::Bookmarks::Config.new
      config.data.should be_kind_of(Array)
    end
end
