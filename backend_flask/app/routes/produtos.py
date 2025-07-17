from flask import Blueprint, jsonify, abort, request
from app.services.produtos_service import listar_produtos, obter_produto_por_id, listar_categorias

produtos_bp = Blueprint('produtos', __name__)

@produtos_bp.route('/', methods=['GET'])
def listar():
    tipo = request.args.get('tipo')
    produtos = listar_produtos(tipo)
    return jsonify(produtos)

@produtos_bp.route('/<int:id>', methods=['GET'])
def detalhe(id):
    produto = obter_produto_por_id(id)
    if not produto:
        abort(404)
    return jsonify(produto)

@produtos_bp.route('/categorias', methods=['GET'])
def categorias():
    categorias = listar_categorias()
    return jsonify(categorias)
