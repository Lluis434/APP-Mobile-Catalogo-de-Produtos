from app.models.produto import Produto
from flask import url_for

def listar_produtos(tipo=None):
    query = Produto.query
    if tipo:
        query = query.filter_by(tipo=tipo)
    produtos = query.all()

    lista = []
    for produto in produtos:
        url_imagem = url_for('static', filename=produto.imagem, _external=True) if produto.imagem else None
        lista.append({
            'id': produto.id,
            'nome': produto.nome,
            'preco': produto.preco,
            'tipo': produto.tipo,
            'imagem': url_imagem,
        })
    return lista

def obter_produto_por_id(produto_id):
    produto = Produto.query.get(produto_id)
    if not produto:
        return None

    url_imagem = url_for('static', filename=produto.imagem, _external=True) if produto.imagem else None
    return {
        'id': produto.id,
        'nome': produto.nome,
        'descricao': produto.descricao,
        'preco': produto.preco,
        'imagem': url_imagem,
    }
