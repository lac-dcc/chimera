// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// 1レーン分の受信
module jelly_mipi_rx_lane_recv
        #(
            parameter   LANES = 2
        )
        (
            input   wire                    reset,
            input   wire                    clk,
            
            // input
            input   wire    [LANES*8-1:0]   in_rxdatahs,       // data
            input   wire    [LANES-1:0]     in_rxvalidhs,      // syncコードでは立たない
            input   wire    [LANES-1:0]     in_rxactivehs,     // hs期間
            input   wire    [LANES-1:0]     in_rxsynchs,       // syncコード
            
            // output
            output  wire                    out_first,
            output  wire                    out_last,
            output  wire    [LANES*8-1:0]   out_data,
            output  wire                    out_valid
        );
    
    reg     [LANES*8-1:0]   st0_rxdatahs;
    reg     [LANES-1:0]     st0_rxvalidhs;
    reg     [LANES-1:0]     st0_rxactivehs;
    reg     [LANES-1:0]     st0_rxsynchs;
    
    reg                     st1_busy;
    reg     [LANES*8-1:0]   st1_data;
    reg                     st1_first;
    reg                     st1_last;
    reg                     st1_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_rxdatahs   <= {LANES{8'hxx}};
            st0_rxvalidhs  <= {LANES{1'b0}};
            st0_rxactivehs <= {LANES{1'b0}};
            st0_rxsynchs   <= {LANES{1'b0}};
            
            st1_busy       <= 1'b0;
            st1_data       <= {LANES{8'hxx}};
            st1_first      <= 1'bx;
            st1_last       <= 1'bx;
            st1_valid      <= 1'b0;
        end
        else begin
            // stage 0
            st0_rxdatahs   <= in_rxdatahs;
            st0_rxvalidhs  <= in_rxvalidhs;
            st0_rxactivehs <= in_rxactivehs;
            st0_rxsynchs   <= in_rxsynchs;
            
            
            // stage 1
            if ( &st0_rxsynchs & &in_rxactivehs ) begin
                st1_busy <= 1'b1;
            end
            else if ( st1_valid & st1_last ) begin
                st1_busy <= 1'b0;
            end
            
            if ( &st0_rxsynchs & &in_rxactivehs ) begin
                st1_first <= 1'b1;
            end
            else if ( st1_valid ) begin
                st1_first <= 1'b0;
            end
            
            st1_last  <= ((in_rxactivehs == 0) || (in_rxvalidhs == 0) | (in_rxsynchs != 0));
            st1_data  <= st0_rxdatahs;
            st1_valid <= ((st0_rxvalidhs != 0) && st1_busy);
        end
    end
    
    assign out_first = st1_first;
    assign out_last  = st1_last;
    assign out_data  = st1_data;
    assign out_valid = st1_valid;
    
endmodule


`default_nettype wire


// end of file
