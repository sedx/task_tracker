class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    @task.current_user = current_user
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
    if @task.save
    else
      render 'edit'
    end

  end

  def edit
    @task= Task.find(params[:id])
  end

  def destroy
  end

  def move_task
    @task = Task.find(params[:task])
    @task.current_user = current_user
    # TODO Если честно мне не очень нравится что сообщения присваиваются в контроллере
    # но через колбэки state_machine иди через эвенты мне не удалось
    #TODO ПОСМОТРЕТЬ ЧЕРЕЗ КОЛБЭК BEFORE_
    move_result = case params[:to].to_sym
                    when :analyze
                      @task.message = 'На анализ можно отдавать
                                      только задачи в разработке'
                      @task.to_analyze
                    when :doing
                      @task.to_do
                    when :testing
                      @task.message = 'В тестирование задачи отдаются
                                      только после разработки'
                      @task.to_test

                    when :released
                      @task.message = 'Релизить можно только протестированные таски'
                      @task.to_release
                    when :archived
                      @task.archive
                  end
  end

  def assign
    @task = Task.find(params[:task_id])
    @task.current_user= current_user
    @task.assign(User.find(params[:task][:user_id]))
  end

  private
    def task_params
      params.require(:task).permit(:title,:description,:tag_list, :user_id, :project_id, :state)
    end
end
