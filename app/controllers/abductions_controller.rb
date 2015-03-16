class AbductionsController < ApplicationController
  def index
    @alien = Alien.find(params[:alien_id])
  end

  def new
    @alien = Alien.find(params[:alien_id])
    @abduction = @alien.abductions.new
  end

  def create
    @alien = Alien.find(params[:alien_id])
    @abduction = @alien.abductions.new(abduction_params)
    if @abduction.save
      flash[:notice] = "#{@alien.species} abducted #{@abduction.person.full_name}!"
      redirect_to alien_abductions_path
    else
      render :new
    end
  end

  def show
    @alien = Alien.find(params[:alien_id])
    @abduction = @alien.abductions.find(params[:id])
  end

  def edit
    @alien = Alien.find(params[:alien_id])
    @abduction = @alien.abductions.find(params[:id])
  end

  def update
    @alien = Alien.find(params[:alien_id])
    @abduction = @alien.abductions.find(params[:id])
      if @abduction.update(abduction_params)
        flash[:notice] = "Abduction was updated!"
        redirect_to alien_abduction_path(@alien, @abduction)
      else
        render :edit
      end
    end

  def destroy
    @alien = Alien.find(params[:alien_id])
    abduction = @alien.abductions.find(params[:id])
    abduction.destroy
    flash[:notice] = "Forget this ever happened!"
    redirect_to alien_abductions_path
  end

  def abduction_params
    params.require(:abduction).permit(:alien_id, :person_id, :date, :anal_probe)
  end
end
