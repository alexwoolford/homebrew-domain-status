# Homebrew Tap for domain-status

Concurrent URL status checker that captures comprehensive metadata in SQLite.

## Installation

```bash
brew tap alexwoolford/domain-status
brew install domain-status
```

`brew install domain_status` still works (tap alias). The formula installs both `domain-status` and `domain_status`.

## Usage

```bash
# Scan URLs from a file
domain-status scan urls.txt

# Export results
domain-status export --format csv --db-path domain_status.db
domain-status export --format jsonl --db-path domain_status.db
domain-status export --format parquet --output results.parquet --db-path domain_status.db
```

## More Information

- [GitHub Repository](https://github.com/alexwoolford/domain-status)
- [crates.io](https://crates.io/crates/domain-status)
- [Documentation](https://docs.rs/domain-status)
