from flask import Flask, jsonify
from flask_mysqldb import MySQL

app = Flask(__name__)

# Configure MySQL connection
app.config['MYSQL_HOST'] = 'mysql-db'         # MySQL service name in Docker Compose
app.config['MYSQL_USER'] = 'user'             # MySQL username
app.config['MYSQL_PASSWORD'] = 'password'     # MySQL password
app.config['MYSQL_DB'] = 'flaskdb'            # MySQL database name

mysql = MySQL(app)

# Home route
@app.route('/')
def home():
    return "Welcome to the Flask MySQL App!"

# Users route to fetch user data
@app.route('/users')
def users():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    return jsonify(users)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)  # Run app on port 5000, accessible externally

