require_relative "api_model"

module Devtunnel
	class SuccessResponse
		attr_accessor :success

		def initialize success
			self.success = success
		end

		def success?
			success
		end

	end
end
