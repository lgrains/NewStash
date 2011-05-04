class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  before_filter :mailer_set_url_options
  before_filter :set_assets

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end


  # this makes the css and js organized
  def set_assets

    @custom_csses = []
    @custom_javascripts = []


    action_hash = {"create" => "new", "update" => "edit"}
    file_name = action_hash[action_name] ? action_hash[action_name] : action_name
    root = Rails.root.to_s

    @custom_csses << "compiled/application.css" # always include the layout css
    @custom_csses << "compiled/#{controller_name}/#{file_name}.css" if File.exist?("#{root}/public/stylesheets/compiled/#{controller_name}/#{file_name}.css")
    @custom_csses << "compiled/#{controller_name}/all.css" if File.exist?("#{root}/public/stylesheets/compiled/#{controller_name}/all.css")

    @custom_javascripts << "#{controller_name}/#{file_name}.js" if File.exist?("#{root}/public/javascripts/#{controller_name}/#{file_name}.js")
    @custom_javascripts << "#{controller_name}/all.js" if File.exist?("#{root}/public/javascripts/#{controller_name}/all.js")

    # a trick to include facebox in the (devise-owned) registrations controller
    include_facebox if controller_name == 'registrations' && action_name == 'edit'

  end

end
