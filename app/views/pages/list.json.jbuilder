json.success true
json.count @pages.count

json.array(@pages) do |page|
	json.id page.id
	json.url page.url
	if page.content.present?
		json.content ActiveSupport::JSON.decode(page.content)
	end
end