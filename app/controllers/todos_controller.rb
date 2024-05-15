class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:done]

  def index
    @today = Date.today #今日の日付
    @tasks = current_user.todos.where(done_at: nil).order(:time) #未完了タスクかつ期限が近い順に並べ替え
    @tasks_done = current_user.todos.where.not(done_at: nil) #完了タスク
  end

  def new
    @task = Todo.new
  end

  def create
    @task = current_user.todos.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def done
    @today = Date.today #今日の日付
    if @task.update(done_at: @today)
      redirect_to root_path
    else
      redirect_to root_path, alert: "タスクの完了に失敗しました。"
    end
  end

  private
  def task_params
    params.require(:todo).permit(:task, :time, :done_at)
  end

  def set_task
    @task = current_user.todos.find_by(id: params[:id])
    redirect_to root_path, alert: "タスクがみつかりません。" if @task.nil?
  end
end
