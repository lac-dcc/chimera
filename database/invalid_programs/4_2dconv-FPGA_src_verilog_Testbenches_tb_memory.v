// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 100ps

`define RAM_WIDTH  8 
`define NB_ADDRESS 10 


module tb_memory();	
	
	parameter RAM_WIDTH = `RAM_WIDTH;    // Specify RAM data width    
    parameter NB_ADDRESS= `NB_ADDRESS;    
	
	//Todo puerto de salida del modulo es un cable.
	//Todo puerto de estímulo o generación de entrada es un registro.
	
	wire[RAM_WIDTH-1:0] output_data;
	
	reg[NB_ADDRESS-1:0] write_address;
	reg[NB_ADDRESS-1:0] read_address;
	reg	input_CLK;
	reg writeEnable;
	reg [RAM_WIDTH-1:0] input_data;
	
	
	
	
	initial	begin
		write_address =10'd0;
		read_address  =10'd0;
		writeEnable   =1'b0;
		input_data    =8'h0;				
		//inicializo clock (si o si)
		input_CLK= 1'b0;			
		#10 writeEnable=1'b1;
		#10 writeEnable = 1'b0;
		
		
		
		#50 input_data=8'hFF;
		#50 write_address = write_address + 1;
		#50 read_address = read_address + 1;
		#20 writeEnable = 1'b1;
		#20 writeEnable = 1'b0;
		
		
        #50 input_data=8'b10000001;
        #50 write_address = write_address + 1;
        #50 read_address = read_address + 1;
        #20 writeEnable = 1'b1;
        #20 writeEnable = 1'b0;
        

        #50 input_data=8'b11100111;
        #20 writeEnable = 1'b1;
        #20 writeEnable = 1'b0;
        
		
		     
        
                
		
		#10000000000 $finish;
	end
	
	always #2.5 input_CLK=~input_CLK;
	
//Módulo para pasarle los estímulos del banco de pruebas.

memory
	#(  
	    .NB_ADDRESS(NB_ADDRESS),
		.RAM_WIDTH (RAM_WIDTH)
		)
	u_bram
		(
		.i_data(input_data),
		.i_writeAdd(write_address),
		.i_readAdd(read_address),
		.i_CLK(input_CLK),
		.i_wrEnable(writeEnable),
		.o_data(output_data)
		);
endmodule
