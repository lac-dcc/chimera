// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

/*
 This is an Internal-Forwarding Register File(IFRF). It has 3 ports,
 two read-only for rs1 and rs2, and one write-only for rd. 
 
 x0 always reads 0, and have no effect writing (though it is actually 
 written into RF, the value can never be read)
 
 During writeback, if rd address equals to rs1/rs2 address, the source
 register outputs the latest value.
 
 This IFRF is implemented using an array of registers, consuming 32x32=1024
 registers instead of the scarcer BRAMs. More importantly, register access
 is finished in a single clock, allowing the pipeline to be as short as 
 two stages.
 */

module regfile(
	       input wire 	  clk, input wire resetb,
	       input wire [4:0]   a_rs1,
	       output reg [31:0] d_rs1,
	       input wire [4:0]   a_rs2,
	       output reg [31:0] d_rs2,
	       input wire [4:0]   a_rd,
	       input wire [31:0] d_rd,
	       input wire we_rd
	       );

   // 32x32 registers
   reg [31:0] 		  data [0:31];
   // Temporary variable
   integer 		  i;

   always @ (posedge clk, negedge resetb) begin : MAIN_CLK_PROCESS
      if (!resetb) begin
	 // Registers do not initialize
	 for (i = 0; i < 32; i = i + 1) begin
	    data[i] <= 32'bX;
	 end
      end
      else if (clk) begin
	 // Write back
	 if (we_rd) begin
	    data[a_rd] <= d_rd;
	 end
      end
   end // block: MAIN_CLK_PROCESS

   always @ (*) begin : COMBINATIONAL_PROCESS
      // Forwarding rs1
      if (a_rs1 == 5'b0)
	d_rs1 = 32'b0;
      else if (we_rd && a_rd != 5'b0 && a_rs1 == a_rd)
	d_rs1 = d_rd;
      else
	d_rs1 = data[a_rs1];
      // Forwarding rs2
      if (a_rs2 == 5'b0)
	d_rs2 = 32'b0;
      else if (we_rd && a_rd != 5'b0 && a_rs2 == a_rd)
	d_rs2 = d_rd;
      else
	d_rs2 = data[a_rs2];
   end
   
endmodule // regfile
