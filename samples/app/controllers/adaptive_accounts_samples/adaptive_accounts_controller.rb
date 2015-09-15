require_dependency "adaptive_accounts_samples/application_controller"
require "ipaddr"

module AdaptiveAccountsSamples
  class AdaptiveAccountsController < ApplicationController
    include PayPal::SDK::AdaptiveAccounts

    def index
      redirect_to :action => :create_account
    end

    def ipn_notify
      if api.ipn_valid?(request.raw_post)
        logger.info("IPN message: VERIFIED")
        render :text => "VERIFIED"
      else
        logger.info("IPN message: INVALID")
        render :text => "INVALID"
      end
    end

    def create_account
      @create_account = api.build_create_account(params[:CreateAccountRequest] || default_api_value)
      @create_account.notificationURL ||= ipn_notify_url
      @create_account.createAccountWebOptions.returnUrl ||= adaptive_accounts_url(:create_account)
      @create_account_response = api.create_account(@create_account) if request.post?
    end

    def get_user_agreement
      @get_user_agreement = api.build_get_user_agreement(params[:GetUserAgreementRequest] || default_api_value)
      @get_user_agreement_response = api.get_user_agreement(@get_user_agreement) if request.post?
    end

    def get_verified_status
      @get_verified_status = api.build_get_verified_status(params[:GetVerifiedStatusRequest] || default_api_value)
      @get_verified_status_response = api.get_verified_status(@get_verified_status) if request.post?
    end

    def add_bank_account
      @add_bank_account = api.build_add_bank_account(params[:AddBankAccountRequest] || default_api_value)
      @add_bank_account_response = api.add_bank_account(@add_bank_account) if request.post?
    end

    def add_payment_card
      @add_payment_card = api.build_add_payment_card(params[:AddPaymentCardRequest] || default_api_value)
      @add_payment_card_response = api.add_payment_card(@add_payment_card) if request.post?
    end

    def set_funding_source_confirmed
      @set_funding_source_confirmed = api.build_set_funding_source_confirmed(params[:SetFundingSourceConfirmedRequest] || default_api_value)
      @set_funding_source_confirmed_response = api.set_funding_source_confirmed(@set_funding_source_confirmed) if request.post?
    end

    def check_compliance_status
      @check_compliance_status = api.build_check_compliance_status(params[:CheckComplianceStatusRequest] || default_api_value)
      @check_compliance_status_response = api.check_compliance_status(@check_compliance_status) if request.post?
    end


    private

    def api
      @api ||= API.new( :device_ipaddress => IPAddr.new(request.remote_ip).native.to_s )
    end
  end
end

