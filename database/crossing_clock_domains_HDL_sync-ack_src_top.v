// This program was cloned from: https://github.com/ReiErt/crossing_clock_domains_HDL_sync-ack
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 17:09:21
// Design Name: 
// Module Name: top
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

module top
(
    input clk_a,
    input a_reset_in,
    //
    input a_vld_in,
    //
    //
    input clk_b,
    input b_reset_in,
    output b_vld_out
);
    
// DUT inputs as reg
reg top_reg_a_vld_in;

// DUT outputs
wire top_wire_b_vld_out;

// Interconnect modules
wire wire_sync_reset_a;
wire wire_sync_reset_b;
wire wire_Adomain_to_sync_vld;  // domain_a to sync
wire wire_sync_to_Adomain_rdy;
wire wire_sync_to_Bdomain_vld; // sync to domain b

reset_synchronizer #() reset_synchronizer_a_inst
(
    .clk(clk_a),
    .asynch_reset_in(a_reset_in),
    .sync_reset_out(wire_sync_reset_a)
);

reset_synchronizer #() reset_synchronizer_b_inst
(
    .clk(clk_b),
    .asynch_reset_in(b_reset_in),
    .sync_reset_out(wire_sync_reset_b)
);

clk_domain_a #() clk_domain_a_inst
(
    .clk_a(clk_a),
    .reset_in(wire_sync_reset_a),
    .vld_in(a_vld_in),
    //
    .vld_out(wire_Adomain_to_sync_vld),
    .rdy_in(wire_sync_to_Adomain_rdy)
);

sync_with_ack #() sync_with_ack_inst
(
    .clk_a(clk_a),
    .a_reset_in(wire_sync_reset_a),
    .a_vld_in(wire_Adomain_to_sync_vld),
    .a_rdy_out(wire_sync_to_Adomain_rdy),
    //
    .clk_b(clk_b),
    .b_reset_in(wire_sync_reset_b),
    .b_vld_out(wire_sync_to_Bdomain_vld)
);

clk_domain_b #() clk_domain_b_inst
(
    .clk_b(clk_b),
    .reset_in(wire_sync_reset_b),
    .vld_in(wire_sync_to_Bdomain_vld),
    //
    .vld_out(b_vld_out)
);
    
endmodule
