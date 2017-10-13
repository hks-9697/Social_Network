class ChatboxesController < ApplicationController
  before_action :set_chatbox, only: [:show, :edit, :update, :destroy]

  # GET /chatboxes
  # GET /chatboxes.json
  def index
    session[:chat_id]=nil
    user = User.find(session[:user_id])
  #  @chatboxes = Chatbox.find_by_sql(["select userto from chatboxes where userfrom = ? union select userfrom from chatboxes where userto = ?",user.userid,user.userid])
    @chatboxes = Chatbox.find_by_sql(["select * from friendships where status = 2 and userid1 = ?",user.userid])
  end

  # GET /chatboxes/1
  # GET /chatboxes/1.json
  def show
  end

  # GET /chatboxes/new
  def new
    session[:userto]=params["format"].to_i
    p params
    if session[:user_id]==nil
      redirect_to login_url
    end
    @chatbox = Chatbox.new
  end

  # GET /chatboxes/1/edit
  def edit
    if session[:user_id]==nil
      redirect_to login_url
    end
  end
  def chat
    session[:chat_id]=params["format"].to_i
    @usr=User.find_by_userid(Friendship.find(params["format"].to_i).userid2)
    @me=User.find(session[:user_id])
    @chatboxes=Chatbox.find_by_sql(["select * from chatboxes where (userfrom = ? and userto = ?) OR (userto = ?  and userfrom = ? ) order by created_at DESC",@usr.userid,@me.userid,@usr.userid,@me.userid])

  end
  # POST /chatboxes.json
  def create
    @chatbox = Chatbox.new(chatbox_params)
    user = User.find(session[:user_id])
    @chatbox.userfrom = user.userid
    @chatbox.type_id=1
    @usr = User.find(session[:userto])
    @chatbox.userto = @usr.userid
    respond_to do |format|
      if @chatbox.save
        format.html { redirect_to @chatbox, notice: 'Chatbox was successfully created.' }
        format.json { render :show, status: :created, location: @chatbox }
      else
        format.html { render :new }
        format.json { render json: @chatbox.errors, status: :unprocessable_entity }
      end
    end

    session[:usetto]=nil
  end

  # PATCH/PUT /chatboxes/1
  # PATCH/PUT /chatboxes/1.json
  def update

    respond_to do |format|
      if @chatbox.update(chatbox_params)
        format.html { redirect_to @chatbox, notice: 'Chatbox was successfully updated.' }
        format.json { render :show, status: :ok, location: @chatbox }
      else
        format.html { render :edit }
        format.json { render json: @chatbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatboxes/1
  # DELETE /chatboxes/1.json
  def destroy
    if session[:user_id]==nil
      redirect_to login_url
    end
    @chatbox.destroy
    respond_to do |format|
      format.html { redirect_to chatboxes_url, notice: 'Chatbox was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatbox
      @chatbox = Chatbox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chatbox_params
      params.require(:chatbox).permit(:userfrom, :userto, :msg, :type_id, :chatbox_image)
    end
end
