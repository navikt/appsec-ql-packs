# appsec-ql-packs

Custom CodeQL model packs for extending CodeQL analysis in NAV IT repositories.

## Contents

This repository contains data extension models for GitHub Actions analysis.

### Trusted Actions Publishers

The model extends the list of trusted Actions publishers for the `actions/unpinned-tag` query. Actions from trusted publishers are allowed to use unpinned tags without triggering security alerts.

**Trusted actions:**
- `navikt/automerge-dependabot` - NAV IT automated dependency management

## Usage

To use this model pack in your CodeQL analysis:

1. Reference this pack in your CodeQL configuration
2. The models will be automatically applied during analysis

For more information, see [Customizing library models for GitHub Actions](https://docs.github.com/en/code-security/codeql-for-vs-code/using-the-advanced-functionality-of-the-codeql-for-vs-code-extension/customizing-library-models-for-github-actions)