class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    if params[:category]
      category = Category.find(:first, :conditions => ["name LIKE ?", params[:category]])
<<<<<<< HEAD
<<<<<<< HEAD
      # @posts = Post.find(:all,:order => "id DESC", :conditions => ["category_id = ?",category.id]).page(params[:page])
      @posts = Post.order("id DESC").where(:category_id => category.id).page()
    else
        @posts = Post.order('id DESC').page(params[:page])

=======
      @posts = Post.find(:all,:order => "id DESC", :conditions => ["category_id = ?",category.id])
    else
      @posts = Post.find(:all,:order => "id DESC")
>>>>>>> b834317a6c2c4cf0766ab93fdaa96472f7580400
=======
      @posts = Post.find(:all,:order => "id DESC", :conditions => ["category_id = ?",category.id])
    else
      @posts = Post.find(:all,:order => "id DESC")
>>>>>>> b834317a6c2c4cf0766ab93fdaa96472f7580400
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> b834317a6c2c4cf0766ab93fdaa96472f7580400
=======

>>>>>>> b834317a6c2c4cf0766ab93fdaa96472f7580400
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to(request.referer, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { redirect_to(request.referer, :notice => 'Your Post can only be 255 characters! ') }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(request.referer, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
