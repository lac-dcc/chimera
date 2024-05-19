// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps

`define BIT_LEN 8
`define CONV_LEN 20
`define CONV_LPOS 13
`define M_LEN 3

module Convolutor#(
    parameter BIT_LEN =`BIT_LEN,
    parameter CONV_LEN =`CONV_LEN,
    parameter CONV_LPOS = `CONV_LPOS,
    parameter M_LEN = `M_LEN
    )(
    output [CONV_LPOS-1:0] o_data,
    input [BIT_LEN-1:0] i_dato0,
    input [BIT_LEN-1:0] i_dato1,
    input [BIT_LEN-1:0] i_dato2,
    input i_selecK_I,
    input i_reset,
    input i_valid,
    input i_CLK
    );
    // registros del kernel
    // [j][i] Primero columnas luego filas
    reg signed [3*BIT_LEN-1:0] kernel [0:M_LEN-1];    
    // registros de la imagen
    reg signed [3*BIT_LEN-1:0] imagen [0:M_LEN-1];

    // resultado
    reg [CONV_LEN-1:0]  conv_reg;

    // reg de la convolucion
    reg signed [CONV_LEN-1:0] resultado;
    
    //  el resto de los cables    
    wire clk, selecK_I, rst, valid;

    integer ptr_row;
    integer ptr_column;

    assign clk = i_CLK;
    assign selecK_I = i_selecK_I; //KI=0 modo kernle k=1 modo imagen
    assign rst = i_reset;
    assign valid = i_valid;

    //Asigancion de Convolucion a la salida
    assign {o_data[CONV_LPOS-1],o_data[CONV_LPOS-2:0]}= {~conv_reg[CONV_LEN-1], conv_reg[CONV_LEN-2 : CONV_LEN-CONV_LPOS]};

    always @( posedge clk) begin
        if(rst) begin
            //reset valores de imagen
            imagen[0]<=24'h0;
            imagen[1]<=24'h0;
            imagen[2]<=24'h0;
            //reser valores de kernel
            kernel[0]<=24'h0;
            kernel[1]<=24'h0;
            kernel[2]<=24'h0;
            //regitro de la convolucion
            conv_reg<=0;
        end
        else if(valid)begin
            case (selecK_I)
                1'b1: begin
                    // imagen
                    imagen[0]<=imagen[1];
                    imagen[1]<=imagen[2];
                    imagen[2]<={i_dato2,i_dato1,i_dato0};
                    //latcheo de la salida 
                    conv_reg<= resultado;
                    //conv_reg<= resultado;
                end
                1'b0: begin
                    //kernel
                    kernel[0]<=kernel[1];
                    kernel[1]<=kernel[2];
                    kernel[2]<={i_dato2,i_dato1,i_dato0};
                    //salida
                    conv_reg<=conv_reg;

                end
            endcase
        end
        else begin 
            //imagen 
            imagen[0]<=imagen[0];
            imagen[1]<=imagen[1];
            imagen[2]<=imagen[2];
            //kernel
            kernel[0]<=kernel[0];
            kernel[1]<=kernel[1];
            kernel[2]<=kernel[2];
            //matengo el lacheo
            conv_reg<=conv_reg;
        end
    end
    
    //Arbol de Suma
    always @(*) begin

        resultado = 20'h0;
        for(ptr_row = 0 ; ptr_row < 3 ; ptr_row=ptr_row+1) 
        begin : SumaYMult
            for (ptr_column = 0 ; ptr_column < 3; ptr_column=ptr_column+1) 
            begin: SumaTop
                resultado = resultado + $signed(kernel[ptr_row][(ptr_column+1)*BIT_LEN-1 -: BIT_LEN])*
                                        $signed(imagen[ptr_row][(ptr_column+1)*BIT_LEN-1 -: BIT_LEN]);
            end
        end
        
    end
endmodule
