module ApplicationHelper
# Return a title on a per-page basis.
def title
	base_title = "enss"
	if @title.nil?
	  base_title
    else
	   "#{base_title} | #{@title}"
     end
   end

def logo
     image_tag("rails.png", :alt => "Sample App", :class => "round")
end

# change statement gravatar_image tag
	def gravatar_for(user, options = { :size => 50})
		gravatar_image_tag(user.email.downcase, :alt => user.name,
												:class => 'gravatar', 
												:gravatar => options)
	end

	def csrf_meta_tag
    if protect_against_forgery?
      out = %(<meta name="csrf-param" content="%s"/>\n)
      out << %(<meta name="csrf-token" content="%s"/>)
      out % [ Rack::Utils.escape_html(request_forgery_protection_token),
              Rack::Utils.escape_html(form_authenticity_token) ]
    end
  end
end
