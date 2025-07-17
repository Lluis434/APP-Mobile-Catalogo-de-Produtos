from app.models.produto import Produto
from flask import url_for
from sqlalchemy import distinct

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

def listar_categorias():
    tipos = Produto.query.with_entities(distinct(Produto.tipo)).all()
    # tipos vem como lista de tuplas: [('moletom',), ('blusas',), ...]
    categorias = [tipo[0] for tipo in tipos if tipo[0]]  # Remove nulos se houver
    categorias.insert(0, 'todos')  # Opcional: adiciona 'todos' no início
    return categorias
