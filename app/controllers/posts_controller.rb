class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @usr=User.find(session[:user_id])
    @friends=Friendship.select('userid2').where(userid1: @usr.userid , status: 2)

    @posts = Post.where(userid: @friends)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    if session[:user_id]==nil
      redirect_to login_url
    end
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    if session[:user_id]==nil
      redirect_to login_url
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    user = User.find(session[:user_id])
    @post.userid = user.userid
    @post.type_id=1

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if session[:user_id]==nil
      redirect_to login_url
    end
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:userid, :msg, :type_id, :post_image)
    end
end
