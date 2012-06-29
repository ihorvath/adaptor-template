require 'spec_helper'

describe "CapabilitiesController" do
  before do
    json = { :format => 'json' }
    get "/capabilities.json", json
  end
  
  it "returns hello world" do
    last_response.body.should == "Hello World"
  end
end