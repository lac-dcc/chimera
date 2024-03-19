`timescale 1 ns/100 ps
// Version: v11.5 11.5.0.26


module ccc_slow(
       POWERDOWN,
       CLKA,
       LOCK,
       GLA,
       SDIN,
       SCLK,
       SSHIFT,
       SUPDATE,
       MODE,
       SDOUT
    );
input  POWERDOWN;
input  CLKA;
output LOCK;
output GLA;
input  SDIN;
input  SCLK;
input  SSHIFT;
input  SUPDATE;
input  MODE;
output SDOUT;

    wire VCC, GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    
    DYNCCC #( .VCOFREQUENCY(25.000) )  Core (.CLKA(CLKA), .EXTFB(GND), 
        .POWERDOWN(POWERDOWN), .GLA(GLA), .LOCK(LOCK), .CLKB(GND), 
        .GLB(), .YB(), .CLKC(GND), .GLC(), .YC(), .SDIN(SDIN), .SCLK(
        SCLK), .SSHIFT(SSHIFT), .SUPDATE(SUPDATE), .MODE(MODE), .SDOUT(
        SDOUT), .OADIV0(GND), .OADIV1(GND), .OADIV2(GND), .OADIV3(VCC), 
        .OADIV4(VCC), .OAMUX0(GND), .OAMUX1(GND), .OAMUX2(VCC), 
        .DLYGLA0(GND), .DLYGLA1(GND), .DLYGLA2(GND), .DLYGLA3(GND), 
        .DLYGLA4(GND), .OBDIV0(GND), .OBDIV1(GND), .OBDIV2(VCC), 
        .OBDIV3(VCC), .OBDIV4(GND), .OBMUX0(GND), .OBMUX1(GND), 
        .OBMUX2(GND), .DLYYB0(GND), .DLYYB1(GND), .DLYYB2(GND), 
        .DLYYB3(GND), .DLYYB4(GND), .DLYGLB0(GND), .DLYGLB1(GND), 
        .DLYGLB2(GND), .DLYGLB3(GND), .DLYGLB4(GND), .OCDIV0(GND), 
        .OCDIV1(GND), .OCDIV2(VCC), .OCDIV3(VCC), .OCDIV4(GND), 
        .OCMUX0(GND), .OCMUX1(GND), .OCMUX2(GND), .DLYYC0(GND), 
        .DLYYC1(GND), .DLYYC2(GND), .DLYYC3(GND), .DLYYC4(GND), 
        .DLYGLC0(GND), .DLYGLC1(GND), .DLYGLC2(GND), .DLYGLC3(GND), 
        .DLYGLC4(GND), .FINDIV0(VCC), .FINDIV1(VCC), .FINDIV2(GND), 
        .FINDIV3(GND), .FINDIV4(GND), .FINDIV5(GND), .FINDIV6(GND), 
        .FBDIV0(GND), .FBDIV1(GND), .FBDIV2(VCC), .FBDIV3(GND), 
        .FBDIV4(GND), .FBDIV5(GND), .FBDIV6(GND), .FBDLY0(GND), 
        .FBDLY1(GND), .FBDLY2(GND), .FBDLY3(GND), .FBDLY4(GND), 
        .FBSEL0(VCC), .FBSEL1(GND), .XDLYSEL(GND), .VCOSEL0(GND), 
        .VCOSEL1(GND), .VCOSEL2(GND));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule

// _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


// _GEN_File_Contents_

// Version:11.5.0.26
// ACTGENU_CALL:1
// BATCH:T
// FAM:PA3LCLP
// OUTFORMAT:Verilog
// LPMTYPE:LPM_PLL_DYNAMIC
// LPM_HINT:NONE
// INSERT_PAD:NO
// INSERT_IOREG:NO
// GEN_BHV_VHDL_VAL:F
// GEN_BHV_VERILOG_VAL:F
// MGNTIMER:F
// MGNCMPL:T
// DESDIR:Z:/fpga_vision/fs_backscatter/smartgen\ccc_slow
// GEN_BEHV_MODULE:F
// SMARTGEN_DIE:UM4X4M1NLPLV
// SMARTGEN_PACKAGE:vq100
// AGENIII_IS_SUBPROJECT_LIBERO:T
// FIN:20.000000
// CLKASRC:0
// FBDLY:1
// FBMUX:1
// XDLYSEL:0
// PRIMFREQ:1.000000
// PPHASESHIFT:0
// DLYAVAL:1
// OAMUX:4
// POWERDOWN_POLARITY:0
// LOCK_POLARITY:1
// LOCK_CTL:0
// VOLTAGE:1.2

// _End_Comments_

