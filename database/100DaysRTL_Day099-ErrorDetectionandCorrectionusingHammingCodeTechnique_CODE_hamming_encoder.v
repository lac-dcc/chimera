// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module hamming_encoder(
    input [3:0]data,
    output [6:0] ham_data_encoder
    );
    
    assign ham_data_encoder[0]=data[0]^data[1]^data[3]; // P1= 1 xor 3 xor 5 xor 7
    
    assign ham_data_encoder[1]=data[0]^data[2]^data[3]; // P2= 2 xor 3 xor 6 xor 7
    
    assign ham_data_encoder[2]=data[0];
    
    assign ham_data_encoder[3]=data[1]^data[2]^data[3]; // P3= 4 xor 5 xor 6 xor 7
    
    assign ham_data_encoder[4]=data[1];
    
    assign ham_data_encoder[5]=data[2];
    
    assign ham_data_encoder[6]=data[3];
    
endmodule
