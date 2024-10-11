// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

module board_top
  (
   input wire clki,
   input wire resetb,
   output wire [7:0] gpio0
   );

   wire 	     clk;
   SB_GB clk_gb(.USER_SIGNAL_TO_GLOBAL_BUFFER(clki),
		.GLOBAL_BUFFER_OUTPUT(clk));

   cpu_top U0(.clk(clk), .resetb(resetb), .gpio0(gpio0));
   
endmodule // board_top
