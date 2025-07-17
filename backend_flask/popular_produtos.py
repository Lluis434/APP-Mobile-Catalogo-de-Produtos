from app import create_app, db
from app.models.produto import Produto

app = create_app()

with app.app_context():
    # 🧨 Apaga todos os produtos antigos
    db.session.query(Produto).delete()
    db.session.commit()
    print("Produtos antigos removidos.")

    # ✅ Lista atualizada de produtos
    produtos_para_inserir = [
        Produto(
            nome="TWS FONE SEM FIO",
            descricao="Fone de ouvido Bluetooth preto, Som Estéreo, bateria duradoura",
            preco=34.90,
            estoque=10,
            tipo="Eletrônicos",
            imagem="imagens/fone.jpeg"
        ),
        Produto(
            nome="CAIXA DE SOM JBL",
            descricao="Boomsbox 3 180W IP67 grande 35 cm",
            preco=85.50,
            estoque=15,
            tipo="Eletrônicos",
            imagem="imagens/jbl.jpeg"
        ),
        Produto(
            nome="KIT CABO + FONTE DE CARREGADOR USB-C",
            descricao="Fonte Adaptador Plug Usb 2a Bivolt",
            preco=89.90,
            estoque=20,
            tipo="Eletrônicos",
            imagem="imagens/Carregador.jpeg"
        ),
        Produto(
            nome="KIT 11 PINCÉIS DE MAQUIAGEM",
            descricao="11 pincéis de maquiagem",
            preco=50.00,
            estoque=20,
            tipo="Maquiagem",
            imagem="imagens/pincel.jpeg"
        ),
        Produto(
            nome="ESPONJAS PARA MAQUIAGEM",
            descricao="4 Esponjas pequenas para espalhar maquiagem",
            preco=19.99,
            estoque=30,
            tipo="Maquiagem",
            imagem="imagens/esponja.jpeg"
        ),
        Produto(
            nome="PALETA DE BLUSH BURST FACE",
            descricao="8 Cores de blush na paleta",
            preco=60.00,
            estoque=30,
            tipo="Maquiagem",
            imagem="imagens/sombra.jpeg"
        ),
        Produto(
            nome="BLUSH COMPACTO MELU",
            descricao="Blush compacto da marca MELU",
            preco=15.90,
            estoque=30,
            tipo="Maquiagem",
            imagem="imagens/blush.jpeg"
        ),
        Produto(
            nome="URSINHO STITCH",
            descricao="Ursinho de pelúcia personagem Stitch",
            preco=54.99,
            estoque=30,
            tipo="Brinquedos",
            imagem="imagens/urso.jpeg"
        ),
        Produto(
            nome="BONECO BABY YODA",
            descricao="Boneco de plástico baby yoda",
            preco=68.99,
            estoque=30,
            tipo="Brinquedos",
            imagem="imagens/yoda.jpeg"
        ),
        Produto(
            nome="NOTEBOOK DELL INSPIRON 15",
            descricao="Intel Core i3 8GB RAM - SSD 256GB Windows 11 15,6” I15-I120K-A10P",
            preco=2969.00,
            estoque=10,
            tipo="Notebooks e Computadores",
            imagem="imagens/notebook.png"
        ),

        Produto(
            nome="MONITOR GBTM19B LED",
            descricao="19 Polegadas, 1440x900, HDMI e VGA, VESA 5 ms Preto",
            preco=263.48,
            estoque=5,
            tipo="Notebooks e Computadores",
            imagem="imagens/monitor.png"
        ),

        Produto(
            nome="MOLETOM TWENTY ONE PILOTS",
            descricao="Moletom Preto Tamanho M",
            preco=187.70,
            estoque=2,
            tipo="Moda",
            imagem="imagens/moletom.png"
        ),

        Produto(
            nome="MOLETOM TWENTY ONE PILOTS",
            descricao="Moletom Preto Tamanho G",
            preco=190.90,
            estoque=3,
            tipo="Moda",
            imagem="imagens/moletom2.png"
        ),

    ]

    # 🔁 Insere os novos produtos no banco
    for produto in produtos_para_inserir:
        db.session.add(produto)

    db.session.commit()
    print(f"{len(produtos_para_inserir)} produtos inseridos com sucesso!")
