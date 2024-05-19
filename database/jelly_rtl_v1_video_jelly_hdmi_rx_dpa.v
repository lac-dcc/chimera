// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_hdmi_rx_dpa
        #(
            parameter   BLITSLIP_PATTERN_TH   = 63,
            parameter   DPA_EYE_WIDTH_TH      = 5,
            parameter   HIGH_PERFORMANCE_MODE = "FALSE",
            parameter   PIN_SWAP              = 0,
            parameter   IDELAY_VALUE_MASTE    = 0,
            parameter   IDELAY_VALUE_SLAVE    = IDELAY_VALUE_MASTE+1,
            parameter   IDELAYCTRL_GROUP      = "IDELAYCTRL_HDMIRX",
            parameter   IOSTANDARD            = "TMDS_33"
        )
        (
            input   wire            reset,
            input   wire            clk,
            input   wire            clk_x2,
            input   wire            clk_x10,
            
            input   wire            dpa_start,
            output  wire            dpa_busy,
            
            input   wire            bitslip_start,
            output  wire            bitslip_busy,
            output  wire            bitslip_ready,
            
            output  wire            phase_valid,
            output  wire            phase_match,
            
            input   wire            in_d_p,
            input   wire            in_d_n,
            
            output  wire            out_d,
            output  wire    [9:0]   out_data
        );
    
    localparam  BITSLIP_WAIT = 7;
    reg             reg_bitslip_busy;
    reg             reg_bitslip_ready;
    reg     [2:0]   reg_bitslip_wait;
    reg     [7:0]   reg_bitslip_count;
    reg             reg_bitslip;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_bitslip_busy  <= 1'b0;
            reg_bitslip_ready <= 1'b0;
            reg_bitslip_wait  <= {2{1'bx}};
            reg_bitslip_count <= {8{1'bx}};
            reg_bitslip       <= 1'b0;
        end
        else begin
            reg_bitslip <= 1'b0;
            
            if ( !reg_bitslip_busy ) begin
                if ( bitslip_start ) begin
                    reg_bitslip_busy  <= 1'b1;
                    reg_bitslip_ready <= 1'b0;
                    reg_bitslip_wait  <= BITSLIP_WAIT;
                    reg_bitslip_count <= 0;
                end
            end
            else begin
                if ( reg_bitslip_wait > 0 ) begin
                    reg_bitslip_wait <= reg_bitslip_wait - 1'b1;
                end
                else begin
                    if ( (out_data == 10'b1101010100) || (out_data == 10'b0010101011)
                            || (out_data == 10'b0101010100) || (out_data == 10'b1010101011) ) begin
                        reg_bitslip_count <= reg_bitslip_count + 1'b1;
                        if ( reg_bitslip_count >= BLITSLIP_PATTERN_TH ) begin
                            // search end
                            reg_bitslip_busy  <= 1'b0;
                            reg_bitslip_ready <= 1'b1;
                        end
                    end
                    else begin
                        // bitslip
                        reg_bitslip_wait  <= BITSLIP_WAIT;
                        reg_bitslip       <= 1'b1;
                    end
                end
            end
            
            // phase error monitoring
            if ( phase_valid && !phase_match ) begin
                reg_bitslip_ready <= 1'b0;
            end
        end
    end
    
    assign bitslip_busy  = reg_bitslip_busy;
    assign bitslip_ready = reg_bitslip_ready;
    
    
    jelly_serdes_1to10_dpa_7series
            #(
                .DPA_EYE_WIDTH_TH       (DPA_EYE_WIDTH_TH),
                .HIGH_PERFORMANCE_MODE  (HIGH_PERFORMANCE_MODE),
                .PIN_SWAP               (PIN_SWAP),
                .IDELAY_VALUE_MASTE     (IDELAY_VALUE_MASTE),
                .IDELAY_VALUE_SLAVE     (IDELAY_VALUE_SLAVE),
                .IDELAYCTRL_GROUP       (IDELAYCTRL_GROUP),
                .IOSTANDARD             (IOSTANDARD)
            )
        i_serdes_1to10_dpa_7series
            (
                .reset                  (reset),
                .clk                    (clk),
                .clk_x2                 (clk_x2),
                .clk_x10                (clk_x10),
                
                .dpa_start              (dpa_start),
                .dpa_busy               (dpa_busy),
                
                .phase_valid            (phase_valid),
                .phase_match            (phase_match),
                
                .bitslip                (reg_bitslip),
                
                .in_d_p                 (in_d_p),
                .in_d_n                 (in_d_n),
                
                .out_d                  (out_d),
                .out_data               (out_data)
            );
    
    
endmodule


`default_nettype wire


// end of file
