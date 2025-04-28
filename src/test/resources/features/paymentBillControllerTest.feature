Feature: PaymentBillController API Test

  Background:
    * url 'http://localhost:8080'
    * def basePath = '/api/bills'
    * def userId = 1
    * def billPayload =
      """
      {
        "amount": 500.00,
        "description": "Electricity Bill",
        "status": "UNPAID"
      }
      """

  Scenario: Get all bills
    Given path basePath
    When method get
    Then status 200
    And match response == '#[]'

  Scenario: Get bills by user ID
    Given path basePath + '/user/' + userId
    When method get
    Then status 200
    And match response == '#[]'

#  Scenario: Create a new bill for a user
#    Given path basePath + '/user/' + userId
#    And request billPayload
#    When method post
#    Then status 201
#    And match response.amount == 500.00
#    And match response.description == 'Electricity Bill'
#    And match response.status == 'UNPAID'
#    * def createdBillId = response.id
#
#  Scenario: Pay a bill
#    * def newBill =
#      """
#      {
#        "amount": 300.00,
#        "description": "Water Bill",
#        "status": "UNPAID"
#      }
#      """
#    # Create bill
#    Given path basePath + '/user/' + userId
#    And request newBill
#    When method post
#    Then status 201
#    * def billId = response.id
#
#    # Pay it
#    Given path basePath + '/pay/' + billId
#    When method put
#    Then status 200
#    And match response.status == 'PAID'
