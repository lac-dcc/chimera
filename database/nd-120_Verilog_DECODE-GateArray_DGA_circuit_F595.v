// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 ** Component : F595                                                         **
 **                                                                          **
 ** R/S Latch with Gated input                                               **
 **                                                                          **
 ** Truth table from REN_A12213XJ5V1UM00_OTH_19980801.pdf                    **
 ** Page 6-214. Function RS-LATCH                                            **
 *****************************************************************************/

module F595( 
   input H01_S, // Set
   input H02_R, // Reset
   input H03_G, // Gate Enable

   output N01_Q, // Q
   output N02_QB // Qn
);

    /* verilator lint_off UNOPTFLAT */

   reg regQ;
   reg regQn;

   // Behavioral description of the R-S latch   
   //always @(posedge H01_S, posedge H02_R, posedge H03_G) begin

    /* verilator lint_off LATCH */

    always @* begin
      if (H03_G) begin
       if (H01_S & H02_R) begin              
           regQ = 1'b1;          
           regQn = 1'b1;                 
       end else if (H02_R & !H01_S) begin
           regQ = 1'b0;          
           regQn = 1'b1;          
       end else if (!H02_R & H01_S) begin
           regQ = 1'b1;          
           regQn = 1'b0;          
       end /*else begin
           regQ = regQ; // Explicitly maintaining previous state (to avoid warning/error "not all control paths of combinational always assign a value")
           regQn = regQn;
       end*/
    end
  end
  
  assign N01_Q = regQ;
  assign N02_QB = regQn;

endmodule
