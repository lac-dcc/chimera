module spram2(/*AUTOARG*/
   // Outputs
   ao_data,
   // Inputs
   clk, rst, ai_ce, ai_we, ai_oe, ai_addr_w,ai_addr_r, ai_data,ao_valid
   );

   //
   // Default address and data buses width
   //
   parameter aw = 1;
   parameter dw = 1;

   //
   // Generic synchronous single-port RAM interface
   //
   input			clk;	// Clock
   input                        rst;
   input			ai_ce;	// Chip enable input
   input			ai_we;	// Write enable input
   input			ai_oe;	// Output enable input
   input [aw-1:0]               ai_addr_w;	// address bus inputs
   input [aw-1:0]               ai_addr_r;	
   input [dw-1:0]               ai_data;	// input data bus
   input			ao_valid;
   output [dw-1:0]              ao_data;	// output data bus

   //
   // Generic single-port synchronous RAM model
   //

   //
   // Generic RAM's registers and wires
   //
   reg [dw-1:0]                 mem [(1<<aw)-1:0];	// RAM content
   reg [aw-1:0]                 addr_reg;		// RAM address register
   reg                          ai_oe_reg;

   //
   // Data output drivers
   //
   assign ao_data = (ai_oe_reg) ? mem[addr_reg] : {dw{1'bz}};

   //
   // RAM address register
   //
	
   always @(posedge clk)
	if(ao_valid) 
	ai_oe_reg <= ai_oe;

   always @(posedge clk) 
     if (ai_ce)
       addr_reg <=  ai_addr_r;

   //
   // RAM write
   //
   always @(posedge clk)
     if (ai_ce && ai_we)
       mem[ai_addr_w] <=  ai_data;

endmodule
