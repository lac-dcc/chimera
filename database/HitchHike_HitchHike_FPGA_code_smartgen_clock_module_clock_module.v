`timescale 1 ns/100 ps
// Version: v11.5 11.5.0.26


module clock_module(
       GL,
       CLK
    );
output GL;
input  CLK;

    wire GND;
    wire GND_power_net1;
    assign GND = GND_power_net1;
    
    CLKDLY Inst1 (.CLK(CLK), .GL(GL), .DLYGL0(GND), .DLYGL1(GND), 
        .DLYGL2(GND), .DLYGL3(GND), .DLYGL4(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    
endmodule

// _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


// _GEN_File_Contents_

// Version:11.5.0.26
// ACTGENU_CALL:1
// BATCH:T
// FAM:PA3LCLP
// OUTFORMAT:Verilog
// LPMTYPE:LPM_PLL_CLKDLY
// LPM_HINT:NONE
// INSERT_PAD:NO
// INSERT_IOREG:NO
// GEN_BHV_VHDL_VAL:F
// GEN_BHV_VERILOG_VAL:F
// MGNTIMER:F
// MGNCMPL:T
// DESDIR:Z:/fpga_vision/test_tmp/smartgen\clock_module
// GEN_BEHV_MODULE:F
// SMARTGEN_DIE:UM4X4M1NLPLV
// SMARTGEN_PACKAGE:vq100
// AGENIII_IS_SUBPROJECT_LIBERO:T
// DLYGL:1
// CLKASRC:0

// _End_Comments_

