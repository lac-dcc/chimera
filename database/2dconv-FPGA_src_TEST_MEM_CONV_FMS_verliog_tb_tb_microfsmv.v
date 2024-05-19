// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps

`define BIT_LEN     8
`define CONV_LEN    20
`define CONV_LPOS   13
`define M_LEN       3
`define GPIO_D      32
`define NB_ADDRESS  10
`define RAM_WIDTH   13
`define NB_IMAGE    10


module tb_microfsmv# (
	parameter BIT_LEN       = `BIT_LEN,
    parameter CONV_LEN      = `CONV_LEN,
    parameter CONV_LPOS     = `CONV_LPOS,
    parameter M_LEN         = `M_LEN,
    parameter NB_ADDRESS    = `NB_ADDRESS,
    parameter RAM_WIDTH     = `RAM_WIDTH,
    parameter GPIO_D        = `GPIO_D,
    parameter NB_IMAGE		= `NB_IMAGE,
    localparam MEMO         = 1,
    localparam MEM1         = 2,
    localparam MEM2         = 3)
    ();


    reg[GPIO_D-1:0]		gpio_o_data_tri_o;
    reg 				CLK100MHZ;
    
    wire[GPIO_D-1:0] 	gpio_i_data_tri_i;
    wire[3:0]			led;
    initial begin
    	CLK100MHZ = 1;
        //reset fsm y conv. 
    	gpio_o_data_tri_o = 32'h5;
    	
        //latcheo el tamaño de la imgen
        #20 gpio_o_data_tri_o = 32'h1b705;
        //
        #20 gpio_o_data_tri_o = 32'h0;

        /*
        //memoria 1-------------------------------
    	#50 gpio_o_data_tri_o = 32'ha0;
        
        #50 gpio_o_data_tri_o = 32'h07fa0;

    	#10 gpio_o_data_tri_o = 32'h07fb0; //30
        #10  gpio_o_data_tri_o = 32'h07fa0; //20

        #10 gpio_o_data_tri_o = 32'h07fb0;
        #10  gpio_o_data_tri_o = 32'h07fa0;
    	//7e
        #10 gpio_o_data_tri_o = 32'h07eb0;
        #10  gpio_o_data_tri_o = 32'h07ea0;

        #10 gpio_o_data_tri_o = 32'h07eb0;
    	#10  gpio_o_data_tri_o = 32'h07ea0;

        #10 gpio_o_data_tri_o = 32'h07eb0;
    	#10  gpio_o_data_tri_o = 32'h07ea0;

        #10 gpio_o_data_tri_o = 32'h07eb0;
    	#10  gpio_o_data_tri_o = 32'h07ea0;

        #10 gpio_o_data_tri_o = 32'h07eb0;
    	#10  gpio_o_data_tri_o = 32'h07ea0;

        #10 gpio_o_data_tri_o = 32'h07eb0;
    	#10  gpio_o_data_tri_o = 32'h07ea0;
    	//7f
        #10 gpio_o_data_tri_o = 32'h07fb0;
    	#10  gpio_o_data_tri_o = 32'h07fa0;

        #10 gpio_o_data_tri_o = 32'h07fb0;
    	#10  gpio_o_data_tri_o = 32'h07fa0;

        #10 gpio_o_data_tri_o = 32'h07fb0;
    	#10  gpio_o_data_tri_o = 32'h07fa0;

        //memoria 2 ----------------------------------
        //7f
        #100 gpio_o_data_tri_o = 32'hC0;

        #100 gpio_o_data_tri_o = 32'h07fc0;

        #10 gpio_o_data_tri_o = 32'h07fd0;
        #10  gpio_o_data_tri_o = 32'h07fc0;

        #10 gpio_o_data_tri_o = 32'h07fd0;
        #10  gpio_o_data_tri_o = 32'h07fc0;
        //7e
        #10 gpio_o_data_tri_o = 32'h07ed0;
        #10  gpio_o_data_tri_o = 32'h07ec0;

        #10 gpio_o_data_tri_o = 32'h07ed0;
        #10  gpio_o_data_tri_o = 32'h07ec0;

        #10 gpio_o_data_tri_o = 32'h07ed0;//50
        #10  gpio_o_data_tri_o = 32'h07ec0;//40

        #10 gpio_o_data_tri_o = 32'h07ed0;
        #10  gpio_o_data_tri_o = 32'h07ec0;

        #10 gpio_o_data_tri_o = 32'h07ed0;
        #10  gpio_o_data_tri_o = 32'h07ec0;

        #10 gpio_o_data_tri_o = 32'h07ed0;
        #10  gpio_o_data_tri_o = 32'h07ec0;
        //7f
        #10 gpio_o_data_tri_o = 32'h07fd0;
        #10  gpio_o_data_tri_o = 32'h07fc0;

        #10 gpio_o_data_tri_o = 32'h07fd0;
        #10  gpio_o_data_tri_o = 32'h07fc0;

        #10 gpio_o_data_tri_o = 32'h07fd0;
        #10  gpio_o_data_tri_o = 32'h07fc0;

        //memoria 3----------------------------------
        #100 gpio_o_data_tri_o = 32'hE0;
        #100  gpio_o_data_tri_o = 32'h07fe0;
        
        #10 gpio_o_data_tri_o = 32'h07ff0;
        #10  gpio_o_data_tri_o = 32'h07fe0;

        #10 gpio_o_data_tri_o = 32'h07ff0;
        #10  gpio_o_data_tri_o = 32'h07fe0;
        //7e
        #10 gpio_o_data_tri_o = 32'h07ef0;
        #10  gpio_o_data_tri_o = 32'h07ee0;

        #10 gpio_o_data_tri_o = 32'h07ef0;
        #10  gpio_o_data_tri_o = 32'h07ee0;

        #10 gpio_o_data_tri_o = 32'h07ef0;
        #10  gpio_o_data_tri_o = 32'h07ee0;

        #10 gpio_o_data_tri_o = 32'h07ef0;
        #10  gpio_o_data_tri_o = 32'h07ee0;

        #10 gpio_o_data_tri_o = 32'h07ef0;
        #10  gpio_o_data_tri_o = 32'h07ee0;

        #10 gpio_o_data_tri_o = 32'h07ef0;
        #10  gpio_o_data_tri_o = 32'h07ee0;
        //7f
        #10 gpio_o_data_tri_o = 32'h07ff0;
        #10  gpio_o_data_tri_o = 32'h07fe0;

        #10 gpio_o_data_tri_o = 32'h07ff0;//70
        #10  gpio_o_data_tri_o = 32'h07fe0;//60

        #10 gpio_o_data_tri_o = 32'h07f6a;
        #10 gpio_o_data_tri_o = 32'h07f7a;
        #10 gpio_o_data_tri_o = 32'h07f6a; ////la instruccion magica
     
        */
        //sop-------------------------------------------
    	#500 gpio_o_data_tri_o = 32'h0A;
    	#500 gpio_o_data_tri_o = 32'h02;

    	// salida de datos
    	#1500 gpio_o_data_tri_o = 32'h10;
    	#10 gpio_o_data_tri_o = 32'h0;
    	#10 gpio_o_data_tri_o = 32'h10;
    	#10 gpio_o_data_tri_o = 32'h0;
    	#10 gpio_o_data_tri_o = 32'h10;
    	#10 gpio_o_data_tri_o = 32'h0;
    	#10 gpio_o_data_tri_o = 32'h10;
    	#10 gpio_o_data_tri_o = 32'h0;
    	#10 gpio_o_data_tri_o = 32'h10;
    	#10 gpio_o_data_tri_o = 32'h0;
    	#10 gpio_o_data_tri_o = 32'h10;
    	#10 gpio_o_data_tri_o = 32'h0;
    	#10 gpio_o_data_tri_o = 32'h10;
    	#10 gpio_o_data_tri_o = 32'h0;
    	#10 gpio_o_data_tri_o = 32'h10;
    	#10 gpio_o_data_tri_o = 32'h0;
    	#10 gpio_o_data_tri_o = 32'h10;
    	#10 gpio_o_data_tri_o = 32'h0;
    	#10 gpio_o_data_tri_o = 32'h10;
    	#10 gpio_o_data_tri_o = 32'h0;
    	
    	#10 gpio_o_data_tri_o = 32'h10;
    	#10 gpio_o_data_tri_o = 32'h0;

    	//#185 gpio_o_data_tri_o =
    	#200 $finish; 
    end
    always #2.5 CLK100MHZ=~CLK100MHZ;

    Micro_fms
    	u_micro_fsm(
    		.gpio_i_data_tri_i(gpio_i_data_tri_i),
    		.o_led(led),
    		.CLK100MHZ(CLK100MHZ),
    		.gpio_o_data_tri_o(gpio_o_data_tri_o)
    		);
endmodule
