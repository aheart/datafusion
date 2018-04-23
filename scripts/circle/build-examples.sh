#!/usr/bin/env bash
#
# Builds examples

set -e

cargo build --examples
cargo run --example csv_dataframe
cargo run --example csv_sql
cargo run --example parquet_dataframe
cargo run --example parquet_sql
