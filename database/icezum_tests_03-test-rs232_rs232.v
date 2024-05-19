// This program was cloned from: https://github.com/FPGAwars/icezum
// License: GNU General Public License v3.0

//------------------------------------------------------------------
//-- Test: Test the DTR and RTS signasl (from the PC to the FPGA)
//-- They are shown in the led0 and led7 respectively
//------------------------------------------------------------------

module leds(input wire RTS,
            input wire DTR,
            output wire LED0,
            output wire LED7);

assign {LED0, LED7} = {DTR, RTS};

endmodule
