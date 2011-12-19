require 'rubygems'
require 'sinatra'
require 'haml'

# Helpers
require './lib/render_partial'

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public, 'public'
set :haml, {:format => :html5} # default Haml format is :xhtml

# i18n
require 'sinatra/r18n'
set :default_locale, 'zh_cn'

before do
  session[:locale] = params[:locale]
end

# Application routes
get '/' do
  haml :index, :layout => :'layouts/application'
end

get '/partners' do
  haml :partners, :layout => :'layouts/page'
end

get '/about' do
  haml :about, :layout => :'layouts/page'
end
