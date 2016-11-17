class Page < ApplicationRecord

	default_scope { order(created_at: :desc) }

	def self.scrap_url url
		page = Nokogiri::HTML(open(url))   
		h1_content = page.css('h1').text
		h3_content = page.css('h2').text
		h2_content = page.css('h3').text

		links = {}

		page.css('a').each do |a_tag|
			link = a_tag.attr('href')
			link_text = a_tag.text.strip
			links[link_text] = link unless self.check_js_event_link link #ignore javasript event links
		end

		page_content = {
			h1: h1_content,
			h2: h2_content,
			h3: h3_content,
			links: links
		}
		puts page_content

		page_content = ActiveSupport::JSON.encode(page_content)

		return self.store_page_content(url,page_content)
	end

	def self.validate_url url
		begin
			page = Nokogiri::HTML(open(url))	
			return { success: true }
		rescue Exception => e
			return { success: false, error: e.message }
		end
	end


	def self.check_js_event_link url
		["javascript", "#"].any? { |needle| url.include? needle }
	end

	def self.store_page_content(url,content)
		page = Page.new(url: url, content: content)
		if page.save
			return { success: true }
		else 
			return { success: false, error: page.errors.full_messages }
		end
	end
	
end
