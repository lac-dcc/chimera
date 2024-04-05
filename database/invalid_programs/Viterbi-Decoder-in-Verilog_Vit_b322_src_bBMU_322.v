/*============================================================================
   module bBMU_322.v

   Branch Metric Computation Unit for (3,2,2) backward label  Viterbi Decoder.

===========================================================================*/

module bBMU_322(HD1,HD2,HD3,HD4,
                HD5,HD6,HD7,HD8,
                HD9,HD10,HD11,HD12,
                HD13,HD14,HD15,HD16,
                HD17,HD18,HD19,HD20,
                HD21,HD22,HD23,HD24,
                HD25,HD26,HD27,HD28,
                HD29,HD30,HD31,HD32,
                Rx, le, reset, clock);
                
`include "params_b322.inc"

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
   output [1:0]  HD17;
   output [1:0]  HD18;
   output [1:0]  HD19;
   output [1:0]  HD20;
   output [1:0]  HD21;
   output [1:0]  HD22;
   output [1:0]  HD23;
   output [1:0]  HD24;
   output [1:0]  HD25;
   output [1:0]  HD26;
   output [1:0]  HD27;
   output [1:0]  HD28;
   output [1:0]  HD29;
   output [1:0]  HD30;
   output [1:0]  HD31;
   output [1:0]  HD32;   
   

   input [`n-1:0] Rx;
   input 	  le;
   input 	  reset;
   input 	  clock;
   
   
   reg [1:0] 	 HD1;
   reg [1:0]     HD2;
   reg [1:0]     HD3;
   reg [1:0]     HD4;
   reg [1:0]     HD5;
   reg [1:0]     HD6;
   reg [1:0]     HD7;
   reg [1:0]     HD8;
   reg [1:0]     HD9;
   reg [1:0]     HD10;
   reg [1:0]     HD11;
   reg [1:0]     HD12;
   reg [1:0]     HD13;
   reg [1:0]     HD14;
   reg [1:0]     HD15;
   reg [1:0]     HD16;
   reg [1:0]     HD17;
   reg [1:0]     HD18;
   reg [1:0]     HD19;
   reg [1:0]     HD20;
   reg [1:0]     HD21;
   reg [1:0]     HD22;
   reg [1:0]     HD23;
   reg [1:0]     HD24;
   reg [1:0]     HD25;
   reg [1:0]     HD26;
   reg [1:0]     HD27;
   reg [1:0]     HD28;
   reg [1:0]     HD29;
   reg [1:0]     HD30;
   reg [1:0]     HD31;
   reg [1:0]     HD32;   

   always @(posedge clock or posedge reset)
     begin
        if (reset)
          begin
             HD1<=2'b00;  HD2<=2'b10;  HD3<=2'b10;  HD4<=2'b10;
             HD5<=2'b10;  HD6<=2'b10;  HD7<=2'b10;  HD8<=2'b00;
             HD9<=2'b01;  HD10<=2'b01; HD11<=2'b11; HD12<=2'b10;
             HD13<=2'b10; HD14<=2'b11; HD15<=2'b01; HD16<=2'b01;
             HD17<=2'b10; HD18<=2'b10; HD19<=2'b00; HD20<=2'b10;
             HD21<=2'b10; HD22<=2'b00; HD23<=2'b10; HD24<=2'b10;
             HD25<=2'b11; HD26<=2'b01; HD27<=2'b01;HD28<=2'b01;
             HD29<=2'b01; HD30<=2'b01; HD31<=2'b01; HD32<=2'b11;
	  end // if (reset)
	else if (le)
	  begin
             case (Rx)//synopsys full_case parallel_case
               3'b000: begin
                          HD1<=2'b00;  HD2<=2'b10;  HD3<=2'b10;  HD4<=2'b10;
                          HD5<=2'b10;  HD6<=2'b10;  HD7<=2'b10;  HD8<=2'b00;
                          HD9<=2'b01;  HD10<=2'b01; HD11<=2'b11; HD12<=2'b10;
                          HD13<=2'b10; HD14<=2'b11; HD15<=2'b01; HD16<=2'b01;
                          HD17<=2'b10; HD18<=2'b10; HD19<=2'b00; HD20<=2'b10;
                          HD21<=2'b10; HD22<=2'b00; HD23<=2'b10; HD24<=2'b10;
                          HD25<=2'b11; HD26<=2'b01; HD27<=2'b01;HD28<=2'b01;
                          HD29<=2'b01; HD30<=2'b01; HD31<=2'b01; HD32<=2'b11;
                       end
               3'b001: begin
                          HD1<=2'b01;  HD2<=2'b01;  HD3<=2'b11;  HD4<=2'b01;
                          HD5<=2'b01;  HD6<=2'b11;  HD7<=2'b01;  HD8<=2'b01;
                          HD9<=2'b00;  HD10<=2'b10; HD11<=2'b10; HD12<=2'b10;
                          HD13<=2'b10; HD14<=2'b10; HD15<=2'b10; HD16<=2'b00;
                          HD17<=2'b11; HD18<=2'b01; HD19<=2'b01; HD20<=2'b01;
                          HD21<=2'b01; HD22<=2'b01; HD23<=2'b01; HD24<=2'b11;
                          HD25<=2'b10; HD26<=2'b10; HD27<=2'b00; HD28<=2'b10;
                          HD29<=2'b10; HD30<=2'b00; HD31<=2'b10; HD32<=2'b10;
                       end
               3'b010: begin
                          HD1<=2'b01;  HD2<=2'b11;  HD3<=2'b01;  HD4<=2'b01;
                          HD5<=2'b01;  HD6<=2'b01;  HD7<=2'b11;  HD8<=2'b01;
                          HD9<=2'b10;  HD10<=2'b10; HD11<=2'b10; HD12<=2'b00;
                          HD13<=2'b00; HD14<=2'b10; HD15<=2'b10; HD16<=2'b10;
                          HD17<=2'b01; HD18<=2'b01; HD19<=2'b01; HD20<=2'b11;
                          HD21<=2'b11; HD22<=2'b01; HD23<=2'b01; HD24<=2'b01;
                          HD25<=2'b10; HD26<=2'b00; HD27<=2'b10; HD28<=2'b10;
                          HD29<=2'b10; HD30<=2'b10; HD31<=2'b00; HD32<=2'b10;
                       end
               3'b011: begin
                          HD1<=2'b10;  HD2<=2'b10;  HD3<=2'b10;  HD4<=2'b00;
                          HD5<=2'b00;  HD6<=2'b10;  HD7<=2'b10;  HD8<=2'b10;
                          HD9<=2'b01;  HD10<=2'b11; HD11<=2'b01; HD12<=2'b01;
                          HD13<=2'b01; HD14<=2'b01; HD15<=2'b11; HD16<=2'b01;
                          HD17<=2'b10; HD18<=2'b00; HD19<=2'b10; HD20<=2'b10;
                          HD21<=2'b10; HD22<=2'b10; HD23<=2'b00; HD24<=2'b10;
                          HD25<=2'b01; HD26<=2'b01; HD27<=2'b01; HD28<=2'b11;
                          HD29<=2'b11; HD30<=2'b01; HD31<=2'b01; HD32<=2'b01;
                       end
               3'b100: begin
                          HD1<=2'b01;  HD2<=2'b01;  HD3<=2'b01;  HD4<=2'b11;
                          HD5<=2'b11;  HD6<=2'b01;  HD7<=2'b01;  HD8<=2'b01;
                          HD9<=2'b10;  HD10<=2'b00; HD11<=2'b10; HD12<=2'b10;
                          HD13<=2'b10; HD14<=2'b10; HD15<=2'b00; HD16<=2'b10;
                          HD17<=2'b01; HD18<=2'b11; HD19<=2'b01; HD20<=2'b01;
                          HD21<=2'b01; HD22<=2'b01; HD23<=2'b11; HD24<=2'b01;
                          HD25<=2'b10; HD26<=2'b10; HD27<=2'b10; HD28<=2'b00;
                          HD29<=2'b10; HD30<=2'b10; HD31<=2'b00; HD32<=2'b10;
                       end
               3'b101: begin
                          HD1<=2'b10;  HD2<=2'b00;  HD3<=2'b10;  HD4<=2'b10;
                          HD5<=2'b10;  HD6<=2'b10;  HD7<=2'b00;  HD8<=2'b10;
                          HD9<=2'b01;  HD10<=2'b01; HD11<=2'b01; HD12<=2'b11;
                          HD13<=2'b11; HD14<=2'b01; HD15<=2'b01; HD16<=2'b01;
                          HD17<=2'b10; HD18<=2'b10; HD19<=2'b10; HD20<=2'b00;
                          HD21<=2'b00; HD22<=2'b10; HD23<=2'b10; HD24<=2'b10;
                          HD25<=2'b01; HD26<=2'b11; HD27<=2'b01; HD28<=2'b01;
                          HD29<=2'b01; HD30<=2'b01; HD31<=2'b11; HD32<=2'b01;
                       end
               3'b110: begin
                          HD1<=2'b10;  HD2<=2'b10;  HD3<=2'b00;  HD4<=2'b10;
                          HD5<=2'b10;  HD6<=2'b00;  HD7<=2'b10;  HD8<=2'b10;
                          HD9<=2'b11;  HD10<=2'b01; HD11<=2'b01; HD12<=2'b01;
                          HD13<=2'b01; HD14<=2'b01; HD15<=2'b01; HD16<=2'b11;
                          HD17<=2'b00; HD18<=2'b10; HD19<=2'b10; HD20<=2'b10;
                          HD21<=2'b10; HD22<=2'b10; HD23<=2'b10; HD24<=2'b00;
                          HD25<=2'b01; HD26<=2'b01; HD27<=2'b11; HD28<=2'b01;
                          HD29<=2'b01; HD30<=2'b11; HD31<=2'b01; HD32<=2'b01;
                       end
               3'b111: begin
                          HD1<=2'b11;  HD2<=2'b01;  HD3<=2'b01;  HD4<=2'b01;
                          HD5<=2'b01;  HD6<=2'b01;  HD7<=2'b01;  HD8<=2'b11;
                          HD9<=2'b10;  HD10<=2'b10; HD11<=2'b00; HD12<=2'b10;
                          HD13<=2'b10; HD14<=2'b00; HD15<=2'b10; HD16<=2'b10;
                          HD17<=2'b01; HD18<=2'b01; HD19<=2'b11; HD20<=2'b01;
                          HD21<=2'b01; HD22<=2'b11; HD23<=2'b01; HD24<=2'b01;
                          HD25<=2'b00; HD26<=2'b10; HD27<=2'b10; HD28<=2'b10;
                          HD29<=2'b10; HD30<=2'b10; HD31<=2'b10; HD32<=2'b00;
                       end
             endcase // case(Rx)
          end // if (le)
     end // always @ (posedge clock or posedge reset)
   
	

endmodule

