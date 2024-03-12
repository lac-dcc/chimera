`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2018 08:05:24 AM
// Design Name: 
// Module Name: pool
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
`define POOL_SIZE 2

module pool(
    clk, rst, pool_en,
    rownum, columnnum, channelnum,  
    data_base_addr, result_base_addr, 
    vgg16_bram_douta,
    vgg16_bram_ena, vgg16_bram_wea, vgg16_bram_addra, vgg16_bram_dina, 
    pool_finish
    );
    input clk;
    input rst;
    input pool_en;
    input [9:0] rownum;
    input [9:0] columnnum;
    input [9:0] channelnum;
    input [19:0] data_base_addr;
    input [19:0] result_base_addr;
    input [`DATA_SIZE-1:0] vgg16_bram_douta;
    output reg vgg16_bram_ena;
    output reg vgg16_bram_wea;
    output reg [19:0] vgg16_bram_addra;
    output reg [`DATA_SIZE-1:0] vgg16_bram_dina;
    output reg pool_finish;
    
    reg [4*`DATA_SIZE-1:0] din;
    wire [`DATA_SIZE-1:0] dout;
    
    reg [`DATA_SIZE-1:0] result;
    
    max_pool pool_mp(
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
            row = 0,
            column = 0,
            channel = 0,
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
            if(pool_en == 1'b1)
            begin
                case (state)
                    S_IDLE:
                    begin
                        channel <= 0;
                        circle <= 0;
                        row <= 0;
                        column <= 0;
                        din <= 0;
                        result <= 0;
                        pool_finish <= 1'b0;
                        state <= S_CHECK;
                    end
                    S_CHECK:
                    begin
                        if(channel == channelnum)
                        begin
                            vgg16_bram_ena <= 1'b0;
                            vgg16_bram_wea <= 1'b0;
                            pool_finish <= 1'b1;
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
                        if(count < `POOL_SIZE * `POOL_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                vgg16_bram_ena <= 1'b1;
                                vgg16_bram_addra <= data_base_addr + channel * rownum * columnnum + (row*2 + (count / `POOL_SIZE)) * rownum + column*2 + count % `POOL_SIZE;
                                circle <= circle + 1;
                            end
                            else if(circle == 2)
                            begin
                                databegin = `DATA_SIZE * (`POOL_SIZE * `POOL_SIZE - count) - 1;
                                din[databegin-:8] <= vgg16_bram_douta;
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
                            vgg16_bram_ena <= 1'b0;
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
                            vgg16_bram_ena <= 1'b1;
                            vgg16_bram_wea <= 1'b1;
                            vgg16_bram_addra <= result_base_addr + channel * rownum * columnnum + row * rownum + column;
                            vgg16_bram_dina <= result;
                            circle <= circle + 1;
                        end
                        else if(circle == 2)
                        begin
                            vgg16_bram_ena <= 1'b0;
                            vgg16_bram_wea <= 1'b0;
                            circle <= 0;
                            if(column == columnnum - 10'b1)
                            begin
                                if(row == rownum - 10'b1)
                                begin
                                    row <= 0;
                                    channel <= channel + 1;
                                end
                                else
                                begin
                                    row <= row + 1;
                                end
                                column <= 0;
                            end
                            else
                            begin
                                column <= column + 1;
                            end
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
