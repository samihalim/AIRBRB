class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
    @desk = Desk.find(params[:desk_id])
  end

  def edit
  end

  def create
    booking = Booking.new(booking_params)
    desk = Desk.find(params[:desk_id])
    booking.desk = desk
    booking.user = current_user

    if booking.save!
      redirect_to booking, notice: 'A booking was successfully created.'

    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'booking was successfully updated.'
    else
      render :edit
    end
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'booking was successfully destroyed.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
