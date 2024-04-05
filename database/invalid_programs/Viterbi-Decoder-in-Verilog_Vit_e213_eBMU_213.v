/*============================================================================
   module eBMU_213.v

   Branch Metric Computation Unit for (2,1,3) backward label  Viterbi Decoder.

===========================================================================*/

module eBMU_213(HD1,  HD2, HD3, HD4, 
                HD5,  HD6, HD7, HD8, 
                HD9,  HD10, HD11, HD12, 
                HD13, HD14, HD15, HD16,
                Rx
               );

`include "params_e213.inc"

   output [1:0]  HD1;
   output [1:0]  HD2;
   output [1:0]  HD3;
   output [1:0]  HD4;
   output [1:0]  HD5;
   output [1:0]  HD6;
   output [1:0]  HD7;
   output [1:0]  HD8;
   output [1:0]  HD9;
   output [1:0]  HD10;
   output [1:0]  HD11;
   output [1:0]  HD12;
   output [1:0]  HD13;
   output [1:0]  HD14;
   output [1:0]  HD15;
   output [1:0]  HD16;   


   input [1:0] 	 Rx;

   reg [1:0] 	 HD1;
   reg [1:0] 	 HD2;
   reg [1:0] 	 HD3;
   reg [1:0] 	 HD4;
   reg [1:0] 	 HD5;
   reg [1:0] 	 HD6;
   reg [1:0] 	 HD7;
   reg [1:0] 	 HD8;
   reg [1:0] 	 HD9;
   reg [1:0] 	 HD10;
   reg [1:0] 	 HD11;
   reg [1:0] 	 HD12;
   reg [1:0] 	 HD13;
   reg [1:0] 	 HD14;
   reg [1:0] 	 HD15;
   reg [1:0] 	 HD16;   
   


   always @(Rx)
     begin

       case (Rx)//synopsys full_case
   
        2'b00: begin
                  HD1 <=2'b00; HD2 <=2'b10; HD3 <=2'b01; HD4 <=2'b01;
                  HD5 <=2'b10; HD6 <=2'b00; HD7 <=2'b01; HD8 <=2'b01;
                  HD9 <=2'b10; HD10<=2'b00; HD11<=2'b01; HD12<=2'b01;
                  HD13<=2'b00; HD14<=2'b10; HD15<=2'b01; HD16<=2'b01;
               end
               
        2'b01: begin
                  HD1 <=2'b01; HD2 <=2'b01; HD3 <=2'b00; HD4 <=2'b10;
                  HD5 <=2'b01; HD6 <=2'b01; HD7 <=2'b10; HD8 <=2'b00;
                  HD9 <=2'b01; HD10<=2'b01; HD11<=2'b10; HD12<=2'b00;
                  HD13<=2'b01; HD14<=2'b01; HD15<=2'b00; HD16<=2'b10;
               end
         
        2'b10: begin
                  HD1 <=2'b01; HD2 <=2'b01; HD3 <=2'b10; HD4 <=2'b00;
                  HD5 <=2'b01; HD6 <=2'b01; HD7 <=2'b00; HD8 <=2'b10;
                  HD9 <=2'b01; HD10<=2'b01; HD11<=2'b00; HD12<=2'b10;
                  HD13<=2'b01; HD14<=2'b01; HD15<=2'b10; HD16<=2'b00;
               end

        2'b11: begin
                  HD1 <=2'b10; HD2 <=2'b00; HD3 <=2'b01; HD4 <=2'b01;
                  HD5 <=2'b00; HD6 <=2'b10; HD7 <=2'b01; HD8 <=2'b01;
                  HD9 <=2'b00; HD10<=2'b10; HD11<=2'b01; HD12<=2'b01;
                  HD13<=2'b10; HD14<=2'b00; HD15<=2'b01; HD16<=2'b01;
               end
       endcase // case(Rx)
  end
   

endmodule 
