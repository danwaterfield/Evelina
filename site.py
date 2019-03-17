from flask import Flask, render_template
import time
app = Flask(__name__)

@app.route("/")
def main():
    return render_template('index.html', last_updated=str(int(round(time.time() * 1000))))

if __name__ == "__main__":
	app.run(debug=True)