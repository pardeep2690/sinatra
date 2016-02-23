require 'data_mapper'

DataMapper.setup(:default, 'sqlite:recall.db')

class Note
	include DataMapper::Resource

	property :id , Serial
	property :content , Text , :required => true
	property :complete, Boolean , :required => true,:default => false
	property :created_at, DateTime
	property :updated_at , DateTime  
end


class Test
	include DataMapper::Resource

	property :id , Serial
	property :title , Text , :required => true
	property :created_at, DateTime
	property :updated_at , DateTime

	has n, :questions
end


class Question
	include DataMapper::Resource

	property :id , Serial
	property :title , Text , :required => true
	property :a , String , :required => true
	property :b , String , :required => true
	property :c , String , :required => true
	property :d , String , :required => true
	property :e , String 
	property :snswer , String , :required => true
	property :created_at, DateTime
	property :updated_at , DateTime

	belongs_to :test
end

DataMapper.finalize
DataMapper::Logger.new(STDOUT,  :debug)
DataMapper.auto_upgrade!