class SubDomain
	def self.matches?( req )
		if req.subdomain.present?
			return true
		end
	end
end