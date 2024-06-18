// This program was cloned from: https://github.com/suyashmahar/RISC-processor
// License: MIT License

`timescale 1ns / 1ps

module ProgramCounter #(
			parameter ARCHITECTURE = 32 
			)(
			  input wire 			 RESET, // Resets PC to 0x0
			  input wire 			 clk, // Global clk
			  input wire [2:0] 		 PCSEL, // Selects source of next PC 
			  input wire [31:0] 		 XAddr,
			  input wire [31:0] 		 RstAddr,
			  input wire [31:0] 		 IllOpAddr,
			  input wire 			 IRQ,
			  input wire [31:0] 		 JT,
			  input wire [31:0] 		 ShftSextC, // 4*SextC 

			  output wire [ARCHITECTURE-1:0] pc_o, // Program counter output
			  output wire [31:0] 		 PcIncr,
			  output wire [31:0] 		 branchOffset
			  );
   
   reg [31:0] 						 pc;
   
   wire 						 MsbJt;
   
   assign pc_o = RESET ? RstAddr : pc;
   assign PcIncr = pc + 32'h00000004;
   assign MsbJt = pc[31] ?  JT[31] : pc[31];
   assign branchOffset = PcIncr + ShftSextC;

   always @(posedge clk) begin
       if (RESET) begin
	   pc = RstAddr;
       end else if (IRQ & ~pc_o[31]) begin
	   pc = XAddr;
       end else begin
	   case (PCSEL)
	     3'b000:
	       pc = {{pc[31]}, {PcIncr[30:0]}};
	     3'b001:
	       pc = {{pc[31]}, {branchOffset[30:0]}};
	     3'b010:
	       pc = {{MsbJt}, {JT[30:0]}};
	     3'b011:
	       pc = IllOpAddr;
	     3'b100:
	       pc = XAddr;
	     default:
	       pc = RstAddr;
	   endcase // case (PCSEL)
       end // else: !if(RESET)
   end // always @ (*)
endmodule // ProgramCounter

