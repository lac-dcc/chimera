// This program was cloned from: https://github.com/suyashmahar/RISC-processor
// License: MIT License

`timescale 1ns / 1ps

module RegfileModule 
  (
   input wire 		clk,

   input wire [4 : 0] 	Ra,
   input wire [4 : 0] 	Rb,
   input wire [4 : 0] 	Rc,

   input wire 		WERF,
   input wire 		RA2SEL,

   input wire [31 : 0] 	WD,

   input wire [4:0] 	XPReg,
   input wire 		WASEL,

   output wire [31 : 0] RD1,
   output wire [31 : 0] RD2
   );
   
   // Connects RA2 selection mux to ra2 port
   // on register file
   reg [4 : 0] 		ra2_loc;
   
   wire [4:0] 		WA;
   assign WA = WASEL ? XPReg : Rc;
   
   // Register file module instantiation for
   // memory declaration
   RegisterFile reg_file_instance_0 
     (
      .clk_i(clk),
       
      .w_add_i(WA),        // Rc <25:21>
      .w_dat_i(WD),
      .write_en_i(WERF),
       
      .a_add_sel(Ra),
      .b_add_sel(ra2_loc),
       
      .r_port_a_o(RD1),
      .r_port_b_o(RD2)
      );

   // Logic for selection of register 2
   always @(*) begin
       #2
         if (RA2SEL == 1'b1) begin
             ra2_loc = Rc;
         end else begin
             ra2_loc = Rb;
         end
   end
endmodule
