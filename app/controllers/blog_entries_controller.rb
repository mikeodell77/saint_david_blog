class BlogEntriesController < ApplicationController
  # GET /blog_entries
  # GET /blog_entries.json

  before_filter :authenticate_user!, only: [:new, :destroy, :update, :edit, :create, :user_blog_entries]

  def index
    # @blog_entries = BlogEntry.order("updated_at DESC").all
    puts 'We are looking for blogs by user_id : ', params[:user_id]
    
    @blog_entries = BlogEntry.order("updated_at DESC").find_all_by_user_id(params[:user_id])



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blog_entries }
    end
  end

  # GET /blog_entries/1
  # GET /blog_entries/1.json
  def show
    @blog_entry = BlogEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog_entry }
    end
  end

  # GET /blog_entries/new
  # GET /blog_entries/new.json
  def new

    @blog_entry = BlogEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog_entry }
    end
  end

  # GET /blog_entries/1/edit
  def edit
    @blog_entry = BlogEntry.find(params[:id])
  end

  # POST /blog_entries
  # POST /blog_entries.json
  def create
    @blog_entry = BlogEntry.new(params[:blog_entry])
    @blog_entry.user_id = current_user.id

    respond_to do |format|
      if @blog_entry.save
        format.html { redirect_to user_blog_entries_blog_entries_path(:user_id =>current_user), notice: 'Blog entry was successfully created.' }
        format.json { render json: @blog_entry, status: :created, location: @blog_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @blog_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blog_entries/1
  # PUT /blog_entries/1.json
  def update
    @blog_entry = BlogEntry.find(params[:id])

    respond_to do |format|
      if @blog_entry.update_attributes(params[:blog_entry])
        format.html { redirect_to user_blog_entries_blog_entries_path(:user_id =>current_user), notice: 'Blog entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_blog_entries
    @blog_entries = BlogEntry.order("updated_at DESC").find_all_by_user_id(params[:user_id])
  end

  # DELETE /blog_entries/1
  # DELETE /blog_entries/1.json
  def destroy
    @blog_entry = BlogEntry.find(params[:id])
    @blog_entry.destroy

    respond_to do |format|
      format.html { redirect_to blog_entries_url }
      format.json { head :no_content }
    end
  end
end
