from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate  
from app.config import Config

db = SQLAlchemy()
migrate = Migrate()  

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    db.init_app(app)
    migrate.init_app(app, db) 

    from app.routes.auth import auth_bp
    app.register_blueprint(auth_bp, url_prefix="/auth")

    from app.routes.produtos import produtos_bp
    app.register_blueprint(produtos_bp, url_prefix="/produtos")

    return app
