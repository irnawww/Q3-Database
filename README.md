# Q3 - Subscriber & Usage SQL

## Overview

This solution implements the SQL tasks from Q3 using PostgreSQL.

The solution is split into three SQL files so the database can be
recreated and tested from a clean environment.

## Files

- `schema.sql` - creates the `subscribers` and `usage` tables.
- `seed.sql` - inserts the initial data provided by the assessment.
- `solution.sql` - contains the solutions for tasks 1-5.

## Requirements

- PostgreSQL
- `psql` command-line client

## Run

Create a database:

```bash
createdb q3_subscriber
```

Create the tables:

```bash
psql -d q3_subscriber -f schema.sql
```

Load the initial data:

```bash
psql -d q3_subscriber -f seed.sql
```

Run the solutions:

```bash
psql -d q3_subscriber -f solution.sql
```

Or, if PostgreSQL authentication requires the `postgres` OS user:

```bash
sudo -u postgres createdb q3_subscriber
sudo -u postgres psql -d q3_subscriber -f schema.sql
sudo -u postgres psql -d q3_subscriber -f seed.sql
sudo -u postgres psql -d q3_subscriber -f solution.sql
```

## Tasks Covered

1. Insert subscriber `Fajar` with the Basic plan and activation date
   `2024-01-24`.
2. Update Fajar's plan from Basic to Premium.
3. Calculate total data usage for Premium subscribers.
4. Find the top 3 subscribers by total data usage.
5. Find subscribers whose average call minutes per usage snapshot is
   less than or equal to 50.

## Expected Results

After running `solution.sql`:

### Task 3

Total Premium subscriber data usage:

```text
16800 MB
```

Fajar has no usage records, so only existing Premium subscriber usage
contributes to the total.

### Task 4

Top 3 subscribers by total data usage:

```text
SUB02 | Sari | 11800 MB
SUB04 | Dewi | 9000 MB
SUB05 | Rian | 5000 MB
```

### Task 5

Subscribers with average call minutes <= 50:

```text
SUB01 | 37.5
SUB03 | 20
SUB06 | 25
```

## Notes

`solution.sql` is intended to be run once on a database initialized with
`schema.sql` and `seed.sql`.
