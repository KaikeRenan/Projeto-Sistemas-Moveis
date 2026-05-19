Dificuldades Enfrentadas no Módulo 07

Este módulo foi um dos mais desafiadores da disciplina, pois envolveu a refatoração completa da arquitetura da aplicação utilizando Provider e GetIt. Inicialmente, o grupo identificou os estados que precisavam ser compartilhados entre as telas, como usuário logado, listas e preferências da aplicação.

Foram criadas classes com ChangeNotifier para gerenciamento de estado e registradas no GetIt e no MultiProvider, permitindo uma melhor organização e compartilhamento global das informações. Os widgets também foram adaptados para utilizar Consumer, Selector e context.watch, tornando a interface reativa às mudanças de estado.

A principal dificuldade encontrada foi reorganizar a estrutura do projeto sem comprometer funcionalidades já existentes, além de controlar corretamente os rebuilds da interface e separar a lógica de negócio da camada visual.

Apesar dos desafios, a implementação foi facilitada pelos conhecimentos adquiridos anteriormente e pelos exemplos apresentados em aula. Como resultado, a aplicação passou a possuir uma arquitetura mais organizada, desacoplada e escalável, facilitando manutenção e futuras expansões do sistema.