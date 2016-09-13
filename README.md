## Planning our app

1. What am I building?
   - A personal site.A place where I can blog and share examples of my work.

2. Who am I building it for?
  - For myself, but also for the community. Sharing what I learn by blogging is a great
    way to learn.
  - Also show potential employers what we are talking about.

3. What features does it need to have?
  - Posts
    - Create / Edit / Destroy
    - Markdown
    - Syntax highlighting
    - Comments

  - Projects
    - Create / Edit/ Destroy

  - Contact
    - Contact form
    -Sendgrid

  - User(devise)

## User stories
1. As a user I want to be able to create a post.
2. As a suer I want to be able to edit and destroy a post.
3. As a user I want to be able to write posts in markdown format.
4. As a user I want to be able to highlight various syntax of code blocks.
5. As a user I want to be able to show visitors and employers examples of my work.
6. As a user I want visitors to be able to contact me through a form on my site.
7. As a user I want visitors to be able to leave comments on posts in my site.


## Modelling my data.
 - Posts model
    - title:string
    - content:text

 - Project model
    - title:string
    - description:text
    - link:string

 - User model
    - Devise
