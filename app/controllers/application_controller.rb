class ApplicationController < ActionController::Base
  def blank_square_form
    render({:template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num * @num
    render({:template => "calculation_templates/square_results.html.erb"})
  end

  def blank_squareroot_form
    render({:template => "calculation_templates/squareroot_form.html.erb"})
  end

  def calculate_squareroot
    @num = params.fetch("number").to_f
    @squareroot_of_num = Math.sqrt(@num)
    render({:template => "calculation_templates/squareroot_results.html.erb"})
  end

  def blank_payment_form
    render({:template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_i
    @pv = params.fetch("user_pv").to_f
    @n = @years * 12
    @r = (@apr/100)/12
    @numerator = (@r * @pv).to_f
    @denominator = (1 - ((@r+1) ** (-1 * @n)))
    @payment = @pv * @r*(1+@r)**@n/((1+@r)**@n-1)
    render({:template => "calculation_templates/payment_results.html.erb"})
  end

  def blank_random_form
    render({:template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)
    render({:template => "calculation_templates/random_results.html.erb"})
  end

end
