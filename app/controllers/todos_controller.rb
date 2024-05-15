class TodosController < ApplicationController

  def index
    @today = Date.today #今日の日付
    @task = Todo.new
    @tasks = Todo.where(done_at:nil).order(:time) #未完了タスクかつ期限が近い順に並べ替え
    @tasks_done = Todo.where.not(done_at:nil) #完了タスク
  end

  def create
    @task = Todo.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def done
    @today = Date.today #今日の日付
    task = Todo.find(params[:id])
    task.update(done_at: @today ) #完了ボタンを押すとdone_atカラムに完了した日時を追加
    redirect_to root_path
  end

  private
  def task_params
    params.require(:todo).permit(:task, :time,:done_at)
  end
end
