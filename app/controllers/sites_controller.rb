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
  before_action :find_site
  def show
  	unless @site
		render file: "#{Rails.root}/public/404", status: 404
	end
  end

  def edit
  	puts 'into edit '+params[:id].to_s+" "+params[:area].to_s
  	I18n.locale =I18n.default_locale
  	if params[:area].present?
		if I18n.available_locales.include?( params[:area].to_sym )
	  		I18n.locale =params[:area]
  			@area=params[:area]
  		end
   	end
  end

  private

  def find_site
  	if params[:id].present?
	    @site = Site.find(params[:id])
	elsif request.subdomain.present?	
	    @site=Site.find_by_subdomain(request.subdomain)
	end
  end
end
