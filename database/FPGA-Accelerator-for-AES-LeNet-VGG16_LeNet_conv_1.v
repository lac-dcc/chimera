`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2017 05:44:43 PM
// Design Name: 
// Module Name: conv_1
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

`define INPUT_NODE 784
`define IMAGE_SIZE 28
`define NUM_CHANNELS 1
`define CONV1_DEEP 20
`define CONV1_SIZE 5
`define CONV1_OUTPUT 24
`define DATA_SIZE 8

module conv_1(
    clk, rst, conv_1_en, bias_weights_bram_douta, input_bram_douta, graph,
    bias_weights_bram_ena, bias_weights_bram_addra,
    result_bram_ena, result_bram_wea, result_bram_addra, result_bram_dina,
    input_bram_ena, input_bram_addra,
    conv_1_finish
    );
    input clk;
    input rst;
    input conv_1_en;
    input [`DATA_SIZE-1:0] bias_weights_bram_douta;
    input [`DATA_SIZE-1:0] input_bram_douta;
    input [4:0] graph;
    output reg bias_weights_bram_ena;
    output reg [18:0] bias_weights_bram_addra;
    output reg result_bram_ena;
    output reg result_bram_wea;
    output reg [14:0] result_bram_addra;
    output reg [`DATA_SIZE-1:0] result_bram_dina;
    output reg input_bram_ena;
    output reg [12:0] input_bram_addra;
    output reg conv_1_finish;
    
    //reg [4:0] filter;
    //reg [4:0] row;
    //reg [4:0] column;
    
    integer filter = 0,
            channel = 0,
            row = 0,
            column = 0,
            count = 0;
    
    reg [`DATA_SIZE*`CONV1_SIZE*`CONV1_SIZE-1:0] matrix1;
    reg [`DATA_SIZE*`CONV1_SIZE*`CONV1_SIZE-1:0] matrix2;
    reg [`DATA_SIZE-1:0] bias;
    reg relu_1_en;
    wire [`DATA_SIZE-1:0] dout;
    reg [`DATA_SIZE-1:0] result;
    
    multi_add conv_1_ma(
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
    
    parameter conv1_weights_base = 0,
              conv1_bias_base = 430500,
              conv1_result_base = 0;
    
    always@(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            state <= S_IDLE;
            bias_weights_bram_ena <= 1'b0;
            result_bram_ena <= 1'b0;
            result_bram_wea <= 1'b0;
            input_bram_ena <= 1'b0;
        end
        else
        begin
            if(conv_1_en == 1'b1)
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
                        conv_1_finish <= 1'b0;
                        state <= S_CHECK;
                    end
                    S_CHECK:
                    begin
                        if(filter == `CONV1_DEEP)
                        begin
                            bias_weights_bram_ena <= 1'b0;
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            input_bram_ena <= 1'b0;
                            conv_1_finish <= 1'b1;
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
                        if(count < `CONV1_SIZE*`CONV1_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                bias_weights_bram_ena <= 1'b1;
                                bias_weights_bram_addra <= conv1_weights_base + count;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                data_begin = `DATA_SIZE * (`CONV1_SIZE * `CONV1_SIZE - count) - 1;
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
                        if(circle == 0)
                        begin
                            bias_weights_bram_ena <= 1'b1;
                            bias_weights_bram_addra <= conv1_bias_base + filter;
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
                    S_LOAD_DATA:
                    begin
                        if(count < `CONV1_SIZE * `CONV1_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                input_bram_ena <= 1'b1;
                                input_bram_addra <= graph * `INPUT_NODE + (row + count / `CONV1_SIZE) * `IMAGE_SIZE + column + count % `CONV1_SIZE;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                data_begin = `DATA_SIZE * (`CONV1_SIZE * `CONV1_SIZE - count) - 1;
                                matrix1[data_begin-:8] <= input_bram_douta;
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
                            input_bram_ena <= 1'b0;
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
                            result_bram_addra <= conv1_result_base + filter * `CONV1_OUTPUT * `CONV1_OUTPUT + row * `CONV1_OUTPUT + column;
                            result_bram_dina <= result;
                            circle <= circle + 1;
                        end
                        else if(circle == 3)
                        begin
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            circle <= 0;
                            if(column == `CONV1_OUTPUT - 1)
                            begin
                                if(row == `CONV1_OUTPUT - 1)
                                begin
                                    if(channel == `NUM_CHANNELS - 1)
                                    begin
                                        filter <= filter + 1;
                                    end
                                    channel <= (channel + 1) % `NUM_CHANNELS;
                                end
                                row <= (row + 1) % `CONV1_OUTPUT;
                            end
                            column <= (column + 1) % `CONV1_OUTPUT;
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
                        input_bram_ena <= 1'b0;
                    end
                endcase
            end
        end
    end
    
endmodule
