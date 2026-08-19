"""Environment variables for Robot Framework test suites."""

from robot.utils import DotDict

CONFIG = DotDict({
    "url": "https://automationexercise.com/",
    "browser": "chrome",
    "timeout": "20s",
    "implicit_wait": "5s",
})

SUPPORTED_BROWSERS = ["chrome", "edge"]

DEFAULT_PASSWORD = "123456"
