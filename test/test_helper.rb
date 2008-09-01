module TestHelper
  def fixture(name)
    File.open("test/fixtures/#{name}.xml", "r").read
  end
end