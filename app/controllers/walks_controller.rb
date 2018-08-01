# coding: utf-8
class WalksController < ApplicationController
  before_action :set_walk, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @walks = Walk.is_public
  end

  def private
    @walks = Walk.where(user_id: current_user.id)
    render 'index'
  end

  def new
    @walk = Walk.new
  end

  def create
    @walk = Walk.new(walk_params)
    @walk.user = current_user
    if @walk.save!
      redirect_to private_walks_path, notice: 'Walk saved!'
    else
      render action: :new
    end
  end

  def show
    add_breadcrumb "All walks", walks_path
    add_breadcrumb @walk.name, walk_path(@walk)
  end

  def edit
  end

  def update
    if @walk.update(walk_params)
      redirect_to walk_path(@walk), notice: 'Walk changed!'
    else
      render action: :edit
    end
  end

  def destroy
    @walk.stations.each do |s|
      s.walk_id = 0
      s.save
    end
    @walk.destroy
    redirect_to walks_path, notice: 'Walk deleted!'
  end

  private

  def walk_params
    params.require(:walk).permit(:name,
                  :location,
                  :preview_image,
                  :description,
                  :entry,
                  :courseline,
                  :public)
  end

  def set_walk
    @walk = Walk.find(params[:id])
  end
end
