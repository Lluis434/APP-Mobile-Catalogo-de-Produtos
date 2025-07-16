from flask import Blueprint, request, jsonify
from app.models.usuario import Usuario
from app import db

admin_bp = Blueprint('admin', __name__, url_prefix='/admin')

# Rota para deletar usuário por ID
@admin_bp.route('/delete_user/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    user = Usuario.query.get(user_id)

    if not user:
        return jsonify({"error": "Usuário não encontrado."}), 404

    db.session.delete(user)
    db.session.commit()

    return jsonify({"message": f"Usuário com ID {user_id} deletado com sucesso."}), 200

# (Opcional) Rota para listar todos os usuários
@admin_bp.route('/usuarios', methods=['GET'])
def listar_usuarios():
    usuarios = Usuario.query.all()
    return jsonify([
        {
            "id": user.id,
            "nome": user.nome,
            "email": user.email
        } for user in usuarios
    ])
