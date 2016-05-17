# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string
#  host       :string
#  subdomain  :string
#  data       :hstore
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SitesController < ApplicationController
  before_action :find_site, :except => [:unmatch]
  def unmatch
  	puts "not match..."
  end
  def show

  	if @site
	  	puts 'in show...'+params[:id].to_s
	elsif @subsite
		@site=@subsite
	else
	  # 	unless params[:id].present?
	  # 		unless request.subdomain.present?
			# 	redirect_to "base#index"
			# else
				render file: "#{Rails.root}/public/404"				
			# end
		# end

	end
  end

  def edit
  end

  private

  def find_site
  	puts 'find_site running'
  	puts request.subdomain.present?
  	if params[:id].present?
	    @site = Site.find(params[:id])
	# elsif params[:subdomain].present?
	elsif request.subdomain.present?		
	    puts 'find_site by subdomain'
	    @subsite=Site.find_by_subdomain(request.subdomain)
	end
  end
end
