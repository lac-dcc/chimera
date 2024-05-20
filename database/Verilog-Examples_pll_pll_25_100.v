// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

/*
* F_PLLIN:    25.000 MHz (given)
* F_PLLOUT:  100.000 MHz (requested)
* F_PLLOUT:  100.000 MHz (achieved)
* 
* FEEDBACK: SIMPLE
* F_PFD:   25.000 MHz
* F_VCO:  800.000 MHz
* 
* DIVR:  0 (4'b0000)
* DIVF: 31 (7'b0011111)
* DIVQ:  3 (3'b011)
* 
* FILTER_RANGE: 2 (3'b010)
*/

module pll_25_100(
        input  clock_in,
        output global_clock,
        output locked
        );

   wire        g_clock_int;
   
   
   SB_PLL40_CORE #(
//  SB_PLL40_PAD #(
                .FEEDBACK_PATH("SIMPLE"),
                .DIVR(4'b0000),
                .DIVF(7'b0011111),      
                .DIVQ(3'b011),
                .FILTER_RANGE(3'b010) 
        ) uut (
                .LOCK(locked),
                .RESETB(1'b1),
                .BYPASS(1'b0),
                .REFERENCECLK(clock_in),
//                .PACKAGEPIN(clock_in),
                .PLLOUTGLOBAL(g_clock_int)
                );

   SB_GB sbGlobalBuffer_inst( .USER_SIGNAL_TO_GLOBAL_BUFFER(g_clock_int), .GLOBAL_BUFFER_OUTPUT(global_clock) );
   
endmodule
