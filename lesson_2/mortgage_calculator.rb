# Build a Mortgage/Car Loan Calculator

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  Float(num) rescue false
end
loop do
  prompt "Welcome to Mortgage Calculator!"
  loan_amnt = ''
  loop do
    prompt "What's the loan amount?"
    loan_amnt = gets.chomp
    if loan_amnt.empty?() || loan_amnt.to_f() < 0
      prompt "Must not be a negative number."
    elsif !valid_number?(loan_amnt)
      prompt "Must be a number."
    else
      break
    end
  end

  apr = ''
  loop do
    prompt "What's the Annual Percentage Rate (APR)?"
    prompt "For Example, 6 for 6% or 4.5 for 4.5%"
    apr = gets.chomp
    if apr.empty?() || apr.to_f() < 0
      prompt "Must not be a negative number."
    elsif !valid_number?(apr)
      prompt "Must be a number or be without a %."
    else
      break
    end
  end

  duration = ''
  loop do
    prompt "What's the loan duration (in years)?"
    duration = gets.chomp
    if duration.empty?() || duration.to_f() < 0
      prompt "Must not be a negative number."
    elsif !valid_number?(duration)
      prompt "Must be a number."
    else
      break
    end
  end

  annual_rate = apr.to_f / 100
  monthly_rate = annual_rate / 12
  monthly_dur = duration.to_f * 12
  monthly_pmt = loan_amnt.to_f *
                (monthly_rate / (1 - (1 + monthly_rate)**-monthly_dur))
  prompt "Your monthly payment is $#{format('%02.2f', monthly_pmt)}"

  prompt "Perform another loan calculation? (Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt "Thank you for using the mortgage calculator.  Good bye!"
