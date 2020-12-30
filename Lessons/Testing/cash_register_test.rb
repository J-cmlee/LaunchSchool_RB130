require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(1000)
  end

  def test_register_exists
    assert(@cash_register)
  end

  def test_accept_money
    sale_item = Transaction.new(1000)
    sale_item.amount_paid = 1000
    assert_equal(2000, @cash_register.accept_money(sale_item))
  end

  def test_accept_money2
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end

  def test_change
    sales_item = Transaction.new(20)
    sales_item.amount_paid = 50
    change = @cash_register.change(sales_item)
    assert_equal(30, change)
  end

  def test_give_receipt
    sales_item = Transaction.new(20)
    assert_output("You've paid $20.\n") { @cash_register.give_receipt(sales_item) }
  end

  def test_give_receipt2
    item_cost = 35
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end

  
end