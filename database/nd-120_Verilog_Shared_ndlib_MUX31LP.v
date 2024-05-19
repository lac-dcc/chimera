// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 ** Component : MUX31LP                                                      **
 **                                                                          **
 ** Manually cleaned up from logisim generator that creates wires not used.. **
 *****************************************************************************/

module MUX31LP( input A,
                input B,
                input D0,
                input D1,
                input D2,
                output ZN );

   wire [1:0] s_select;
   wire       s_d0;
   wire       s_d1;
   wire       s_d2;         

   wire       s_muxout;   

   assign s_select[0]   = A;
   assign s_select[1]   = B;
   assign s_d0          = D0;   
   assign s_d1          = D1;
   assign s_d2          = D2;

   assign ZN = ~s_muxout;


   Multiplexer_4   PLEXERS_1 (
                              .muxIn_0(s_d0),
                              .muxIn_1(s_d1),
                              .muxIn_2(s_d2),
                              .muxIn_3(s_d2),
                              .muxOut(s_muxout),
                              .sel(s_select[1:0]));


endmodule
