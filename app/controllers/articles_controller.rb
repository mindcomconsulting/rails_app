class ArticlesController < ApplicationController
	
	def index
         #debugger
		@article = Article.all.paginate(:page=>params[:page],:per_page=> 2)
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @article }
      format.js
    end
	end

	def new
		@article = Article.new
	end
  
 def new_email
   @email = Email.new
 end

 # def create_email
 #    @email = Email.create(email_params)
 #      if @email.save
 #        UserMailer.send_email(@email).deliver_now
 #        redirect_to :back
 #      end
 # end

	def edit
		
		@article = Article.find(params[:id])
	end

	def create   
	  @article = current_user.articles.create(article_params)
	  @products = Article.find_by(:id=>1)
     if @article.save
	     #UserMailer.welcome_email(@products).deliver_now
	  	 #redirect_to :back
       redirect_to :controller=>'articles', :action=>'index'
	   else
	    render 'new'
	   end	  
  end


  def update
    @article = Article.find(params[:id]) 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

	def show
		@article = Article.find(params[:id])
	end

  def generate_pdf
    @products = Article.find_by(:id=>params[:id])    
     # pdf = Prawn::Document.new
     # pdf.text "Hello World"
     # pdf.render_file File.join(Rails.root, "app/report", "x.pdf")


    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     pdf = ReportPdf.new(@products)                
    #     pdf.render_file File.join(Rails.root, "public/images", "x.pdf")
    #   end
    # end
    #UserMailer.welcome_email(@products).deliver_now

    UserMailer.delay(run_at: 2.minutes.from_now).welcome_email(@products)
    redirect_to :controller=>'articles',:action=>'index'
  end



	private
  def article_params
   	params.require(:article).permit(:name, :attachment, :title, :fname)
  end
  def email_params
    params.require(:email).permit(:email)
  end
end
{"id"=>"1", "target"=>"_blank", "controller"=>"articles", "action"=>"generate_pdf", "format"=>"pdf"}