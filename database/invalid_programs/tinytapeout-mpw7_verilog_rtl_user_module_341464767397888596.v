// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341464767397888596(
  input [7:0] io_in, 
  output [7:0] io_out
);

wire [2:0] a;
wire [2:0] b;
wire [3:0] c;

assign a = io_in[3:1];
assign b = io_in[6:4];
assign c = a+b;

assign io_out[0] = c[1] || (!c[2]&&!c[0]) || (c[2]&&c[0]);
assign io_out[1] = (!c[2]&&!c[0]) || (!c[1]&&!c[0]) || (c[1]&&c[0]);
assign io_out[2] = c[2] || (!c[1]&&!c[0]) || (c[1]&&c[0]);
assign io_out[3] = (!c[2]&&!c[0])|| (!c[2]&&c[1])|| (c[1]&&!c[0])|| (c[2]&&!c[1]&&c[0]);
assign io_out[4] = (c[1]&& !c[0]) || (!c[2]&&!c[1]);
assign io_out[5] = !c[1] || (c[2]&& !c[0]);
assign io_out[6] =  (!c[2]&& c[1])|| (c[1]&&!c[0])||(c[2]&&!c[1]);
assign io_out[7] = c[3];


endmodule
