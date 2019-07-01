class HomeworksController < ApplicationController
  def create
    @homework = lesson.homeworks.build
    @homework.user_id = current_user.id
    @homework.course_id = course.id
    @homework.assign_attributes(homework_params)

    flash[:notice] = "Your homework successfully created." if @homework.save
    redirect_to course_lesson_path(course, lesson)
  end

  private

  def course
    @course ||= Course.find(params[:course_id])
  end
  helper_method :course

  def lesson
    @lesson ||= course.lessons.find(params[:lesson_id])
  end
  helper_method :lesson

  def homework
    @homework ||= lesson.homeworks.find(params[:id])
  end
  helper_method :homework

  def homework_params
    params.require(:homework).permit(:body)
  end
end
