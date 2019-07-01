class Dashboard::HomeworksController < Dashboard::BaseController
  def index
    @lessons = course.lessons.all

    if params[:lesson_id].present? || params.has_value?('0')
      @homeworks = course.homeworks.select_lessons(params[:lesson_id]).
      page(params[:page]).per(2)
      @lesson_title = @lessons.find(params[:lesson_id]).title
    else
      @homeworks = course.homeworks.all.page(params[:page]).per(5)
      @lesson_title = "all"
    end
  end

  def destroy
    homework.destroy

    flash[:notice] = "homework was successfully deleted"
    redirect_to dashboard_course_homeworks_path(course)
  end

  private

  def course
    @course ||= Course.find(params[:course_id])
  end
  helper_method :course

  def homework
    @homework ||= course.homeworks.find(params[:id])
  end
  helper_method :homework

  def homework_params
    params.require(:homework).permit(:body)
  end
end
