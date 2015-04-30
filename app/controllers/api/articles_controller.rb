class Api::ArticlesController < ApplicationController
	def csrf_meta_tags
	    if protect_against_forgery?
	      [
	        tag('meta', :name => 'csrf-param', :content => request_forgery_protection_token),
	        tag('meta', :name => 'csrf-token', :content => form_authenticity_token),
	      ].join("\n").html_safe
	    end
  	end


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
