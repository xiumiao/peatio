require 'spec_helper'

module APIv2

  class AuthTest < Grape::API
    get("/auth_test") do
      authenticate!
      current_user
    end

    get("/mobile_provider_auth_test") do
      authenticate_mobile_provider!
      current_user
    end
  end

  class Mount
    mount AuthTest
  end

end

describe APIv2::Helpers do
  let(:tonce)  { time_to_milliseconds }

  context "#authenticate!" do
    let!(:token) { create(:api_token) }

    context "Authenticate using params" do
      let(:payload) { "GET|/api/v2/auth_test|access_key=#{token.access_key}&foo=bar&hello=world&tonce=#{tonce}" }
      let(:signature) { APIv2::Auth::Utils.hmac_signature(token.secret_key, payload) }

      it "should response successfully" do
        get '/api/v2/auth_test', access_key: token.access_key, signature: signature, foo: 'bar', hello: 'world', tonce: tonce
        response.should be_success
      end

      it "should set current user" do
        get '/api/v2/auth_test', access_key: token.access_key, signature: signature, foo: 'bar', hello: 'world', tonce: tonce
        response.body.should == token.member.reload.to_json
      end

      it "should fail authentication" do
        get '/api/v2/auth_test'
        response.code.should == '401'
        response.body.should == "{\"error\":{\"code\":2001,\"message\":\"Authorization failed\"}}"
      end
    end
  end

  context "#authenticate_mobile_provider!" do
    let(:payload) { "GET|/api/v2/mobile_provider_auth_test|access_key=#{token.access_key}&foo=bar&hello=world&tonce=#{tonce}" }
    let(:signature) { APIv2::Auth::Utils.hmac_signature(token.secret_key, payload) }

    context "using MobileProviderToken" do
      let!(:token) { create(:mobile_provider_token) }

      it "should response successfully" do
        get '/api/v2/mobile_provider_auth_test', access_key: token.access_key, signature: signature, foo: 'bar', hello: 'world', tonce: tonce
        response.should be_success
      end
    end

    context "using ordinary APIToken" do
      let!(:token) { create(:api_token) }

      it "should fail authentication" do
        get '/api/v2/mobile_provider_auth_test', access_key: token.access_key, signature: signature, foo: 'bar', hello: 'world', tonce: tonce
        response.code.should == '401'
        response.body.should == "{\"error\":{\"code\":2001,\"message\":\"Authorization failed\"}}"
      end
    end

    context "using no token" do
      it "should fail authentication" do
        get '/api/v2/mobile_provider_auth_test'
        response.code.should == '401'
        response.body.should == "{\"error\":{\"code\":2001,\"message\":\"Authorization failed\"}}"
      end
    end

  end
end
