class Listing < ApplicationRecord
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	if Rails.env.development?
		has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "default.jpg"
	else	
		has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "default.jpg",
											:storage => :dropbox,
	  									:dropbox_credentials => Rails.root.join("config/dropbox.yml")
	  									:path => ":style/:id_:filename"
	end  									 
end
