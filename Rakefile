require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |t|
  #task.rspec_opts = Dir.glob("[0-9][0-9][0-9]_*").collect { |x| "-I#{x}" }
  #task.rspec_opts << '-r ./rspec_config --color -f d'
  t.pattern = '**/*_spec.rb'
  t.rspec_opts = ['--default-path', 'test/spec']
end

task test: :spec
