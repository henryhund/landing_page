require 'sinatra'
# require 'data_mapper'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require 'gibbon'

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

post '/thank-you' do    
  @title = 'Thank You!' 
  @name = params[:name]
  @email = params[:email] 
 

  #set up MC API
  gb = Gibbon.new(ENV["MAILCHIMP_API_KEY"])

  #add subscirber
  gb.list_subscribe({:id => ENV["MAILCHIMP_LIST_ID"], :email_address => @email, :merge_vars => {:FNAME => @name, :LNAME => " "}})


  erb :thanks 
end

get '/confirmed' do  
  @title = 'Confirmation!'  
 
  erb :confirmed  
end  