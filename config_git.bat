@echo off

git remote remove origin

git init

:: Inicializa o repositório git, se não for um repositório
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo Não é um repositório Git. Inicializando o repositório...
    git init
)

:: Configurações globais do Git
git config --global user.name "mobile-2025"
git config --global user.email "leandrocesardacruz.mobile.2025@gmail.com"

:: Adiciona o repositório remoto (só executa se já não estiver adicionado)
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    git remote add origin "https://github.com/mobile-2025/Repo.git"
)

git pull origin main 

git checkout -b main

:: Exibe mensagem de sucesso
echo Configurações do Git foram aplicadas com sucesso!
pause