Feature:  enter new post

  Scenario: new post
    Given I am viewing "/posts/new"
    Then I should see "New post"