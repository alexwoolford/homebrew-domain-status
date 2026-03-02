# Homebrew Tap for domain_status

Concurrent URL status checker that captures comprehensive metadata in SQLite.

## Installation

```bash
brew tap alexwoolford/domain-status
brew install domain_status
```

## Usage

```bash
# Scan URLs from a file
domain_status scan urls.txt

# Export results
domain_status export --format csv --db-path domain_status.db
domain_status export --format jsonl --db-path domain_status.db
domain_status export --format parquet --output results.parquet --db-path domain_status.db
```

## More Information

- [GitHub Repository](https://github.com/alexwoolford/domain_status)
- [crates.io](https://crates.io/crates/domain_status)
- [Documentation](https://docs.rs/domain_status)
