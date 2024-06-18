// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

// Instanciates the internal high speed oscilator. This is needed
// only if the external Upduino oscilator is not connected to the FPGA.

module oscilator (
    output clk
);

  SB_HFOSC interal_osc (
      .CLKHFPU(1'b1),
      .CLKHFEN(1'b1),
      .CLKHF  (clk)
  );

endmodule
