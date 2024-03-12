`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2018 08:39:53 AM
// Design Name: 
// Module Name: fc
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

`define DATA_SIZE 8
`define CONV_SIZE 3

module fc(
    clk, rst, fc_en, 
    weight_base_addr, bias_base_addr, data_base_addr, result_base_addr, rownum, columnnum,
    vgg16_bram_douta, 
    vgg16_bram_ena, vgg16_bram_wea, vgg16_bram_addra, vgg16_bram_dina, 
    fc_finish
    );
    input clk;
    input rst;
    input fc_en;
    input [19:0] weight_base_addr;
    input [19:0] bias_base_addr;
    input [19:0] data_base_addr;
    input [19:0] result_base_addr;
    input [9:0] rownum;
    input [14:0] columnnum;
    input [`DATA_SIZE-1:0] vgg16_bram_douta;
    output reg vgg16_bram_ena;
    output reg vgg16_bram_wea;
    output reg [19:0] vgg16_bram_addra;
    output reg [`DATA_SIZE-1:0] vgg16_bram_dina;
    output reg fc_finish;
    
    reg [`DATA_SIZE*`CONV_SIZE*`CONV_SIZE-1:0] matrix1;
    reg [`DATA_SIZE*`CONV_SIZE*`CONV_SIZE-1:0] matrix2;
    reg [`DATA_SIZE-1:0] bias;
    reg relu_en;
    wire [`DATA_SIZE-1:0] dout;
    reg [`DATA_SIZE-1:0] result;
    
    mult_add fc_ma(
        .matrix1(matrix1),
        .matrix2(matrix2),
        .bias(bias),
        .relu_en(relu_en),
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
            databegin = 0;
            
    always@(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            state <= S_IDLE;
            vgg16_bram_ena <= 1'b0;
            vgg16_bram_wea <= 1'b0;
        end
        else
        begin
            if(fc_en == 1'b1)
            begin
                case (state)
                    S_IDLE:
                    begin
                        row <= 0;
                        column <= 0;
                        matrix1 <= 0;
                        matrix2 <= 0;
                        bias <= 0;
                        relu_en <= 0;
                        result <= 0;
                        fc_finish <= 0;
                        state <= S_CHECK;
                    end
                    S_CHECK:
                    begin
                        if(row == rownum)
                        begin
                            vgg16_bram_ena <= 1'b0;
                            vgg16_bram_wea <= 1'b0;
                            relu_en <= 1'b0;
                            fc_finish <= 1'b1;
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
                        if(count < `CONV_SIZE * `CONV_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                vgg16_bram_ena <= 1'b1;
                                vgg16_bram_addra <= weight_base_addr + row * rownum + column;
                                circle <= circle + 1;
                            end
                            else if(circle == 2)
                            begin
                                databegin = `DATA_SIZE * (`CONV_SIZE * `CONV_SIZE - count) - 1;
                                matrix2[databegin-:8] <= vgg16_bram_douta;
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
                            column <= column - `CONV_SIZE * `CONV_SIZE;
                            vgg16_bram_ena <= 1'b0;
                            state <= S_LOAD_BIAS;
                        end
                    end
                    S_LOAD_BIAS:
                    begin
                        if(column < `CONV_SIZE * `CONV_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                vgg16_bram_ena <= 1'b1;
                                vgg16_bram_addra <= bias_base_addr + row;
                                circle <= circle + 1;
                            end
                            else if(circle == 2)
                            begin
                                bias <= vgg16_bram_douta;
                                circle <= 0;
                                count <= 0;
                                vgg16_bram_ena <= 1'b0;
                                state <= S_LOAD_DATA;
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
                        if(count < `CONV_SIZE * `CONV_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                vgg16_bram_ena <= 1'b1;
                                vgg16_bram_addra <= data_base_addr + column;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                databegin = `DATA_SIZE * (`CONV_SIZE * `CONV_SIZE - count) - 1;
                                matrix1[databegin-:8] <= vgg16_bram_douta;
                                count <= count + 1;
                                circle <= 0;
                                column <= column + 1;
                            end
                            else
                            begin
                                circle <= circle + 1;
                            end
                        end
                    end
                    S_MULTI_ADD:
                    begin
                        result <= result + dout;
                        if(column == columnnum)
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
                            vgg16_bram_ena <= 1'b1;
                            vgg16_bram_wea <= 1'b1;
                            vgg16_bram_addra <= result_base_addr + row;
                            vgg16_bram_dina <= result;
                            circle <= circle + 1;
                        end
                        else if(circle == 2)
                        begin
                            vgg16_bram_ena <= 1'b0;
                            vgg16_bram_wea <= 1'b0;
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
                        vgg16_bram_ena <= 1'b0;
                        vgg16_bram_wea <= 1'b0;
                    end
                endcase
            end
        end
    end
endmodule
