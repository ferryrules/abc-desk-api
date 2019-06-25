class PaycheckAdjustmentsController < ApplicationController
  before_action :set_paycheck_adjustment, only: [:show, :update, :destroy]

  # GET /paycheck_adjustments
  def index
    @paycheck_adjustments = PaycheckAdjustment.all

    render json: @paycheck_adjustments
  end

  # GET /paycheck_adjustments/1
  def show
    render json: @paycheck_adjustment
  end

  # POST /paycheck_adjustments
  def create
    @paycheck_adjustment = PaycheckAdjustment.new(paycheck_adjustment_params)

    if @paycheck_adjustment.save
      render json: @paycheck_adjustment, status: :created, location: @paycheck_adjustment
    else
      render json: @paycheck_adjustment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /paycheck_adjustments/1
  def update
    if @paycheck_adjustment.update(paycheck_adjustment_params)
      render json: @paycheck_adjustment
    else
      render json: @paycheck_adjustment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paycheck_adjustments/1
  def destroy
    @paycheck_adjustment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paycheck_adjustment
      @paycheck_adjustment = PaycheckAdjustment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def paycheck_adjustment_params
      params.require(:paycheck_adjustment).permit(:adj_type, :adj_amount, :description, :paycheck_id, :employee_id)
    end
end
