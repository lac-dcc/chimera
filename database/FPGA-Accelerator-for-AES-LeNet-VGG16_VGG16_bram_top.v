`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2018 11:39:15 PM
// Design Name: 
// Module Name: bram_top
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

module bram_top(
    clk, rst,
    loaddma_start, base_addr, num,
    doutb_in,
    data_ena, data_wea, data_addra, data_dina,
    storedma_start, 
    clkb_out, rstb_out, enb_out, web_out, addrb_out, dinb_out,
    loaddma_finish,
    vgg16_bram_douta,
    storedma_finish
    );
    input clk;
    input rst;
    input loaddma_start;
    input [19:0] base_addr;
    input [31:0] num;
    input [31:0] doutb_in;
    input data_ena;
    input [0:0] data_wea;
    input [19:0] data_addra;
    input [7:0] data_dina;
    input storedma_start;
    output clkb_out;
    output rstb_out;
    output reg enb_out;
    output reg [3:0] web_out;
    output reg [31:0] addrb_out;
    output reg [31:0] dinb_out;
    output reg loaddma_finish;
    output [7:0] vgg16_bram_douta;
    output reg storedma_finish;
    
    reg vgg16_bram_ena;
    reg [0:0] vgg16_bram_wea;
    reg [19:0] vgg16_bram_addra;
    reg [7:0] vgg16_bram_dina;
    // wire [7:0] vgg16_bram_douta;
    
    assign clkb_out = clk,
           rstb_out = rst;
    
    blk_mem_gen_0 vgg16_bram (
      .clka(clk),    // input wire clka
      .ena(vgg16_bram_ena),      // input wire ena
      .wea(vgg16_bram_wea),      // input wire [0 : 0] wea
      .addra(vgg16_bram_addra),  // input wire [19 : 0] addra
      .dina(vgg16_bram_dina),    // input wire [7 : 0] dina
      .douta(vgg16_bram_douta)  // output wire [7 : 0] douta
    );
    
    reg [2:0] state;
    parameter S_IDLE = 3'b100,
              S_LOAD_DMA = 3'b010,
              S_STORE_DMA = 3'b001;
              
    reg [31:0] count;
    
    integer circle = 0,
            databegin = 0,
            total = 0;
              
    always@(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            vgg16_bram_ena <= 1'b0;
            vgg16_bram_wea <= 1'b0;
            vgg16_bram_addra <= 20'b0;
            vgg16_bram_dina <= 8'b0;
            state <= S_IDLE;
            enb_out <= 1'b0;
            web_out <= 4'b0;
            addrb_out <= 32'b0;
            dinb_out <= 32'b0;
            loaddma_finish <= 1'b0;
        end
        else
        begin
            case (state)
                S_IDLE:
                begin
                    if(loaddma_start == 1'b1)
                    begin
                        enb_out <= 1'b1;
                        addrb_out <= 32'b0;
                        vgg16_bram_ena <= 1'b1;
                        vgg16_bram_wea <= 1'b1;
                        vgg16_bram_addra <= base_addr;
                        count <= 32'b0;
                        circle <= 0;
                        state <= S_LOAD_DMA;
                        loaddma_finish <= 1'b0;
                    end
                    else if(storedma_start == 1'b1)
                    begin
                        enb_out <= 1'b1;
                        web_out <= 4'b1;
                        addrb_out <= 32'b0;
                        dinb_out <= 32'b0;
                        vgg16_bram_ena <= 1'b1;
                        vgg16_bram_addra <= base_addr;
                        count <= 32'b0;
                        circle <= 0;
                        total <= 0;
                        storedma_finish <= 1'b0;
                        state <= S_STORE_DMA;
                    end
                    else
                    begin
                        vgg16_bram_ena <= data_ena;
                        vgg16_bram_wea <= data_wea;
                        vgg16_bram_addra <= data_addra;
                        vgg16_bram_dina <= data_dina;
                        state <= S_IDLE;
                    end
                end
                S_LOAD_DMA:
                begin
                    if(count == num)
                    begin
                        count <= 32'b0;
                        state <= S_IDLE;
                        enb_out <= 1'b0;
                        addrb_out <= 32'b0;
                        circle <= 0;
                        vgg16_bram_ena <= 1'b0;
                        vgg16_bram_wea <= 1'b0;
                        vgg16_bram_addra <= 20'b0;
                        loaddma_finish <= 1'b1;
                    end
                    else
                    begin
                        databegin = `DATA_SIZE * (4 - circle) - 1;
                        vgg16_bram_dina <= doutb_in[databegin-:8];
                        vgg16_bram_addra <= vgg16_bram_addra + count[19:0];
                        count <= count + 32'b1;
                        circle = circle + 1;
                        if(circle == 4)
                        begin
                            circle <= 0;
                            addrb_out <= addrb_out + 32'b1;
                        end
                    end
                end
                S_STORE_DMA:
                begin
                    if(circle == 2)
                    begin
                        if(count == num)
                        begin
                            state <= S_IDLE;
                            enb_out <= 1'b0;
                            web_out <= 4'b0;
                            addrb_out <= 32'b0;
                            dinb_out <= 32'b0;
                            vgg16_bram_ena <= 1'b0;
                            vgg16_bram_addra <= 20'b0;
                            count <= 32'b0;
                            total <= 0;
                            storedma_finish <= 1'b1;
                        end
                        else
                        begin
                            databegin = `DATA_SIZE * (4 - total) - 1;
                            dinb_out[databegin-:8] <= vgg16_bram_douta;
                            vgg16_bram_addra <= vgg16_bram_addra + 20'b1;
                            count <= count + 32'b1;
                            total = total + 1;
                            if(total == 4)
                            begin
                                total <= 0;
                                addrb_out <= addrb_out + 32'b1;
                            end
                        end
                        circle <= 0;
                    end
                    else
                    begin
                        circle <= circle + 1;
                    end
                end
                default:
                begin
                    state <= S_IDLE;
                end
            endcase
        end
    end
endmodule
