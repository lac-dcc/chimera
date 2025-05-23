// This program was cloned from: https://github.com/lnis-uofu/OpenFPGA
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 09:43:10 AM
// Design Name: 
// Module Name: bitstream_loader
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


module bitstream_loader(
    input prog_clk,
    input start,
    output config_chain_head,
    output reg done
    );
    
    parameter BITSTREAM_FILE="";
    parameter BITSTREAM_SIZE=6140;
    
    reg [BITSTREAM_SIZE<=2 ? 2 : $clog2(BITSTREAM_SIZE):0] bitstream_index;
    
    reg [13:0] bram_addr;
    reg [3:0] bram_line_index;
    
    wire bram_output;
    assign config_chain_head = bram_output;

    EFX_RAM_5K #(
      .READ_WIDTH(1),
      .WRITE_WIDTH(0),
      
      .INIT_0(256'h00000000000000000000000000000000000000000000007f00000000000000ff),
        .INIT_1(256'h0000fff8ffffffff000000000000000000000000000000000000000000000000),
        .INIT_2(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_3(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_4(256'h00000003f8000000000000000000000000000000000000000000000000000000),
        .INIT_5(256'h0000000000000000078000000000000000000000000000000000000000000000),
        .INIT_6(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_7(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_8(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_9(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_A(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_B(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_C(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_D(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_E(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_F(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
        .INIT_17(256'h0021000000000000000000000000000000000000000000000000000000000000),
   )
   EFX_RAM_5K_inst (
      // Port A Data: 16-bit (each) output: Port A data
      .WDATA(0),                // Write data
      .WADDR(0),                // Write address
      .WE(0),                    // Write enable

      .WCLK(0),
      .WCLKE(0),

      .RDATA(bram_output),
      .RADDR(bram_addr),
      .RE(1'b1),
      .RCLK(prog_clk)
   );
   
   
    initial begin
        bram_addr <= 0;
        bram_line_index <= 0;
        bitstream_index <= 0;
        done <= 1'b0;
    end
    
    always @(posedge prog_clk) begin
        if (start && !done) begin
            
            bram_addr <= bram_addr + 1;
            bitstream_index <= bitstream_index + 1;
        end
        if (bitstream_index == BITSTREAM_SIZE) begin
            done <= 1'b1;
        end
    end
    
    
endmodule








    