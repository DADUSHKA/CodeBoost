class CoursesController < ApplicationController
  # skip_authorization_check
  def index
    authorize! :read, Course
    @courses = Course.all.page(params[:page]).per(2)
  end
end
