# NAV Java Queries

This pack contains custom CodeQL queries for Java security analysis.

## Structure

- `src/` - Contains the query files (.ql)
- `codeql-suites/` - Contains query suites (.qls) that define collections of queries
- `qlpack.yml` - Pack configuration file

## Usage

To use this pack in your CodeQL analysis:

```yaml
# In your codeql-config.yml or GitHub Advanced Security settings
packs:
  - navikt/java-queries
```

Or reference specific query suites:

```bash
codeql database analyze <database> navikt/java-queries:codeql-suites/navikt-java-security.qls
```

## Adding New Queries

1. Create a new `.ql` file in the `src/` directory
2. Include proper metadata in the query header (see example queries)
3. Tag queries appropriately (e.g., `security`, `external/cwe/...`)
4. Test the query against sample code before committing

## Query Metadata

All queries should include:
- `@name` - Human-readable name
- `@description` - What the query detects
- `@kind` - Query type (problem, path-problem, etc.)
- `@problem.severity` - Severity level
- `@precision` - Precision level
- `@id` - Unique identifier (format: navikt/...)
- `@tags` - Relevant tags including security and CWE references
