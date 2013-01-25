require "rich"

if Object.const_defined?("Rich")
  Rich.setup do |config|    
    
    # == CKEditor configuration
    # 
    # Rich ships with what I hope are sensible defaults. 
    # You may want to override these.
    # 
    # For example, the elements available in the formats
    # dropdown are defined like this:
    #   config.editor[:format_tags] = "h3;p;pre"

		# JS File (ckeditor/plugins/styles/styles/....js) for Editor's styles
		config.editor[:stylesSet] = "custom"
		# CSS for in editor styling
		config.editor[:contentsCss] = "/assets/ckeditor.css"
		# CKEditor config
		config.editor[:toolbar] = [['Format','Styles'],['Bold', 'Italic', '-', 'Table', 'NumberedList', 'BulletedList', 'Blockquote', '-', 'richImage', 'richFile','MediaEmbed', '-', 'Link', 'Unlink'],['Source', 'ShowBlocks']]
		config.editor[:removePlugins] = "image,forms"

				#
    # By default, Rich visualizes what type of element
    # you are editing. To disable this:
    #   config.editor[:startupOutlineBlocks] = false
    
    # == Image styles
    # 
    # Rich uses paperclip for image processing. You can
    # define the styles you would like to use here. You 
    # can use the standard syntax allowed by paperclip.
    # See: https://github.com/thoughtbot/paperclip/wiki/Thumbnail-Generation
    # 
    # When you change these after uploading some files,
    # remember to re-generate your styles by running:
    #   rake rich:refresh_assets
    config.image_styles = {
      :thumb => "65x65#",
      :news_list => "130x100#",
      :page_preview => "190x150#"
    }

		config.allow_embeds = true

    # == Convert options
    #
    # You can pass additional commands to ImageMagick to set image quality,
    # apply a blur, and other fancy tricks.
    #
    # Example (this will make your image look terrible):
    # config.convert_options = {
    #     :large => '-quality 1'
    # }

		Paperclip.options[:command_path] = "/opt/ImageMagick/bin/"

		Paperclip::Attachment.default_options[:storage] = :s3

		if Rails.env.development?
			# Development setup
			Paperclip::Attachment.default_options[:s3_credentials] = "#{Rails.root}/config/s3.yml"
			Paperclip::Attachment.default_options[:bucket] = "spaceheads"
			Paperclip::Attachment.default_options[:path] = "/barstyle/images/:id/:style/:filename"
			Paperclip::Attachment.default_options[:url] = ":s3_domain_url"
			Paperclip::Attachment.default_options[:s3_domain_url] = "s3-ap-southeast-1.amazonaws.com"
		elsif Rails.env.production?
			# Production setup
			Paperclip::Attachment.default_options[:s3_credentials] = {
					:bucket            => ENV['S3_BUCKET_NAME'],
					:access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
					:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
			}
			Paperclip::Attachment.default_options[:path] = ENV['AWS_PATH']
			Paperclip::Attachment.default_options[:url] = ENV['AWS_URL']
			Paperclip::Attachment.default_options[:s3_domain_url] = ENV['S3_DOMAIN_URL']
		end
    
    # == Allowed styles (in file manager)
    # 
    # Of the styles specified above, which should be user
    # selectable in the file manager?
    #
    # Example:
    #   config.allowed_styles = [ :large, :thumb ]
    #
    # Default:
    # config.allowed_styles = :all
		config.allowed_styles = :page_preview
    
    # == Default Style
    # 
    # The style to insert by default. In addition to the
    # styles defined above you can also use :original to get 
    # the unprocessed file. Make sure this style exists.
    config.default_style = :thumb

	# == Upload non-image files
	#
	# Setting this option to true will add a second Rich filebrowser icon to
	# the editor toolbar. In this filebrowser you can upload non-image files.
	# Inserting these files into your editor will result in a direct (A) link.
	#
	# Default:
	config.allow_document_uploads = true
		
	# == Set allowed filetypes for non-image files
	#
	# If you want, you can restrict the types of documents that users can upload.
	# Default behavior is to allow any kind of file to be uploaded. You can set
	# the accepted types by providing an array of mimetypes to check against.
	# Note that for this to have any effect, you first need to enable document
	# uploads using the setting above.
	# 
	# Default, allow any file to be uploaded:
	config.allowed_document_types = :all
	#
	# Example, only allow PDF uploads:
	# config.allowed_document_types = ['application/pdf']
		
	# == Asset insertion
	#
	# Set this to true to keep the filebrowser open after inserting an asset.
	# Also configurable per-use from within the filebrowser.
	#
	# Default:
	# config.insert_many = false
    
    # == User Authentication
    #
    # When defined, Rich will automatically call this method
    # in a before filter to ensure that the user is logged in.
    # 
    # If you do not change this value from the default, anyone
    # will be able to see your images, and upload files.
    # 
    # Example for Devise with an AdminUser model:
    config.authentication_method = :authenticate_admin_user!
    # 
    # Default (NOT recommended in production environments): 
    # config.authentication_method = :none
    
  end
  
  Rich.insert
end