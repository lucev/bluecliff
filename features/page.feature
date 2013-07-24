Feature: view pages

  Scenario: view pages
    Given I am viewing "/"
    Then I should see "All posts"

  Scenario: page doesnt exist
    Given I am viewing "/some-url"
    Then I should see "Page doesn't exist"

  Scenario: about page
    Given I request "/about"
    Then I should see "About"    

  Scenario: returning 404 status
    Given I request "/some-url"
    Then I should get response with status "404"

  Scenario: home page has a title
    Given I am viewing "/"
    Then page should have a title "BlueCliff"

  Scenario: show post page has a title
    Given I am viewing "/my-post"
    Then I should be on a page with title "My Post | BlueCliff"