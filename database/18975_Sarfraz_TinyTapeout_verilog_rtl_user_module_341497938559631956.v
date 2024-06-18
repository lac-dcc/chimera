// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

module user_module_341497938559631956(
  input wire [7:0] io_in,
  output wire [7:0] out
);
  assign out = ~io_in;
endmodule
