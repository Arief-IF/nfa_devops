import os
from flask import Flask

app = Flask(__name__)

app_name = os.environ.get('APP_NAME', 'My Web App')
app_port = int(os.environ.get('APP_PORT', 5000))

@app.route("/")
def hello():
    return f"Hello from {app_name}! Running on port {app_port}"

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=app_port)
