// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

module user_module_341497964482527828(
  input wire [7:0] io_in,
  output wire [7:0] out
);
  wire [7:0] io_in__1;
  wire [6:0] add_121;
  wire [3:0] add_127;
  assign io_in__1 = io_in - ({1'h0, io_in[7:1]} & 8'h55);
  assign add_121 = (io_in__1[6:0] & 7'h33) + ({1'h0, io_in__1[7:2]} & 7'h33);
  assign add_127 = add_121[3:0] + {1'h0, add_121[6:4]};
  assign out = {4'h0, add_127};
endmodule
