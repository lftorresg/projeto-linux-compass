# Projeto de Monitoramento de Serviço Nginx  

Este projeto consiste em um script Bash que verifica o status do serviço Nginx, registra os resultados em arquivos de log e automatiza a execução periódica do monitoramento.

## Índice  
1. [Estrutura do Projeto](#estrutura-do-projeto)  
2. [Pré-requisitos](#pré-requisitos)  
3. [Configuração](#configuração)  
4. [Descrição do Script](#descrição-do-script)  
5. [Automatização com Cron](#automatização-com-cron)  
6. [Execução](#execução)  

---

## Estrutura do Projeto  

```plaintext
Projeto/
├── logs/
│   ├── status_online.log
│   ├── status_offline.log
├── verif_nginx.sh
```

- **logs/**: Diretório onde os arquivos de log são gerados.  
  - `status_online.log`: Registra os status ONLINE do serviço.  
  - `status_offline.log`: Registra os status OFFLINE do serviço.  
- **verif_nginx.sh**: Script Bash responsável por monitorar o status do serviço Nginx.

---

## Pré-requisitos  

1. **Sistema Operacional**:  
   - Linux (baseado em Debian, como o Kali Linux).  

2. **Pacotes Necessários**:  
   - `nginx`: Servidor web.  
   - `cron`: Para automatização da execução.  

3. **Permissões**:  
   - Acesso root ou sudo para gerenciar serviços e configurar o cron.

---

## Configuração  

1. **Clone o repositório ou copie os arquivos** para o diretório desejado.  
   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd Diretório
   ```

2. **Torne o script executável**:  
   ```bash
   chmod +x seu_diretório/verif_nginx.sh
   ```

3. **Configure o ambiente**:  
   - Certifique-se de que o serviço Nginx está instalado e ativo:  
     ```bash
     sudo apt update
     sudo apt install nginx -y
     sudo systemctl start nginx
     ```

---

## Descrição do Script  

O script `verif_nginx.sh` realiza as seguintes ações:  
1. Verifica automaticamente o status do serviço Nginx.  
2. Cria o diretório de logs (`logs/`) se ele não existir.  
3. Registra o status atual (ONLINE ou OFFLINE) no respectivo arquivo de log.  
4. Inclui informações detalhadas:  
   - Data e hora.  
   - Nome do serviço (`nginx`).  
   - Status do serviço (ONLINE ou OFFLINE).  

## Automatização com Cron  

Para executar o script automaticamente a cada 5 minutos:  

1. Edite o crontab:  
   ```bash
   crontab -e
   ```

2. Adicione a linha abaixo ao final do arquivo:  
   ```bash
   */5 * * * * /caminho/para/seu/script/verif_nginx.sh
   ```

3. Salve e saia.  

Para verificar se o cron está ativo:  
```bash
crontab -l
```

---

## Execução  

1. Execute o script manualmente para testar:  
   ```bash
   ./verif_nginx.sh
   ```

2. Verifique os arquivos de log:  
   ```bash
   cat logs/status_online.log
   cat logs/status_offline.log
   ```

---

## Resultados  

- O status do Nginx será registrado nos arquivos de log dentro do diretório `logs/`.  
- A saída do terminal exibirá o status com as respectivas datas e horários.  

Exemplo de log:  
No `status_online.log`:
```plaintext
15-01-2025 16:30:00 | nginx | ONLINE | O serviço nginx está em execução.
```

No `status_offline.log`:
```plaintext
15-01-2025 16:35:00 | nginx | OFFLINE | O serviço nginx não está ativo ou está com problemas.
```  
