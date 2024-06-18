// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps


`define BIT_LEN 8
`define CONV_LEN 20
`define CONV_LPOS 13
`define M_LEN 3
`define GPIO_D 32

`define NB_ADDRESS 10
`define RAM_WIDTH 13


module tb_topmicro#(
	parameter BIT_LEN       = `BIT_LEN,
    parameter CONV_LEN      = `CONV_LEN,
    parameter CONV_LPOS     = `CONV_LPOS,
    parameter M_LEN         = `M_LEN,
    parameter NB_ADDRESS    = `NB_ADDRESS,
    parameter RAM_WIDTH     = `RAM_WIDTH,
    parameter GPIO_D        = `GPIO_D
    )();

    wire [GPIO_D-1:0] gpio_i_data_tri_i;
    reg  [GPIO_D-1:0] gpio_o_data_tri_o;
    wire o_led;
    reg CLK100MHZ;
    initial begin
    	CLK100MHZ = 1'b0;
    	gpio_o_data_tri_o = 32'h9;// reste

    	#20 gpio_o_data_tri_o = 32'h1E;
    	
    	#3210 gpio_o_data_tri_o = 32'h0;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#5   gpio_o_data_tri_o = gpio_o_data_tri_o + 32'h100;
    	#20 $finish;

    end

    always #2.5 CLK100MHZ = ~CLK100MHZ;
    micro_sim
    	u_micro_sim(.gpio_i_data_tri_i(gpio_i_data_tri_i),
		   	.o_led(o_led),
			.CLK100MHZ(CLK100MHZ),
			.gpio_o_data_tri_o(gpio_o_data_tri_o));
endmodule
