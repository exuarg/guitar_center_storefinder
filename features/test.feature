Feature: web automation

Scenario Outline: user can go guitarcenter.com, and find stores by distance starting with closest depending on zip code.

Given user goes to guitarcenter website
When user goes to the store finder, inputs "<zipcode>"
Then they get results of stores by distance starting with the closest

Examples:
| zipcode |
| 10001   |
| 90401   |
| 33014   |