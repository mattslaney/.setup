# Prints the CPU usage: user% sys% idle.

run_segment() {
    iodata=$(iostat -y 1 1 | awk 'NR>7 { kbr += $3; kbw += $4 } END { printf("R%s W%s\n", kbr, kbw) }')
    echo "$iodata"
    return 0
}
