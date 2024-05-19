// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps

`define NB_ADDRESS 10
`define RAM_WIDTH 13
`define INIT 0


module bram_memory#( 
	parameter RAM_WIDTH 	= `RAM_WIDTH,    
	parameter NB_ADDRESS 	= `NB_ADDRESS,
	parameter INIT 			= `INIT,
	parameter INIT_FILE = "D:\\ProyectosVivado\\Control_Fsm_Conv_Mem\\Control_Fsm_Conv_Mem.srcs\\sim_1\\new\\mem_0.txt",    
	localparam RAM_DEPTH=(2**NB_ADDRESS)-1
	)(//Definición de puertos
	output [RAM_WIDTH-1:0]   o_data,
	input                    i_wrEnable,
	input                    i_CLK,
	input  [NB_ADDRESS-1:0]  i_writeAdd,
	input  [NB_ADDRESS-1:0]  i_readAdd,
	input  [RAM_WIDTH - 1:0] i_data
	);
	//add
	//input					i_rst;
	//output           [3:0]   o_led;
	//reg           [1:0] go_to_leds;
	reg [RAM_WIDTH-1:0] BRAM [RAM_DEPTH:0];
	reg [RAM_WIDTH-1:0] dout_reg;
	integer ram_index;
	

	generate
    if (INIT_FILE != "") begin: use_init_file
      initial begin
      	case (INIT)
        	1: $readmemh(INIT_FILE, BRAM, 0, RAM_DEPTH);
        	2: $readmemh("D:\\ProyectosVivado\\Control_Fsm_Conv_Mem\\Control_Fsm_Conv_Mem.srcs\\sim_1\\new\\mem_1.txt", BRAM, 0, RAM_DEPTH);
        	3: $readmemh("D:\\ProyectosVivado\\Control_Fsm_Conv_Mem\\Control_Fsm_Conv_Mem.srcs\\sim_1\\new\\mem_2.txt", BRAM, 0, RAM_DEPTH);
        	default: begin
        		for (ram_index = 0; ram_index <= RAM_DEPTH; ram_index = ram_index + 1)
					BRAM[ram_index] = {RAM_WIDTH{1'b1}};
        	end
        endcase
      end
    end 
    else begin: init_bram_to_zero
      initial
      	for (ram_index = 0; ram_index <= RAM_DEPTH; ram_index = ram_index + 1)
					BRAM[ram_index] = {RAM_WIDTH{1'b1}};
    end
  	endgenerate
	
	always @(posedge i_CLK) begin
		dout_reg<=BRAM[i_readAdd];	
		if(i_wrEnable) begin			
			BRAM[i_writeAdd]<=i_data;		
		end	
	end
 
	assign{o_data}= dout_reg;


endmodule
