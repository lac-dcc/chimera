// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0

/*
==========================================================================
Synchronizer.v
==========================================================================
 - RTL code for the Synchronizer module.
 - It samples the input signal using the device clock and also detects
     positive and negative edges.
 - Reference: https://www.fpga4fun.com/SPI2.html
*/

`ifndef SPI_HELPERS_SYNCHRONIZER
`define SPI_HELPERS_SYNCHRONIZER

module spi_helpers_Synchronizer #(
  parameter bit reset_value = 0
) (
  input  logic clk,
  input  logic reset,
  input  logic in_,
  output logic posedge_,
  output logic negedge_,
  output logic out
);
  logic [2:0] shreg;  // Clock value history

  always_comb begin
    posedge_ = (~shreg[2]) & shreg[1];  // Low to high transition
    negedge_ = shreg[2] & (~shreg[1]);  // High to low transition
  end

  always_ff @(posedge clk) begin
    if (reset) begin
      shreg <= {3{reset_value}};
    end else shreg <= {shreg[1:0], in_};
  end

  assign out = shreg[1];

endmodule

`endif
