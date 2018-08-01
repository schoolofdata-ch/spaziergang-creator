class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :set_station, only: [:new, :create]
  before_action :authenticate_user!

  def index
    @subjects = Subject.all
  end

  def show
    @pages = Page.where(subject_id: @subject.id)

    add_breadcrumb "All walks", walks_path
    add_breadcrumb @subject.station.walk.name, walk_path(@subject.station.walk)
    add_breadcrumb @subject.station.name, station_path(@subject.station)
    add_breadcrumb @subject.name, subject_path(@subject)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.user_id = current_user.id
    @subject.station_id = @station.id
    if @subject.save!
      redirect_to subject_path(@subject), notice: 'Subject saved!'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @subject.update(subject_params)
      redirect_to subject_path(@subject), notice: 'Subject changed!'
    else
      render action: :edit
    end
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path, notice: 'Subject deleted!'
  end

  private

  def set_station
    @station = Station.find(params[:station_id])
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name,
                                    :description,
                                    :station_id)
  end
end
