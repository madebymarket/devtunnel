require_relative "api_model"

module Devtunnel
  class Account
    include ApiModel
    attr_accessor :api_key, :email, :user, :port

    def self.login(email, password)
      params = {:basic_username => email, :basic_password => password}
      Devtunnel::Api.request :post, "/login", params
    end

    def self.signup(email)
      params = {:email => email}
      Devtunnel::Api.request :post, "/signup", params
    end

		def write_creds
			File.open(File.expand_path("~/.devtunnel_auth"), "w") do |f|
				f.write({api_key: api_key, email: email}.to_json)
			end
		end

		def self.from_creds
			fn = File.expand_path("~/.devtunnel_auth")
			raise Exception.new("Please log in first") unless File.exist? fn
			File.open(fn, "r") do |f|
				hash = JSON.parse f.read
				self.new hash
			end
		end
	
		def self.logout
			fn = File.expand_path("~/.devtunnel_auth")
			File.unlink(fn) if File.exist? fn
		end

		def self.forward port
      params = {:port => port}
      Devtunnel::Api.request :post, "/forward", params
		end
  end
end
