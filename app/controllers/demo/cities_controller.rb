# frozen_string_literal: true

module Demo
  class CitiesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_demo_city, only: %i[show edit update destroy]

    # GET /demo/cities or /demo/cities.json
    def index
      @demo_cities = Demo::City.all
    end

    # GET /demo/cities/1 or /demo/cities/1.json
    def show
      @demo_city.log(:show)
    end

    # GET /demo/cities/new
    def new
      @demo_city = Demo::City.new
    end

    # GET /demo/cities/1/edit
    def edit; end

    # POST /demo/cities or /demo/cities.json
    def create
      @demo_city = Demo::City.new(demo_city_params)

      respond_to do |format|
        if @demo_city.save
          format.html { redirect_to demo_cities_url, notice: 'City was successfully created.' }
          format.json { render :show, status: :created, location: @demo_city }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @demo_city.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /demo/cities/1 or /demo/cities/1.json
    def update
      respond_to do |format|
        if @demo_city.update(demo_city_params)
          format.html { redirect_to demo_cities_url, notice: 'City was successfully updated.' }
          format.json { render :show, status: :ok, location: @demo_city }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @demo_city.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /demo/cities/1 or /demo/cities/1.json
    def destroy
      @demo_city.destroy!

      respond_to do |format|
        format.html { redirect_to demo_cities_url, notice: 'City was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_demo_city
      @demo_city = Demo::City.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def demo_city_params
      params.require(:demo_city).permit(:name, :country)
    end
  end
end
