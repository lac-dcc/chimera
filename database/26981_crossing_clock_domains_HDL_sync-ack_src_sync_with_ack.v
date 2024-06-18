// This program was cloned from: https://github.com/ReiErt/crossing_clock_domains_HDL_sync-ack
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Reilly Ertman
// 
// Create Date: 28.03.2024 20:02:39
// Module Name: sync_with_ack
// Project Name: 
// Description: frequency agnostic CDC valid_in Synchronizer. valid_in pulse is passed between clock domains, regardless of frequency. Upstream clock_domain receives ack once downstream clock_domain is finished.
// 
//////////////////////////////////////////////////////////////////////////////////

module sync_with_ack(
    input clk_a,
    input a_reset_in,
    //
    input a_vld_in,
    output a_rdy_out,
    //
    //
    input clk_b,
    input b_reset_in,
    //
    output b_vld_out
);

// signal area BEGIN
reg FlagToggle_clkA;
reg [2:0] reg_SyncA_shift;
reg [1:0] reg_SyncB_shift;
// signal area END


// assign area BEGIN
assign b_vld_out = (reg_SyncA_shift[2] ^ reg_SyncA_shift[1]);
assign a_rdy_out = !(FlagToggle_clkA ^ reg_SyncB_shift[1]);
// assign area END


// always block area BEGIN
always @(posedge clk_a) begin
    if (~a_reset_in)
        FlagToggle_clkA <= 0;
    else
        FlagToggle_clkA <= FlagToggle_clkA ^ (a_vld_in);
end

always @(posedge clk_b) begin
    if (~b_reset_in)
        reg_SyncA_shift <= 0;
    else 
        reg_SyncA_shift <= {reg_SyncA_shift[1:0], FlagToggle_clkA};
end

always @(posedge clk_a) begin
    if (~a_reset_in)
        reg_SyncB_shift <= 0;
    else 
        reg_SyncB_shift <= {reg_SyncB_shift[0], reg_SyncA_shift[2]};
end
// always block area END

endmodule