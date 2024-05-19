// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

module io_port
  (
   input wire 	      clk,
   input wire 	      resetb,
   /* verilator lint_off UNUSED */
   input wire [7:0]   io_addr/*verilator public*/,
   input wire 	      io_en/*verilator public*/,
   /* verilator lint_on UNUSED */
   input wire 	      io_we/*verilator public*/,
   input wire [31:0]  io_data_write/*verilator public*/,
   output wire [31:0] io_data_read,
   output wire 	      irq_mtimecmp,
   output reg [7:0]   gpio0
   );

   wire 	      mtime_we;
   wire [31:0] 	      mtime_dout;

   assign mtime_we = io_addr[7:4] == 4'b0001 ? io_we : 1'b0;

   assign io_data_read = io_addr[7:4] == 4'b0001 ? mtime_dout : 32'bX;

   // GPIO0 is at 0x80000000, the same address as testbench commands.
   // However, it only uses the lowest byte
   always @ (posedge clk) begin : GPIO0
      if (!resetb) begin
	 gpio0 <= 8'b0;
      end
      else if (clk) begin
	 if (io_addr[7:2] == 6'b0 && io_we) begin
	    gpio0 <= io_data_write[7:0];
	 end
      end
   end

   timer TIMER0
     (
      .clk(clk), .resetb(resetb),
      .io_addr_3_2(io_addr[3:2]), .io_we(mtime_we), .io_din(io_data_write),
      .io_dout(mtime_dout), .irq_mtimecmp(irq_mtimecmp)
      );

endmodule
