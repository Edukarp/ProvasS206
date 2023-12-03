describe('Testes no site https://www.demoblaze.com/index.html', () => {
  beforeEach(() => {
    // Antes de cada teste, visite a página inicial
    cy.visit('https://www.demoblaze.com/index.html')
  })

  it('Deve verificar se o título da página está correto', () => {
    cy.title().should('eq', 'STORE')
  })

  it('Deve verificar se o título da página está errado', () => {
    verificarTituloNaoPresente('INCORRECT TITLR')
  })

  it('Deve adicionar um produto ao carrinho', () => {
    cy.get(':nth-child(1) > .card > .card-block > .card-title > .hrefch').click() // Adiciona o primeiro produto ao carrinho
    cy.on('window:alert', (str) => {
      expect(str).to.equal('Product added')
    })
  })

  it('Deve navegar para a página de carrinho', () => {
    cy.contains('Cart').click() // Clica no link "Cart"
    cy.url().should('include', '/cart.html') // Verifica se a URL contém /cart.html
    cy.get('.col-lg-8 > h2').should('contain', 'Products')
  })

  // Função para verificar se um título específico NÃO está presente na página
  const verificarTituloNaoPresente = (titulo) => {
    cy.title().should('not.eq', titulo)
  }
})