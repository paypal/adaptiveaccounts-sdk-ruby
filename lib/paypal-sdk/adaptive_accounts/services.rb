require 'paypal-sdk-core'

# AUTO GENERATED code for AdaptiveAccounts
module PayPal::SDK
  module AdaptiveAccounts

	  # Service Version
	  SERVICE_VERSION = "1.2.0"
	  # Service Name
	  SERVICE_NAME = "AdaptiveAccounts"

    module Services
      include DataTypes


      # Service Call: CreateAccount
      # @param CreateAccountRequest
      # @return CreateAccountResponse
      def CreateAccount(options = {} , http_header = {})
        request_object  = BuildCreateAccount(options)
        request_hash    = request_object.to_hash
        response_hash   = request("CreateAccount", request_hash, http_header)
        CreateAccountResponse.new(response_hash)
      end
      alias_method :create_account, :CreateAccount

      def BuildCreateAccount(options = {}, &block)
        klass     = CreateAccountRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_create_account, :BuildCreateAccount

      # Service Call: GetUserAgreement
      # @param GetUserAgreementRequest
      # @return GetUserAgreementResponse
      def GetUserAgreement(options = {} , http_header = {})
        request_object  = BuildGetUserAgreement(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetUserAgreement", request_hash, http_header)
        GetUserAgreementResponse.new(response_hash)
      end
      alias_method :get_user_agreement, :GetUserAgreement

      def BuildGetUserAgreement(options = {}, &block)
        klass     = GetUserAgreementRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_user_agreement, :BuildGetUserAgreement

      # Service Call: GetVerifiedStatus
      # @param GetVerifiedStatusRequest
      # @return GetVerifiedStatusResponse
      def GetVerifiedStatus(options = {} , http_header = {})
        request_object  = BuildGetVerifiedStatus(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetVerifiedStatus", request_hash, http_header)
        GetVerifiedStatusResponse.new(response_hash)
      end
      alias_method :get_verified_status, :GetVerifiedStatus

      def BuildGetVerifiedStatus(options = {}, &block)
        klass     = GetVerifiedStatusRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_verified_status, :BuildGetVerifiedStatus

      # Service Call: AddBankAccount
      # @param AddBankAccountRequest
      # @return AddBankAccountResponse
      def AddBankAccount(options = {} , http_header = {})
        request_object  = BuildAddBankAccount(options)
        request_hash    = request_object.to_hash
        response_hash   = request("AddBankAccount", request_hash, http_header)
        AddBankAccountResponse.new(response_hash)
      end
      alias_method :add_bank_account, :AddBankAccount

      def BuildAddBankAccount(options = {}, &block)
        klass     = AddBankAccountRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_add_bank_account, :BuildAddBankAccount

      # Service Call: AddPaymentCard
      # @param AddPaymentCardRequest
      # @return AddPaymentCardResponse
      def AddPaymentCard(options = {} , http_header = {})
        request_object  = BuildAddPaymentCard(options)
        request_hash    = request_object.to_hash
        response_hash   = request("AddPaymentCard", request_hash, http_header)
        AddPaymentCardResponse.new(response_hash)
      end
      alias_method :add_payment_card, :AddPaymentCard

      def BuildAddPaymentCard(options = {}, &block)
        klass     = AddPaymentCardRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_add_payment_card, :BuildAddPaymentCard

      # Service Call: SetFundingSourceConfirmed
      # @param SetFundingSourceConfirmedRequest
      # @return SetFundingSourceConfirmedResponse
      def SetFundingSourceConfirmed(options = {} , http_header = {})
        request_object  = BuildSetFundingSourceConfirmed(options)
        request_hash    = request_object.to_hash
        response_hash   = request("SetFundingSourceConfirmed", request_hash, http_header)
        SetFundingSourceConfirmedResponse.new(response_hash)
      end
      alias_method :set_funding_source_confirmed, :SetFundingSourceConfirmed

      def BuildSetFundingSourceConfirmed(options = {}, &block)
        klass     = SetFundingSourceConfirmedRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_set_funding_source_confirmed, :BuildSetFundingSourceConfirmed

      # Service Call: CheckComplianceStatus
      # @param CheckComplianceStatusRequest
      # @return CheckComplianceStatusResponse
      def CheckComplianceStatus(options = {} , http_header = {})
        request_object  = BuildCheckComplianceStatus(options)
        request_hash    = request_object.to_hash
        response_hash   = request("CheckComplianceStatus", request_hash, http_header)
        CheckComplianceStatusResponse.new(response_hash)
      end
      alias_method :check_compliance_status, :CheckComplianceStatus

      def BuildCheckComplianceStatus(options = {}, &block)
        klass     = CheckComplianceStatusRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_check_compliance_status, :BuildCheckComplianceStatus


    end

  end
end
