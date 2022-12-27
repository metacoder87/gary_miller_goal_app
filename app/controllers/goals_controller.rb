class GoalsController < ApplicationController
  before_action :require_current_user!

  # GET /goals or /goals.json
  def index
    @goals = current_user.goals
  end

  # GET /goals/1 or /goals/1.json
  def show
    @goal = Goal.find(params[:id])
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # POST /goals or /goals.json
  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      flash[:notices] = ['Goal saved!']
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  # PATCH/PUT /goals/1 or /goals/1.json
  def update
    @goal = Goal.find(params[:id])

    if @goal.update_attributes(goal_params)
      flash[:notices] = ['Goal updated!']
      if request.referer == edit_goal_url(@goal)
        redirect_to @goal
      else
        redirect_to request.referer
      end
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  # DELETE /goals/1 or /goals/1.json
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    flash[:notices] = ['Goal deleted!']
    redirect_to goals_url
  end

  private

    # Only allow a list of trusted parameters through.
    def goal_params
      params.require(:goal).permit(:title, :private, :details, :completed)
    end
end