class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    #@tasks = Task.all
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
    #if params[:status_eq] == "todo"
    #  @tasks = Task.ransack(status_eq: 'todo').result
    #elsif params[:status_eq] == "doing"
    #  @tasks = Task.ransack(status_eq: 'doing').result
    #elsif params[:status_eq] == "done"
    #  @tasks = Task.ransack(status_eq: 'done').result
    #end
    #@q = Task.ransack(status_eq: params[:q][:status]).result.to_sql
    #@tasks = Task.ransack(status_eq: params[:q][:status]).result.to_sql
    #puts params[:q][:status]
    #@q.build_condition
    
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:title, :description, :status, :deadline)
    end
end
