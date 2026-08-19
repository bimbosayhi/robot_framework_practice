# Automation Exercise - Robot Framework

Automated test suites for [Automation Exercise](https://automationexercise.com/) using Robot Framework and SeleniumLibrary.

## Project Structure

```
├── tests/                      # Test suites
│   ├── 01_register_user.robot      # User registration tests
│   └── 02_login_template.robot     # Login failure scenarios (template)
│
├── resources/                  # Shared resources
│   ├── common.resource             # Browser setup, screenshot utilities
│   ├── auth.resource               # Authentication keywords
│   ├── locators.resource           # Page element locators
│   └── variables.py                # Environment config (URL, browser, timeouts)
│
├── .gitignore
├── README.md
└── requirements.txt
```

## Prerequisites

- Python 3.8+
- Chrome browser + ChromeDriver

## Setup

```bash
pip install -r requirements.txt
```

## Run Tests

```bash
# Run all tests
robot --outputdir results tests/

# Run a specific suite
robot --outputdir results tests/01_register_user.robot
```
