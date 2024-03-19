// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// 1レーン分の受信
module jelly_mipi_rx_lane_sync
        #(
            parameter   LANES = 2
        )
        (
            input   wire                    reset,
            input   wire                    clk,
            
            input   wire    [LANES*8-1:0]   in_rxdatahs,
            input   wire    [LANES-1:0]     in_rxvalidhs,
            input   wire    [LANES-1:0]     in_rxactivehs,
            input   wire    [LANES-1:0]     in_rxsynchs,
            
            output  wire    [LANES*8-1:0]   out_rxdatahs,
            output  wire    [LANES-1:0]     out_rxvalidhs,
            output  wire    [LANES-1:0]     out_rxactivehs,
            output  wire    [LANES-1:0]     out_rxsynchs
        );
    
    integer                 i;
    
    reg     [LANES*8-1:0]   st0_rxdatahs;
    reg     [LANES-1:0]     st0_rxvalidhs;
    reg     [LANES-1:0]     st0_rxactivehs;
    reg     [LANES-1:0]     st0_rxsynchs;
    
    reg                     st1_sync;
    reg     [LANES-1:0]     st1_bypass;
    reg     [LANES*8-1:0]   st1_rxdatahs;
    reg     [LANES-1:0]     st1_rxvalidhs;
    reg     [LANES-1:0]     st1_rxactivehs;
    reg     [LANES-1:0]     st1_rxsynchs;
    
    reg     [LANES*8-1:0]   st2_rxdatahs;
    reg     [LANES-1:0]     st2_rxvalidhs;
    reg     [LANES-1:0]     st2_rxactivehs;
    reg     [LANES-1:0]     st2_rxsynchs;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_rxdatahs   <= {LANES{8'hxx}};
            st0_rxvalidhs  <= {LANES{1'b0}};
            st0_rxactivehs <= {LANES{1'b0}};
            st0_rxsynchs   <= {LANES{1'b0}};
            
            st1_sync       <= 1'b0;
            st1_bypass     <= {LANES{1'b0}};
            st1_rxdatahs   <= {LANES{8'hxx}};
            st1_rxvalidhs  <= {LANES{1'b0}};
            st1_rxactivehs <= {LANES{1'b0}};
            st1_rxsynchs   <= {LANES{1'b0}};
            
            st2_rxdatahs   <= {LANES{8'hxx}};
            st2_rxvalidhs  <= {LANES{1'b0}};
            st2_rxactivehs <= {LANES{1'b0}};
            st2_rxsynchs   <= {LANES{1'b0}};
        end
        else begin
            // stage 0
            st0_rxdatahs   <= in_rxdatahs;
            st0_rxvalidhs  <= in_rxvalidhs;
            st0_rxactivehs <= in_rxactivehs;
            st0_rxsynchs   <= in_rxsynchs;
            
            // stage 1
            st1_sync <= (st0_rxsynchs != 0);
            if ( !st1_sync && (st0_rxsynchs != 0) ) begin
                for ( i = 0; i < LANES; i = i+1 ) begin
                    st1_bypass[i] <= (!st0_rxsynchs[i] && in_rxsynchs[i]);
                end
            end
            st1_rxdatahs   <= st0_rxdatahs;
            st1_rxvalidhs  <= st0_rxvalidhs;
            st1_rxactivehs <= st0_rxactivehs;
            st1_rxsynchs   <= st0_rxsynchs;
            
            // stage 2
            for ( i = 0; i < LANES; i = i+1 ) begin
                st2_rxdatahs[i*8 +: 8] <= st1_bypass[i] ? st0_rxdatahs[i*8 +: 8] : st1_rxdatahs[i*8 +: 8];
                st2_rxvalidhs[i]       <= st1_bypass[i] ? st0_rxvalidhs[i]       : st1_rxvalidhs[i];
                st2_rxactivehs[i]      <= st1_bypass[i] ? st0_rxactivehs[i]      : st1_rxactivehs[i];
                st2_rxsynchs[i]        <= st1_bypass[i] ? st0_rxsynchs[i]        : st1_rxsynchs[i];
            end
        end
    end
    
    assign out_rxdatahs   = st2_rxdatahs;
    assign out_rxvalidhs  = st2_rxvalidhs;
    assign out_rxactivehs = st2_rxactivehs;
    assign out_rxsynchs   = st2_rxsynchs;
    
endmodule


`default_nettype wire


// end of file
