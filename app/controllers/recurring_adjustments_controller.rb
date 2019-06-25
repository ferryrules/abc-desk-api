class RecurringAdjustmentsController < ApplicationController
  before_action :set_recurring_adjustment, only: [:show, :update, :destroy]

  # GET /recurring_adjustments
  def index
    @recurring_adjustments = RecurringAdjustment.all

    render json: @recurring_adjustments
  end

  # GET /recurring_adjustments/1
  def show
    render json: @recurring_adjustment
  end

  # POST /recurring_adjustments
  def create
    @recurring_adjustment = RecurringAdjustment.new(recurring_adjustment_params)

    if @recurring_adjustment.save
      render json: @recurring_adjustment, status: :created, location: @recurring_adjustment
    else
      render json: @recurring_adjustment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recurring_adjustments/1
  def update
    if @recurring_adjustment.update(recurring_adjustment_params)
      render json: @recurring_adjustment
    else
      render json: @recurring_adjustment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recurring_adjustments/1
  def destroy
    @recurring_adjustment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurring_adjustment
      @recurring_adjustment = RecurringAdjustment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recurring_adjustment_params
      params.require(:recurring_adjustment).permit(:adj_type, :adj_amount, :description, :employee_id)
    end
end
