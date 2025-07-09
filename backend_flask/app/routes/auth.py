from flask import Blueprint, request, jsonify
from app.services.auth_service import register_user, login_user

auth_bp = Blueprint('auth', __name__)

@auth_bp.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    response, status = register_user(
        data.get('nome'),
        data.get('email'),
        data.get('senha'),
        data.get('confirma_senha')
    )
    return jsonify(response), status

@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    response, status = login_user(
        data.get('email'),
        data.get('senha')
    )
    return jsonify(response), status
