from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://ondul:o@localhost/music_app'
db = SQLAlchemy(app)

CORS(app)

class Genre(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    genre_name = db.Column(db.String(255), nullable=False)

    def as_dict(self):
        return {'id': self.id, 'genre_name': self.genre_name}

class Instrument(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    string_instruments = db.Column(db.Text)
    percussion_instruments = db.Column(db.Text)
    keyboard_instruments = db.Column(db.Text)
    brass_wind_instruments = db.Column(db.Text)

    def as_dict(self):
        return {
            'id': self.id,
            'string_instruments': self.string_instruments,
            'percussion_instruments': self.percussion_instruments,
            'keyboard_instruments': self.keyboard_instruments,
            'brass_wind_instruments': self.brass_wind_instruments
        }

class Tutor(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    full_names = db.Column(db.String(255), nullable=False)
    expertise = db.Column(db.String(255))
    availability = db.Column(db.String(255))
    rates = db.Column(db.Numeric(10, 2))
    qualifications = db.Column(db.Text)
    experience = db.Column(db.Integer)
    reviews = db.Column(db.Text)
    lessons = db.Column(db.Text)
    instruments = db.Column(db.Text)
    email = db.Column(db.String(255), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    location = db.Column(db.String(255))
    number = db.Column(db.String(20))

    def as_dict(self):
        return {
            'id': self.id,
            'full_names': self.full_names,
            'expertise': self.expertise,
            'availability': self.availability,
            'rates': self.rates,
            'qualifications': self.qualifications,
            'experience': self.experience,
            'reviews': self.reviews,
            'lessons': self.lessons,
            'instruments': self.instruments,
            'email': self.email,
            'password': self.password,
            'location': self.location,
            'number': self.number
        }

class Client(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    tutor_id = db.Column(db.Integer)
    full_names = db.Column(db.String(255), nullable=False)
    instruments = db.Column(db.Text)
    email = db.Column(db.String(255), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    location = db.Column(db.String(255))
    number = db.Column(db.String(20))

    def as_dict(self):
        return {
            'id': self.id,
            'tutor_id': self.tutor_id,
            'full_names': self.full_names,
            'instruments': self.instruments,
            'email': self.email,
            'password': self.password,
            'location': self.location,
            'number': self.number
        }
    


#Routes for Genres
@app.route('/genres', methods=['GET'])
def get_genres():
    genres = Genre.query.all()
    return jsonify([genre.as_dict() for genre in genres])

@app.route('/genres/<int:id>', methods=['GET'])
def get_genre(id):
    genre = Genre.query.get_or_404(id)
    return jsonify(genre.as_dict())

@app.route('/genres', methods=['POST'])
def create_genre():
    data = request.get_json()
    new_genre = Genre(genre_name=data['genre_name'])
    db.session.add(new_genre)
    db.session.commit()
    return jsonify(new_genre.as_dict()), 201

@app.route('/genres/<int:id>', methods=['PUT'])
def update_genre(id):
    data = request.get_json()
    genre = Genre.query.get_or_404(id)
    genre.genre_name = data['genre_name']
    db.session.commit()
    return jsonify(genre.as_dict())

@app.route('/genres/<int:id>', methods=['DELETE'])
def delete_genre(id):
    genre = Genre.query.get_or_404(id)
    db.session.delete(genre)
    db.session.commit()
    return '', 204



#Routes for Instruments
@app.route('/instruments', methods=['GET'])
def get_instruments():
    instruments = Instrument.query.all()
    return jsonify([instrument.as_dict() for instrument in instruments])

@app.route('/instruments/<int:id>', methods=['GET'])
def get_instrument(id):
    instrument = Instrument.query.get_or_404(id)
    return jsonify(instrument.as_dict())

@app.route('/instruments', methods=['POST'])
def create_instrument():
    data = request.get_json()
    new_instrument = Instrument(
        string_instruments=data.get('string_instruments'),
        percussion_instruments=data.get('percussion_instruments'),
        keyboard_instruments=data.get('keyboard_instruments'),
        brass_wind_instruments=data.get('brass_wind_instruments')
    )
    db.session.add(new_instrument)
    db.session.commit()
    return jsonify(new_instrument.as_dict()), 201

@app.route('/instruments/<int:id>', methods=['PUT'])
def update_instrument(id):
    data = request.get_json()
    instrument = Instrument.query.get_or_404(id)
    instrument.string_instruments = data.get('string_instruments')
    instrument.percussion_instruments = data.get('percussion_instruments')
    instrument.keyboard_instruments = data.get('keyboard_instruments')
    instrument.brass_wind_instruments = data.get('brass_wind_instruments')
    db.session.commit()
    return jsonify(instrument.as_dict())

@app.route('/instruments/<int:id>', methods=['DELETE'])
def delete_instrument(id):
    instrument = Instrument.query.get_or_404(id)
    db.session.delete(instrument)
    db.session.commit()
    return '', 204



#Routes for Tutors
@app.route('/tutors', methods=['GET'])
def get_tutors():
    tutors = Tutor.query.all()
    return jsonify([tutor.as_dict() for tutor in tutors])

@app.route('/tutors/<int:id>', methods=['GET'])
def get_tutor(id):
    tutor = Tutor.query.get_or_404(id)
    return jsonify(tutor.as_dict())

@app.route('/tutors', methods=['POST'])
def create_tutor():
    data = request.get_json()
    new_tutor = Tutor(
        full_names=data['full_names'],
        expertise=data.get('expertise'),
        availability=data.get('availability'),
        rates=data.get('rates'),
        qualifications=data.get('qualifications'),
        experience=data.get('experience'),
        reviews=data.get('reviews'),
        lessons=data.get('lessons'),
        instruments=data.get('instruments'),
        email=data['email'],
        password=data['password'],
        location=data.get('location'),
        number=data.get('number')
    )
    db.session.add(new_tutor)
    db.session.commit()
    return jsonify(new_tutor.as_dict()), 201

@app.route('/tutors/<int:id>', methods=['PUT'])
def update_tutor(id):
    data = request.get_json()
    tutor = Tutor.query.get_or_404(id)
    tutor.full_names = data['full_names']
    tutor.expertise = data.get('expertise')
    tutor.availability = data.get('availability')
    tutor.rates = data.get('rates')
    tutor.qualifications = data.get('qualifications')
    tutor.experience = data.get('experience')
    tutor.reviews = data.get('reviews')
    tutor.lessons = data.get('lessons')
    tutor.instruments = data.get('instruments')
    tutor.email = data['email']
    tutor.password = data['password']
    tutor.location = data.get('location')
    tutor.number = data.get('number')
    db.session.commit()
    return jsonify(tutor.as_dict())

@app.route('/tutors/<int:id>', methods=['DELETE'])
def delete_tutor(id):
    tutor = Tutor.query.get_or_404(id)
    db.session.delete(tutor)
    db.session.commit()
    return '', 204


#Routes for Clients
@app.route('/clients', methods=['GET'])
def get_clients():
    clients = Client.query.all()
    return jsonify([client.as_dict() for client in clients])

@app.route('/clients/<int:id>', methods=['GET'])
def get_client(id):
    client = Client.query.get_or_404(id)
    return jsonify(client.as_dict())

@app.route('/clients', methods=['POST'])
def create_client():
    data = request.get_json()
    new_client = Client(
        tutor_id=data['tutor_id'],
        full_names=data['full_names'],
        instruments=data.get('instruments'),
        email=data['email'],
        password=data['password'],
        location=data.get('location'),
        number=data.get('number')
    )
    db.session.add(new_client)
    db.session.commit()
    return jsonify(new_client.as_dict()), 201

@app.route('/clients/<int:id>', methods=['PUT'])
def update_client(id):
    data = request.get_json()
    client = Client.query.get_or_404(id)
    client.tutor_id = data['tutor_id']




if __name__ == '__main__':
    app.run(debug=True)
