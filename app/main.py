"""Password Manager main."""
from flask import Flask
from flask import render_template

app = Flask(__name__)


def render_theme(body):
    """Return the theme rendered with jinja2."""
    return render_template(
        "theme.html",
        body=body,
    )


@app.route('/')
def main():
    body  = render_template(
        "index.html"
    )
    return render_theme(body)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
