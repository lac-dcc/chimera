// This program was cloned from: https://github.com/necaticakaci/matrak
// License: MIT License

// Matrak M10 RV32I RISC-V Processor
// Gülpare II Architechture 2023
// Nexys A7 Wrapper Module

module wrapper (
   input             clk_100_i,
   input             rst_i,
   output [7:0]      gpio_o,
   output            uart_tx_o
);

   wire clk_50;

   clk_50mhz clk1 (
      .clk_out1(clk_50),
      .clk_in1(clk_100_i)
   );

   top t1 (
      .clk_i(clk_50),
      .rst_i(!rst_i),
      .gpio_o(gpio_o),
      .uart_tx_o(uart_tx_o)
   );

endmodule
