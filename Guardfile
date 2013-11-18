guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb})
  watch(%r{^lib/prct09/(.+)\.rb}){ |m| "spec/#{m[1]}_spec.rb" }
end
