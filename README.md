# Week 1 Database Assignment — Library Management System

## Overview
This project is a MySQL database designed to manage the core operations of a small library:
tracking books, authors, members, and book loans. It was created and tested using both
MySQL Workbench and the MySQL command-line client (Terminal).

## Why This Topic
A library naturally demonstrates the key concepts covered this week — multiple related
tables, primary/foreign key relationships, and realistic queries (joins, filtering,
aggregation) — making it a good fit for practicing database fundamentals.

## Database Structure

The database is called **`library_management`** and contains four tables:

| Table     | Purpose                                                                 |
|-----------|--------------------------------------------------------------------------|
| `authors` | Stores author details (name, country).                                  |
| `books`   | Stores book details (title, genre, year published, copies available), linked to `authors` via `author_id`. |
| `members` | Stores library member details (name, email, join date).                 |
| `loans`   | Tracks which member borrowed which book and when, linked to both `books` and `members`. |

### Relationships
- One **author** can write many **books** (`authors.author_id` → `books.author_id`).
- One **book** can appear in many **loans** (`books.book_id` → `loans.book_id`).
- One **member** can have many **loans** (`members.member_id` → `loans.member_id`).

Foreign keys use `ON DELETE CASCADE` / `ON UPDATE CASCADE` (or `SET NULL` for authors)
so that related records stay consistent if a book, member, or author is removed or updated.

## What the Script Does
`answer.sql` performs the following steps in order:
1. Creates the `library_management` database.
2. Creates the four tables described above, with appropriate primary keys, foreign keys,
   and constraints (e.g. `UNIQUE` email, `NOT NULL` fields, default dates).
3. Inserts sample data into each table (5 authors, 5 books, 3 members, 4 loan records).
4. Runs example queries to demonstrate the database in action, including:
   - Listing all books with their author's name.
   - Listing currently borrowed (not yet returned) books.
   - Counting total loans per member.
   - Finding books with fewer than 3 copies available.

## How to Run
**Using Terminal:**
```bash
mysql -u root -p < answer.sql
```

**Using MySQL Workbench:**
1. Open `answer.sql` via File → Open SQL Script.
2. Execute the script (lightning bolt icon).
3. Refresh the Schemas panel to see `library_management`.

## Author
[BERTO TABAN OFOTIR]
