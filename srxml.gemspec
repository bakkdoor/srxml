Gem::Specification.new do |s|
  s.name     = "srxml"
  s.version  = "0.0.1"
  s.date     = "2008-08-31"
  s.summary  = "Simple Ruby XML Generator"
  s.email    = "bakkdoor@flasht.de"
  s.homepage = "http://github.com/bakkdoor/srxml"
  s.description = "SRXML is a very (super, if you will!) lightweight xml generator for Ruby. No big magic here, it simply uses method_missing to create the tags. There is some plan to make it more useful. For Example being able to parse existing files etc. but there are probably better libraries to do that.
  If you simply want to create an xml file without the need for extra fancy formatting, SRXML could just be the deal for you!"
  s.has_rdoc = false
  s.authors  = ["Christopher Bertels"]
  s.files    = ["sr_xml.rb",
		"README", 
		"examples/example.rb",
		"examples/example.xml",
		"examples/example2.rb",
		"examples/example2.xml"]
  s.test_files = []
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
end