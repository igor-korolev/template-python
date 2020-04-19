"""Configuration and fixtures for tests."""

import logging

import pytest


@pytest.fixture(scope="function")
def show_it_works():
    """Dummy fixture that outputs to console and shows that it works."""
    logger = logging.getLogger(__name__)
    logger.info("Setup of the fixture")
    yield
    logger.info("Tear down of the fixture")
