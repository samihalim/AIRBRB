class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :new, :create]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save!
      redirect_to @booking, notice: 'A booking was successfully created.'
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
    currentuser.bookings
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
