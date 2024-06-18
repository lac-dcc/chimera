// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "ErrorCheckerDP.v"
`include "ErrorCheckerController.v"

module ErrorCheckerDriver (
    x_bus,
    y_bus,
    b1_bus,
    b0_bus,
    en,
    clk,
    rst,
    error_bus,
    error_checker_ready,
    error_checker_done
);

  input [19:0] x_bus, y_bus, b1_bus, b0_bus;
  input en, clk, rst;

  output [19:0] error_bus;
  output error_checker_ready, error_checker_done;

  wire h_x_ld;

  ErrorCheckerDP data_path (
      .b1_bus(b1_bus),
      .b0_bus(b0_bus),
      .x_bus(x_bus),
      .y_bus(y_bus),
      .h_x_ld(h_x_ld),
      .clk(clk),
      .rst(rst),
      .error_bus(error_bus)
  );

  ErrorCheckerController controller (
      .en(en),
      .cout(cout),
      .clk(clk),
      .rst(rst),
      .error_checker_ready(error_checker_ready),
      .error_checker_done(error_checker_done),
      .h_ld(h_x_ld)
  );

endmodule
