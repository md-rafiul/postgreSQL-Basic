# postgreSQL-Basic

1. What is PostgreSQL?
Ans: PostgreSQL is a powerful, open-source relational database management system (RDBMS)

2. What is the purpose of a database schema in PostgreSQL?
Ans: A schema in PostgreSQL is a namespace that contains database objects such as tables, views, functions, and types.

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Ans: 
    Primary Key (PK):
        Must contain unique and non-null values.
        Uniquely identifies each row in a table.
    
    Foreign Key (FK):
        A field that refers to the primary key in another table.
        Enforces referential integrity between related tables.
        Ensures that the value in the child table exists in the parent table.

4. What is the difference between the VARCHAR and CHAR data types?
Ans:
CHAR(n) is fixed-length, so if you store fewer characters, it adds space padding.
VARCHAR(n) is variable-length, storing exactly what you enter (up to n).

Feature	        CHAR(n)	                                VARCHAR(n)
Length      	Fixed-length	                        Variable-length
Padding     	Pads with spaces to length n	        No padding
Storage     	Always uses n characters	            Uses only what’s needed (up to n)
Best For        Uniform data	                        Varying length data 

5. What are the LIMIT and OFFSET clauses used for in PostgreSQL?
Ans:

The LIMIT and OFFSET clauses in PostgreSQL are used to control the number of rows returned by a query,
especially useful for pagination, previewing data, or managing performance in large result sets.

* Limit Specifies the maximum number of rows to return.
*  Offset skips a specified number of rows before beginning to return rows.