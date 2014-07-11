class RidesController < ApplicationController
  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    if @ride.valid?
      redirect_to @ride
    else
      flash[:error] = @ride.errors.full_messages.join(', ')
      redirect_to :back
    end
  end

  def update
  end

  def edit
    @ride = Ride.find(params[:id])
  end

  def destroy
    Ride.find(params["id"]).destroy
    redirect_to rides_path
  end

  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def join
    ride = Ride.find(params[:id])
    if current_user && !(ride.users.exists? current_user.id)
      ride.users << current_user
    end
    redirect_to ride
  end

  def airport
    @airport_info = airport_helper(params[:id])
    redirect_to root_url unless @airport_info[:valid]
    @rides = Ride.where("airport= ? AND date > ?", @airport_info[:airport], Time.now) 
  end

  private
    def ride_params
      params.require(:ride).permit(:airport, :date, :ridetime)
    end

    def airport_helper(id)
      case id
      when "1"
        {
          valid: true,
          title: "To LAX",
          airport: "To LAX"
        }
      when "2"
        {
          valid: true,
          title: "From LAX",
          airport: "From LAX"
        }
      when "3"
        {
          valid: true,
          title: "To Ontario",
          airport: "To Ontario"
        }
      when "4"
        {
          valid: true,
          title: "From Ontario",
          airport: "From Ontario"
        }
      else
        {
          valid: false
        }
      end  
    end
end
