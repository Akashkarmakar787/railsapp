class ArticlesController < ApplicationController
	#before_action :set_article, only: [:edit, :update, :show, :destroy]
	#before_action :set_article, only: [:edit, :update, :show, :destroy]
before_action :set_article, only: [:edit, :update, :show, :destroy]
before_action :require_user, except: [:index, :show]
before_action :require_same_user, only: [:edit, :update, :destory]
def edit
	#@article= Article.find(params[:id])
end
def update
	#@article=Article.find(params[:id]);
	if @article.update(article_params)
		flash[:notice]="Article was successfully updated"
		redirect_to article_path(@article)
	else
		render 'edit'
	end
end
def index
	@articles=Article.paginate(page: params[:page], per_page: 5)
end
def new
    @article = Article.new
end
 def create
 	
 	#render plain: params[:article].inspect
 	@article =Article.new(article_params)
 	@article.user= current_user
 	if @article.save
 		flash[:notice]="Article was successfully created"
 		redirect_to article_path(@article)
 	
 	else
 		render 'new'
 	end
 	
 end
 def show
 	#@article= Article.find(params[:id]);
 end
 def destroy
 	#@article=Article.find(params[:id]);
 	@article.destroy
 	flash[:notice]="Article was successfully deleted"
 	redirect_to articles_path
 end
 private
 def article_params
 	params.require(:article).permit(:title, :description)
 end
 def set_article
 	@article= Article.find(params[:id]);
 end
 def require_same_user
 	if current_user != @article.user
 		flash[:danger]="you can only delete or edit your own articles"
 		redirect_to root_path
 	end
 end

end