class Api::ArticlesController < ApplicationController
	def index
    	articles = Article.all
    	jsonObject = articles.to_json(:include => :comments)
    	render json: JSON.pretty_generate(JSON.parse(jsonObject))
	end

	def show
		article = Article.find(params[:id])
    	jsonObject = article.to_json(:include => :comments)
    	render json: JSON.pretty_generate(JSON.parse(jsonObject))
	end
end
