# WebAppStack

Este projeto foi desenvolvido para servir aplicações web dentro de containers Docker. Ele é totalmente modular e pode ser utilizado não apenas com Laravel, mas com qualquer projeto que deseje integrar à estrutura configurada. Seu principal objetivo é facilitar o desenvolvimento, permitindo levantar todos os serviços necessários com um único comando:

```bash
docker compose up -d
```

## Funcionalidades incluídas

- Nginx com suporte a SSL  
- PHP 8.4  
- Laravel 12  
- Xdebug configurado  
- PostgreSQL

## Instalação

Após clonar o repositório, navegue até a raiz do projeto (onde está localizado o arquivo `docker-compose.yml`) e execute o comando:

```bash
docker compose up -d
```

Após a execução, os containers estarão prontos para uso. Você poderá acessar o projeto Laravel pelo navegador no seguinte endereço:

- **HTTPS (localhost)**: https://localhost:8443/

## Contribuindo

Pull requests são bem-vindos! Para mudanças significativas, por favor, abra uma *issue* primeiro para discutirmos o que você gostaria de modificar.

Certifique-se de atualizar os testes, caso necessário.

## Licença

Este projeto está licenciado sob a licença [MIT](https://choosealicense.com/licenses/mit/).