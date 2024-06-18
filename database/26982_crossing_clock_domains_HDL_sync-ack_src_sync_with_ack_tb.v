// This program was cloned from: https://github.com/ReiErt/crossing_clock_domains_HDL_sync-ack
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2024 20:02:39
// Design Name: 
// Module Name: DUT
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

module sync_with_ack_tb();

// parameter area
parameter T = 10;

// DUT inputs as reg
reg tb_clk_A;
reg tb_a_vld_in;
reg tb_clk_B;
reg tb_a_reset_in;
reg tb_b_reset_in;

// DUT outputs as wire
wire tb_vld_out;

top #() top_inst
(
    .clk_a(tb_clk_A),
    .a_reset_in(tb_a_reset_in),
    //
    .a_vld_in(tb_a_vld_in),
    //.a_rdy_out(tb_a_rdy_out),
    //
    .clk_b(tb_clk_B),
    .b_reset_in(tb_b_reset_in),
    .b_vld_out(tb_vld_out)
);

//clock_a
initial begin
    tb_clk_A = 1'b0; // Initialize clock 1
    #1; // Initial delay
    // Generate clock 1 with a period of 10ns
    forever #7 tb_clk_A = ~tb_clk_A;
end

//clock_b
always begin
  tb_clk_B = 1'b1;
  #(T/2);
  tb_clk_B = 1'b0;
  #(T/2);
end

// TB program logic
initial begin
    tb_a_reset_in = 1'b0;
    tb_b_reset_in = 1'b0;
    tb_a_vld_in = 1'b0;
    
    @(posedge tb_clk_A);
    tb_a_reset_in = 1'b1; 
    tb_b_reset_in = 1'b1;
    
    repeat (4) begin
        @(posedge tb_clk_A);
    end
    
    repeat (16) begin // send out vld_in and wait for vld_out
        tb_a_vld_in = 1'b1;
        @(posedge tb_clk_A);
        tb_a_vld_in = 1'b0;
        @(posedge tb_vld_out);
        @(posedge tb_clk_A);
    end
end

endmodule