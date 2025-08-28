# Agenda:
- [What is Liquibase?](#what-is-liquibase)
- [Basic Concepts & Terminologies](#basic-concepts--terminologies)
- [Core Features](#core-features)
- [Hands-on Demo](#hands-on-demo)
- [Core Liquibase Commands](#core-liquibase-commands)
- [Benefits](#benefits)
- [Intermediate Concepts](#intermediate-concepts)
- [Tips](#tips)


## What is Liquibase?
  * Liquibase is an open-source database schema change management tool that helps teams track, version, and deploy database changes in a consistent and controlled way. It's especially useful in DevOps and CI/CD pipelines where database changes need to be versioned just like application code.

## Basic Concepts & Terminologies:

### 1. ChangeSet:
  * A changeset is the fundamental unit of change. It represents a single atomic piece of work that should be applied to a database (like creating a table, adding a column, or inserting data).
###  2. ChangeLog:
  * A ChangeLog is a file (or a set of files) that contains one or more changesets and defines the order and structure in which changes should be applied to the database.
### 3. Purpose of DatabaseChangeLog & DatabaseChangeLogLock Table:
* **DatabaseChangeLog**: Tracks which changesets have been executed against the database.
* **DatabaseChangeLogLock**: Prevents concurrent Liquibase executions.
### 4. Supported Formats: 
* It supports formats like: **XML**, **YAML**, **JSON**, **SQL**
### 5. How Liquibase keeps track of changes
### 6. Idempotence and rollback safety

## Core Features:

### 1. Database Change Tracking:
* Uses changelogs to define and track changes like creating tables, adding columns, inserting data, etc.
### 2. Changelogs:
* Written in XML, YAML, JSON, or SQL formats. 
* Each change is wrapped in a <changeSet> with an author and an ID for tracking.
### 3. Rollback Support:
* Built-in rollback capabilities for undoing changes safely.
###  4. Database Support:
* Works with most relational databases: MySQL, PostgreSQL, Oracle, SQL Server, DB2, H2, etc.
###  5. Diff and Generate ChangeLog:
* Can compare two databases (e.g., dev vs prod) and generate the necessary changelogs.
### 6. Integration with CI/CD:
* Easily integrated with Jenkins, GitHub Actions, Azure DevOps, etc., to automate deployments.
### 7. Command Line & API Access:
* Available as a CLI tool, Maven/Gradle plugin, Java API, or Docker image.



## Hands-on Demo:
* Let's move to the demo.

## Core Liquibase Commands:
* validate
* status
* update
* rollback last N ChangeSets
  * Shows SQL for rolling back last N changesets:
    * `liquibase rollbackCountSQL N`
  * Rollback last N changes:
    * `liquibase rollbackCount N`
* tag
  * `liquibase tag <tag_name>`
* Rollback to a specific tag:
  * `liquibase rollback <tag_name>`

## Benefits:

* Version-controlled database changes.
* Reliable rollback and audit history.
* Supports automated deployments and CI/CD.
* Helps prevent "it works on my machine" DB issues.

## Intermediate Concepts:
* Rollback strategies
  * Manual rollback SQL
    * The rollback block that we as a developer define for each ChangeSet
  * Automatic rollback tags
    * Creating a rollback point using tag and liquibase will automatically generate SQL to undo changesets applied after the tag
* Change types
  * CreateTable, AddColumn, ModifyDataType, LoadData, etc.
* Contexts and Labels
  * Can be provided to each ChangeSet.
  * Fine-grained control to run changes in specific environments.
* Preconditions
  * Ensuring a changeset only runs if certain conditions are met
* Tagging database states
  * Useful for rollback or deployment verification

## Tips:
* Always test on a local/dev DB
* Use id+author+context for unique changesets
* Keep changes small and atomic
* Avoid modifying existing changesets in production