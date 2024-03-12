`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2018 03:04:16 AM
// Design Name: 
// Module Name: mult_add
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

`define LENGTH 3
`define WIDTH 3
`define DATA_SIZE 8

module mult_add(
    matrix1, matrix2, bias, relu_en, dout
    );
    input [`DATA_SIZE*`LENGTH*`WIDTH-1:0] matrix1;
    input [`DATA_SIZE*`LENGTH*`WIDTH-1:0] matrix2;
    input [`DATA_SIZE-1:0] bias;
    input relu_en;
    output [`DATA_SIZE-1:0] dout;
    
    reg [2*`DATA_SIZE-1:0] temp;
    reg sign;
    reg [`DATA_SIZE-1:0] item1;
    reg [`DATA_SIZE-1:0] item2;
    reg [2*(`DATA_SIZE-1)-1:0] midvalue;
    reg [`DATA_SIZE-1:0] result;
    wire [`DATA_SIZE-1:0] relu_result;
    
    relu ma_relu(
        .din(result),
        .dout(relu_result)
    );
    
    integer i = 0;
    integer data_begin = 0;
    
    assign dout = (relu_en == 1'b1) ? relu_result : result;
    
    always@(*)
    begin
        temp = 8'b0;
        sign = 1'b0;
        item1 = 8'b0;
        item2 = 8'b0;
        midvalue = 14'b0;
        for(i = 0; i < `LENGTH*`WIDTH; i = i + 1)
        begin
            data_begin = `DATA_SIZE * (`LENGTH * `WIDTH - i) - 1;
            sign = matrix1[data_begin] ^ matrix2[data_begin];
            item1 = (matrix1[data_begin] == 1'b0) ? matrix1[data_begin-:8] : {matrix1[data_begin], ~matrix1[(data_begin-1)-:7] + 1'b1};
            item2 = (matrix2[data_begin] == 1'b0) ? matrix2[data_begin-:8] : {matrix2[data_begin], ~matrix2[(data_begin-1)-:7] + 1'b1};
            midvalue = item1[`DATA_SIZE-2:0] * item2[`DATA_SIZE-2:0];
            temp = temp + {sign, midvalue, 1'b0};
        end
        temp = temp + {bias, 8'b0};
        result = temp >> 8;
    end
    
endmodule
