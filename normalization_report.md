# Normalization Report — LibraryDB

## Original problem
Initial naive design had fields like AuthorName and PublisherName inside Books table — that causes redundancy.

## 1NF
- Ensure atomic values and no repeating groups.
- Each column holds single value: Done.

## 2NF
- Remove partial dependencies (for composite keys). Our primary keys are single columns so move repeated author data out.
- AuthorName moved to Authors table; Publisher details moved to Publishers table.

## 3NF
- Remove transitive dependencies.
- Books references PublisherID (no publisher fields inside Books).
- BookAuthors table handles many-to-many between Books and Authors.
