// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module spi_state(
    input    wire  clk,           // System clock
    input    wire  reset,         // Asynchronous system reset
    input    wire  [15:0] datain, // Binary input vector
    output   wire  spi_cs_l,      //SPI Active-low chip select
    output   wire  spi_sclk,      // SPI bus clock
    output   wire  spi_data,      // SPI bus data
    output [4:0]counter
    );

    reg [15:0] MOSI;     // SPI shift register
    reg [4:0] count;     // Control counter
    reg cs_l;            // SPI chip select (active-low)
    reg sclk; 
    reg [2:0]state;
    
    always@(posedge clk or posedge reset)
        if(reset) begin
            MOSI <= 16'b0;
            count<= 5'd16;
            cs_l <= 1'b1;
            sclk <= 1'b0;
        end		
    
        else begin
            case (state)
            	
                0: begin
                    sclk <= 1'b0;
                    cs_l <= 1'b1;
                    state<=1;
                end
    
                1: begin
                    sclk <= 1'b0;
                    cs_l <= 1'b0;
                    MOSI <=datain[count-1];
                    count <=count-1;
                    state <=2;
                end
    
                2: begin
                    sclk <= 1'b1;
                    if(count > 0)
                        state<=1;
                    else begin
                        count<=16;
                        state<=0;
                    end
                end
    
                default:state<=0;
    
            endcase
        end

    assign spi_cs_l = cs_l;
    assign spi_sclk = sclk;
    assign spi_data = MOSI; 
    assign counter=count;
    
endmodule
    
