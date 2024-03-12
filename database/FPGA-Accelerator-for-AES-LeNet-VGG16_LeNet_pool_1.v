`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2017 01:09:48 AM
// Design Name: 
// Module Name: pool_1
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
`define POOL1_INPUT 24
`define POOL1_OUTPUT 12
`define POOL1_SIZE 2
`define DATA_SIZE 8

module pool_1(
    clk, rst, pool_1_en, result_bram_douta,
    result_bram_ena, result_bram_wea, result_bram_addra, result_bram_dina,
    pool_1_finish
    );
    input clk;
    input rst;
    input pool_1_en;
    input [`DATA_SIZE-1:0] result_bram_douta;
    output reg result_bram_ena;
    output reg result_bram_wea;
    output reg [14:0] result_bram_addra;
    output reg [`DATA_SIZE-1:0] result_bram_dina;
    output reg pool_1_finish;
    
    reg [4*`DATA_SIZE-1:0] din;
    wire [`DATA_SIZE-1:0] dout;
    
    reg [`DATA_SIZE-1:0] result;
    
    max_pool pool_1_mp(
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
            
    parameter conv1_result_base = 0,
              pool1_result_base = 11520;
    
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
            if(pool_1_en == 1'b1)
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
                        pool_1_finish <= 1'b0;
                        state <= S_CHECK;
                    end
                    S_CHECK:
                    begin
                        if(channel == `CONV1_DEEP)
                        begin
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            pool_1_finish <= 1'b1;
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
                        if(count < `POOL1_SIZE * `POOL1_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                result_bram_ena <= 1'b1;
                                result_bram_addra <= conv1_result_base + channel * `POOL1_INPUT * `POOL1_INPUT + (row + (count / `POOL1_SIZE)) * `POOL1_INPUT + column + count % `POOL1_SIZE;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                data_begin = `DATA_SIZE * (`POOL1_SIZE * `POOL1_SIZE - count) - 1;
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
                            result_bram_addra <= pool1_result_base + channel * `POOL1_OUTPUT * `POOL1_OUTPUT + row * `POOL1_OUTPUT + column;
                            result_bram_dina <= result;
                            circle <= circle + 1;
                        end
                        else if(circle == 3)
                        begin
                            result_bram_ena <= 1'b0;
                            result_bram_wea <= 1'b0;
                            circle <= 0;
                            if(column == `POOL1_OUTPUT - 1)
                            begin
                                if(row == `POOL1_OUTPUT - 1)
                                begin
                                    channel <= channel + 1;
                                end
                                row <= (row + 1) % `POOL1_OUTPUT;
                            end
                            column <= (column + 1) % `POOL1_OUTPUT;
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
