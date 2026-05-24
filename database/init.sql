BEGIN;

-- Tipos de usuário
CREATE TABLE IF NOT EXISTS tipo_usuario (
    id   SERIAL PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL
);

INSERT INTO tipo_usuario (tipo) VALUES
    ('Admin'),
    ('Gerente'),
    ('Municipe');

-- Usuários do sistema
CREATE TABLE IF NOT EXISTS usuario (
    id             SERIAL PRIMARY KEY,
    nome           VARCHAR(100) NOT NULL,
    email          VARCHAR(150) UNIQUE NOT NULL,
    senha          VARCHAR(100) NOT NULL,
    tipo_usuario_id INTEGER NOT NULL,
    criado_em      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_tipo
        FOREIGN KEY (tipo_usuario_id)
        REFERENCES tipo_usuario (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

INSERT INTO usuario (nome, email, senha, tipo_usuario_id) VALUES
    ('Rodrigo Silva Peres', 'rodrigo@email.com', 'senha123', 1),
    ('Aluno Teste',         'aluno@email.com',   'senha123', 2);

-- Registros de IPTU
CREATE TABLE IF NOT EXISTS iptu (
    id         SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE,
    nome       VARCHAR(100),
    valor      NUMERIC(10, 2),
    CONSTRAINT fk_iptu_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuario (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO iptu (usuario_id, nome, valor) VALUES
    (NULL, 'ANDRE DE HOLANDA VENTURA',             1000.00),
    (NULL, 'ANDRE MICHEL DE CARVALHO',             1000.00),
    (NULL, 'BRUNA CAIADO REGRA',                   1000.00),
    (NULL, 'BRUNO ALVES PEREIRA DOS SANTOS',       1000.00),
    (NULL, 'BRUNO HENRIQUE MENEZES RAMOS',         1000.00),
    (NULL, 'BRUNO HENRIQUE OLIVEIRA',              1000.00),
    (NULL, 'CLAUDIO DOS SANTOS SIQUEIRA JUNIOR',   1000.00),
    (NULL, 'EDLAINE DE PAULA SOUZA',               1000.00),
    (NULL, 'EDUARDO HENRIQUE DE SOUZA BRITO',      1000.00),
    (NULL, 'FELIPE FERNANDES CORREA',              1000.00),
    (NULL, 'GABRIEL HENRIQUE SIQUEIRA PINTO',      1000.00),
    (NULL, 'GABRIEL JULIANI BERNES',               1000.00),
    (NULL, 'LEANDRO BARBOSA CARDOSO',              1000.00),
    (NULL, 'LUANA PINHEIRO DOS SANTOS VENANCIO',   1000.00),
    (NULL, 'LUCAS ROQUE ALVIM CRUZ',               1000.00),
    (NULL, 'LUIZ FELIPE DOS SANTOS',               1000.00),
    (NULL, 'MARIA EDUARDA FERREIRA SILVA',         1000.00),
    (NULL, 'MAURICIO OLIVEIRA MEDEIROS CEPINHO',   1000.00),
    (NULL, 'NICOLAS HENRIQUE SILVA DE OLIVEIRA',   1000.00),
    (NULL, 'NICOLAS JOSE DE AQUINO',               1000.00),
    (NULL, 'PAMELA DA SILVA FREITAS',              1000.00),
    (NULL, 'PAULO ALEXANDRE BUENO',                1000.00),
    (NULL, 'PEDRO FELIPE DE ARAUJO OLIVEIRA',      1000.00),
    (NULL, 'POLLYANA ROBERTA DE SOUSA',            1000.00),
    (NULL, 'RAQUEL MASSAE NAKAMURA SIQUEIRA',      1000.00),
    (NULL, 'RODRIGO DE ANDRADE PAULA',             1000.00),
    (NULL, 'TIAGO SANTINI DA SILVA',               1000.00),
    (NULL, 'VICTOR HUGO DANTAS CARBAJO',           1000.00),
    (NULL, 'VINICIUS BARBOSA FERNANDES',           1000.00),
    (NULL, 'VITOR FRANCISCO DE AZEVEDO ZONZINI',   1000.00),
    (1,    'RODRIGO SILVA PERES',                     10.00);

-- Comentários dos munícipes
CREATE TABLE IF NOT EXISTS comentario (
    id         SERIAL PRIMARY KEY,
    texto      VARCHAR(255),
    usuario_id INTEGER NOT NULL,
    CONSTRAINT fk_comentario_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuario (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

INSERT INTO comentario (texto, usuario_id) VALUES
    ('Nossa pirapora é linda e tem uma ótima gestão.', 1),
    ('Concordo chefinho!', 2);

-- Tabela de dados sensíveis (uso interno)
CREATE TABLE IF NOT EXISTS dados_roubados (
    id    SERIAL PRIMARY KEY,
    dados VARCHAR(255)
);

COMMIT;
