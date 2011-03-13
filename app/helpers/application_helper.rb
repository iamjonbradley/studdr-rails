module ApplicationHelper
  def top_menu
                      
    menu = '<div class="link"><a href="/posts" class="category">All</a></div>'

    categories = Category.all
    categories.each do |category|
        menu += '<div class="link"><a href="/posts/category/'+category.name.downcase+'" class="category">'+category.name+'</a></div>'
    end
        raw menu
  end
end
