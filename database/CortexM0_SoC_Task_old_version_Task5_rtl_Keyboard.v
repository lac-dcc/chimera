// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

 module Keyboard(
    input                 clk,
    input                 rstn,
    input                 key_clear,
    input        [3 :0]   col,
    output       [3 :0]   row,
    output                key_interrupt,
    output       [15:0]   key_data
);

wire  [15:0]  key;
keyboard_scan keyboard_scan(
     .clk(clk)
    ,.rstn(rstn)
    ,.col(col)
    ,.row(row)
    ,.key(key)
);

wire [15:0] key_pulse;
keyboard_filter keyboard_filter(
     .clk(clk)
    ,.rstn(rstn)
    ,.key_in(key)
    ,.key_pulse(key_pulse)
);

assign key_interrupt = |key_pulse ;

keyboard_reg keyboard_reg(
     .rstn(rstn)
    ,.key_clear(key_clear)
    ,.key_pulse(key_pulse)
    ,.key_reg(key_data)
);

endmodule