#!/usr/bin/env ruby
version = '0.6.0'
files = Dir.glob('**/*')

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{json_pure}
  s.version           = %q{1.4.3}
  s.description       = %q{This is a JSON implementation in pure Ruby.}
  s.date              = %q{2010-05-04}
  s.summary           = %q{This is a JSON implementation in pure Ruby.}
  s.email             = %q{flori@ping.de}
  s.homepage          = %q{http://flori.github.com/json/}
  s.authors           = %w(Florian\ Frank)
  s.require_paths     = %w(lib)
  s.executables       = %w(edit_json.rb prettify_json.rb)

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
  #{"s.test_files        = [
    '#{Dir.glob("tests/**/*.rb").join("',\n    '")}'
  ]" if File.directory?("tests")}
end
EOF

if (save = ARGV.delete('-s'))
  if File.exist?(file = File.expand_path("../../json_pure.gemspec", __FILE__))
    File.delete(file)
  end
  File.open(file, 'w') { |f| f.puts gemspec }
else
  puts gemspec
end
