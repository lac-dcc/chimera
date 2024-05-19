// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 ** Component : TTL_74648                                                    **
 **                                                                          **
 ** OCTAL BUS TRANSCEIVERS AND REGISTERS WITH 3-STATE OUTPUTS                **
 ** (INVERTING)                                                              **
 **                                                                          **
 ** DOC: https://www.ti.com/lit/ds/symlink/sn54as646.pdf                     **
 *****************************************************************************/

 module TTL_74648( 
   input[7:0] A_IN,
   input[7:0] B_IN,
   input CLKAB,
   input CLKBA,
   input DIR,   // Direction (1=A to B, 0=B to A)
   input OE_n,  // Output Enable Negated
   input SAB,   // Select-Control AB - multiplex stored and real-time (transparent mode) registeres
   input SBA,   // Select-Control BA - multiplex stored and real-time (transparent mode) registeres. 0=REAL-TIME

   output[7:0] A_OUT_n,
   output[7:0] B_OUT_n
);



   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_sab;
   wire s_clkab;
   wire s_sba;
   wire s_clkba;
   wire s_dir;
   wire s_oe_n;

   wire [15:0] a_in_n;
   wire [15:0] b_in_n;


   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_sab   = SAB;
   assign s_clkab = CLKAB;
   assign s_sba   = SBA;
   assign s_clkba = CLKBA;
   assign s_dir   = DIR;
   assign s_oe_n  = OE_n;

   assign a_in_n = ~A_IN;
   assign b_in_n = ~B_IN;
   

   
   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   reg [7:0] regA;
   reg [7:0] regB;

   always @(posedge s_clkab )
   begin
      regA <= a_in_n;
   end

   always @(posedge s_clkba )
   begin
      regB <= b_in_n;
   end

   
/*
A_OUT:
   If OE_n is not active (low), the output is 0.

   If DIR is 0 (B to A direction):
      If SBA is 0, A_OUT gets real-time data from B_IN.
      If SBA is 1, A_OUT gets stored data from regB.

*/
   // sdir = 0 => B => A   

   // s_sba = 0 => Real Time B to A
   // s_sba = 1 => Register  B to A
   assign A_OUT_n = !s_oe_n ? 8'b0 : !s_dir ?  ((!s_sba) ? b_in_n : regB) : 8'b0;
   

/*
B_OUT:
      If OE_n is not active (low), the output is 0.
      
      If DIR is 1 (A to B direction):
         If SAB is 0, B_OUT gets real-time data from A_IN.
         If SAB is 1, B_OUT gets stored data from regA.
*/

   // sdir = 1 => A => B

   // s_sab = 0 => Real Time A to B
   // s_sab = 1 => Register  A to B
   assign B_OUT_n = !s_oe_n ? 8'b0 : s_dir ?  ((!s_sab) ? a_in_n : regA) : 8'b0;

endmodule
