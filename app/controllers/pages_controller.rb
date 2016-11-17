class PagesController < ApplicationController

	before_filter :validate_url, only: [:scrap]

	def scrap
		url = params["url"]
		scrapResponse = Page.scrap_url(url)
		if scrapResponse[:success] == false
			render json: scrapResponse, status: 200	
		else
			render json: { success: true, message: 'Successfully Scrapped and Stored!!' }, status: 200
		end
	end

	def list
		@pages = Page.all
		render 'pages/list.json.jbuilder'
	end

	private
		def validate_url
			url = params[:url]
			#check if url is present in the URL
			if url.present?
				#check if url is valid and able to connect
				check_validation = Page.validate_url(url)

				if  check_validation[:success] == false
					return render json: check_validation, status: 422
				end
			else
				return render json: { success: false, error: "Url is required!! Not Acceptable!!" }, status: 406 
			end
		end

end

