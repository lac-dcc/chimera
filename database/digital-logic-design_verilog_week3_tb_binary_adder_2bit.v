`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2022 10:54:16 PM
// Design Name: 
// Module Name: tb_binary_adder_2bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_binary_adder_2bit;

reg [1:0] a_i,b_i;  // define inputs of DUT as reg
reg cin_i;
wire [1:0] s_o;     // define outputs of DUT as wire
wire cout_o;

binary_adder_2bit DUT   // Design Under Test
(
.a_i    (a_i   ),
.b_i    (b_i   ),
.cin_i  (cin_i ),
.s_o    (s_o   ),
.cout_o (cout_o)
);

initial begin
    a_i     = 2'b00;
    b_i     = 2'b00;
    cin_i   = 1'b0;
    #10;
    a_i     = 2'b01;
    b_i     = 2'b10;
    cin_i   = 1'b1;
    #10;
    a_i     = 2'b11;
    b_i     = 2'b11;
    cin_i   = 1'b1;
    #10;
    a_i     = 2'b11;
    b_i     = 2'b11;
    cin_i   = 1'b0;
    #10;
    a_i     = 2'b01;
    b_i     = 2'b01;
    cin_i   = 1'b1;
    #10;
    $finish;
end

endmodule