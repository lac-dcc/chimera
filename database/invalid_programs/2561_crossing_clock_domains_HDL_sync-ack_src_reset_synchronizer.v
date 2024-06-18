// This program was cloned from: https://github.com/ReiErt/crossing_clock_domains_HDL_sync-ack
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Reilly Ertman
// 
// Create Date: 05.05.2024 12:05:47
// Module Name: reset_synchronizer
// Tool Versions: 
// Description: Resets are asynchronously asserted but synchronous de asserted. 
// 
//////////////////////////////////////////////////////////////////////////////////


module reset_synchronizer
#(parameter reset_polarity = 1'b0,
  parameter num_ff = 2)
(
    input clk,
    input asynch_reset_in,
    //
    output sync_reset_out
);

    // signal area BEGIN
    wire new_reset;
    reg [num_ff-1:0] synchronous_ff;
    // signal area END
 
    // assign area BEGIN
    assign sync_reset_out = synchronous_ff[num_ff-1];     //last FF in chain is now our synchronous reset;
    assign new_reset = asynch_reset_in ^ reset_polarity;
    // assign area END   
    
    // always block area BEGIN
    always @ (posedge clk or negedge reset) begin     // synchronise asynchronous signal
        if (~new_reset) 
            synchronous_ff <= {num_ff{reset_polarity}};
        else 
            synchronous_ff <= {synchronous_ff[num_ff-2:0], ~reset_polarity};
    end
    // always block area END
    
endmodule