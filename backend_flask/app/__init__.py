from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate  
from flask_cors import CORS
from flask_admin import Admin
from flask_admin.contrib.sqla import ModelView
from app.config import Config

db = SQLAlchemy()
migrate = Migrate()

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    CORS(app, supports_credentials=True)

    db.init_app(app)
    migrate.init_app(app, db)

    from app.models.usuario import Usuario  # Importa aqui dentro para evitar circular
    from app.routes.auth import auth_bp
    app.register_blueprint(auth_bp, url_prefix="/auth")

    from app.routes.produtos import produtos_bp
    app.register_blueprint(produtos_bp, url_prefix="/produtos")

    class AdminModelView(ModelView):
        def is_accessible(self):
            from flask import session, abort
            user_id = session.get('user_id')
            if not user_id:
                return True
            user = Usuario.query.get(user_id)
            return user and user.is_admin

        def inaccessible_callback(self, name, **kwargs):
            from flask import abort
            abort(403)

    admin = Admin(app, name='Painel Admin', template_mode='bootstrap4')
    admin.add_view(AdminModelView(Usuario, db.session))

    return app
