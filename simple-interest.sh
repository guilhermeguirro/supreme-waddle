#!/bin/bash

# Function to calculate simple interest
calculate_simple_interest() {
    principal=$1
    rate=$2
    time=$3

    # Check if the inputs are valid numbers
    if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: Please provide valid numeric values for principal, rate, and time."
        exit 1
    fi

    # Calculate simple interest
    interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

    # Output the result
    echo "Principal Amount: $principal"
    echo "Rate of Interest: $rate%"
    echo "Time (in years): $time"
    echo "Simple Interest: $interest"
}

# Main script
if [ $# -ne 3 ]; then
    echo "Usage: $0 <principal> <rate> <time>"
    echo "Example: $0 1000 5 2"
    exit 1
fi

# Call the function with provided arguments
calculate_simple_interest $1 $2 $3
