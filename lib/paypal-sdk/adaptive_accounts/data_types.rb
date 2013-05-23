# Stub objects for AdaptiveAccounts
# Auto generated code

require 'paypal-sdk-core'

module PayPal::SDK
  module AdaptiveAccounts
    module DataTypes

      class DataType < Core::API::DataTypes::Base
        def self.load_members
          add_attribute :xmlns
          add_attribute :type, :namespace => :xsi
        end
      end

      module ResponseStatus
        Status = { :success => ["Success", "SuccessWithWarning"],
                   :warning => ["Warning", "SuccessWithWarning", "FailureWithWarning"],
                   :failure => ["Failure", "FailureWithWarning"] }

        def response_status
          self.responseEnvelope && self.responseEnvelope.ack
        end

        Status.keys.each do |status|
          define_method("#{status}?") do
            Status[status].include?(self.response_status)
          end
        end
      end

      class EnumType < Core::API::DataTypes::Enum
      end

      # This type contains the detailed error information resulting from the service operation. 
      class ErrorData < DataType
        def self.load_members
          object_of :errorId, Integer
          object_of :domain, String
          object_of :subdomain, String
          object_of :severity, ErrorSeverity
          object_of :category, ErrorCategory
          object_of :message, String
          object_of :exceptionId, String
          array_of :parameter, ErrorParameter
        end
      end



      class ErrorParameter < DataType
        def self.load_members
          add_attribute :name, :required => true
          object_of :value, String, :required => true
        end
      end



      # This specifies the list of parameters with every request to the service. 
      class RequestEnvelope < DataType
        def self.load_members
          # This specifies the required detail level that is needed by a client application pertaining to a particular data component (e.g., Item, Transaction, etc.). The detail level is specified in the DetailLevelCodeType which has all the enumerated values of the detail level for each component. 
          object_of :detailLevel, DetailLevelCode
          # This should be the standard RFC 3066 language identification tag, e.g., en_US. 
          object_of :errorLanguage, String
        end
      end



      # This specifies a list of parameters with every response from a service. 
      class ResponseEnvelope < DataType
        def self.load_members
          object_of :timestamp, DateTime, :required => true
          # Application level acknowledgement code. 
          object_of :ack, AckCode, :required => true
          object_of :correlationId, String, :required => true
          object_of :build, String, :required => true
        end
      end



      # This elements in this type refers to the end user of the application invoking this service. 
      class ClientDetailsType < DataType
        def self.load_members
          object_of :ipAddress, String
          object_of :deviceId, String
          object_of :applicationId, String
          object_of :model, String
          object_of :geoLocation, String
          object_of :customerType, String
          object_of :partnerName, String
          object_of :customerId, String
        end
      end



      # This specifies a fault, encapsulating error data, with specific error codes. 
      class FaultMessage < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :error, ErrorData
        end
      end



      class ErrorSeverity < EnumType
        self.options = { 'ERROR' => 'Error', 'WARNING' => 'Warning' }
      end



      class ErrorCategory < EnumType
        self.options = { 'SYSTEM' => 'System', 'APPLICATION' => 'Application', 'REQUEST' => 'Request' }
      end



      #  AckCodeType This code identifies the acknowledgement code types that could be used to communicate the status of processing a (request) message to an application. This code would be used as part of a response message that contains an application level acknowledgement element. 
      class AckCode < EnumType
        self.options = { 'SUCCESS' => 'Success', 'FAILURE' => 'Failure', 'WARNING' => 'Warning', 'SUCCESSWITHWARNING' => 'SuccessWithWarning', 'FAILUREWITHWARNING' => 'FailureWithWarning' }
      end



      #  DetailLevelCodeType 
      class DetailLevelCode < EnumType
        self.options = { 'RETURNALL' => 'ReturnAll', 'RETURNATTRIBUTES' => 'ReturnAttributes' }
      end



      #  Bank account type should be CHECKING, SAVINGS,BUSINESS_CHECKING, BUSINESS_SAVINGS,NORMAL, or UNKNOWN. 
      class BankAccountType < EnumType
        self.options = { 'CHECKING' => 'CHECKING', 'SAVINGS' => 'SAVINGS', 'BUSINESSCHECKING' => 'BUSINESS_CHECKING', 'BUSINESSSAVINGS' => 'BUSINESS_SAVINGS', 'NORMAL' => 'NORMAL', 'UNKNOWN' => 'UNKNOWN' }
      end



      #  API confirmation type currently Valid values are: NONE, MOBILE and WEB. WEB: Returns a URL to complete the registration. 
      class ConfirmationType < EnumType
        self.options = { 'WEB' => 'WEB', 'MOBILE' => 'MOBILE', 'NONE' => 'NONE' }
      end



      #  Business Types 
      class BusinessType < EnumType
        self.options = { 'ASSOCIATION' => 'ASSOCIATION', 'CORPORATION' => 'CORPORATION', 'GENERALPARTNERSHIP' => 'GENERAL_PARTNERSHIP', 'GOVERNMENT' => 'GOVERNMENT', 'INDIVIDUAL' => 'INDIVIDUAL', 'LIMITEDLIABILITYPARTNERSHIP' => 'LIMITED_LIABILITY_PARTNERSHIP', 'LIMITEDLIABILITYPRIVATECORPORATION' => 'LIMITED_LIABILITY_PRIVATE_CORPORATION', 'LIMITEDLIABILITYPROPRIETORS' => 'LIMITED_LIABILITY_PROPRIETORS', 'LIMITEDPARTNERSHIP' => 'LIMITED_PARTNERSHIP', 'LIMITEDPARTNERSHIPPRIVATECORPORATION' => 'LIMITED_PARTNERSHIP_PRIVATE_CORPORATION', 'NONPROFIT' => 'NONPROFIT', 'OTHERCORPORATEBODY' => 'OTHER_CORPORATE_BODY', 'PARTNERSHIP' => 'PARTNERSHIP', 'PRIVATECORPORATION' => 'PRIVATE_CORPORATION', 'PRIVATEPARTNERSHIP' => 'PRIVATE_PARTNERSHIP', 'PROPRIETORSHIP' => 'PROPRIETORSHIP', 'PROPRIETORSHIPCRAFTSMAN' => 'PROPRIETORSHIP_CRAFTSMAN', 'PROPRIETARYCOMPANY' => 'PROPRIETARY_COMPANY', 'PUBLICCOMPANY' => 'PUBLIC_COMPANY', 'PUBLICCORPORATION' => 'PUBLIC_CORPORATION', 'PUBLICPARTNERSHIP' => 'PUBLIC_PARTNERSHIP' }
      end



      #  Subtype required only for Business Type GOVERNMENT and ASSOCIATION GOVERNMENT: ENTITY, EMANATION,ESTD_COMMONWEALTH, ESTD_UNDER_STATE_TERRITORY, ESTD_UNDER_FOREIGN_COUNTRY ASSOCIATION: INCORPORATED, NON_INCORPORATED 
      class BusinessSubtypeType < EnumType
        self.options = { 'ENTITY' => 'ENTITY', 'EMANATION' => 'EMANATION', 'ESTDCOMMONWEALTH' => 'ESTD_COMMONWEALTH', 'ESTDUNDERSTATETERRITORY' => 'ESTD_UNDER_STATE_TERRITORY', 'ESTDUNDERFOREIGNCOUNTRY' => 'ESTD_UNDER_FOREIGN_COUNTRY', 'INCORPORATED' => 'INCORPORATED', 'NONINCORPORATED' => 'NON_INCORPORATED' }
      end



      #  Sales venue / store front type 
      class SalesVenueType < EnumType
        self.options = { 'WEB' => 'WEB', 'EBAY' => 'EBAY', 'OTHERMARKETPLACE' => 'OTHER_MARKETPLACE', 'OTHER' => 'OTHER' }
      end



      #  Stake holder role 
      class StakeholderRoleType < EnumType
        self.options = { 'CHAIRMAN' => 'CHAIRMAN', 'SECRETARY' => 'SECRETARY', 'TREASURER' => 'TREASURER', 'BENEFICIALOWNER' => 'BENEFICIAL_OWNER', 'PRIMARYCONTACT' => 'PRIMARY_CONTACT', 'INDIVIDUALPARTNER' => 'INDIVIDUAL_PARTNER', 'NONINDIVIDUALPARTNER' => 'NON_INDIVIDUAL_PARTNER', 'PRIMARYINDIVIDUALPARTNER' => 'PRIMARY_INDIVIDUAL_PARTNER', 'DIRECTOR' => 'DIRECTOR', 'NOBENEFICIALOWNER' => 'NO_BENEFICIAL_OWNER' }
      end



      #  SwitchMaestro, deprecated card type, use UKMaestro instead 
      class CardTypeType < EnumType
        self.options = { 'VISA' => 'Visa', 'MASTERCARD' => 'MasterCard', 'AMERICANEXPRESS' => 'AmericanExpress', 'DISCOVER' => 'Discover', 'SWITCHMAESTRO' => 'SwitchMaestro', 'UKMAESTRO' => 'UKMaestro', 'CARTEAURORE' => 'CarteAurore', 'CARTEBLEUE' => 'CarteBleue', 'COFINOGA' => 'Cofinoga', 'ETOILES' => '4etoiles', 'CARTAAURA' => 'CartaAura', 'TARJETAAURORA' => 'TarjetaAurora', 'JCB' => 'JCB', 'MAESTRO' => 'Maestro' }
      end



      #  Generic Yes or No input validation type. 
      class YesNoType < EnumType
        self.options = { 'YES' => 'YES', 'NO' => 'NO' }
      end



      #  Government ID Types 
      class GovernmentIDTypes < EnumType
        self.options = { 'SIN' => 'SIN' }
      end



      #  Legal Agreement Types 
      class LegalAgreementTypes < EnumType
        self.options = { 'FINANCIALBINDINGAUTHORITY' => 'FINANCIAL_BINDING_AUTHORITY' }
      end



      class ProductActivationErrors < EnumType
        self.options = { 'NOTALLOWED' => 'NOT_ALLOWED', 'MISSINGCC' => 'MISSING_CC', 'MISSINGMOBILEPHONE' => 'MISSING_MOBILE_PHONE', 'MISSINGPIN' => 'MISSING_PIN', 'MOBILEPHONENOTACTIVATED' => 'MOBILE_PHONE_NOT_ACTIVATED', 'PRODUCTEXISTS' => 'PRODUCT_EXISTS', 'UNCONFIRMEDMOBILE' => 'UNCONFIRMED_MOBILE', 'INTERNALERROR' => 'INTERNAL_ERROR' }
      end



      # Identifies a PayPal account to which this request is targeted. Caller of this API has to provide ONLY one of these inputs: emailAddress, accountId or phoneNumber. 
      class AccountIdentifierType < DataType
        def self.load_members
          # Identifies the PayPal account based on the emailAddress. 
          object_of :emailAddress, String, :required => true
          # Identifies the PayPal account based on the phoneNumber. 
          object_of :mobilePhoneNumber, String, :required => true
          # Identifies the PayPal account based on the accountId. 
          object_of :accountId, String, :required => true
        end
      end



      # Valid values are: Personal, Premier, and Business. Flag="2" corresponds to java.util.regex.Pattern.CASE_INSENSITIVE, meaning the strings are not case-sensitive 
      class CreateAccountRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :clientDetails, ClientDetailsType
          # Valid values are: Personal, Premier, and Business. Flag="2" corresponds to java.util.regex.Pattern.CASE_INSENSITIVE, meaning the strings are not case-sensitive 
          object_of :accountType, String
          object_of :name, NameType, :required => true
          object_of :dateOfBirth, Date
          object_of :address, AddressType, :required => true
          # Must provide at least one of contactPhoneNumber, homePhoneNumber, or mobilePhoneNumber 
          object_of :contactPhoneNumber, String
          # Must provide at least one of contactPhoneNumber, homePhoneNumber, or mobilePhoneNumber 
          object_of :homePhoneNumber, String
          # Must provide at least one of contactPhoneNumber, homePhoneNumber, or mobilePhoneNumber 
          object_of :mobilePhoneNumber, String
          object_of :currencyCode, String
          object_of :citizenshipCountryCode, String
          object_of :preferredLanguageCode, String, :required => true
          object_of :notificationURL, String
          object_of :emailAddress, String
          # Valid values are: Mobile and Web. Mobile: Returns a key to complete the registration. Web: Returns a URL to complete the registration. 
          object_of :registrationType, String
          object_of :createAccountWebOptions, CreateAccountWebOptionsType
          object_of :suppressWelcomeEmail, Boolean
          # Set to true if you want this account to undergo extra vetting by PayPal before becoming usable. 
          object_of :performExtraVettingOnThisAccount, Boolean
          # tax id, ssn, itin, pan, cpf, acn, abn, etc. 
          object_of :taxId, String
          object_of :partnerField1, String
          object_of :partnerField2, String
          object_of :partnerField3, String
          object_of :partnerField4, String
          object_of :partnerField5, String
          # Required for business account creation 
          object_of :businessInfo, BusinessInfoType
          # An ID representing a unique value, such as SSN, TIN, SIN, TaxID, etc. generally issued by a Government. Currently supports only SIN for Canada. 
          array_of :governmentId, GovernmentIDPair
          # Account Holder's profession, values such as: Accountant, Actuary, Advocate, Architect, Business Owner, Doctor, Dentist, Engineer, Financial Analyst, Lawyer, Librarian, Nurse, Pilot, Pharmacist, Physician, Physicial Therapist, Professor, Psychologist, Scientist, Teacher, Webmaster, Writer, Student, Other 
          object_of :profession, String
          # Account Holder's occupation. For business accounts only. Values: Executive, President, Vice President, Director, Manager, Staff, Other. 
          object_of :occupation, String
          # Account Holder's functional area. For business accounts only. Values: Finance, Operations, Technology, Sales, Marketing, Other 
          object_of :functionalArea, String
          # Boolean value, indicates whether user has agreed for a particular agreement or not. 
          array_of :legalAgreement, LegalAgreementType
          # Expected Value: 0|1|2|3|4|5 according to the description below: 0 - "Send payments for goods and/or services to domestic merchants" 1 - "Send payments for goods and/or services to cross-border merchants" 2 - "Send payments for goods and/or services to domestic and cross-border merchants" 3 - "Receive payments for goods and/or services from domestic buyers" 4 - "Receive payments for goods and/or services from cross-border buyers" 5 - "Receive payments for goods and/or service from domestic/cross-border buyers" 
          object_of :purposeOfAccount, String
        end
      end



      # Valid values are: COMPLETED 
      class CreateAccountResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :createAccountKey, String
          # Valid values are: COMPLETED 
          object_of :execStatus, String, :required => true
          object_of :redirectURL, String
          # Identifies a PayPal account. Only premier and business accounts have an accountId 
          object_of :accountId, String
          array_of :error, ErrorData
        end
      end



      class GetUserAgreementRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :createAccountKey, String
          object_of :countryCode, String
          object_of :languageCode, String
        end
      end



      class GetUserAgreementResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :agreement, String, :required => true
          array_of :error, ErrorData
        end
      end



      # Deprecated, use accountIdentifier.emailAddress instead 
      class GetVerifiedStatusRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # Deprecated, use accountIdentifier.emailAddress instead 
          object_of :emailAddress, String
          # Identifies a PayPal account to which this request is targeted. Caller of this API has to provide ONLY one of these inputs: emailAddress, accountId or mobilePhoneNumber. 
          object_of :accountIdentifier, AccountIdentifierType
          # matchCriteria determines which field(s) in addition to emailAddress is used to locate the account. Currently, we support matchCriteria of 'NAME' and 'NONE'. 
          object_of :matchCriteria, String, :required => true
          # Required if matchCriteria is NAME Optional if matchCriteria is NONE 
          object_of :firstName, String
          # Required if matchCriteria is NAME Optional if matchCriteria is NONE 
          object_of :lastName, String
        end
      end



      # Returned values are: VERIFIED|UNVERIFIED. 
      class GetVerifiedStatusResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # Returned values are: VERIFIED|UNVERIFIED. 
          object_of :accountStatus, String, :required => true
          # Returns countryCode belonging to PayPal account. 
          object_of :countryCode, String
          # Info about PayPal user such as emailAddress, accountId, firstName, lastName etc. 
          object_of :userInfo, UserInfoType
          array_of :error, ErrorData
        end
      end



      # Identifying the PayPal account to which this request is targetted to. Caller of this API has to either provided an emailAddress or an accountId. 
      class AddBankAccountRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # Identifying the PayPal account to which this request is targetted to. Caller of this API has to either provided an emailAddress or an accountId. 
          object_of :emailAddress, String
          # Identifying the PayPal account to which this request is targetted to. Caller of this API has to either provided an emailAddress or an accountId. 
          object_of :accountId, String
          object_of :createAccountKey, String
          # Country code for the bank 
          object_of :bankCountryCode, String, :required => true
          # The defualt value is UNKNOWN. 
          object_of :bankName, String
          # Bank routing or transit number 
          object_of :routingNumber, String
          object_of :bankAccountType, BankAccountType
          # Basic Bank Account Number (BBAN) 
          object_of :bankAccountNumber, String
          # International Bank Account Number (IBAN) 
          object_of :iban, String
          # CLABE represents the bank information for countries like Mexico 
          object_of :clabe, String
          # Bank/State/Branch number 
          object_of :bsbNumber, String
          # Branch location 
          object_of :branchLocation, String
          # Branch sort code. 
          object_of :sortCode, String
          # Bank transit number 
          object_of :bankTransitNumber, String
          # Institution number 
          object_of :institutionNumber, String
          # Branch code 
          object_of :branchCode, String
          # For Brazil Agency Number 
          object_of :agencyNumber, String
          # Bank code 
          object_of :bankCode, String
          # RIB key 
          object_of :ribKey, String
          # control digits 
          object_of :controlDigit, String
          # Tax id type of CNPJ or CPF, only supported for Brazil. 
          object_of :taxIdType, String
          # Tax id number for Brazil. 
          object_of :taxIdNumber, String
          # Date of birth of the account holder 
          object_of :accountHolderDateOfBirth, Date
          object_of :confirmationType, ConfirmationType, :required => true
          object_of :webOptions, WebOptionsType
        end
      end



      # Valid values are: FUNDING_SOURCE_ADDED, WEB_URL_VERIFICATION_NEEDED 
      class AddBankAccountResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # Valid values are: FUNDING_SOURCE_ADDED, WEB_URL_VERIFICATION_NEEDED 
          object_of :execStatus, String, :required => true
          object_of :redirectURL, String
          object_of :fundingSourceKey, String
          array_of :error, ErrorData
        end
      end



      # Identifying the PayPal account to which this request is targetted to. Caller of this API has to either provided an emailAddress or an accountId. 
      class AddPaymentCardRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # Identifying the PayPal account to which this request is targetted to. Caller of this API has to either provided an emailAddress or an accountId. 
          object_of :emailAddress, String
          # Identifying the PayPal account to which this request is targetted to. Caller of this API has to either provided an emailAddress or an accountId. 
          object_of :accountId, String
          object_of :createAccountKey, String
          object_of :nameOnCard, NameType, :required => true
          object_of :billingAddress, AddressType, :required => true
          object_of :cardOwnerDateOfBirth, Date
          object_of :cardNumber, String, :required => true
          object_of :cardType, CardTypeType, :required => true
          object_of :expirationDate, CardDateType
          # CVV2: Proivde only for requests where confirmationType is None (Direct request) 
          object_of :cardVerificationNumber, String
          object_of :startDate, CardDateType
          # Up to 2 digit for Switch/Maestro cards. 
          object_of :issueNumber, String
          object_of :confirmationType, ConfirmationType, :required => true
          object_of :webOptions, WebOptionsType
        end
      end



      # Valid values are: FUNDING_SOURCE_ADDED, WEB_URL_VERIFICATION_NEEDED 
      class AddPaymentCardResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # Valid values are: FUNDING_SOURCE_ADDED, WEB_URL_VERIFICATION_NEEDED 
          object_of :execStatus, String, :required => true
          object_of :redirectURL, String
          object_of :fundingSourceKey, String
          array_of :error, ErrorData
        end
      end



      # This not considered when financialProductCategory=PRE_PAID_CARD 
      class AddPartnerFinancialProductRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :accountIdentifier, AccountIdentifierType, :required => true
          # This not considered when financialProductCategory=PRE_PAID_CARD 
          object_of :nameOnCard, NameType
          # This not considered when financialProductCategory=PRE_PAID_CARD 
          object_of :billingAddress, AddressType
          # This not considered when financialProductCategory=PRE_PAID_CARD 
          object_of :cardOwnerDateOfBirth, Date
          object_of :cardNumber, String, :required => true
          # Identify the kind of PayPal financial product. Possible value is : PRE_PAID_CARD 
          object_of :financialProductCategory, String, :required => true
          # expirationDate is mandatory when financialProductCategoy = PRE_PAID_CARD 
          object_of :expirationDate, CardDateType, :required => true
          # This not considered when financialProductCategory=PRE_PAID_CARD 
          object_of :cardVerificationNumber, String
          # This not considered when financialProductCategory=PRE_PAID_CARD 
          object_of :startDate, CardDateType
          # Up to 2 digit for Switch/Maestro cards. 
          object_of :issueNumber, String
        end
      end



      # Valid values are: CARD_ADDED 
      class AddPartnerFinancialProductResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # Valid values are: CARD_ADDED 
          object_of :execStatus, String, :required => true
          array_of :error, ErrorData
        end
      end



      # Identifying the PayPal account to which this request is targetted to. Caller of this API has to either provided an emailAddress or an accountId. 
      class SetFundingSourceConfirmedRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # Identifying the PayPal account to which this request is targetted to. Caller of this API has to either provided an emailAddress or an accountId. 
          object_of :emailAddress, String
          # Identifying the PayPal account to which this request is targetted to. Caller of this API has to either provided an emailAddress or an accountId. 
          object_of :accountId, String
          object_of :fundingSourceKey, String, :required => true
        end
      end



      class SetFundingSourceConfirmedResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :error, ErrorData
        end
      end



      # Identifies a PayPal account to which this request is targeted. Caller of this API has to provide ONLY one of these inputs: emailAddress, accountId or mobilePhoneNumber. 
      class CheckComplianceStatusRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # Identifies a PayPal account to which this request is targeted. Caller of this API has to provide ONLY one of these inputs: emailAddress, accountId or mobilePhoneNumber. 
          object_of :accountIdentifier, AccountIdentifierType, :required => true
        end
      end



      # Returned values are: ALLOW|DENY 
      class CheckComplianceStatusResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # Returned values are: ALLOW|DENY 
          object_of :execStatus, String, :required => true
          # Returned values are: CLIENT_NOT_SUPPORTED, COUNTRY_NOT_SUPPORTED, VERIFICATION_NOT_COMPLETED, DOCUMENTS_UNDER_REVIEW, DENIED 
          object_of :denialReason, String
          array_of :error, ErrorData
        end
      end



      # This operation is for internal purposes developed for a POC. 
      class ActivateProductRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # Identifies a PayPal account to which this request is targeted. Caller of this API has to provide ONLY one of these inputs: emailAddress or accountId. 
          object_of :accountIdentifier, AccountIdentifierType, :required => true
        end
      end



      # Valid values are: SUCCESS, FAILED 
      class ActivateProductResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # Valid values are: SUCCESS, FAILED 
          object_of :execStatus, String, :required => true
          array_of :productActivationErrors, ProductActivationErrors
          array_of :error, ErrorData
        end
      end



      class UpdateComplianceStatusRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          object_of :auditeeInfo, AuditeeInfoType, :required => true
          object_of :auditorList, AuditorList
          object_of :auditDetails, AuditDetailsType, :required => true
        end
      end



      class UpdateComplianceStatusResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          object_of :execStatus, String, :required => true
          array_of :error, ErrorData
        end
      end



      class NameType < DataType
        def self.load_members
          object_of :salutation, String
          object_of :firstName, String, :required => true
          object_of :middleName, String
          object_of :lastName, String, :required => true
          object_of :suffix, String
        end
      end



      class AddressType < DataType
        def self.load_members
          object_of :line1, String, :required => true
          object_of :line2, String
          object_of :city, String
          object_of :state, String
          object_of :postalCode, String
          object_of :countryCode, String, :required => true
        end
      end



      # Ask end-user to also initiate confirmation of their mobile phone. This number must be supplied by the API caller (using mobilePhoneNumber) Default=false. 
      class CreateAccountWebOptionsType < DataType
        def self.load_members
          object_of :returnUrl, String
          object_of :showAddCreditCard, Boolean
          # Ask end-user to also initiate confirmation of their mobile phone. This number must be supplied by the API caller (using mobilePhoneNumber) Default=false. 
          object_of :showMobileConfirm, Boolean
          object_of :returnUrlDescription, String
          # If provided, end user will go through a single page sign-up flow on a Mini Browser. If not provided, flow defaults to the Multi-page flow that is full size. 
          object_of :useMiniBrowser, Boolean
          # Indicates the frequency of the reminder emails sent to the PayPal user after CreateAccount. Used only when registrationType is Web. Valid values: DEFAULT: All reminder emails will be sent (same behaviour as when this paramter is not present) NONE: No reminder emails will be sent (More values to be added in future) 
          object_of :reminderEmailFrequency, String
          # Indicates if the Return URL is used to confirm email. On accessing the Return URL successfully, confirm the email if this parameter is true, otherwise, do not confirm the email. Used only when registrationType is Web. Valid values (mixed case): true: Append the Email Confirmation Code to the Return URL. false: Do not append the Email Confirmation Code to the Return URL. 
          object_of :confirmEmail, String
        end
      end



      # PayPal Business Category. i.e., baby - 1004 
      class BusinessInfoType < DataType
        def self.load_members
          object_of :businessName, String, :required => true
          object_of :businessAddress, AddressType, :required => true
          object_of :workPhone, String, :required => true
          # PayPal Business Category. i.e., baby - 1004 
          object_of :category, Integer
          # Paypal Business subcategory. i.e., baby-clothing - 2027 
          object_of :subCategory, Integer
          # If Category and Subcategory is specified, then this is optional. PayPal uses the industry standard Merchant Category Codes. Please refer to your Association Merchant Category Code documentation for a list of codes 
          object_of :merchantCategoryCode, Integer
          object_of :doingBusinessAs, String
          object_of :customerServicePhone, String
          object_of :customerServiceEmail, String
          object_of :disputeEmail, String
          object_of :webSite, String
          # Company Id: tax id, acn, abn, etc. 
          object_of :companyId, String
          object_of :dateOfEstablishment, Date
          object_of :businessType, BusinessType
          object_of :businessSubtype, BusinessSubtypeType
          object_of :incorporationId, String
          # Average transaction value. 
          object_of :averagePrice, Float
          # Average monthly transaction value. 
          object_of :averageMonthlyVolume, Float
          # Percentage of the revenue that is from online sales (0%-100%). 
          object_of :percentageRevenueFromOnline, Integer
          array_of :salesVenue, SalesVenueType
          # Description of store front or place for sales. Only required when "OTHER" is specified for salesVenue. 
          object_of :salesVenueDesc, String
          # Value Added Tax (VAT) ID number 
          object_of :vatId, String
          # Country code for country on the vat id. 
          object_of :vatCountryCode, String
          # Official commercial registration location. 
          object_of :commercialRegistrationLocation, String
          object_of :principalPlaceOfBusinessAddress, AddressType
          object_of :registeredOfficeAddress, AddressType
          object_of :establishmentCountryCode, String
          object_of :establishmentState, String
          # All the stakeholders of the company. 
          array_of :businessStakeholder, BusinessStakeholderType
          # Business entity acting on behalf of Third Party. 
          object_of :businessEntityForThirdParty, BusinessEntityForThirdPartyType
          # Values: Yes or No 
          object_of :hasDirectors, YesNoType
          # Values: Yes or No 
          object_of :hasBeneficialOwners, YesNoType
          # Values: Yes or No 
          object_of :hasThirdPartyAssociates, YesNoType
        end
      end



      # Info about Stakeholders such as partner, beneficial, owner, director etc. 
      class BusinessStakeholderType < DataType
        def self.load_members
          object_of :role, StakeholderRoleType, :required => true
          object_of :name, NameType
          object_of :fullLegalName, String
          object_of :address, AddressType
          object_of :dateOfBirth, Date
          # Occupation of the business stakeholder. Values such as: Accountant, Actuary, Advocate, Architect, Business Owner, Doctor, Dentist, Engineer, Financial Analyst, Lawyer, Librarian, Nurse, Pilot, Pharmacist, Physician, Physicial Therapist, Professor, Psychologist, Scientist, Teacher, Webmaster, Writer, Student, Other 
          object_of :occupation, String
        end
      end



      # Info about PayPal user such as emailAddress, accountId, firstName, lastName etc. 
      class UserInfoType < DataType
        def self.load_members
          # Returns emailAddress belonging to PayPal account. 
          object_of :emailAddress, String
          # Valid values are: Personal, Premier, and Business (not case-sensitive). 
          object_of :accountType, String
          # Identifies a PayPal account. Only premier and business accounts have an accountId 
          object_of :accountId, String
          # Identifies a PayPal user, like firstName, lastName. 
          object_of :name, NameType
          # Business Name of the PayPal account holder. 
          object_of :businessName, String
        end
      end



      class WebOptionsType < DataType
        def self.load_members
          object_of :returnUrl, String
          object_of :cancelUrl, String
          object_of :returnUrlDescription, String
          object_of :cancelUrlDescription, String
        end
      end



      # Month in integer format, between 1 and 12 
      class CardDateType < DataType
        def self.load_members
          # Month in integer format, between 1 and 12 
          object_of :month, Integer, :required => true
          # Year in four digit format- YYYY 
          object_of :year, Integer, :required => true
        end
      end



      # Third party type: Individual or Business. 
      class BusinessEntityForThirdPartyType < DataType
        def self.load_members
          # Third party type: Individual or Business. 
          object_of :thirdPartyType, String
          # If third party is individual, name of the individual. 
          object_of :name, NameType
          # If third party is individual, date of birth of the individual. 
          object_of :dateOfBirth, Date
          # Address of third party collecting the data. 
          object_of :address, AddressType
          # If third party is individual, profession of the individual representing third party. 
          object_of :profession, String
          # Relationship with third party, of the individual or the business. 
          object_of :relationshipWithThirdParty, String
          # Nature of Business, if third party is a business. 
          object_of :natureOfBusiness, String
          # Name of Business, if third party is a business. 
          object_of :nameOfBusiness, String
          # If third party is a business, collect the businessType. Values: Corporation, Private Company, Public Company, Partnership, Government Entity, Non-Profit Organization 
          object_of :businessType, String
          # If third party is a business, collect Incorporation ID. 
          object_of :incorporationId, String
          # If third party is business, collect place of issue of Incorporation. 
          object_of :incorporationCountry, String
          # If third party is business, collect place of issue of Incorporation. 
          object_of :incorporationState, String
        end
      end



      class GovernmentIDPair < DataType
        def self.load_members
          object_of :value, String
          object_of :type, GovernmentIDTypes
        end
      end



      class LegalAgreementType < DataType
        def self.load_members
          object_of :accepted, String
          object_of :type, LegalAgreementTypes
        end
      end



      class Auditor < DataType
        def self.load_members
          object_of :id, String, :required => true
          object_of :name, String, :required => true
          object_of :action, String, :required => true
          object_of :notes, String
        end
      end



      class TupleType < DataType
        def self.load_members
          object_of :name, String, :required => true
          object_of :value, String, :required => true
        end
      end



      class DocumentType < DataType
        def self.load_members
          object_of :type, String, :required => true
          array_of :filename, String, :required => true
        end
      end



      class AuditorList < DataType
        def self.load_members
          array_of :auditor, Auditor, :required => true
        end
      end



      class AuditeeInfoType < DataType
        def self.load_members
          object_of :accountIdentifier, AccountIdentifierType, :required => true
          array_of :document, DocumentType
          array_of :data, TupleType
        end
      end



      class AuditDetailsType < DataType
        def self.load_members
          object_of :status, String, :required => true
          object_of :level, String, :required => true
          object_of :method, String, :required => true
          object_of :reason, String, :required => true
          array_of :data, TupleType
          object_of :policyVersion, String
        end
      end





      constants.each do |data_type_klass|
        data_type_klass = const_get(data_type_klass)
        data_type_klass.load_members if defined? data_type_klass.load_members
      end

    end
  end
end
