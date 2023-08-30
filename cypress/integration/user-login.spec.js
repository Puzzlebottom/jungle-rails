describe('user login', () => {

  describe('user registration', () => {
    it('should show a button to register', () => {
      cy.visit('/');
      cy.get('[href="/register"]').should('be.visible');
    });

    it('should load the registration form', () => {
      cy.get('[href = "/register"]').click();
      cy.get('main.container > h1').should('contain.text', 'Register!');
      cy.get('form').should('be.visible');
    });

    it('should register a new user', () => {
      //fill out form
      cy.get('#user_first_name').type('Albus');
      cy.get('#user_last_name').type('Dumbleedoo');
      cy.get('#user_email').type('headmaster@hogwarts.wiz');
      cy.get('#user_password').type('grindelwald');
      cy.get('#user_password_confirmation').type('grindelwald');

      cy.get('[type="submit"]').click();

      //logs user in
      cy.get('[href="/logout"]').should('be.visible');

      //redirects to home page
      cy.get('.title > h1').should('contain.text', 'The Jungle');
    });
  });

  describe('logout', () => {
    it('should log a user out', () => {
      cy.get('[href="/logout"]').click();

      cy.get('[href="/login"]').should('be.visible');
    });
  });

  describe('existing user login', () => {
    it('should load the login form', () => {
      cy.get('[href="/login"]').click();
      cy.get('main.container > h1').should('contain.text', 'Login');
      cy.get('form').should('be.visible');
    });

    it('should log in an existing user', () => {
      //fill out form
      cy.get('#email').type('headmaster@hogwarts.wiz');
      cy.get('#password').type('grindelwald');

      cy.get('[type="submit"]').click();

      //logs user in
      cy.get('[href="/logout"]').should('be.visible');
    });

    it('should redirect the user to the home page', () => {
      cy.get('.title > h1').should('contain.text', 'The Jungle');
    });
  });

});

