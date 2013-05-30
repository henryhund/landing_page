require 'sinatra'
# require 'data_mapper'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'

enable :sessions

SITE_TITLE = "Lorious"  
SITE_DESCRIPTION = "Welcome"

'''DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/recall.db")  
  
class Note  
  include DataMapper::Resource  
  property :id, Serial  
  property :content, Text, :required => true  
  property :complete, Boolean, :required => true, :default => false  
  property :created_at, DateTime  
  property :updated_at, DateTime  
end  
  
DataMapper.finalize.auto_upgrade! 

helpers do  
    include Rack::Utils  
    alias_method :h, :escape_html  
end   '''

get '/' do  
  @title = 'Welcome'  
 
  erb :home  
end  

get '/thank-you' do  
  @title = 'Thank You!'  
 
  erb :thanks 

get '/confirmed' do  
  @title = 'Confirmation!'  
 
  erb :thanks  
end  