__author__ = 'lavaraja'
import flask
from flask import Flask,session, request, flash, url_for, redirect, render_template, abort ,g
from flask_security import login_required
from flask_login  import LoginManager
import mysql.connector
import hashlib, uuid
from functools import wraps
from flask import g, request, redirect, url_for
from passlib.handlers.sha2_crypt import sha256_crypt
import datetime
import time


app = Flask(__name__)
app.secret_key="secretkey"

app.secret_key = 'xxxxyyyyyzzzzz'

@app.route('/fetch',methods=['GET','POST'])
def fetch3():
    if request.method=="POST":
        return render_template('test.html')   # return a string

    dest=request.form['query']
    print dest
    return render_template('test2.html')   # return a string

@app.route('/',methods=['GET'])
def home():
    error='h'

    return render_template('test.html')   # return a string


# start the server with the 'run()' method
if __name__ == '__main__':
    app.run()
