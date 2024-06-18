// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps

`define BIT_LEN     8
`define CONV_LEN    20
`define CONV_LPOS   13
`define M_LEN       3

module Convolutor #(
    parameter BIT_LEN       = `BIT_LEN,
    parameter CONV_LEN      = `CONV_LEN,
    parameter CONV_LPOS     = `CONV_LPOS,
    parameter M_LEN         = `M_LEN,
    localparam BIT_ARRAY    = BIT_LEN*M_LEN
    )(
    output [CONV_LPOS-1:0]  o_data,
    input [BIT_LEN-1:0]     i_dato0,
    input [BIT_LEN-1:0]     i_dato1,
    input [BIT_LEN-1:0]     i_dato2,
    input i_selecK_I, //KI=0 modo kernle k=1 modo imagen
    input i_reset,
    input i_valid,
    input i_CLK
    
    );
    // registros del kernel
    // [j][i] Primero columnas luego filas
    reg signed [BIT_ARRAY-1:0]  kernel [0:M_LEN-1];    
    // registros de la imagen
    reg signed [BIT_ARRAY-1:0]  imagen [0:M_LEN-1];
    // resultado
    reg signed [CONV_LPOS-1:0]  conv_reg;
    // reg de la convolucion
    
    reg signed [CONV_LEN-3:0]   parcial0,parcial1;

    wire signed [CONV_LEN-1:0]   resultado;
    
    reg signed [(2*BIT_LEN)-1:0] array_prod [0:(M_LEN*M_LEN)-1];

    integer ptr0 , ptr1, i;
    integer shift;

    //Asigancion de Convolucion a la salida
    assign {o_data[CONV_LPOS-1],o_data[CONV_LPOS-2:0]}= {~conv_reg[CONV_LPOS-1], conv_reg[CONV_LPOS-2:0]};
    always @( posedge i_CLK) begin
        if(i_reset) begin
            //reset valores de imagen y kernel
            for(shift=0; shift < M_LEN; shift = shift +1) begin
                imagen[shift]<={BIT_ARRAY{1'b0}};
                kernel[shift]<={BIT_ARRAY{1'b0}};
            end 
            //regitro de la convolucion
            conv_reg<={CONV_LPOS{1'b0}};
        end
        else if(i_valid)begin
            case (i_selecK_I)
                1'b1: begin
                    // imagen
                    for( shift = 0; shift < M_LEN-1; shift = shift +1)
                        imagen[shift]<=imagen[shift+1];
                    
                    imagen[M_LEN-1]<={i_dato2,i_dato1,i_dato0};
                    //latcheo de la salida 
                    conv_reg<= resultado[CONV_LEN-2:CONV_LEN-CONV_LPOS-1];
                end
                1'b0: begin
                    //kernel
                    for( shift = 0; shift < M_LEN-1; shift = shift +1)
                        kernel[shift]<=kernel[shift+1];

                    kernel[M_LEN-1]<={i_dato2,i_dato1,i_dato0};
                    //salida
                    conv_reg<=conv_reg;
                end
            endcase
        end
        else begin 
            //imagen 
            for (shift =0 ; shift<M_LEN;shift=shift+1) begin: elseequ
                imagen[shift]<=imagen[shift];
                kernel[shift]<=kernel[shift];
            end
            //matengo el lacheo
            conv_reg<=conv_reg;
        end
    end
    //Arbol de Suma
    /*
    generate
        genvar i;
        for(i = 0 ; i < (M_LEN*M_LEN) ; i=i+1) 
            assign array_prod[i] =  $signed(kernel[i/3][((i%3)+1)*BIT_LEN-1 -: BIT_LEN])*
                                    $signed(imagen[i/3][((i%3)+1)*BIT_LEN-1 -: BIT_LEN]);
        
    endgenerate
     */

    always@(posedge i_CLK)
        for(i = 0 ; i < (M_LEN*M_LEN) ; i=i+1) begin
            array_prod[i] =
                $signed(kernel[i/3][((i%3)+1)*BIT_LEN-1 -: BIT_LEN])*
                $signed(imagen[i/3][((i%3)+1)*BIT_LEN-1 -: BIT_LEN]);
        end
    
    always @(*) begin
        parcial0=0;
        for(ptr0 = 0 ; ptr0 < 4; ptr0 = ptr0 +1)begin
            parcial0 = parcial0 + array_prod[ptr0];
        end
    end

    always @(*) begin
        parcial1=0;
        for(ptr1 = 0 ; ptr1 < 4; ptr1 = ptr1 +1)begin
            parcial1 = parcial1 + array_prod[4+ptr1]; 
        end
    end
    //assignacion de las sumas parciales, a la convolucion
    assign  resultado = parcial0 + parcial1 + array_prod[8];
   
endmodule