[![Code Climate](https://codeclimate.com/github/AndreyAntipov/ssh-bookmarks-cli/badges/gpa.svg)](https://codeclimate.com/github/AndreyAntipov/ssh-bookmarks-cli)

## SSH-Bookmarks

A dead simple cli ssh manager. 

All parameters are stored in ~/.ssh/config file

## Requirements:

- ~/.ssh/config file
- Ruby
- Bundler


## Installation:

1. `git clone https://github.com/AndreyAntipov/ssh-bookmarks-shell.git -b master`
2.  `cd ssh-bookmarks-shell`
3.  `bundle install`
4.  `cp ssh-bookmarks.rb /usr/local/bin/ssh-bookmarks`
5.  `sudo chmod +x /usr/local/bin/ssh-bookmarks`

##### Inline

`git clone https://github.com/AndreyAntipov/ssh-bookmarks-shell.git -b master && cd ssh-bookmarks-shell && bundle install && cp ssh-bookmarks.rb /usr/local/bin/ssh-bookmarks && sudo chmod +x /usr/local/bin/ssh-bookmarks`


## Configuring SSH config file

[http://linux.die.net/man/5/ssh_config](http://linux.die.net/man/5/ssh_config)

or

`man ssh_config`


## Usage:

ssh-bookmarks


## Screenshoots:

![Server selection](https://raw.githubusercontent.com/AndreyAntipov/ssh-bookmarks-shell/media/screenshoot.png "Server selection")

--- 

## License:

The MIT License (MIT) 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions in [LICENSE.md](https://github.com/AndreyAntipov/ssh-bookmarks-shell/blob/master/LICENSE.md)
