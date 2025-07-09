from flask import Blueprint, jsonify, abort
from app.services.produtos_service import listar_produtos, obter_produto_por_id

produtos_bp = Blueprint('produtos', __name__)

@produtos_bp.route('/', methods=['GET'])
def listar():
    produtos = listar_produtos()
    return jsonify(produtos)

@produtos_bp.route('/<int:id>', methods=['GET'])
def detalhe(id):
    produto = obter_produto_por_id(id)
    if not produto:
        abort(404)
    return jsonify(produto)
