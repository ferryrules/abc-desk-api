class PaychecksController < ApplicationController
  before_action :set_paycheck, only: [:show, :update, :destroy]

  # GET /paychecks
  def index
    @paychecks = Paycheck.all

    render json: @paychecks
  end

  # GET /paychecks/1
  def show
    render json: @paycheck
  end

  # POST /paychecks
  def create
    @paycheck = Paycheck.new(paycheck_params)

    if @paycheck.save
      render json: @paycheck, status: :created, location: @paycheck
    else
      render json: @paycheck.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /paychecks/1
  def update
    if @paycheck.update(paycheck_params)
      render json: @paycheck
    else
      render json: @paycheck.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paychecks/1
  def destroy
    @paycheck.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paycheck
      @paycheck = Paycheck.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def paycheck_params
      params.require(:paycheck).permit(:hours, :ot_hours, :pto_hours, :vacation_hours, :holiday_hours, :sick_hours, :payroll_id, :employee_id)
    end
end
