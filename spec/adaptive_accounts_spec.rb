require 'spec_helper'

describe "AdaptiveAccounts" do

  before :all do
    @api= PayPal::SDK::AdaptiveAccounts::API.new
  end

  describe "Services" do
    PayPal::SDK::AdaptiveAccounts::Services.instance_methods.select{|m| m =~ /^[A-Z]/ and m !~ /^Build/ }.each do |service_method|
      it "make empty request to #{service_method}" do
        response = @api.send(service_method, {})
        response.response_envelope.ack.should_not be_nil
      end
    end
  end

  it "Validate ipn message" do
    expect(@api.ipn_valid?("Invalid")).to be false
  end

end
