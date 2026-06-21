#!/bin/bash
input="${1:-$(cat)}"
echo "$input" | awk '
{
  words += NF
  for (i=1; i<=NF; i++) {
    len = length($i)
    for (j=1; j<=len; j++) {
      char = substr($i, j, 1)
      if (char ~ /[a-zA-Z0-9]/) letters++
      if (char ~ /[.!?]/) {
        if (j == len) sentences++
      }
    }
  }
}
END {
  if (words > 0) {
    if (sentences == 0) sentences = 1
    L = (letters / words) * 100
    S = (sentences / words) * 100
    cli = 0.0588 * L - 0.296 * S - 15.8
    printf "CLI: %.2f (W: %d, L: %d, S: %d)\n", cli, words, letters, sentences
  } else {
    print "CLI: 0.00"
  }
}'
