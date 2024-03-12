// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// see also ../../docs/reset_timings_waveform.json
`include "../7474/hct7474.v"

`timescale 1ns/1ns

// "Do not use an asynchronous reset within your design." - https://zipcpu.com/blog/2017/08/21/rules-for-newbies.html
module reset(
    input _RESET_SWITCH, // HOLD LO FOR RESET
    input system_clk,
    
    output _mrNeg,    // stays low for two cycles - clears later - goes high on the 1st negative edge after the positive edge that cleared _mrPos
    output phase_exec,  // phase clock - stops in low state during reset - so stops in the fetch phase which is the required initial phase
    output _phase_exec  // phase clock - stops in high state during reset - so stops in the fetch phase which is the required initial phase
);
    parameter LOG=0;

    wire _Qnotused;
    wire _mrPos;

    hct7474 #(.BLOCKS(1), .LOG(0)) resetff1(
          ._SD(1'b1),
          ._RD(_RESET_SWITCH),
          .D(1'b1),
          .CP(system_clk), 
          .Q(_mrPos),
          ._Q(_Qnotused)
        );


    // _reset_pc is same as MR however it clears on the neg edge so that the PC can reset on the previous +ve edge
    wire _system_clk;
    nand #(8) nand1(_system_clk, system_clk); 

    hct7474 #(.BLOCKS(1), .LOG(0)) resetff2(
          ._SD(1'b1),
          ._RD(_mrPos), // wont set back to H until after _mrPos clears
          .D(1'd1),
          .CP(_system_clk), // resets on the -ve edge after _mrPos is released
          .Q(_mrNeg),
          ._Q()
        );

    // H/W uses 74132 SCHMITT NAND
    nand #(10) nand2(phase_exec , system_clk , _mrPos); 
    nand #(10) nand3(_phase_exec , phase_exec); 

endmodule 
 

 
