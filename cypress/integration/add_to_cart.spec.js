describe('add to cart', () => {
  beforeEach(() => {
    cy.visit('/');
    cy.get('.products article')
      .first()
      .click();
  });

  it('should add one item to the cart when the add button is clicked', () => {
    // cart starts empty
    cy.get('.nav-link')
      .contains('my cart', { matchCase: false })
      .should('contain.text', '0');

    //click the button
    cy.get('button')
      .contains('add', { matchCase: false })
      .click();

    //my cart increments
    cy.get('.nav-link')
      .contains('my cart', { matchCase: false })
      .should('contain.text', '1');
  });
});

