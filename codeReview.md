# 📋 Code Review

 ✅ **Review realizado pela Squad 4 - *TimeOut***  

📌 **Código feito pela Squad 3 - *Level Up***

---
# Code Review – Testes de Cadastro (Robot Framework)

## Arquivo analisado:
### Diretório: tests/cadastro.robot

### Link: https://github.com/IvoSobral/LEVELUP_Serverest_and_Robot/blob/main/tests/cadastro.robot

## Pontos positivos:
O código está bem estruturado, fazendo uso de diversas bibliotecas que aprimoram seus testes, tal como a Faker e a Browser. Além disso, os testes cobrem uma série de casos válidos e de grande importância, como cadastro com emails duplicados e inválidos. Aperfeiçoando a realização dos testes.

## Pontos de melhoria:

- Repetição de passos como Go To signup page e Go to signup form pode ser abstraída em uma keyword única.

- Validações inconsistentes: alguns testes não possuem Alert Should Be no final.
  >(Adendo que se tiver sido proposital, dar um feedback de retorno informando, e claramente desconsiderar esse ponto de melhoria)

- Documentação: nem todos os casos possuem [Documentation].
  >(outro ponto que se foi proposital, ser desconsiderado)

## Resumo:
No geral, os testes cumprem bem o objetivo, mas podem ser um pouco mais limpos. Essas mudanças pouco influenciam na qualidade atual do código, que já é eficiente e funcional.
