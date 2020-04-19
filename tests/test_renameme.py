"""Dummy test. Rename this file."""

from templ_app import app


def test_app(capsys, show_it_works):  # pylint: disable=unused-argument
    """Verifies that running the app outputs correct starting message."""
    app.run()
    stdout, _ = capsys.readouterr()

    assert "The app is successfully launched!" in stdout
