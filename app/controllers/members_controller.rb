class MembersController < ApplicationController
  def index
    @members = Member.all
  end
  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end
  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])
    if @member.name == "sally"
      render :admin
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @member }
      end
    end    
  end
  # POST /posts
  # POST /posts.json
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

end