#!/usr/bin/env bash

set -euo pipefail

VOUT="$(readlink -f $(dirname $0))"

mkdir -p "$VOUT"

# Does not omit attributes when empty, FWIW.

for kind in assert assume cover; do
for conc in false true; do
for guards in '[]' '["USE_UNR_ONLY_CONSTRAINTS"]'; do
for format in '""' '"sva"' '"ifElseFatal"'; do
for label in '""' '"label"'; do
for msg in '""' '"message"'; do

mlir=$(cat <<EOF
firrtl.circuit "Verif" {
  firrtl.module @Verif(in %clock: !firrtl.clock, in %cond: !firrtl.uint<1>, in %enable: !firrtl.uint<1>) attributes {convention = #firrtl<convention scalarized>} {
    firrtl.$kind %clock, %cond, %enable, $msg : !firrtl.clock, !firrtl.uint<1>, !firrtl.uint<1>  {eventControl = 0 : i32, isConcurrent = $conc, format = $format, guards = $guards, name = $label }
  }
}
EOF)

line=$(echo "$mlir" | grep "firrtl.$kind")
echo -e "\n\n"
echo "$line"

echo "->"
verilog=$(echo "$mlir" | firtool -format=mlir -)
echo "$verilog"
asSVAverilog=$(echo "$mlir" | firtool -format=mlir -emit-chisel-asserts-as-sva -)
echo "--asSVA-->"
echo "$asSVAverilog"

if [[ "$guards" == "[]" ]]; then
  hasG="no"
else
  hasG="unr"
fi
d="$VOUT/$kind/conc_$conc-guard_$hasG-fmt_$format-msg_$msg-name_$label"

mkdir -p "$d"
echo "$mlir" > $d/input.mlir
echo "$verilog" > $d/output.sv
echo "$asSVAverilog" > $d/output-as-svas.sv

done
done
done
done
done
done


# Dupe scan using jdupes

 jdupes -r . -X'onlyext:sv' > $VOUT/jdupes.log
