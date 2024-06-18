// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module Adder11 (input[9:0] A, B, output [10:0] sum);

    wire [8:0] cio;

    FullAdder F1(.A(A[0]), .B(B[0]), .carry_in(1'b0), .sum(sum[0]), .carry_out(cio[0]));
    FullAdder F2(.A(A[1]), .B(B[1]), .carry_in(cio[0]), .sum(sum[1]), .carry_out(cio[1]));
    FullAdder F3(.A(A[2]), .B(B[2]), .carry_in(cio[1]), .sum(sum[2]), .carry_out(cio[2]));
    FullAdder F4(.A(A[3]), .B(B[3]), .carry_in(cio[2]), .sum(sum[3]), .carry_out(cio[3]));
    FullAdder F5(.A(A[4]), .B(B[4]), .carry_in(cio[3]), .sum(sum[4]), .carry_out(cio[4]));
    FullAdder F6(.A(A[5]), .B(B[5]), .carry_in(cio[4]), .sum(sum[5]), .carry_out(cio[5]));
    FullAdder F7(.A(A[6]), .B(B[6]), .carry_in(cio[5]), .sum(sum[6]), .carry_out(cio[6]));
    FullAdder F8(.A(A[7]), .B(B[7]), .carry_in(cio[6]), .sum(sum[7]), .carry_out(cio[7]));
    FullAdder F9(.A(A[8]), .B(B[8]), .carry_in(cio[7]), .sum(sum[8]), .carry_out(cio[8]));
    FullAdder F10(.A(A[9]), .B(B[9]), .carry_in(cio[8]), .sum(sum[9]), .carry_out(sum[10]));
    
endmodule