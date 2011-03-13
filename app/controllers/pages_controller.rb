class PagesController < ApplicationController
    def index 
    end 
    def show
      if params[:slug]
        page = page_file params[:slug]
      end
      if page != '404'
        render page
      else
        redirect_to '/404.html'#, :status => 404
      end
    end
end
