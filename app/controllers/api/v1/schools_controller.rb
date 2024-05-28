class Api::V1::SchoolsController < ApplicationController
  def index
    schools = School.all
    render json: schools
  end

  def create
    school = School.new(params.require(:school).permit(School.column_names))
    if school.save
      render json: {success: true, school: school}
    else
      render json: {success: false, errors: school.errors.full_messages}
    end
  end

  def update
    school = School.find(params[:id])
    if school.update(params.require(:school).permit(School.column_names))
      render json: {success: true, school: school}
    else
      render json: {success: false, errors: school.errors.full_messages}
    end
  end

  def destroy
    school = School.find(params[:id])
    if school.destroy
      render json: {success: true, school: school}
    else
      render json: {success: false, errors: school.errors.full_messages}
    end
  end
end
