Feature: view pages

  Scenario: view pages
    Given I am viewing "/"
    Then I should see "Hello World!"

  Scenario: page doesnt exist
    Given I am viewing "/some-url"
    Then I should see "404 page doesn't exist"

  Scenario: returning 404 status
    Given I request "/some-url"
    Then I should get response with status "404"