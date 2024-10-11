// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_encoder;
    reg [3:0]data;
    wire [6:0] ham_data_encoder;
    
    hamming_encoder dut(data, ham_data_encoder);
    
    initial begin
     data=4'b0110;	
     #2 $display("\n \t Output of Hamming Encoder: %b \n",ham_data_encoder);
    #10 $stop;  //we will get output=1010101, please check in console after run the simulation
    end
    endmodule
