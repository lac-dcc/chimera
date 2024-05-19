// This program was cloned from: https://github.com/efabless/clear
// License: Apache License 2.0

//Generated from netlist by SpyDrNet
//netlist name: FPGA88_SOFA_A
module logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff
(
    `ifdef USE_POWER_PINS
    VPWR,
    VGND, 
    `endif
    ff_D,
    ff_DI,
    ff_clk,
    ff_reset,
    test_enable,
    ff_Q
);

    `ifdef USE_POWER_PINS
    input VPWR;
    input VGND;
    `endif
    input ff_D;
    input ff_DI;
    input ff_clk;
    input ff_reset;
    input test_enable;
    output ff_Q;

    wire ff_D;
    wire ff_DI;
    wire ff_Q;
    wire ff_clk;
    wire ff_reset;
    wire test_enable;

    sky130_fd_sc_hd__sdfrtp_1 sky130_fd_sc_hd__sdfrtp_1_0_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(ff_clk),
        .D(ff_D),
        .RESET_B(ff_reset),
        .SCD(ff_DI),
        .SCE(test_enable),
        .Q(ff_Q)
    );
endmodule

