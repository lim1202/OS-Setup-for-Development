"""
App server for get tableau ticket.

------------------------------------------------------------

Usage:

    nohup python app.py >logs &
"""

import logging

from flask import Flask, jsonify, request, abort, make_response

############################################################
#  Web app
############################################################

app = Flask(__name__)

@app.route("/", methods=["GET"])
def index():
    """Index"""
    resp = "hello world"
    return jsonify({'message': resp})

@app.errorhandler(400)
def bad_request(error):
    """Bad request"""
    return make_response(jsonify({'message': error.description}), 400)

@app.errorhandler(401)
def unauthorized(error):
    """Unauthorized"""
    return make_response(jsonify({'message': error.description}), 401)

############################################################
#  App server
############################################################

if __name__ == "__main__":
    app.run(debug=True)
else:
    GUNICORN_LOGGER = logging.getLogger("gunicorn.error")
    app.logger.handlers = GUNICORN_LOGGER.handlers
    app.logger.setLevel(GUNICORN_LOGGER.level)
