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
`define NB_ADDRESS 10
`define RAM_WIDTH 13

module tb_top_cm #(
    parameter BIT_LEN =`BIT_LEN,
    parameter CONV_LEN =`CONV_LEN,
    parameter CONV_LPOS = `CONV_LPOS,
    parameter M_LEN = `M_LEN,
    parameter RAM_WIDTH = `CONV_LPOS,    
	parameter NB_ADDRESS= `NB_ADDRESS
    )();

    //PUETO DE ENTRADA REGISTRO , LO QUE GENERE ESTIMULOS
    //PUERTO DE SALIDA WIRE--> CABLE
    //bloqueabte por que necesitamos que se ejecuta liena linea
    //si tenemos 2 incial se ejecutan en paralelo
    //always repetitivS

    reg signed [RAM_WIDTH-1:0]i_ker0, i_ker1, i_ker2;
    reg signed [RAM_WIDTH-1:0]i_data_mem0, i_data_mem1, i_data_mem2;
    reg [NB_ADDRESS-1:0] write_address_MEM, read_address_MEM;

    reg CLK100MHZ;
    reg KI;
    reg rst_c;
    //reg rst_m; //resete de momira version 2.0
    reg valid;
    reg writeEnable;
    reg car_conv;
    wire [RAM_WIDTH-1:0]mem0, mem1, mem2;
    wire [CONV_LPOS-1:0] data;
    wire signed [BIT_LEN-1:0] dato0, dato1, dato2; //Datos a la entrada del convlucionador
    wire signed [RAM_WIDTH-1:0] i_mem0;

    //assign {dato2, dato1, dato0} = (KI==1'b0)?{i_ker2,i_ker1,i_ker0}:{mem2[BIT_LEN-1:0],mem1[BIT_LEN-1:0],mem0[BIT_LEN-1:0]};
    assign dato0 = (KI==1'b0)?i_ker0:mem0[BIT_LEN-1:0];
    assign dato1 = (KI==1'b0)?i_ker1:mem1[BIT_LEN-1:0];
    assign dato2 = (KI==1'b0)?i_ker2:mem2[BIT_LEN-1:0];

    assign i_mem0 = (car_conv==1'b0)?i_data_mem0:data;

initial begin
    CLK100MHZ	= 1'b1;
    writeEnable = 0;
    car_conv = 0;
    write_address_MEM = 10'h0;
    read_address_MEM = 10'h0;
   	rst_c = 1'b1; //  reseteo los registros del conv.
    valid = 1'b0; // carga y salida deshabilitada
    //prueba memoria..........con resete version 2
    //rst_m = 1'b1; 

    i_ker0 = 8'h0; //0
    i_ker1 = 8'h0; //0.25
    i_ker2 = 8'h0; //0

    KI = 1'b0; //modo kernel
    

    //#5 rst_m = 1'b0; //reste de mommoria verson 2.0
    /*
    cargo imagen a la memoria
    */
    //00000 bits adicionales
    i_data_mem0 = 13'b0000001111111; //127 (0.992)
    i_data_mem1 = 13'b0000001111111; 
    i_data_mem2 = 13'b0000001111111;
 	writeEnable = 1;   
 	#5 writeEnable = 0;

    #5 write_address_MEM = write_address_MEM + 1;
    i_data_mem0 = 13'b0000001111111;
    i_data_mem1 = 13'b0000001111111;
    i_data_mem2 = 13'b0000001111111;
    writeEnable = 1;   
 	#5 writeEnable = 0;

    #5 write_address_MEM = write_address_MEM + 1;
    i_data_mem0 = 13'b0000001111110; //126 (0.984)
    i_data_mem1 = 13'b0000001111110;
    i_data_mem2 = 13'b0000001111110;
   	writeEnable = 1;   
 	#5 writeEnable = 0;

    #5 writeEnable = 1;
    write_address_MEM = write_address_MEM + 1;
    //cargo 5 datos
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 writeEnable=0;

    i_data_mem0 = 13'b0000001111111; //127 (0.992)
    i_data_mem1 = 13'b0000001111111; 
    i_data_mem2 = 13'b0000001111111;
    #5 writeEnable =1;
    write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 writeEnable=0;

    i_data_mem0 = 13'b0000001111110; //126 (0.984)
    i_data_mem1 = 13'b0000001111110;
    i_data_mem2 = 13'b0000001111110;
    #5 writeEnable =1;
    write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 writeEnable=0;

    i_data_mem0 = 13'b0000001111111; //127 (0.992)
    i_data_mem1 = 13'b0000001111111; 
    i_data_mem2 = 13'b0000001111111;
    #5 writeEnable =1;
    write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 writeEnable=0;

    i_data_mem0 = 13'b0000001111110; //126 (0.984)
    i_data_mem1 = 13'b0000001111110;
    i_data_mem2 = 13'b0000001111110;
    #5 writeEnable =1;
    write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 writeEnable=0;

    i_data_mem0 = 13'b0000001111101; //125 ()
    i_data_mem1 = 13'b0000001111101;
    i_data_mem2 = 13'b0000001111101;
    #5 writeEnable =1;
    write_address_MEM = write_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    #5 writeEnable=0;

    i_data_mem0 = 13'b0000001111110; //126 (0.984)
    i_data_mem1 = 13'b0000001111110;
    i_data_mem2 = 13'b0000001111110;
    #5 writeEnable =1;
    write_address_MEM = write_address_MEM + 1;
    #5 writeEnable=0;

    i_data_mem0 = 13'b0000001111111; //127 (0.992)
    i_data_mem1 = 13'b0000001111111; 
    i_data_mem2 = 13'b0000001111111;
    #5 writeEnable =1;
    write_address_MEM = write_address_MEM + 1;
    #5 writeEnable=0;

    /* Carga de datos a al Conv ---------------------------------
    */
    #10 rst_c = 1'b0;// bajo el reset
	#5valid = 1'b1; // hibilito la carga y la salida 
    
    i_ker0 = 8'b00000000; //0
    i_ker1 = 8'b00100000; //0.25
    i_ker2 = 8'b00000000; //0
    // carga primera fila del kernel 

    #5i_ker0 = 8'b00100000; //0.25
    i_ker1 = 8'b10000000; //-1
    i_ker2 = 8'b00100000; // 0.25
    
    //cargo la segunda fila del kernel
    #5i_ker0 = 8'b00000000; //0
    i_ker1 = 8'b00100000; //0.25
    i_ker2 = 8'b00000000; //0
    // cargo la tercera fila del kernel
    #5 valid = 1'b0;
    
    //Cargo imagen-----------------------
    #5 KI = 1'b1; // paso al modo imagen 
    // cargo la primera fila de la imagen 
    #5valid = 1'b1;

    // cargo la segunda fila de la imagen
    read_address_MEM = read_address_MEM + 1;
    #5 valid = 1'b1;

    // cargo la tercera fila de la imagen
    read_address_MEM = read_address_MEM + 1;
    #5 valid = 1'b1;
    
    write_address_MEM = 10'h0;

    //obengo datos a la salida
    //#5 valid = 1'b0;
    //fin de etapa inicial------------------
    car_conv=1'b1;
    
    read_address_MEM = read_address_MEM + 1;
    #5 valid = 1'b1;
    //#5valid = 1'b0;

    #5 writeEnable = 1'b1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1; 

    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;    
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;

    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;    
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;

    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;    
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;

    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;    
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;

    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;    
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;

    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;    
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;
    #5 write_address_MEM = write_address_MEM + 1;
    read_address_MEM = read_address_MEM + 1;

    #5 write_address_MEM = write_address_MEM + 1;
    
    #5 writeEnable = 1'b0;
    car_conv=1'b0;
    #10 KI = 1'b0;

    #20 $finish;
end
always #2.5 CLK100MHZ = ~CLK100MHZ;

Conv
    u_conv(.i_dato0(dato0), 
           .i_dato1(dato1), 
           .i_dato2(dato2), 
           .i_selecK_I(KI), 
           .i_reset(rst_c), 
           .i_valid(valid),
           .CLK100MHZ(CLK100MHZ), 
           .o_data(data));

bram_memory
    u_bram_1(.i_wrEnable(writeEnable),
             .i_data(i_mem0),
             .i_writeAdd(write_address_MEM),
             .i_readAdd(read_address_MEM),
             .i_CLK(CLK100MHZ),
             .o_data(mem0));
bram_memory
    u_bram_2(.i_wrEnable(writeEnable),
             .i_data(i_data_mem1),
             .i_writeAdd(write_address_MEM),
             .i_readAdd(read_address_MEM),
             .i_CLK(CLK100MHZ),
             .o_data(mem1));
bram_memory
    u_bram_3(.i_wrEnable(writeEnable),
             .i_data(i_data_mem2),
             .i_writeAdd(write_address_MEM),
             .i_readAdd(read_address_MEM),
             .i_CLK(CLK100MHZ),
             .o_data(mem2));
            

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
   -    1100000010000000 (-1656)
   +    0000111111000000 (4032)
--------------------------------------
    11111111111111100000 (-32)

luego de pos procesamiento quedandome con 13 bits tiene que qedar
    01111111111111100000  invierto el signo mas significativo
           0111111111111  13 bist MSB
*/
endmodule