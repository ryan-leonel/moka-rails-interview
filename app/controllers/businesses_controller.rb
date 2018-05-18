class BusinessesController < ApplicationController

  # GET /businesses/:id
  def show
     @business = Business.find(params[:id])
  end

  # GET /businesses/new
  def new
    if current_business.present?
      redirect_to current_business
    else
      @business = Business.new
    end
  end

  # GET /businesses/:id/edit
  def edit
    @business = Business.find(params[:id])
  end

  # POST /businesses
  def create
    @business = Business.new(business_params)
    @business.user_id = current_user.id
    if @business.save
      redirect_to root_url, notice: "Business #{@business.name} has been successfully created"
    else
      render 'new'
    end
  end

  # PUT /businesses/:id
  def update
    @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      redirect_to @business, notice: "Business #{@business.name} has been successfully updated"
    else
      render 'edit'
    end
  end

  # DELETE /businesses/:id
  def destroy
    @business = Business.find_by(id: params[:id])
    if @business.try(:destroy)
      redirect_to @business, notice: "Business #{@business.name} has been successfully deleted"
    else
      redirect_to @business, alert: "Failed to delete business #{@business.name}"
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :city, :user_id)
  end

end
