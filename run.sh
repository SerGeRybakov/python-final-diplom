#!/bin/sh
echo SLEEP FOR 30 SECS - WAIT FOR POSTGRES
sleep 30
export FLASK_APP=web_shop/app.py && export FLASK_DEBUG=1
flask db upgrade
python3 load_db_inits.py
gunicorn --bind 0.0.0.0:5000 web_shop.app:app
