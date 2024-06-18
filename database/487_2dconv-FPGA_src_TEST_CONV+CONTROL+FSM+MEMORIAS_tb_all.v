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


module tb_all#(
	parameter BIT_LEN       = `BIT_LEN,
    parameter CONV_LEN      = `CONV_LEN,
    parameter CONV_LPOS     = `CONV_LPOS,
    parameter M_LEN         = `M_LEN,
    parameter NB_ADDRESS    = `NB_ADDRESS,
    parameter RAM_WIDTH     = `RAM_WIDTH,
    parameter GPIO_D        = `GPIO_D
    )();

    
    reg  [GPIO_D-1:0] gpio_o_data_tri_o;
    wire [GPIO_D-1:0] gpio_i_data_tri_i;
    wire o_led;
    reg CLK100MHZ;
    
    
    
    initial begin
    	CLK100MHZ = 1'b0;
    	gpio_o_data_tri_o = 32'd1;// reset
    	
    	#50 gpio_o_data_tri_o = 32'd0;
        
        //Etapa carga, 5 datos, subida/bajada valid
        #500 gpio_o_data_tri_o = 32'b00000000000000000100000000000000;
        #500 gpio_o_data_tri_o = 32'b00010000000000000100000000000000;
        #500 gpio_o_data_tri_o = 32'b00000000010000010000000001000000;
        #500 gpio_o_data_tri_o = 32'b00010000010000010000000001000000;
        #500 gpio_o_data_tri_o = 32'b00000000000000000100000000000000;
        #500 gpio_o_data_tri_o = 32'b00010000000000000100000000000000;
        
        
        
        //Carga img length/size
        
        #500 gpio_o_data_tri_o = 32'b00100000000000000000000000010100;
        //Cambio a instruccion de carga de img length;
        #500 gpio_o_data_tri_o = 32'b00110000000000000000000000010100;
        #500 gpio_o_data_tri_o = 32'b00100000000000000000000000010100;
                                        
        
        //Ya cargue tamano, pasamos a etapa de carga
        
        //----------- PRIMERA MEMORIA -------------------------------//
        
        //DATO = 7F                       --(SELECTS)
        #500 gpio_o_data_tri_o = 32'b01000010000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010010000000000000000011111110;
        //DATO = 7F
        #500 gpio_o_data_tri_o = 32'b01000010000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010010000000000000000011111110;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000010000000000000000011111100;
        #500 gpio_o_data_tri_o = 32'b01010010000000000000000011111100;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000010000000000000000011111100;
        #500 gpio_o_data_tri_o = 32'b01010010000000000000000011111100;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000010000000000000000011111100;
        #500 gpio_o_data_tri_o = 32'b01010010000000000000000011111100;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000010000000000000000011111100;
        #500 gpio_o_data_tri_o = 32'b01010010000000000000000011111100;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000010000000000000000011111100;
        #500 gpio_o_data_tri_o = 32'b01010010000000000000000011111100;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000010000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010010000000000000000011111110;
        //DATO = 7F
        #500 gpio_o_data_tri_o = 32'b01000010000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010010000000000000000011111110;
        //DATO = 7F
        #500 gpio_o_data_tri_o = 32'b01000010000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010010000000000000000011111110;
        // DATO = 7F
        #500 gpio_o_data_tri_o = 32'b01000010000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010010000000000000000011111110;
        
        
        
        
        //----------------------- SEGUNDA MEMORIA -----------------------        
        
        #500 gpio_o_data_tri_o = 32'b01000100000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010100000000000000000011111110;
        //DATO = 7F
        #500 gpio_o_data_tri_o = 32'b01000100000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010100000000000000000011111110;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000100000000000000000011111100;
        #500 gpio_o_data_tri_o = 32'b01010100000000000000000011111100;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000100000000000000000011111100;
        #500 gpio_o_data_tri_o = 32'b01010100000000000000000011111100;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000100000000000000000011111100;
        #500 gpio_o_data_tri_o = 32'b01010100000000000000000011111100;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000100000000000000000011111100;
        #500 gpio_o_data_tri_o = 32'b01010100000000000000000011111100;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000100000000000000000011111100;
        #500 gpio_o_data_tri_o = 32'b01010100000000000000000011111100;
        //DATO = 7E
        #500 gpio_o_data_tri_o = 32'b01000100000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010100000000000000000011111110;
        //DATO = 7F
        #500 gpio_o_data_tri_o = 32'b01000100000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010100000000000000000011111110;
        //DATO = 7F
        #500 gpio_o_data_tri_o = 32'b01000100000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010100000000000000000011111110;
        // DATO = 7F
        #500 gpio_o_data_tri_o = 32'b01000100000000000000000011111110;
        #500 gpio_o_data_tri_o = 32'b01010100000000000000000011111110;
        
        
        //----------------------- TERCERA MEMORIA -----------------------        
               
           #500 gpio_o_data_tri_o = 32'b01000110000000000000000011111110;
           #500 gpio_o_data_tri_o = 32'b01010110000000000000000011111110;
           //DATO = 7F
           #500 gpio_o_data_tri_o = 32'b01000110000000000000000011111110;
           #500 gpio_o_data_tri_o = 32'b01010110000000000000000011111110;
           //DATO = 7E
           #500 gpio_o_data_tri_o = 32'b01000110000000000000000011111100;
           #500 gpio_o_data_tri_o = 32'b01010110000000000000000011111100;
           //DATO = 7E
           #500 gpio_o_data_tri_o = 32'b01000110000000000000000011111100;
           #500 gpio_o_data_tri_o = 32'b01010110000000000000000011111100;
           //DATO = 7E
           #500 gpio_o_data_tri_o = 32'b01000110000000000000000011111100;
           #500 gpio_o_data_tri_o = 32'b01010110000000000000000011111100;
           //DATO = 7E
           #500 gpio_o_data_tri_o = 32'b01000110000000000000000011111100;
           #500 gpio_o_data_tri_o = 32'b01010110000000000000000011111100;
           //DATO = 7E
           #500 gpio_o_data_tri_o = 32'b01000110000000000000000011111100;
           #500 gpio_o_data_tri_o = 32'b01010110000000000000000011111100;
           //DATO = 7E
           #500 gpio_o_data_tri_o = 32'b01000110000000000000000011111110;
           #500 gpio_o_data_tri_o = 32'b01010110000000000000000011111110;
           //DATO = 7F
           #500 gpio_o_data_tri_o = 32'b01000110000000000000000011111110;
           #500 gpio_o_data_tri_o = 32'b01010110000000000000000011111110;
           //DATO = 7F
           #500 gpio_o_data_tri_o = 32'b01000110000000000000000011111110;
           #500 gpio_o_data_tri_o = 32'b01010110000000000000000011111110;
           // DATO = 7F
           #500 gpio_o_data_tri_o = 32'b01000110000000000000000011111110;
           #500 gpio_o_data_tri_o = 32'b01010110000000000000000011111110;
           
           //volvete al select 00
           #25  gpio_o_data_tri_o = 32'b01000000000000000000000000000000;
        
        
        
        //Paso a estado de RUN, vamos FSM
        #500 gpio_o_data_tri_o = 32'b10000000000000000000000000000000;
        
        //Paso a estado data request
        #1000 gpio_o_data_tri_o = 32'b01100000000000000000000000000000;
        # 200 gpio_o_data_tri_o = 32'b01110000000000000000000000000000;
        
        # 200 gpio_o_data_tri_o = 32'b01100000000000000000000000000000;
        # 200 gpio_o_data_tri_o = 32'b01110000000000000000000000000000;
        
        # 200 gpio_o_data_tri_o = 32'b01100000000000000000000000000000;
        # 200 gpio_o_data_tri_o = 32'b01110000000000000000000000000000;
        
        # 200 gpio_o_data_tri_o = 32'b01100000000000000000000000000000;
        # 200 gpio_o_data_tri_o = 32'b01110000000000000000000000000000;
        
        # 200 gpio_o_data_tri_o = 32'b01100000000000000000000000000000;
        # 200 gpio_o_data_tri_o = 32'b01110000000000000000000000000000;
        
        # 200 gpio_o_data_tri_o = 32'b01100000000000000000000000000000;
        # 200 gpio_o_data_tri_o = 32'b01110000000000000000000000000000;
        
        # 200 gpio_o_data_tri_o = 32'b01100000000000000000000000000000;
        # 200 gpio_o_data_tri_o = 32'b01110000000000000000000000000000;
        
        # 200 gpio_o_data_tri_o = 32'b01100000000000000000000000000000;
        # 200 gpio_o_data_tri_o = 32'b01110000000000000000000000000000;
        
        # 200 gpio_o_data_tri_o = 32'b01100000000000000000000000000000;
        # 200 gpio_o_data_tri_o = 32'b01110000000000000000000000000000;
                        
        # 200 gpio_o_data_tri_o = 32'b01100000000000000000000000000000;
        # 200 gpio_o_data_tri_o = 32'b01110000000000000000000000000000;
                
        
        
    	#2500 $finish;

    end

    always #2.5 CLK100MHZ = ~CLK100MHZ;
    
    
    
    micro_all
    	u_micro_sim(
    	    .o_led(o_led),
			.i_CLK(CLK100MHZ),
			.gpio_o_data_tri_o(gpio_o_data_tri_o),
			.gpio_i_data_tri_i(gpio_i_data_tri_i)
			);
endmodule
