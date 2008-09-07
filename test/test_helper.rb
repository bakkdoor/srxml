module TestHelper
  def fixture(name, opts = {})
    opts[:xml] = opts[:xml].nil? ? true : opts[:xml]
    ending = opts[:xml] ? ".xml" : ""
    File.open("test/fixtures/#{name}#{ending}", "r").read
  end
end