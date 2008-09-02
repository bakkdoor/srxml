Gem::Specification.new do |s|
   s.name = "srxml"
   s.summary = "Simple Ruby XML Generator"
   s.description = %q{SRXML is a very (super, if you will!) lightweight xml generator for Ruby. No big magic here, it simply uses method_missing to create the tags. There is some plan to make it more useful. For Example being able to parse existing files etc. but there are probably better libraries to do that.If you simply want to create an xml file without the need for extra fancy formatting, SRXML could just be the deal for you!}
   s.version = "0.0.4"
   s.date = "2008-09-02"
   s.author = "Christopher Bertels"
   s.email = "bakkdoor@flasht.de"
   s.homepage = "http://github.com/bakkdoor/srxml"
   s.has_rdoc = false
   s.files = [ "README", "Rakefile", "lib/srxml.rb",
     "examples/example.rb", "examples/example.xml", "examples/example2.rb", "examples/example2.xml",
     "test/fixtures/friends_formatted.xml", "test/fixtures/projects.xml", "test/fixtures/projects_formatted.xml",
     "test/test_helper.rb", "test/test_srxml.rb"]
   s.test_files = ["test/test_helper.rb", "test/test_srxml.rb"]
   s.extra_rdoc_files = ["README"]
   s.rdoc_options = ["--main", "README"]
   s.requirements << 'none'
   s.require_path = 'lib'
end