Run Instructions

For both sequential and pipe model, the instructions must be hardcoded into the instruction memory in the fetch module.

For seq:

iverilog -o wrap wrap.v execute.v fetch.v memory.v pc_update.v decode.v ../ALU/ALU.v ADD.v SUB.v andfunc.v xorfunc.v fa.v
vvp wrap

For pipe:

