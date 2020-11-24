class DesksController < ApplicationController
  before_action :set_desk, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]


  def index
    @desks = Desk.all.order(updated_at: :desc)
  end

  def show
  end

  def new
    @desk = Desk.new
  end

  def edit
  end

  def create
    @desk = Desk.new(desk_params)
    @desk.user = current_user

    if @desk.save!
      redirect_to @desk, notice: 'A desk was successfully created.'
    else
      render :new
    end
  end

  def update
    if @desk.update(desk_params)
      redirect_to @desk, notice: 'Desk was successfully updated.'
    else
      render :edit
    end
  end

  def my_desks
    currentuser.desks
  end

  def destroy
    @desk.destroy
    redirect_to desks_url, notice: 'Desk was successfully destroyed.'
  end

  private

  def set_desk
    @desk = Desk.find(params[:id])
  end

  def desk_params
    params.require(:desk).permit(:title, :price, :location, :seats, :start_date, :end_date, :photo)
  end
end
