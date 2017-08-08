class SalesController < ApplicationController
  def new
    @sales = Sale.new
  end

  def create
    @sales = Sale.new(sale_params)
   puts @sales.category
   if @sales.tax == 1
     @sales.total = @sales.value - (@sales.value * @sales.discount / 100)
   else
     @sales.total = (@sales.value - (@sales.value * @sales.discount / 100)) * 1.19
   end
   puts @sales.total
   @sales.save
   redirect_to sales_path
  end

  def done
   @sales = Sale.all
  end

  private

  def sale_params
   params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end
end
