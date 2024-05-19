// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

module user_module_341497971083313748(
  input wire [7:0] io_in,
  output wire [7:0] out
);
  wire [1:0] add_347;
  wire [1:0] add_349;
  wire [1:0] add_351;
  wire [1:0] add_353;
  wire [2:0] add_359;
  wire [2:0] add_361;
  wire [3:0] add_365;
  assign add_347 = {1'h0, io_in[0]} + {1'h0, io_in[1]};
  assign add_349 = {1'h0, io_in[2]} + {1'h0, io_in[3]};
  assign add_351 = {1'h0, io_in[4]} + {1'h0, io_in[5]};
  assign add_353 = {1'h0, io_in[6]} + {1'h0, io_in[7]};
  assign add_359 = {1'h0, add_347} + {1'h0, add_349};
  assign add_361 = {1'h0, add_351} + {1'h0, add_353};
  assign add_365 = {1'h0, add_359} + {1'h0, add_361};
  assign out = {4'h0, add_365};
endmodule
