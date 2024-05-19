// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Component : TTL_74534                                                    **
 **                                                                          **
 ** 74HC534 Octal D-type Flip-Flop                                           **
 ** (NEGATED OUTPUTS)                                                        **
 *****************************************************************************/

module TTL_74534( 
   input CK,
   input OE_n,

   input [7:0] D,
   output [7:0] Q_n
);   


   wire s_ck;
   wire s_oe_n;   
   wire [7:0] s_d_n;

   reg [7:0] regQ_n;


   assign s_ck = CK;
   assign s_oe_n = OE_n;
   assign s_d_n = ~D;
   
   always @(posedge s_ck )
   begin
      regQ_n <= s_d_n;
   end

   assign Q_n = s_oe_n ? 8'b0 : regQ_n;
endmodule
