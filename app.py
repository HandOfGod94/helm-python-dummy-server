#!/usr/bin/env python

import flask
from flask_wtf import FlaskForm
from wtforms import IntegerField
from flask import render_template, request
from flask_wtf.csrf import CSRFProtect

app = flask.Flask(__name__)
csrf = CSRFProtect(app)
app.config['SECRET_KEY'] = 'SECRET_KEY'


class CalculatorForm(FlaskForm):
    value1 = IntegerField('value1')
    value2 = IntegerField('value2')


@app.route('/')
def index():
    return "Hello World"


@app.route('/calculate', methods=['GET', 'POST'])
def calculate():
    form = CalculatorForm()
    app.logger.info("Request Headers %s", request.headers)
    if form.validate_on_submit():
        value1 = request.form['value1']
        value2 = request.form['value2']
        result = int(value1) + int(value2)
        return render_template('calculator.jinja2', form=form, result=result)
    return render_template('calculator.jinja2', form=form)


if __name__ == "__main__":
    app.debug = True
    app.run(host='0.0.0.0', port=7001)
