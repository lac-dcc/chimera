// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_decoder;
    reg [6:0] ham_data_encoder;
    wire [2:0]error_position;
    wire is_error; 
    wire [3:0]data;
    
    
    hamming_decoder dut(ham_data_encoder,data,error_position,is_error);
    
    initial begin   
     ham_data_encoder= 7'b0110011;//error input at  0th position
    
    #20 ham_data_encoder= 7'b1110011;//error input at  7th position
    
    #20 ham_data_encoder= 7'b0110111;//error input at  3rd position

    end
    
    initial begin
    $monitor("\t\t Decoded Data: %b  Is there an Error=%b  Error is at Position: %d  \n",   data,is_error,error_position);
    #60 $finish;
    end
endmodule
