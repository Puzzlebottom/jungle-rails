describe('product details page', () => {
  beforeEach(() => {
    cy.visit('/');
    cy.get('.products article')
      .first()
      .click();
  });
  it('should load the product details page', () => {
    cy.get('.products-show').should('exist');
  });
});

