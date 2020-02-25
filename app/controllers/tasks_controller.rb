class TasksController < ApplicationController
  before_action :get_list
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @list.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = @list.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @list.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to list_tasks_path(@list), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to list_tasks_path(@list), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to list_tasks_path(@list), notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update_status
    @task = Task.find params[:id]
    # Authorization checks go here
    if @task.status == 0
      @task.status = 1
      message = "Task #{@task.name} done."
    else
      @task.status = 0
      message = "Task #{@task.name} undone."
    end
    respond_to do |format|
      if @task.save
        format.html { redirect_to list_tasks_path(@list), notice: message }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = @list.tasks.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :text, :status, :start_date, :end_date)
  end

  def get_list
    @list = current_user.lists.find(params[:list_id])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Wrong list it"
    redirect_to lists_path
  end
end

validates :body, presence: true
