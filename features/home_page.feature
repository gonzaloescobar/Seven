Feature: Home page

  Scenario: Browse default page
    When I browse the default page
    Then I should see "Seven"
    And I should see "Breakpoint"
