`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/01/2018 08:32:31 PM
// Design Name: 
// Module Name: conv_2
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

`define CONV1_DEEP 20
`define CONV2_DEEP 50
`define CONV2_SIZE 5
`define CONV2_INPUT 12
`define CONV2_OUTPUT 8
`define DATA_SIZE 8

module conv_2(
    clk, rst, conv_2_en, bias_weights_bram_douta, result_bram_douta,
    bias_weights_bram_ena, bias_weights_bram_addra,
    result_bram_ena, result_bram_wea, result_bram_addra, result_bram_dina,
    conv_2_finish
    );
    input clk;
    input rst;
    input conv_2_en;
    input [`DATA_SIZE-1:0] bias_weights_bram_douta;
    input [`DATA_SIZE-1:0] result_bram_douta;
    output reg bias_weights_bram_ena;
    output reg [18:0] bias_weights_bram_addra;
    output reg result_bram_ena;
    output reg result_bram_wea;
    output reg [14:0] result_bram_addra;
    output reg [`DATA_SIZE-1:0] result_bram_dina;
    output reg conv_2_finish;
    
    integer filter = 0,
            channel = 0,
            row = 0,
            column = 0,
            count = 0;
    
    reg [`DATA_SIZE*`CONV2_SIZE*`CONV2_SIZE-1:0] matrix1;
    reg [`DATA_SIZE*`CONV2_SIZE*`CONV2_SIZE-1:0] matrix2;
    reg [`DATA_SIZE-1:0] bias;
    reg relu_1_en;
    wire [`DATA_SIZE-1:0] dout;
    reg [`DATA_SIZE-1:0] result;
    
    multi_add conv_2_ma(
        .matrix1(matrix1),
        .matrix2(matrix2),
        .bias(bias),
        .relu_1_en(relu_1_en),
        .dout(dout)
    );
    
    reg [6:0] state;
    
    parameter S_IDLE          = 7'b1000000,
              S_CHECK         = 7'b0100000,
              S_LOAD_WEIGHTS  = 7'b0010000,
              S_LOAD_BIAS     = 7'b0001000,
              S_LOAD_DATA     = 7'b0000100,
              S_CONVOLUTE     = 7'b0000010,
              S_STORE_RESULT  = 7'b0000001;
    
    integer data_begin = 0;
    integer circle = 0;
    
    parameter pool1_result_base = 11520,
              conv2_weights_base = 500,
              conv2_bias_base = 430520,
              conv2_result_base = 14400;
              
    always@(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            state <= S_IDLE;
            bias_weights_bram_ena <= 1'b0;
            result_bram_ena <= 1'b0;
            result_bram_wea <= 1'b0;
        end
        else
        begin
            if(conv_2_en == 1'b1)
            begin
                case(state)
                    S_IDLE:
                    begin
                        filter <= 0;
                        channel <= 0;
                        row <= 0;
                        column <= 0;
                        matrix1 <= 0;
                        matrix2 <= 0;
                        bias <= 0;
                        relu_1_en <= 1'b0;
                        result <= 0;
                        conv_2_finish <= 1'b0;
                        state <= S_CHECK;
                    end
                    S_CHECK:
                    begin
                        if(filter == `CONV2_DEEP)
                        begin
                            bias_weights_bram_ena <= 1'b0;
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            conv_2_finish <= 1'b1;
                            state <= S_IDLE;
                        end
                        else
                        begin
                            circle <= 0;
                            count <= 0;
                            state <= S_LOAD_WEIGHTS;
                        end
                    end
                    S_LOAD_WEIGHTS:
                    begin
                        if(count < `CONV2_SIZE*`CONV2_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                bias_weights_bram_ena <= 1'b1;
                                bias_weights_bram_addra <= conv2_weights_base + count;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                data_begin = `DATA_SIZE * (`CONV2_SIZE * `CONV2_SIZE - count) - 1;
                                matrix2[data_begin-:8] <= bias_weights_bram_douta;
                                count <= count + 1;
                                circle <= 0;
                            end
                            else
                            begin
                                circle <= circle + 1;
                            end
                        end
                        else
                        begin
                            circle <= 0;
                            count <= 0;
                            bias_weights_bram_ena <= 1'b0;
                            state <= S_LOAD_BIAS;
                        end
                    end
                    S_LOAD_BIAS:
                    begin
                        if(channel == 0)
                        begin
                            if(circle == 0)
                            begin
                                bias_weights_bram_ena <= 1'b1;
                                bias_weights_bram_addra <= conv2_bias_base + filter;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                bias <= bias_weights_bram_douta;
                                circle <= 0;
                                count <= 0;
                                bias_weights_bram_ena <= 1'b0;
                                state <= S_LOAD_DATA;
                            end
                            else
                            begin
                                circle <= circle + 1;
                            end
                        end
                        else
                        begin
                            bias <= result;
                            state <= S_LOAD_DATA;
                        end
                    end
                    S_LOAD_DATA:
                    begin
                        if(count < `CONV2_SIZE * `CONV2_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                result_bram_ena <= 1'b1;
                                result_bram_addra <= pool1_result_base + channel * `CONV2_INPUT * `CONV2_INPUT + (row + count / `CONV2_SIZE) * `CONV2_INPUT + column + count % `CONV2_SIZE;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                data_begin = `DATA_SIZE * (`CONV2_SIZE * `CONV2_SIZE - count) - 1;
                                matrix1[data_begin-:8] <= result_bram_douta;
                                count <= count + 1;
                                circle <= 0;
                            end
                            else
                            begin
                                circle <= circle + 1;
                            end
                        end
                        else
                        begin
                            circle <= 0;
                            count <= 0;
                            result_bram_ena <= 1'b0;
                            relu_1_en <= 1'b0;
                            state <= S_CONVOLUTE;
                        end
                    end
                    S_CONVOLUTE:
                    begin
                        result <= dout;
                        circle <= 0;
                        state <= S_STORE_RESULT;
                    end
                    S_STORE_RESULT:
                    begin
                        if(circle == 0)
                        begin
                            result_bram_ena <= 1'b1;
                            result_bram_wea <= 1'b1;
                            result_bram_addra <= conv2_result_base + filter * `CONV2_OUTPUT * `CONV2_OUTPUT + row * `CONV2_OUTPUT + column;
                            result_bram_dina <= result;
                            circle <= circle + 1;
                        end
                        else if(circle == 3)
                        begin
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            circle <= 0;
                            if(column == `CONV2_OUTPUT - 1)
                            begin
                                if(row == `CONV2_OUTPUT - 1)
                                begin
                                    if(channel == `CONV1_DEEP - 1)
                                    begin
                                        filter <= filter + 1;
                                    end
                                    channel <= (channel + 1) % `CONV1_DEEP;
                                end
                                row <= (row + 1) % `CONV2_OUTPUT;
                            end
                            column <= (column + 1) % `CONV2_OUTPUT;
                            state <= S_CHECK;
                        end
                        else
                        begin
                            circle <= circle + 1;
                        end
                    end
                    default:
                    begin
                        state <= S_IDLE;
                        bias_weights_bram_ena <= 1'b0;
                        result_bram_ena <= 1'b0;
                        result_bram_wea <= 1'b0;
                    end
                endcase
            end
        end
    end

endmodule
