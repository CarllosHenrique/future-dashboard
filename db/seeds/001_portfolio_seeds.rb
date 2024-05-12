# Seeds for Portfolio model
class PortfolioSeeds < Seeds::Base
  def call
    portfolio = Portfolio.new(name: ENV.fetch("PORTFOLIO_NAME"),
                              applied_value: ENV.fetch("PORTFOLIO_VALUE"),
                              gross_balance: ENV.fetch("PORTFOLIO_VALUE"))
    portfolio.save!

    puts "#{self.class} - Created portfolio: #{portfolio.name}"
  end
end
