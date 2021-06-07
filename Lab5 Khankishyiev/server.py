from flask import Flask, render_template, request
import json
from pymongo import MongoClient

app = Flask(__name__)

# Making Connection
client = MongoClient("mongodb://localhost:27017/")


@app.route("/", methods=['post', 'get'])
def table_display():
    data = {}
    for collection in ("clients", "mechanics", "profession", "progress"):
        d = client["lab_mo"][collection].find({})
        data[collection] = d

    return render_template("main.html", data=data)


def init():
    for table in ("clients", "mechanics", "profession", "progress"):
        with open(f"./json/{table}.json", "r") as file:
            file_data = json.load(file)

        collection = client["lab_mo"][table]
        if isinstance(file_data, list):
            collection.insert_many(file_data)
        else:
            collection.insert_one(file_data)

    print("database initialised")


init()

app.run()
