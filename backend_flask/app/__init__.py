from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate  
from app.config import Config
from flask_cors import CORS

db = SQLAlchemy()
migrate = Migrate()  

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    CORS(app)

    db.init_app(app)
    migrate.init_app(app, db) 

    from app.routes.auth import auth_bp
    app.register_blueprint(auth_bp, url_prefix="/auth")

    from app.routes.produtos import produtos_bp
    app.register_blueprint(produtos_bp, url_prefix="/produtos")

    from app.routes.teste import teste_bp
    app.register_blueprint(teste_bp, url_prefix="/teste")


    return app
