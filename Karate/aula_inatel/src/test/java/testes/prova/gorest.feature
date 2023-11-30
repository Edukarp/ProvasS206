Feature: Testes na API GoRest

Background:
  * def url_base = 'https://gorest.co.in/public-api'
  * configure headers = { Authorization: 'Bearer c7bc8e30b39568c3fd0019b9529b14515d141350a5bc3ca9de4321a25220f845' }  // Substitua 'your_access_token' pelo seu token de acesso

Scenario: Listar todos os usuários
  Given url url_base
  And path '/users'
  When method GET
  Then status 200
  And match response.data[*].id != null

Scenario: Atualizar informações de um usuário existente
  Given url url_base
  And path '/users/5803735'
  And request { email: 'atualizado@test.com', status: 'Inactive' }
  When method PUT
  Then status 200
  And match response.data.email == 'atualizado@test.com'


  Scenario: Entrando em uma página que não existe
    Given url url_base
    And path '/user'
    When method GET
    Then status 404

  Scenario: Procurando um usuário pelo Id e confirmando pelo Nome
    Given url url_base
    And path '/users/5803730'
    When method GET
    Then status 200
    And match response.data.name == "Hari Abbott"

  Scenario: Procurando comentario pelo id e confirmando pelo nome e email
    Given url url_base
    And path '/comments/71205'
    When method GET
    Then status 200
    And match response.data.name == "Gopee Chaturvedi"
    And match response.data.email == "chaturvedi_gopee@becker-heathcote.test"
