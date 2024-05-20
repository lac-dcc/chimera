// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0


/*
* F_PLLIN:    25.000 MHz (given)
* F_PLLOUT:   40.000 MHz (requested)
* F_PLLOUT:   39.844 MHz (achieved)
* 
* FEEDBACK: SIMPLE
* F_PFD:   12.500 MHz
* F_VCO:  637.500 MHz
* 
* DIVR:  1 (4'b0001)
* DIVF: 50 (7'b0110010)
* DIVQ:  4 (3'b100)
* 
* FILTER_RANGE: 1 (3'b001)
*/

module pll_25_40(
        input  clock_in,
        output global_clock,
        output locked
        );

   wire        g_clock_int;
   
   
//   SB_PLL40_CORE #(
    SB_PLL40_PAD #(
                .FEEDBACK_PATH("SIMPLE"),
                .DIVR(4'b0001),
                .DIVF(7'b0110010),      
                .DIVQ(3'b100),
                .FILTER_RANGE(3'b001) 
        ) uut (
                .LOCK(locked),
                .RESETB(1'b1),
                .BYPASS(1'b0),
 //             .REFERENCECLK(clock_in),
                .PACKAGEPIN(clock_in),
                .PLLOUTGLOBAL(g_clock_int)
                );

   SB_GB sbGlobalBuffer_inst( .USER_SIGNAL_TO_GLOBAL_BUFFER(g_clock_int), .GLOBAL_BUFFER_OUTPUT(global_clock) );
   
endmodule
