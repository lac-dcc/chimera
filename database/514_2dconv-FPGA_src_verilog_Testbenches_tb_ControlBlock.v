// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale  1ns/100ps //por cada evento de simulacion salta 1 ns

module tb_ControlBlock();	
	
	
	//Todo puerto de salida del modulo es un cable.
	//Todo puerto de estímulo o generación de entrada es un registro.
	
	 //Definicion de puertos
     reg  [23:0] i_GPIOdata;
     reg  [12:0] i_MCUdata;
     reg   [2:0] i_GPIOctrl;
     reg         i_GPIOvalid;
     reg         i_rst;
     reg         i_CLK;
     reg         i_EoP_FSM;
    
    
     wire [31:0] o_GPIOdata;
     wire [23:0] o_KNLdata;
     wire  [10:0] o_imgLength;
     wire  [2:0] o_led; //o_estado
     wire        o_EoP_MCU;
     wire        o_SoP;
     wire        o_valid_FSM;
     wire        o_valid_CONV;
     wire        o_KNorIMG;
	
	
	
	initial	begin
		 i_GPIOdata<=32'd9;
         i_MCUdata<=13'b1111000000101;
         i_GPIOctrl<=3'd0;
         i_GPIOvalid<=1'b0;
         i_rst<=1'b1;
         i_CLK<=1'b1;
         i_EoP_FSM<=1'b0;
         
         //Arrancamos
         #5 i_rst<=1'b0;
         
         
         //Test de instrucciones
         /*Código instrucción              Acción
                         
                              000                      Cargar kernel
                              001                      Cargar Img_size
                              010                      Cargar Imagen
                              011                      Pedir dato
                              100                      Cambio de estado (a precesamiento)
                              -----------------------------------------
                              101-111                  No utilizados
                              ---------------------------------------
           */
           
          //Carga kernel (ya esta en 000)
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d15;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d50;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d50;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          
          
          //Tamano imagen se envia via GPIO
          #5 i_GPIOdata<='d1024;
          //Cambiamos de instruccion, a carga de tamano
          #10 i_GPIOctrl<='d1;
        
          
          //Cambio a carga imagen
          #15 i_GPIOctrl<='d2;
          #5 i_GPIOdata<='d7;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d17;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d27;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d37;
          #5 i_GPIOvalid <=1'b1;
          #2 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d47;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d57;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d67;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d77;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d87;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d97;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d107;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_GPIOdata<='d117;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          
          
          //Cambio a pedido de datos
          #5 i_GPIOctrl<='d3;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_MCUdata   <='d12;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          #5 i_MCUdata   <='d19;
          #5 i_GPIOvalid <=1'b1;
          #5 i_GPIOvalid <=1'b0;
          
          
          //Cambio a instruccion de que termino la imagen
          #5 i_GPIOctrl<='d4;
          //En este estado, se pasa a estado RUN, hasta ser interrumpido por FSM
          //explicitando que termino el procesamiento
          #15 i_EoP_FSM<=1'b1;
          		
		  #30 $finish;
	end
	
	always #2.5 i_CLK=~i_CLK;
	
//Módulo para pasarle los estímulos del banco de pruebas.

ControlBlock
	
	u_RegisterFile
		(
		 .i_GPIOdata(i_GPIOdata),
         .i_MCUdata(i_MCUdata),
         .i_GPIOctrl(i_GPIOctrl),
         .i_GPIOvalid(i_GPIOvalid),
         .i_rst(i_rst),
         .i_CLK(i_CLK),
         .i_EoP_FSM(i_EoP_FSM),
         .o_GPIOdata(o_GPIOdata),
         .o_KNLdata(o_KNLdata),
         .o_imgLength(o_imgLength),
         .o_led(o_led),
         .o_EoP_MCU(o_EoP_MCU),
         .o_SoP(o_SoP),
         .o_valid_FSM(o_valid_FSM),
         .o_valid_CONV(o_valid_CONV),
         .o_KNorIMG(o_KNorIMG)
		);
endmodule