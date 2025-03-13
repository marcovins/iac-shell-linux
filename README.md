# Gerenciamento de Usuários e Permissões no Linux

Este projeto contém dois scripts Bash que automatizam a criação de diretórios, grupos e usuários no Linux, além de definir permissões de acesso conforme as necessidades do sistema.

## Scripts

### 1. `iac.sh`

Este script realiza a criação de diretórios, grupos e usuários, além de definir permissões para cada grupo.

#### Funcionalidades:
- Cria os diretórios: `/publico`, `/adm`, `/ven` e `/sec`.
- Cria os grupos de usuários: `GRP_ADM`, `GRP_VEN` e `GRP_SEC`.
- Cria usuários e os adiciona a seus respectivos grupos:
  - **Administradores:** `carlos`, `maria`, `joao` (pertencem ao grupo `GRP_ADM`).
  - **Vendas:** `debora`, `sebastiana`, `roberto` (pertencem ao grupo `GRP_VEN`).
  - **Segurança:** `josefina`, `amanda`, `rogerio` (pertencem ao grupo `GRP_SEC`).
- Define permissões:
  - Os diretórios `/adm`, `/ven` e `/sec` são acessíveis apenas pelos respectivos grupos (`chmod 770`).
  - O diretório `/publico` é acessível por todos os usuários (`chmod 777`).

### 2. `user-create.sh`

Este script cria usuários convidados no sistema.

#### Funcionalidades:
- Cria usuários convidados: `guest10`, `guest11`, `guest12` e `guest13`.
- Define uma senha inicial para cada usuário.
- Exige a alteração da senha no primeiro login (`passwd -e`).

## Como Utilizar

1. Dê permissão de execução aos scripts:
   ```bash
   chmod +x iac.sh user-create.sh
   ```
2. Execute o script principal para configurar o ambiente:
   ```bash
   sudo ./iac.sh
   ```
3. Execute o script de criação de usuários convidados (se necessário):
   ```bash
   sudo ./user-create.sh
   ```

## Requisitos
- Distribuição Linux baseada em Debian ou Red Hat.
- Permissão de superusuário (root).
- Pacote `openssl` instalado para criptografar senhas.
