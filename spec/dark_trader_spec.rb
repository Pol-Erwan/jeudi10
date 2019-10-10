
require_relative '../lib/dark_trader'

describe "hashage method, it should return a hash with both arrays" do
  it "Wrong type" do
    expect(hashage("a","$1")).to eq(nil)
  end
end


describe "nokogiri method, takes a url, return the html" do
  it "TEST empty url" do
    expect(nokogiri("")).to eq(nil)
  end
  it "TEST good url" do
    expect(nokogiri("https://www.google.com/")).to be_kind_of(Nokogiri::HTML::Document)
  end
end
