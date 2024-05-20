// This program was cloned from: https://github.com/efabless/clear
// License: Apache License 2.0

//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Template for user-defined Verilog modules
//	Author: Xifan TANG
//	Organization: University of Utah
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps
// ----- Template Verilog module for io -----
//----- Default net type -----
`default_nettype none

// ----- Verilog module for io -----
module io(
          `ifdef USE_POWER_PINS
          VPWR,
          VGND, 
          `endif
          IO_ISOL_N,
          SOC_IN,
          SOC_OUT,
          SOC_DIR,
          FPGA_OUT,
          FPGA_DIR,
          FPGA_IN);
  
`ifdef USE_POWER_PINS
input VPWR;
input VGND;
`endif     
//----- GLOBAL PORTS -----
input [0:0] IO_ISOL_N;
//----- GPIN PORTS -----
input [0:0] SOC_IN;
//----- GPOUT PORTS -----
output [0:0] SOC_OUT;
//----- GPOUT PORTS -----
output [0:0] SOC_DIR;
//----- INPUT PORTS -----
input [0:0] FPGA_OUT;
//----- INPUT PORTS -----
input [0:0] FPGA_DIR;
//----- OUTPUT PORTS -----
output [0:0] FPGA_IN;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----

// ----- Internal logic should start here -----
  wire SOC_DIR_N;

  //
  sky130_fd_sc_hd__or2b_4 ISOL_EN_GATE (                                  
                                        `ifdef USE_POWER_PINS 
                                        .VPWR(VPWR), 
                                        .VGND(VGND),  
                                        `endif 
                                        .B_N(IO_ISOL_N),
                                        .A(FPGA_DIR),
                                        .X(SOC_DIR)
                                       );

  //
  sky130_fd_sc_hd__inv_1 INV_SOC_DIR (`ifdef USE_POWER_PINS .VPWR(VPWR), .VGND(VGND),`endif .A(SOC_DIR), .Y(SOC_DIR_N));
  sky130_fd_sc_hd__ebufn_4 IN_PROTECT_GATE (
                                            `ifdef USE_POWER_PINS 
                                            .VPWR(VPWR), 
                                            .VGND(VGND),  
                                            `endif 
                                            .TE_B(SOC_DIR_N),
                                            .A(SOC_IN),
                                            .Z(FPGA_IN)
                                            );

  //
  sky130_fd_sc_hd__ebufn_4 OUT_PROTECT_GATE (
                                            `ifdef USE_POWER_PINS 
                                             .VPWR(VPWR), 
                                             .VGND(VGND),  
                                             `endif 
                                             .TE_B(SOC_DIR),
                                             .A(FPGA_OUT),
                                             .Z(SOC_OUT)
                                             );

// ----- Internal logic should end here -----
endmodule
// ----- END Verilog module for io -----

//----- Default net type -----
`default_nettype none
