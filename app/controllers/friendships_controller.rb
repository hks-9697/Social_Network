class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    user = User.find(session[:user_id])

    @friendships = Friendship.where(status: 1, userid1: user.userid)
    @friendships2 = Friendship.where(status: 0, userid1: user.userid)
    @friendships3 = Friendship.where(status: 2, userid1: user.userid)
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    if session[:user_id]==nil
      redirect_to login_url
    end
    @friendship = Friendship.new
    @friendship2 = Friendship.new

  end

  # GET /friendships/1/edit
  def edit
    if session[:user_id]==nil
      redirect_to login_url
    end
  end

  # POST /friendships
  # POST /friendships.json
  def create

    user = User.find(session[:user_id])

    @friendship = Friendship.new(friendship_params)
    @friendship.userid1 = user.userid
    @friendship.status=0

    @friendship2 = Friendship.new(friendship_params)
    @friendship2.userid1=@friendship.userid2
    @friendship2.userid2 = user.userid
    @friendship2.status=1

    if Friendship.where(userid1: user.userid , userid2: @friendship.userid2).size > 0
      flash.now[:danger] = "Request already sent or already a friend"
      redirect_to friendships_path
      p Friendship.where(userid1: user.userid , userid2: @friendship.userid2)
    else
      respond_to do |format|
        if @friendship.save and @friendship2.save
          format.html { redirect_to @friendship, notice: 'Friendship was successfully created.' }
          format.json { render :show, status: :created, location: @friendship }
        else
          format.html { render :new }
          format.json { render json: @friendship.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    if session[:user_id]==nil
      redirect_to login_url
    end
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept_request
      @friendship=Friendship.find(params["format"].to_i)
      @friendship.status=2
      @friendship2=Friendship.where(userid1: @friendship.userid2,userid2: @friendship.userid1)
      @friendship2.each do |friend|
         friend.status=2
         friend.save
      end
      @friendship.save

      redirect_to friendships_path

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:userid1, :userid2, :status)
    end


end
