require_relative "devtunnel/version"
require_relative "devtunnel/api"
require_relative "devtunnel/api_response"
require_relative "devtunnel/entity"
require_relative "devtunnel/api_error"
require "rest_client"
require "json"

module Devtunnel
	@api_key = nil
	@api_url = "http://devtunnel.link/api/v1"

	def self.api_key=(api_key)
		@api_key = api_key
	end
	def self.api_key
		@api_key
	end
	def self.api_url=(api_url)
		@api_url = api_url
	end
	def self.api_url
		@api_url
	end
end
