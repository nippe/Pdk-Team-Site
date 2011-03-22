class WallPostsController < ApplicationController
  # GET /wall_posts
  # GET /wall_posts.xml
  def index
    @wall_posts = WallPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wall_posts }
    end
  end

  # GET /wall_posts/1
  # GET /wall_posts/1.xml
  def show
    @wall_post = WallPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wall_post }
    end
  end

  # GET /wall_posts/new
  # GET /wall_posts/new.xml
  def new
    @wall_post = WallPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wall_post }
    end
  end

  # GET /wall_posts/1/edit
  def edit
    @wall_post = WallPost.find(params[:id])
  end

  # POST /wall_posts
  # POST /wall_posts.xml
  def create
    @wall_post = WallPost.new(params[:wall_post])

    respond_to do |format|
      if @wall_post.save
        format.html { redirect_to(@wall_post, :notice => 'Wall post was successfully created.') }
        format.xml  { render :xml => @wall_post, :status => :created, :location => @wall_post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wall_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wall_posts/1
  # PUT /wall_posts/1.xml
  def update
    @wall_post = WallPost.find(params[:id])

    respond_to do |format|
      if @wall_post.update_attributes(params[:wall_post])
        format.html { redirect_to(@wall_post, :notice => 'Wall post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wall_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wall_posts/1
  # DELETE /wall_posts/1.xml
  def destroy
    @wall_post = WallPost.find(params[:id])
    @wall_post.destroy

    respond_to do |format|
      format.html { redirect_to(wall_posts_url) }
      format.xml  { head :ok }
    end
  end
end
