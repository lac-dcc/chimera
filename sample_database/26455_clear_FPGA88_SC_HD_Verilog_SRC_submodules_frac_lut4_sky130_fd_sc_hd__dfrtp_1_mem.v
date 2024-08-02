// This program was cloned from: https://github.com/efabless/clear
// License: Apache License 2.0

//Generated from netlist by SpyDrNet
//netlist name: FPGA88_SOFA_A
module frac_lut4_sky130_fd_sc_hd__dfrtp_1_mem
(
    `ifdef USE_POWER_PINS
    VPWR,
    VGND, 
    `endif
    ccff_head,
    prog_clk,
    prog_reset,
    ccff_tail,
    mem_out
);

    `ifdef USE_POWER_PINS
    input VPWR;
    input VGND;
    `endif
    input ccff_head;
    input prog_clk;
    input prog_reset;
    output ccff_tail;
    output [0:16]mem_out;

    wire ccff_head;
    wire ccff_tail;
    wire [0:16]mem_out;
    wire prog_clk;
    wire prog_reset;

assign ccff_tail = mem_out[16];
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(ccff_head),
        .RESET_B(prog_reset),
        .Q(mem_out[0])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_10_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[9]),
        .RESET_B(prog_reset),
        .Q(mem_out[10])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_11_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[10]),
        .RESET_B(prog_reset),
        .Q(mem_out[11])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_12_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[11]),
        .RESET_B(prog_reset),
        .Q(mem_out[12])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_13_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[12]),
        .RESET_B(prog_reset),
        .Q(mem_out[13])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_14_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[13]),
        .RESET_B(prog_reset),
        .Q(mem_out[14])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_15_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[14]),
        .RESET_B(prog_reset),
        .Q(mem_out[15])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_16_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[15]),
        .RESET_B(prog_reset),
        .Q(mem_out[16])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[0]),
        .RESET_B(prog_reset),
        .Q(mem_out[1])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[1]),
        .RESET_B(prog_reset),
        .Q(mem_out[2])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_3_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[2]),
        .RESET_B(prog_reset),
        .Q(mem_out[3])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_4_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[3]),
        .RESET_B(prog_reset),
        .Q(mem_out[4])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_5_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[4]),
        .RESET_B(prog_reset),
        .Q(mem_out[5])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_6_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[5]),
        .RESET_B(prog_reset),
        .Q(mem_out[6])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_7_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[6]),
        .RESET_B(prog_reset),
        .Q(mem_out[7])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_8_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[7]),
        .RESET_B(prog_reset),
        .Q(mem_out[8])
    );
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_9_
    (
        
 	`ifdef USE_POWER_PINS 
	.VPWR(VPWR), 
	.VGND(VGND),  
	`endif 
	.CLK(prog_clk),
        .D(mem_out[8]),
        .RESET_B(prog_reset),
        .Q(mem_out[9])
    );
endmodule

