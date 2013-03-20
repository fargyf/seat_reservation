ActionController::Base.asset_host = Proc.new { |source, request|
  if request.format.pdf?
    "#{request.protocol}#{request.host_with_port}"
  else
    nil
  end
}

PDFKit.configure do |config|
  #config.wkhtmltopdf = '/root/.rbenv/shims/wkhtmltopdf'
  config.default_options[:ignore_load_errors] = true
  config.root_url = "http://localhost"
  config.default_options = {
    :encoding                => "UTF-8",
    :page_size               => "A4",
    #:print_media_type        => true,
    :margin_top              => "0.25in",
    :margin_right            => "0.25in",
    :margin_bottom           => "0.25in",
    :margin_left             => "0.25in",
    :disable_smart_shrinking => false
  }
end

