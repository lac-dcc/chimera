// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale  1ns/100ps //por cada evento de simulacion salta 1 ns
//`timescale 1ns / 1ps
//TB
//ShiftLeds
`define BIT_LEN 8
`define CONV_LEN 20
`define CONV_LPOS 13
`define M_LEN 3

module test_Conv #(
    parameter BIT_LEN =`BIT_LEN,
    parameter CONV_LEN =`CONV_LEN,
    parameter CONV_LPOS = `CONV_LPOS,
    parameter M_LEN = `M_LEN
    )();

    //PUETO DE ENTRADA REGISTRO , LO QUE GENERE ESTIMULOS
    //PUERTO DE SALIDA WIRE--> CABLE
    //bloqueabte por que necesitamos que se ejecuta liena linea
    //si tenemos 2 incial se ejecutan en paralelo
    //always repetitivS

    reg signed [BIT_LEN-1:0]dato0;
    reg signed [BIT_LEN-1:0]dato1;
    reg signed [BIT_LEN-1:0]dato2;
    reg CLK100MHZ;
    reg KI;
    reg rst;
    reg valid;
    wire [CONV_LPOS-1:0] data;
    
initial begin
    CLK100MHZ	= 1'b1;
    dato0 = 8'b00000000; //0
    dato1 = 8'b00100000; //0.25
    dato2 = 8'b00000000; //0
    rst = 1'b1; //  reseteo los registros 
    valid = 1'b0; // carga y salida deshabilitada
    KI = 1'b0; // modo carga kernel
    #5 rst	 = 1'b0;// bajo el reset
    
    #5 valid = 1'b1; // hibilito la carga y la salida
    // carga primera fila del kernel 

    #5 dato0 = 8'b00100000; //0.25
    dato1 = 8'b10000000; //-1
    dato2 = 8'b00100000; // 0.25
    //cargo la segunda fila del kernel
    
    #5dato0 = 8'b00000000; //0
    dato1 = 8'b00100000; //0.25
    dato2 = 8'b00000000; //0
    // cargo la tercera fila del

    #5 valid = 1'b0;
    
    //Cargo dato
    #5 KI = 1'b1; // paso al modo imagen 
    #5 valid = 1'b1;
    dato0 = 8'b01111111; //127 (0.992)
    dato1 = 8'b01111111; 
    dato2 = 8'b01111111;
    // cargo la primera fila de la imagen 
    
    #5dato0 = 8'b01111111;
    dato1 = 8'b01111111;
    dato2 = 8'b01111111;
    // cargo la segunda fila de la imagen
    
    #5dato0 = 8'b01111110; //126 (0.984)
    dato1 = 8'b01111110;
    dato2 = 8'b01111110;
    // cargo la tercera fila de la imagen

    #5 valid = 1'b0;
    //fin de etapa inicial----------------

    #5 valid = 1'b1;

    #25dato0 = 8'b01111111; //127 (0.992)
    dato1 = 8'b01111111; 
    dato2 = 8'b01111111; 
    
    #45dato0 = 8'b01111110; //126 (0.984)
    dato1 = 8'b01111110;
    dato2 = 8'b01111110;

    #30dato0 = 8'b01111111; //127 (0.992)
    dato1 = 8'b01111111; 
    dato2 = 8'b01111111; 

    #20dato0 = 8'b01111110; //126 (0.984)
    dato1 = 8'b01111110;
    dato2 = 8'b01111110;

    #15dato0 = 8'b01111101; //125 ()
    dato1 = 8'b01111101;
    dato2 = 8'b01111101;

    #10dato0 = 8'b01111110; //126 (0.984)
    dato1 = 8'b01111110;
    dato2 = 8'b01111110;

    #5dato0 = 8'b01111111; //127 (0.992)
    dato1 = 8'b01111111; 
    dato2 = 8'b01111111; 

    #10 valid = 1'b0;
    KI = 1'b0;

/*  
    //otro valid mas clock +2 
    #10 valid = 1'b1;
    #5 valid = 1'b0;
    //otro valid mas clock +3 
    #10 valid = 1'b1;
    #5 valid = 1'b0;
*/
	#20	$finish;

end
always #2.5 CLK100MHZ = ~CLK100MHZ;

Conv
    u_conv(.i_dato0(dato0), 
           .i_dato1(dato1), 
           .i_dato2(dato2), 
           .i_selecK_I(KI), 
           .i_reset(rst), 
           .i_valid(valid),
           .CLK100MHZ(CLK100MHZ), 
           .o_data(data));

/*en toeria el procesamiento resutlado de la convolucion completa deveria de ser
             01111111 (127)  son 3 calculos de estos 
            *00100000 (0.25)
   ------------------
     0000111111100000 (4064)

             01111110 (126)  1 calculo de estos 

            *00100000 (0.25)
   ------------------
     0000111111000000 (4032)

             01111111 (127)  son 3 calculos de estos 
            *10000000 (-1)
   ------------------
     1100000010000000 (-1656)

        0000111111100000 (4064)
   +    0000111111100000 (4064)
   +    0000111111100000 (4064)
   -    1100000010000000 (-1656)
   +    0000111111000000 (4032)
--------------------------------------
    11111111111111100000 (-32)

luego de pos procesamiento quedandome con 13 bits tiene que qedar
    01111111111111100000  invierto el signo mas significativo
           0111111111111  13 bist MSB
*/
endmodule
