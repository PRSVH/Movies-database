# Movies-database
The relational database moviedb has the following database schema:

**MOVIE**(title, production year, country, run time, major genre)

primary key : {title, production year}

**PERSON**(id, first name, last name, year born)

primary key : {id}

**AWARD** (award name, institution, country)

primary key : {award name}

**RESTRICTION_CATEGORY**(description, country)

primary key : {description, country}

**DIRECTOR**(id, title, production year)

primary key : {title, production year}

foreign keys : [title, production year] ⊆ Movie[title, production year]
[id] ⊆ Person[id]

**WRITER**(id, title, production year, credits)

primary key : {id, title, production year}

foreign keys : [title, production year] ⊆ Movie[title, production year]
[id] ⊆ Person[id]

**CREW**(id, title, production year, contribution)

primary key : {id, title, production year}

foreign keys : [title, production year] ⊆ Movie[title, production year]

[id] ⊆ Person[id]

**SCENE**(title, production year, scene no, description)

primary key : {title, production year, scene no}

foreign keys : [title, production year] ⊆ Movie[title, production year]

**ROLE**(id, title, production year, description, credits)

primary key : {title, production year, description}

foreign keys : [title, production year] ⊆ Movie[title, production year]
[id] ⊆ Person[id]

**RESTRICTION**(title, production year, description, country)

primary key : {title, production year, description, country}

foreign keys : [title, production year] ⊆ Movie[title, production year]
[description, country] ⊆ Restriction Category[description, country]

APPEARANCE(title, production year, description, scene no)

primary key : {title, production year, description, scene no}

foreign keys : [title, production year, scene no] ⊆ Scene[title, production year, scene no]
[title, production year, description] ⊆ Role[title, production year, description]


**MOVIE_AWARD**(title, production year, award name, year of award, category, result)

primary key : {title, production year, award name, year of award, category}

foreign keys : [title, production year] ⊆ Movie[title, production year]
[award name] ⊆ Award[award name]

**CREW_AWARD**(id, title, production year, award name, year of award, category, result)

primary key : {id, title, production year, award name, year of award, category}

foreign keys : [id, title, production year] ⊆ Crew[id, title, production year]
[award name] ⊆ Award[award name]

**DIRECTOR_AWARD**(title, production year, award name, year of award, category, result)

primary key : {title, production year, award name, year of award, category}

foreign keys : [title, production year] ⊆ Director[title, production year]
[award name] ⊆ Award[award name]

**WRITER_AWARD**(id, title, production year, award name, year of award, category, result)

primary key : {id, title, production year, award name, year of award, category}

foreign keys : [id, title, production year] ⊆ Writer[id, title, production year]
[award name] ⊆ Award[award name]

**ACTOR_AWARD**(title, production year, description, award name, year of award, category, result)

primary key : {title, production year, description, award name, year of award, category}

foreign keys : [award name] ⊆ Award[award name]
[title, production year, description] ⊆ Role[title, production year, description]

There are five different categories of awards: movie awards, crew awards, director awards, writer awards and
actor awards. A movie can only win an award after being nominated for the award.
This repository contains my solution to some SQL queries.
