class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]
  before_action :ensure_user_is_authorized, only: [:show]

  # GET /restaurants or /restaurants.json
  def index
    @restaurants = policy_scope(Restaurant)
    if @restaurants.empty?
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    if !current_user.admin?
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end

  # GET /restaurants/1/edit
  def edit
    if !current_user.admin?
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :location)
    end

    def ensure_user_is_authorized
      if !RestaurantPolicy.new(current_user, @restaurant).show?
        raise Pundit::NotAuthorizedError, "not allowed"
      end
    end
end
