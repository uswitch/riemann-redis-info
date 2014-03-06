require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'
require 'find'

# Don't include resource forks in tarballs on Mac OS X.
ENV['COPY_EXTENDED_ATTRIBUTES_DISABLE'] = 'true'
ENV['COPYFILE_DISABLE'] = 'true'

# Gemspec
gemspec = Gem::Specification.new do |s|
  s.rubyforge_project = 'riemann-redis-info'

  s.name = 'riemann-redis-info'
  s.version = '0.1.0'
  s.author = 'Christian Blunden'
  s.email = 'christian.blunden@uswitch.com'
  s.homepage = 'https://github.com/uswitch/riemann-redis-info'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Redis client that submit redis INFO events to Riemann.'

  s.add_dependency 'riemann-tools', '>= 0.1.9'
  s.add_dependency 'redis', '>= 3.0.2'

  s.files = FileList['lib/**/*', 'bin/*', 'LICENSE', 'README.md'].to_a
  s.executables |= Dir.entries('bin/')
  s.require_path = 'lib'
  s.has_rdoc = false

  s.required_ruby_version = '>= 1.8.7'
end

Gem::PackageTask.new gemspec do |p|
end

RDoc::Task.new do |rd|
  rd.main = 'Riemann Redis INFO'
  rd.title = 'Riemann Redis INFO'
  rd.rdoc_dir = 'doc'

  rd.rdoc_files.include('lib/**/*.rb')
end
