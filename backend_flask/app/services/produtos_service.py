from app.models.produto import Produto

def listar_produtos():
    produtos = Produto.query.all()
    return [
        {
            'id': produto.id,
            'nome': produto.nome,
            'preco': produto.preco
        }
        for produto in produtos
    ]

def obter_produto_por_id(produto_id):
    produto = Produto.query.get(produto_id)
    if not produto:
        return None
    return {
        'id': produto.id,
        'nome': produto.nome,
        'descricao': produto.descricao,
        'preco': produto.preco
    }
