# appsec-ql-packs

A repository of custom CodeQL query packs for security analysis across NAV's codebases.

## Overview

This repository contains custom CodeQL query packs that can be used to perform security analysis on various programming languages. These packs are designed to supplement the standard CodeQL queries with organization-specific security checks and best practices.

## Available Query Packs

| Pack Name | Language | Description |
|-----------|----------|-------------|
| `navikt/java-queries` | Java | Custom security queries for Java applications |
| `navikt/javascript-queries` | JavaScript/TypeScript | Custom security queries for JavaScript and TypeScript |
| `navikt/python-queries` | Python | Custom security queries for Python applications |
| `navikt/go-queries` | Go | Custom security queries for Go applications |

## Usage

### Using with GitHub Code Scanning

To use these query packs in GitHub Code Scanning, create or update the `.github/codeql-config.yml` file in your repository:

```yaml
name: "CodeQL Config"

queries:
  - uses: security-and-quality

packs:
  # For Java repositories
  - navikt/java-queries
  
  # For JavaScript/TypeScript repositories
  - navikt/javascript-queries
  
  # For Python repositories
  - navikt/python-queries
  
  # For Go repositories
  - navikt/go-queries
```

Then reference this configuration in your CodeQL workflow:

```yaml
- name: Initialize CodeQL
  uses: github/codeql-action/init@v3
  with:
    config-file: .github/codeql-config.yml
```

### Using with CodeQL CLI

To use these packs with the CodeQL CLI:

1. **Install the pack:**
   ```bash
   codeql pack install navikt/java-queries
   ```

2. **Run analysis with the pack:**
   ```bash
   codeql database analyze <database> \
     navikt/java-queries:codeql-suites/navikt-java-security.qls \
     --format=sarif-latest \
     --output=results.sarif
   ```

### Using Specific Query Suites

Each pack includes predefined query suites:

- `navikt-java-security.qls` - All security-related Java queries
- `navikt-javascript-security.qls` - All security-related JavaScript queries
- `navikt-python-security.qls` - All security-related Python queries
- `navikt-go-security.qls` - All security-related Go queries

## Repository Structure

```
appsec-ql-packs/
├── codeql-workspace.yml          # Workspace configuration
├── java-queries/
│   ├── qlpack.yml                # Pack metadata
│   ├── src/                      # Query files
│   │   └── *.ql
│   └── codeql-suites/            # Query suites
│       └── *.qls
├── javascript-queries/
│   ├── qlpack.yml
│   ├── src/
│   └── codeql-suites/
├── python-queries/
│   ├── qlpack.yml
│   ├── src/
│   └── codeql-suites/
└── go-queries/
    ├── qlpack.yml
    ├── src/
    └── codeql-suites/
```

## Contributing

### Adding New Queries

1. Navigate to the appropriate language pack directory
2. Create a new `.ql` file in the `src/` directory
3. Include proper query metadata (see existing queries for examples)
4. Test your query against sample code
5. Submit a pull request

### Query Metadata Requirements

All queries must include:

```ql
/**
 * @name Query Name
 * @description Brief description of what the query detects
 * @kind problem
 * @problem.severity warning|error
 * @precision high|medium|low
 * @id navikt/unique-query-id
 * @tags security
 *       external/cwe/cwe-XXX
 */
```

### Testing Queries

Before submitting a query:

1. Test it against real code to ensure it works as expected
2. Verify it doesn't produce excessive false positives
3. Ensure the metadata is complete and accurate
4. Document any limitations or assumptions

## Publishing Packs

To publish updated versions of the packs:

1. Update the version in the respective `qlpack.yml` file
2. Use the CodeQL CLI to publish:
   ```bash
   codeql pack publish <pack-directory>
   ```

## Resources

- [CodeQL Documentation](https://codeql.github.com/docs/)
- [CodeQL Query Writing](https://codeql.github.com/docs/writing-codeql-queries/)
- [CodeQL Pack Documentation](https://codeql.github.com/docs/codeql-cli/about-codeql-packs/)
- [GitHub Code Scanning](https://docs.github.com/en/code-security/code-scanning)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.