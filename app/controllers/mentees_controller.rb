class MenteesController < ApplicationController
  # GET /mentees
  # GET /mentees.json
  def index
    @mentees = Mentee.all
    respond_with @mentees
  end

  # GET /mentees/1
  # GET /mentees/1.json
  def show
    @mentee = Mentee.find(params[:id])
    respond_with @mentee
  end

  # GET /mentees/new
  # GET /mentees/new.json
  def new
    @mentee = Mentee.new
    respond_with @mentee
  end

  # GET /mentees/1/edit
  def edit
    @mentee = Mentee.find(params[:id])
    respond_with @mentee
  end

  # POST /mentees
  # POST /mentees.json
  def create
    @mentee = Mentee.new(params[:mentee])
    if @mentee.save
      flash[:notice] = "Mentee successfully created."
    end
    respond_with @mentee, :location => users_url
  end

  # PUT /mentees/1
  # PUT /mentees/1.json
  def update
    @mentee = Mentee.find(params[:id])
    if @mentee.update_attributes(params[:mentee])
      flash[:notice] = "Mentee was successfully updated."
    end
    respond_with(@mentee)
  end

  # DELETE /mentees/1
  # DELETE /mentees/1.json
  def destroy
    @mentee = Mentee.find(params[:id])
    @mentee.destroy
    flash[:notice] = "Mentee was successfully destroyed."

    respond_with @mentee
  end
end
