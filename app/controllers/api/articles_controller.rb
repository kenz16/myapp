class Api::ArticlesController < ApplicationController
	require 'json'
	def index
    	articles = Article.all
    	jsonObject = articles.to_json(:include => :comments)
    	render json: JSON.pretty_generate(JSON.parse(jsonObject))
	end
end
