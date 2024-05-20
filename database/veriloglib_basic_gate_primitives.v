// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module gate_primitives
(
  input i1, i2,
  input [3:0] ctrl,
  output o
);

    wire [11:0] o_int;
  
    // Gate types
    and  and1 (o_int[0], i1, i2);
    or   or1 (o_int[1], i1, i2);
    nand nand1(o_int[2], i1, i2);
    nor  nor1(o_int[3], i1, i2);
    xor  xor1 (o_int[4], i1, i2);
    xnor xnor1(o_int[5], i1, i2);
    
    // Buffer and inverter on i1
    buf buf1(o_int[6], i1);
    not not1(o_int[7], i1);
    
    // Tristate buffers and inverters (i2 used as control signal)
    bufif1 bufifone(o_int[8], i1, i2);
    bufif0 bufifzero(o_int[9], i1, i2);
    notif1 notifone(o_int[10], i1, i2);
    notif0 notifzero(o_int[11], i1, i2);

    // Multiplex requested output
    assign o = o_int[ctrl];
  
endmodule
