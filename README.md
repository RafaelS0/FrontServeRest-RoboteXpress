# Testes Automatizados - ServeRest Frontend

Projeto de testes automatizados para validação de login e cadastro na aplicação ServeRest Frontend usando Robot Framework e BrowserLibrary.

## 🚀 Funcionalidades

- **Cadastro de usuário** via interface web com dados dinâmicos
- **Testes de login** com validações de sucesso e erro
- **Screenshots automáticos** para evidências nos relatórios
- **Dados persistentes** entre execuções de teste
- **Geração de dados únicos** com FakerLibrary

## 📋 Pré-requisitos

- Python 3.8+
- Git

## ⚙️ Configuração

1. **Clone o repositório**
```bash
git clone <url-do-repositorio>
cd FrontServeRest-RoboteXpress
```

2. **Execute o setup automático**
```bash
setup_project.bat
```

## 🧪 Executando os Testes

### Execução completa
```bash
run_tests.bat
```

### Execução individual
```bash
# Ativar ambiente virtual
venv\Scripts\activate.bat

# Teste de cadastro
robot tests/cadastro_test.robot

# Testes de login
robot tests/login_test.robot
```

## 📊 Relatórios

Após a execução, os relatórios são gerados:
- `log.html` - Detalhes com screenshots
- `report.html` - Resumo dos testes
- `output.xml` - Dados estruturados

## 🏗️ Estrutura do Projeto

```
├── tests/
│   ├── cadastro_test.robot    # Teste de cadastro
│   └── login_test.robot       # Testes de login
├── resources/
│   └── keywords.robot         # Keywords reutilizáveis
├── requirements.txt           # Dependências
├── setup_project.bat         # Configuração inicial
└── run_tests.bat            # Execução dos testes
```

## 🔧 Tecnologias

- **Robot Framework** - Framework de testes
- **BrowserLibrary** - Automação web
- **FakerLibrary** - Geração de dados dinâmicos
- **Requests** - Requisições a API

## ✅ Cobertura dos Testes
- Página de **Login**
- Página de **Cadastro**
- Página de **Produtos**
- Página de **Cadastrar um novo usuário** *(necessário login de Administrador)*
- Página de **Lista de Compras**


## 👥 Squad 4 - TimeOut
- **Julielen Arnoud Dorneles**
- **Victor Lohan Sousa de Assis**
- **Agemilson Pereira Abreu**
- **Kaio Leandro Garcia Silvestrini**
- **Rafael Oliva Soares**


