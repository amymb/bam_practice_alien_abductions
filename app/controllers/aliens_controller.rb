class AliensController < ApplicationController

  def new
    @alien = Alien.new
  end

  def create
    @alien = Alien.new(alien_params)
    if @alien.save
      flash[:notice] = "#{@alien.species} were successfully added!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @alien = Alien.find(params[:id])
  end

  def edit
    @alien = Alien.find(params[:id])
  end

  def update
    @alien = Alien.find(params[:id])
    if @alien.update(alien_params)
      flash[:notice] = "Alien was updated!"
      redirect_to @alien
    else
      render :edit
    end
  end

  def destroy
    alien = Alien.find(params[:id])
    alien.destroy
    flash[:notice] = "#{alien.species} were successfully destroyed"
    redirect_to root_path
  end

  def alien_params
    params.require(:alien).permit(:species, :planet)
  end

end
