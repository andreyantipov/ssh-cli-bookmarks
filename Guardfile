# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec, cmd: 'rspec' do
  watch(%r{^test/spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "test/spec/lib/#{m[1]}_spec.rb" }
  watch('test/spec/spec_helper.rb')  { 'spec' }
end

guard :cucumber do
  watch(%r{^test/features/.+\.feature$})
  watch(%r{^test/features/support/.+$})          { 'features' }
  watch(%r{^test/features/.+\/step_definitions/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")][0] || 'features'
  end
end

guard :rubocop do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard :reek do
  watch(%r{.+\.rb$})
end

guard 'yard' do
  watch(%r{app/.+\.rb})
  watch(%r{lib/.+\.rb})
  watch(%r{ext/.+\.c})
end
