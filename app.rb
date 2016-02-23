# mentioned in model files
require_relative 'models'
require 'sinatra'

get '/' do
  @notes = Note.all :order => :id.desc
  @title = 'All Notes'
  erb :home
end



post '/' do 
	n = Note.new
	n.content = params[:content]
	n.created_at = Time.now
	n.updated_at= Time.now
	n.save
	redirect '/'
end


get '/:note_id' do | id |
	@note = Note.get(id)
	@title = "Edit note ##{id}"
	erb :edit
end


put '/:id' do
  n = Note.get params[:id]
  n.content = params[:content]
  n.complete = params[:complete] ? 1 : 0
  n.updated_at = Time.now
  n.save
  redirect '/'
end

get '/:id/complete' do
  n = Note.get params[:id]
  n.complete = n.complete ? 0 : 1 # flip it
  n.updated_at = Time.now
  n.save
  redirect '/'
end

get '/:id/delete' do
  @note = Note.get params[:id]
  @title = "Confirm deletion of note ##{params[:id]}"
  erb :delete
end


delete '/:id' do
  n = Note.get params[:id]
  n.destroy
  redirect '/'
end




get '/newtest' do 
end