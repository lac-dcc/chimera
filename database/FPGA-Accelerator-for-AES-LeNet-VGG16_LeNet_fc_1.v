`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2017 08:00:24 AM
// Design Name: 
// Module Name: fc_1
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

`define FC1_SIZE 500
`define CONV2_DEEP 50
`define POOL2_OUTPUT 4
`define DATA_SIZE 8

module fc_1(
    clk, rst, fc_1_en, bias_weights_bram_douta, result_bram_douta,
    bias_weights_bram_ena, bias_weights_bram_addra,
    result_bram_ena, result_bram_wea, result_bram_addra, result_bram_dina,
    fc_1_finish
    );
    input clk;
    input rst;
    input fc_1_en;
    input [`DATA_SIZE-1:0] bias_weights_bram_douta;
    input [`DATA_SIZE-1:0] result_bram_douta;
    output reg bias_weights_bram_ena;
    output reg [18:0] bias_weights_bram_addra;
    output reg result_bram_ena;
    output reg result_bram_wea;
    output reg [14:0] result_bram_addra;
    output reg [`DATA_SIZE-1:0] result_bram_dina;
    output reg fc_1_finish;
    
    reg [`DATA_SIZE*25-1:0] matrix1;
    reg [`DATA_SIZE*25-1:0] matrix2;
    reg [`DATA_SIZE-1:0] bias;
    reg relu_1_en;
    wire [`DATA_SIZE-1:0] dout;
    reg [`DATA_SIZE-1:0] result;
    
    multi_add fc_1_ma(
        .matrix1(matrix1),
        .matrix2(matrix2),
        .bias(bias),
        .relu_1_en(relu_1_en),
        .dout(dout)
    );
    
    reg [6:0] state;
    
    parameter S_IDLE         = 7'b1000000,
              S_CHECK        = 7'b0100000,
              S_LOAD_WEIGHTS = 7'b0010000,
              S_LOAD_BIAS    = 7'b0001000,
              S_LOAD_DATA    = 7'b0000100,
              S_MULTI_ADD    = 7'b0000010,
              S_STORE_RESULT = 7'b0000001;
              
    integer count = 0,
            row = 0,
            column = 0,
            circle = 0,
            data_begin = 0;
            
    parameter pool2_result_base = 17600,
              fc1_weights_base = 25500,
              fc1_bias_base = 430570,
              fc1_result_base = 18400;
              
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
            if(fc_1_en == 1'b1)
            begin
                case(state)
                    S_IDLE:
                    begin
                        row <= 0;
                        column <= 0;
                        matrix1 <= 0;
                        matrix2 <= 0;
                        bias <= 0;
                        relu_1_en <= 1'b1;
                        result <= 0;
                        fc_1_finish <= 1'b0;
                        state <= S_CHECK;
                    end
                    S_CHECK:
                    begin
                        if(row == `FC1_SIZE)
                        begin
                            bias_weights_bram_ena <= 1'b0;
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            relu_1_en <= 1'b0;
                            fc_1_finish <= 1'b1;
                            state <= S_IDLE;
                        end
                        else
                        begin
                            circle <= 0;
                            count <= 0;
                            result <= 0;
                            state <= S_LOAD_WEIGHTS;
                        end
                    end
                    S_LOAD_WEIGHTS:
                    begin
                        if(count < 25)
                        begin
                            if(circle == 0)
                            begin
                                bias_weights_bram_ena <= 1'b1;
                                bias_weights_bram_addra <= fc1_weights_base + row * `CONV2_DEEP * `POOL2_OUTPUT * `POOL2_OUTPUT + column;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                data_begin = `DATA_SIZE * (25 - count) - 1;
                                matrix2[data_begin-:8] <= bias_weights_bram_douta;
                                count <= count + 1;
                                column <= column + 1;
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
                            column <= column - 25;
                            bias_weights_bram_ena <= 1'b0;
                            state <= S_LOAD_BIAS;
                        end
                    end
                    S_LOAD_BIAS:
                    begin
                        if(column < 25)
                            begin
                            if(circle == 0)
                            begin
                                bias_weights_bram_ena <= 1'b1;
                                bias_weights_bram_addra <= fc1_bias_base + row;
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
                        if(count < 25)
                        begin
                            if(circle == 0)
                            begin
                                result_bram_ena <= 1'b1;
                                result_bram_addra <= pool2_result_base + column;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                data_begin = `DATA_SIZE * (25 - count) - 1;
                                matrix1[data_begin-:8] <= result_bram_douta;
                                count <= count + 1;
                                column <= column + 1;
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
                            relu_1_en <= 1'b1;
                            state <= S_MULTI_ADD;
                        end
                    end
                    S_MULTI_ADD:
                    begin
                        result <= result + dout;
                        if(column == `CONV2_DEEP * `POOL2_OUTPUT * `POOL2_OUTPUT)
                        begin
                            circle <= 0;
                            state <= S_STORE_RESULT;
                        end
                        else
                        begin
                            circle <= 0;
                            count <= 0;
                            state <= S_LOAD_WEIGHTS;
                        end
                    end
                    S_STORE_RESULT:
                    begin
                        if(circle == 0)
                        begin
                            result_bram_ena <= 1'b1;
                            result_bram_wea <= 1'b1;
                            result_bram_addra <= fc1_result_base + row;
                            result_bram_dina <= result;
                            circle <= circle + 1;
                        end
                        else if(circle == 3)
                        begin
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            circle <= 0;
                            column <= 0;
                            count <= 0;
                            row <= row + 1;
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
