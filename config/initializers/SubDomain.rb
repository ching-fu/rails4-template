class SubDomain
	def self.matches?( req )
		# domain = TestProject::Application.config.domain
		# # case requrest.host
		# 	when "www.#{domain}", "#{domain}", nil
		# 		false
		# else
		# 	true
		# end
		puts "here is SubDomain"
		# puts req.host
		# # puts req.subdomain

		# s=Site.all
		# s.each do |t|
		# 	puts t.subdomain
		# 	puts t.host
		# 	puts t.name
		# 	if req.subdomain==t.subdomain
		# 		puts true
		# 		return true
		# 	end
		# end
		# puts "no subdomain match"
		if req.subdomain.present?
			puts "present true"
			return true
		end
	end
end