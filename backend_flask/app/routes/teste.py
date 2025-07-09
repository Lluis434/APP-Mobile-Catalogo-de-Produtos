from flask import Blueprint, jsonify

teste_bp = Blueprint('teste', __name__)

@teste_bp.route('/ping', methods=['GET'])
def ping():
    return jsonify({"mensagem": "Olá do Flask!"})
