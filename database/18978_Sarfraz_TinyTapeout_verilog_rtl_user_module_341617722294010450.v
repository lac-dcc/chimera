// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

module user_module_341617722294010450(
  input wire [7:0] io_in,
  output wire [7:0] out
);
  wire [7:0] io_in__1;
  wire [7:0] io_in__2;
  wire [7:0] io_in__3;
  assign io_in__1 = io_in ^ {4'h0, io_in[7:4]};
  assign io_in__2 = io_in__1 ^ {2'h0, io_in__1[7:2]};
  assign io_in__3 = io_in__2 ^ {1'h0, io_in__2[7:1]};
  assign out = io_in__3;
endmodule
