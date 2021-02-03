#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Flask Setup
import os
import gspread
from flask import Flask, jsonify, request, abort
from flask_cors import CORS, cross_origin
from oauth2client.service_account import ServiceAccountCredentials

app = Flask(__name__)
CORS(app)
app.config['CORS_HEADERS'] = 'application/json'


# Google Sheets API Setup

credential = ServiceAccountCredentials.from_json_keyfile_name("credentials.json",
                                                              ["https://spreadsheets.google.com/feeds",                                                               "https://www.googleapis.com/auth/spreadsheets",                                                        "https://www.googleapis.com/auth/drive.file",                                                        "https://www.googleapis.com/auth/drive"])
client = gspread.authorize(credential)
gsheet = client.open("Python Sheet").sheet1

# An example GET Route to get all reviews
@app.route('/all_reviews', methods=["GET"])
def all_reviews():
    return jsonify(gsheet.get_all_records())

# An example POST Route to add a review
@app.route('/add_review', methods=["POST"])
def add_review():
    req = request.get_json()
    print(req)
    row = [req["email"], req["date"], req["score"]]
    gsheet.insert_row(row, 2)  # since the first row is our title header
    return jsonify(gsheet.get_all_records()).headers.add("Access-Control-Allow-Origin", "*")

@app.route('/del_review/<email>', methods=["DELETE"])
def del_review(email):
    cells = gsheet.findall(str(email))
    for c in cells:
        gsheet.delete_row(c.row)
    return jsonify(gsheet.get_all_records())

@app.route('/add_row', methods=["POST"])
@cross_origin()
def add_row():
    postreq = request.get_json()

    for req in postreq:

        row = [
            req["transaction_id"],
            req["item_id"],
            req["item_name"],
            req["name"],
            req["number"],
            req["size"],
            req["date"]
            ]
        gsheet.insert_row(row, 2)  # since the first row is our title header

    return jsonify(gsheet.get_all_records())

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True, port=os.environ.get('PORT', 8080))
