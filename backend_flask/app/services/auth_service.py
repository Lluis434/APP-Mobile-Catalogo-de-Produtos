from werkzeug.security import generate_password_hash, check_password_hash
from app.models.usuario import Usuario
from app import db

def register_user(nome, email, senha, confirma_senha):
    if not all([nome, email, senha, confirma_senha]):
        return {"error": "Todos os campos são obrigatórios."}, 400

    if senha != confirma_senha:
        return {"error": "Senha e confirmação não coincidem."}, 400

    existing_user = Usuario.query.filter_by(email=email).first()
    if existing_user:
        return {"error": "Email já cadastrado."}, 409

    hashed_password = generate_password_hash(senha, method='pbkdf2:sha256')

    new_user = Usuario(nome=nome, email=email, senha_hash=hashed_password)
    db.session.add(new_user)
    db.session.commit()

    return {"message": "Usuário criado com sucesso."}, 201

def login_user(email, senha):
    if not email or not senha:
        return {"error": "Email e senha são obrigatórios."}, 400

    user = Usuario.query.filter_by(email=email).first()
    if not user:
        return {"error": "Email ou senha incorretos."}, 401

    if not check_password_hash(user.senha_hash, senha):
        return {"error": "Email ou senha incorretos."}, 401

    return {"message": "Login realizado com sucesso."}, 200
