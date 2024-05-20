// This program was cloned from: https://github.com/HUZAIFA-TARIQ/GIKI-TapeOut-2
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2024 02:32:43 AM
// Design Name: 
// Module Name: tt_um_DigitalClockTop
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


module tt_um_DigitalClockTop(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
    );
    
    assign uio_oe = 8'b00111111;
    assign uio_out[6] = 1'b0;
    assign uio_out[7] = 1'b0;
    
    DigitalClock uut(
        .clk(clk),
        .rst(rst_n),
        .ssd_display(uo_out),
        .anode(uio_out[5:0]),
        .value_set_register(ui_in),                     
        .value_set_selection(uio_in[7:6])   
    );
endmodule
