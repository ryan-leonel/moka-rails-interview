class ItemsController < ApplicationController

  # GET /items
  def index
    # List all of the Items that are owned by the logged in User's Business
    if current_business.present?
      @items = current_business.items
    else
    # If business not yet created, redirect to create a new business
      redirect_to new_business_path, notice: "Please create a business."
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/:id/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    @item.business = current_business
    if @item.save
      redirect_to items_path, notice: "Item #{@item.name} has been successfully created"
    else
      render 'new'
    end
  end

  # PUT /items/:id
  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to items_path, notice: "Item #{@item.name} has been successfully updated"
    else
      render 'edit'
    end
  end

  # DELETE /items/:id
  def destroy
    @item = Item.find_by(id: params[:id])
    if @item.try(:destroy)
      redirect_to items_path, notice: "Item #{@item.name} has been successfully deleted"
    else
      redirect_to items_path, alert: "Failed to delete item #{@item.name}"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
