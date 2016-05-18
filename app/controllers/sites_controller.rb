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
  		render file: "#{Rails.root}/public/404.html", status: 404
  	end
  end

  def edit
  end

  private

  def find_site
  	if params[:id].present?
	    @site = Site.find(params[:id])
	elsif params[:unmatch].present?
		puts request.host+'/'+params[:unmatch]
		@site=Site.find_by_host(request.host+'/'+params[:unmatch])
	else
		puts request.host.split('.').first
		@site=Site.find_by_host(request.host)
	end
  end
end
