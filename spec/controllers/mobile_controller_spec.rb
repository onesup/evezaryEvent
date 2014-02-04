require 'spec_helper'

describe MobileController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'mobile_apply_1'" do
    it "returns http success" do
      get 'mobile_apply_1'
      response.should be_success
    end
  end

  describe "GET 'mobile_apply_2'" do
    it "returns http success" do
      get 'mobile_apply_2'
      response.should be_success
    end
  end

end
