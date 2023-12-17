## Servidor Minecraft no Docker

Este repositório foi criado para configurar e executar um servidor Minecraft utilizando Docker, aproveitando uma imagem personalizada baseada em Arch Linux que utiliza systemd para gerenciar os serviços.

A proposta é possibilitar ter um servidor próprio, portátil e exposto na internet. Para isso, a implementação escolhida foi rodar o servidor como um contêiner Docker, o que permite exportá-lo como um contêiner zipado ou expô-lo na internet com o ngrok, permitindo que qualquer pessoa com o link possa se conectar. Essa abordagem traz a vantagem de desvincular o mundo e o servidor de um único computador. Além disso, os clientes não precisam lidar com inconvenientes para se conectar ao servidor, necessitando apenas de acesso à internet. O host também possui vantagens nesse sentido, precisando apenas ter o Docker instalado, sem a necessidade de lidar com a instalação do Java.

### Arquivos do Projeto

1. **`docker-compose.yml`:**
   O arquivo `docker-compose.yml` define a configuração do serviço Docker para o servidor Forge do Minecraft. Ele especifica os recursos, como CPUs e memória, as portas expostas e os volumes montados para o servidor.

2. **`Dockerfile`:**
   O arquivo Dockerfile foi construído com base em uma imagem personalizada baseada em Arch Linux. Ele configura e prepara o ambiente para executar o servidor Minecraft, utilizando systemd para gerenciar os serviços.

3. **`install.sh`:**
   O script `install.sh` é um script de shell que inicia o serviço do servidor Forge do Minecraft em um contêiner Docker utilizando `docker-compose`.

4. **`expose.sh`:**
   O arquivo `expose.sh` executa o comando `ngrok tcp 25565` dentro do contêiner do servidor Forge do Minecraft (`forgeserver`). Isso pode ser utilizado para expor o servidor Minecraft local através do serviço ngrok.

5. **`stop.sh`:**
   O script `stop.sh` está disponível para parar o servidor Minecraft. Execute-o quando desejar interromper o funcionamento do servidor.

### Configuração

1. Personalize as configurações do servidor Minecraft editando os arquivos eula.txt e server.properties localizados no diretório config.

2. No arquivo de Dockerfile, na linha `RUN ngrok config add-authtoken your_token`, substitua `your_token` pelo seu token do ngrok, isso é crucial para expor seu servidor para além da rede local.

### Usabilidade

1. Após iniciar o servidor com o script start.sh, o mapeamento de porta estará configurado de forma que qualquer computador poderá se conectar ao servidor utilizando o IP do host e a porta padrão 25565.

2. Também é possível expor o servidor na internet com o script expose.sh. Após sua execução, o prompt do ngrok será aberto, exibindo o domínio do servidor. Esse domínio será utilizado para a conexão. No menu de conexão do Minecraft, basta utilizar a informação presente no campo "Forwarding" exibido no prompt do ngrok.
