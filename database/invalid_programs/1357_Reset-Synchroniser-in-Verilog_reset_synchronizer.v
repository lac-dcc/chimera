// This program was cloned from: https://github.com/ReiErt/Reset-Synchroniser-in-Verilog
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Reilly Ertman
// 
// Create Date: 05.05.2024 12:05:47
// Module Name: reset_synchronizer
// Tool Versions: 
// Description: Resets are asynchronously asserted but synchronous de-asserted, to avoid metastability. 
// 
//////////////////////////////////////////////////////////////////////////////////


module reset_synchronizer
#(parameter p_reset_polarity = 1'b0,
  parameter p_num_ff = 2)
(
    input i_clk,
    input i_asynch_reset,
    //
    output o_sync_reset
);

    // signal area BEGIN
    wire w_new_reset;
    reg [p_num_ff-1:0] r_synchronous_ff;
    // signal area END
 
    // assign area BEGIN
    assign sync_reset_out = r_synchronous_ff[p_num_ff-1];     //last FF in chain is now our synchronous reset;
    assign w_new_reset = asynch_reset_in ^ p_reset_polarity;
    // assign area END   
    
    // procedure area BEGIN
    always @ (posedge clk or negedge w_new_reset) begin     // synchronise asynchronous signal
        if (~w_new_reset) 
            r_synchronous_ff <= {p_num_ff{p_reset_polarity}};
        else 
            r_synchronous_ff <= {r_synchronous_ff[p_num_ff-2:0], ~p_reset_polarity};
    end
    // procedure area END
    
endmodule