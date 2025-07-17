from app import create_app, db
from app.models.produto import Produto

app = create_app()

with app.app_context():
    produtos_para_inserir = [
        Produto(
            nome="Moletom",
            descricao="Moletom confortável",
            preco=120.00,
            estoque=10,
            tipo="Moletom",
            imagem="imagens/Moletom1.png"
        ),
        Produto(
            nome="Blusa",
            descricao="Blusa",
            preco=85.50,
            estoque=15,
            tipo="Blusa",
            imagem="imagens/blusa.png"
        ),
        Produto(
            nome="Blusa",
            descricao="Blusa branca",
            preco=75.00,
            estoque=20,
            tipo="Blusa",
            imagem="imagens/blusa2.png"
        ),
        Produto(
            nome="Calça",
            descricao="Calça preta",
            preco=150.00,
            estoque=20,
            tipo="Calça",
            imagem="imagens/calca.png"
        ),
        Produto(
            nome="Calça Jeans",
            descricao="Calça Jeans",
            preco=70.00,
            estoque=30,
            tipo="Calça",
            imagem="imagens/calca_jeans.png"
        ),
        Produto(
            nome="Vestido",
            descricao="Vestido",
            preco=100.00,
            estoque=30,
            tipo="Vestido",
            imagem="imagens/vestido.png"
        ),
        Produto(
            nome="Vestido",
            descricao="Vestido Preto",
            preco=100.00,
            estoque=30,
            tipo="Vestido",
            imagem="imagens/vestido2.png"
        ),
  
    ]

    for produto in produtos_para_inserir:
        existente = Produto.query.filter_by(nome=produto.nome).first()
        if not existente:
            db.session.add(produto)

    db.session.commit()
    print(f"{len(produtos_para_inserir)} produtos inseridos com sucesso!")
