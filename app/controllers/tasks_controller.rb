class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.js {render 'created_task'}
      else
        format.js {render 'fail_crate_task'}
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes task_params
    unless @task.save
      render 'edit'
    end

  end

  def edit
    @task= Task.find(params[:id])
  end

  def destroy
    @task= Task.find(params[:id])
    @task.destroy
  end

  def move_task
    @task = Task.find(params[:task])

    # передаем текущего пользователя чтобы записать в историю
    @task.current_user = current_user
    # Если честно мне не очень нравится что сообщения присваиваются в контроллере
    # но через колбэки state_machine иди через эвенты мне не удалось, возможно я что-тоделал не так
    case params[:to].to_sym
    when :analyze
      unless @task.to_analyze
        @task.message = 'На анализ можно отдавать только задачи в разработке'
      end
    when :doing
      @task.to_do
    when :testing
      unless @task.to_test
        @task.message = 'В тестирование задачи отдаются только после разработки'
      end

    when :released
      unless @task.to_release
        @task.message = 'Релизить можно только протестированные таски'
      end
    when :archived
      @task.archive
  end
  end

  def assign
    @task = Task.find(params[:task_id])
    # передаем текущего пользователя чтобы записать в историю
    @task.current_user= current_user
    @task.assign(User.find(params[:task][:user_id]))
  end

  private
    def task_params
      params.require(:task).permit(:title,:description,:tag_list, :user_id, :project_id, :state, :time)
    end
end
