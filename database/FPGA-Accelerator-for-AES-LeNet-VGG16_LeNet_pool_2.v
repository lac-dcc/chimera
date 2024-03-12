`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/01/2018 09:13:10 PM
// Design Name: 
// Module Name: pool_2
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

`define CONV2_DEEP 50
`define POOL2_INPUT 8
`define POOL2_OUTPUT 4
`define POOL2_SIZE 2
`define DATA_SIZE 8

module pool_2(
    clk, rst, pool_2_en, result_bram_douta,
    result_bram_ena, result_bram_wea, result_bram_addra, result_bram_dina,
    pool_2_finish
    );
    input clk;
    input rst;
    input pool_2_en;
    input [`DATA_SIZE-1:0] result_bram_douta;
    output reg result_bram_ena;
    output reg result_bram_wea;
    output reg [14:0] result_bram_addra;
    output reg [`DATA_SIZE-1:0] result_bram_dina;
    output reg pool_2_finish;
    
    reg [4*`DATA_SIZE-1:0] din;
    wire [`DATA_SIZE-1:0] dout;
    
    reg [`DATA_SIZE-1:0] result;
    
    max_pool pool_2_mp(
        .din(din),
        .dout(dout)
    );
    
    reg [4:0] state;
    
    parameter S_IDLE         = 5'b10000,
              S_CHECK        = 5'b01000,
              S_LOAD_DATA    = 5'b00100,
              S_POOLING      = 5'b00010,
              S_STORE_RESULT = 5'b00001;
              
    integer count = 0,
            circle = 0,
            channel = 0,
            row = 0,
            column = 0,
            data_begin = 0;
            
    parameter conv2_result_base = 14400,
              pool2_result_base = 17600;
    
    always@(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            state <= S_IDLE;
            result_bram_ena <= 1'b0;
            result_bram_wea <= 1'b0;
        end
        else
        begin
            if(pool_2_en == 1'b1)
            begin
                case(state)
                    S_IDLE:
                    begin
                        channel <= 0;
                        circle <= 0;
                        row <= 0;
                        column <= 0;
                        din <= 0;
                        result <= 0;
                        pool_2_finish <= 1'b0;
                        state <= S_CHECK;
                    end
                    S_CHECK:
                    begin
                        if(channel == `CONV2_DEEP)
                        begin
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            pool_2_finish <= 1'b1;
                            state <= S_IDLE;
                        end
                        else
                        begin
                            circle <= 0;
                            count <= 0;
                            state <= S_LOAD_DATA;
                        end
                    end
                    S_LOAD_DATA:
                    begin
                        if(count < `POOL2_SIZE * `POOL2_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                result_bram_ena <= 1'b1;
                                result_bram_addra <= conv2_result_base + channel * `POOL2_INPUT * `POOL2_INPUT + (row + (count / `POOL2_SIZE)) * `POOL2_INPUT + column + count % `POOL2_SIZE;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                data_begin = `DATA_SIZE * (`POOL2_SIZE * `POOL2_SIZE - count) - 1;
                                din[data_begin-:`DATA_SIZE] <= result_bram_douta;
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
                            state <= S_POOLING;
                        end
                    end
                    S_POOLING:
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
                            result_bram_addra <= pool2_result_base + channel * `POOL2_OUTPUT * `POOL2_OUTPUT + row * `POOL2_OUTPUT + column;
                            result_bram_dina <= result;
                            circle <= circle + 1;
                        end
                        else if(circle == 3)
                        begin
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            circle <= 0;
                            if(column == `POOL2_OUTPUT - 1)
                            begin
                                if(row == `POOL2_OUTPUT - 1)
                                begin
                                    channel <= channel + 1;
                                end
                                row <= (row + 1) % `POOL2_OUTPUT;
                            end
                            column <= (column + 1) % `POOL2_OUTPUT;
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
                        result_bram_ena <= 1'b0;
                        result_bram_wea <= 1'b0;
                    end
                endcase
            end
        end
    end
    
endmodule
