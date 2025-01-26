#!/bin/bash
clear screen

pip freeze > requirements.txt
sed -i '' 's/==.*//' requirements.txt
pip install --upgrade -r requirements.txt
