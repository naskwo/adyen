require 'adyen/api/simple_soap_client'
require 'adyen/api/payment_service'
require 'adyen/api/recurring_service'

module Adyen
  module API
    class << self
      # Username for the HTTP Basic Authentication that Adyen uses. Your username
      # should be something like +ws@Company.MyAccount+
      # @return [String]
      attr_accessor :username

      # Password for the HTTP Basic Authentication that Adyen uses. You can choose
      # your password yourself in the user management tool of the merchant area.
      # @return [String] 
      attr_accessor :password

      attr_accessor :default_params
    end

    self.default_params = {}

    #
    # Shortcut methods
    #

    def self.authorise_payment(params)
      PaymentService.new(params).authorise_payment
    end

    def self.authorise_recurring_payment(params)
      PaymentService.new(params).authorise_recurring_payment
    end

    def self.disable_recurring_contract(shopper_reference, recurring_detail_reference = nil)
      RecurringService.new({
        :shopper => { :reference => shopper_reference },
        :recurring_detail_reference => recurring_detail_reference
      }).disable
    end

    # TODO: the rest
  end
end
