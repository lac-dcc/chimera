// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 10ps

module tb_FSM();	

	parameter NB_ADDRESS= 10;
	//Para ver mas rapido si llega a completarse
    parameter NB_IMAGE  = 10;
	//Todo puerto de salida del modulo es un cable.
	//Todo puerto de estímulo o generación de entrada es un registro.
	//Definición de puertos
    reg                    	CLK;
    reg                    	reset;
    reg                    	SOP;
    reg [NB_IMAGE-1:0]     	imgLength;
    reg                    	valid;
    reg 					load; 
    wire [NB_ADDRESS-1:0]  	writeAddress;
    wire [NB_ADDRESS-1:0]  	readAddress;
    wire                   	EOP;
    wire                   	chblock;
    wire 					vld;
    integer i;
	initial	begin
		CLK       = 1'b0;
		SOP       = 1'b0;	
		imgLength = 10'hf;
		valid     = 1'b0;
		load 	  = 1'b0;
		reset     = 1'b1;		
		#10 reset = 1'b0;
		// etapa de carga 
		#5 load = 1'b1; 
		
		for(i=0; i<= imgLength; i=i+1)begin
			#5 valid = 1'b1;
			#5 valid = 1'b0;
		end
		load = 1'b0;	

		//Carga/lectura --> testeo del valid.
		//Emulo arranque de sistema, deberían cargarse los parametros correspondientes
		
		#30 SOP = 1'b1;
		#20 SOP = 1'b0;

		#200 $finish;
	end
	always #2.5 CLK=~CLK;
	//Módulo para pasarle los estímulos del banco de pruebas.
	Fsmv#(  
		.NB_ADDRESS(NB_ADDRESS),
		.NB_IMAGE (NB_IMAGE),
		.N_CONV (4))
		u_Fsmv(
			.o_readAdd(readAddress),
			.o_writeAdd(writeAddress),
			.o_EoP(EOP),
			.o_changeBlock(chblock),
			.o_fms2conVld(vld),
			.i_CLK(CLK),
			.i_reset(reset),
			.i_SoP(SOP),
			.i_imgLength(imgLength),
			.i_valid(valid),
			.i_load(load));


endmodule
