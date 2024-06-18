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


module tb_fusion#(
	parameter BIT_LEN       = `BIT_LEN,
    parameter CONV_LEN      = `CONV_LEN,
    parameter CONV_LPOS     = `CONV_LPOS,
    parameter M_LEN         = `M_LEN,
    parameter NB_ADDRESS    = `NB_ADDRESS,
    parameter RAM_WIDTH     = `RAM_WIDTH,
    parameter GPIO_D        = `GPIO_D
    )();

    
    reg  [GPIO_D-1:0] gpio_o_data_tri_o;
    wire o_led;
    reg CLK100MHZ;
    
    
    
    initial begin
    	CLK100MHZ = 1'b0;
    	gpio_o_data_tri_o = 32'd1;// reset
    	
    	#25 gpio_o_data_tri_o = 32'd0;
        
        //Etapa carga, 5 datos, subida/bajada valid
        #500 gpio_o_data_tri_o = 32'b00000000000000000000111000000010;
        #500 gpio_o_data_tri_o = 32'b00010000000000000000111000000010;
        #500 gpio_o_data_tri_o = 32'b00000000000000000011111000000010;
        #500 gpio_o_data_tri_o = 32'b00010000000000000011111000000010;
        #500 gpio_o_data_tri_o = 32'b00000000000000000000101000000010;
        #500 gpio_o_data_tri_o = 32'b00010000000000000000101000000010;
        #500 gpio_o_data_tri_o = 32'b00000000000000000111111000000010;
        #500 gpio_o_data_tri_o = 32'b00010000000000000111111000000010;
        #500 gpio_o_data_tri_o = 32'b00000000000000000000001000000010;
        #500 gpio_o_data_tri_o = 32'b00010000000000000000001000000010;
        
        //Carga img length/size
        #500 gpio_o_data_tri_o = 32'b00000000000000000000000000000000;
        //Cargo 1024
        #500 gpio_o_data_tri_o = 32'b00000000000000000000000000001110;
        //Cambio a instruccion de carga de img length;
        #500 gpio_o_data_tri_o = 32'b00100000000000000000000000001110;
                                        
        
        //Ya cargue tamano, pasamos a etapa de carga
        #500 gpio_o_data_tri_o = 32'b01000000000000000000011011011010;
        #500 gpio_o_data_tri_o = 32'b01010000000000000000011011011010;
        #500 gpio_o_data_tri_o = 32'b01000000000000000000011011000010;
        #500 gpio_o_data_tri_o = 32'b01010000000000000000011011011010;
        #500 gpio_o_data_tri_o = 32'b01000000000000000000010000000000;
        #500 gpio_o_data_tri_o = 32'b01010000000000000000010000000000;
        #500 gpio_o_data_tri_o = 32'b01000000000010101010010101010100;
        #500 gpio_o_data_tri_o = 32'b01010000000010101010010101010100;
        #500 gpio_o_data_tri_o = 32'b01000000000111111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01010000000111111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01000000000111111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01010000000111111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01000000000111111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01010000000111111111111111111110;
        
        
        //Data request
        #500 gpio_o_data_tri_o = 32'b01100000000111111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01110000000111100011111111111110;
        #500 gpio_o_data_tri_o = 32'b01100000000101111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01110000000101111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01100000000101111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01110000000101111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01100000000101111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01110000000101111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01100000000101111111111111111110;
        #500 gpio_o_data_tri_o = 32'b01110000000101111111111111111110;
                                
        
        //Paso a estado de RUN, vamos FSM
        #500 gpio_o_data_tri_o = 32'b10000000000111111111111111111110;
        
        
    	#2500 $finish;

    end

    always #2.5 CLK100MHZ = ~CLK100MHZ;
    
    
    
    micro_sim
    	u_micro_sim(
		   	.o_led(o_led),
			.i_CLK(CLK100MHZ),
			.gpio_o_data_tri_o(gpio_o_data_tri_o));
endmodule
