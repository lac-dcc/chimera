// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps

`define RAM_WIDTH 13


module BRAM( i_wrEnable, i_CLK, i_writeAdd, i_readAdd, i_data, o_data );
    
    parameter RAM_WIDTH = `RAM_WIDTH;    
    parameter NB_ADDRESS= 10;
    parameter INIT_FILE = "";
    localparam RAM_DEPTH=(2**NB_ADDRESS)-1;
    
    
//Definición de puertos
    input                    i_wrEnable;
    input                i_CLK;
    input [NB_ADDRESS-1:0] i_writeAdd;
    input [NB_ADDRESS-1:0] i_readAdd;
    input [RAM_WIDTH - 1:0] i_data;
    
    output [RAM_WIDTH-1:0] o_data;


    
    reg [RAM_WIDTH-1:0]  BRAM [RAM_DEPTH:0];
    reg [RAM_WIDTH-1:0] dout_reg;
    integer        ram_index;
    
    generate
        if (INIT_FILE != "") begin: use_init_file
            initial
                $readmemh(INIT_FILE, BRAM, 0, RAM_DEPTH);
        end else begin: init_bram_to_zero
            integer ram_index;
            initial
                for (ram_index = 0; ram_index < RAM_DEPTH; ram_index = ram_index + 1)
                    BRAM[ram_index] = {RAM_WIDTH{1'b0}};
        end
    endgenerate

    always @(posedge i_CLK) begin
	      dout_reg<=BRAM[i_readAdd];
	      if(i_wrEnable) begin
			      BRAM[i_writeAdd]<=i_data;			
	      end
    end

    assign{o_data}=dout_reg;
    
endmodule