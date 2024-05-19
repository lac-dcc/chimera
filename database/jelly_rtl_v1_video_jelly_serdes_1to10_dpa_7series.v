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



//  1 to 10 serdes for xilinx 7series
module jelly_serdes_1to10_dpa_7series
        #(
            parameter   DPA_EYE_WIDTH_TH      = 7,
            parameter   HIGH_PERFORMANCE_MODE = "FALSE",
            parameter   PIN_SWAP              = 0,
            parameter   IDELAY_VALUE_MASTE    = 0,
            parameter   IDELAY_VALUE_SLAVE    = IDELAY_VALUE_MASTE+1,
            parameter   IDELAYCTRL_GROUP      = "IDELAYCTRL_GROUP",
            parameter   IOSTANDARD            = "LVDS25"
        )
        (
            input   wire            reset,
            input   wire            clk,
            input   wire            clk_x2,
            input   wire            clk_x10,
            
            input   wire            dpa_start,
            output  wire            dpa_busy,
            
            output  wire            phase_valid,
            output  wire            phase_match,
            
            input   wire            bitslip,
            
            input   wire            in_d_p,
            input   wire            in_d_n,
            
            output  wire            out_d,
            output  wire    [9:0]   out_data
        );
    
    
    // serdes signal
    wire    [4:0]       serdes_data_master;
    wire    [4:0]       serdes_data_slave;
    wire                serdes_phase_valid = (serdes_data_master[3:0] != serdes_data_master[4:1]);
    wire                serdes_phase_match = (serdes_data_master == serdes_data_slave);
    
    
    // clk_2x phase
    reg         reg_clk_x2_phase = 1'b0;
    always @(posedge clk_x2) begin
        if ( reset ) begin
            reg_clk_x2_phase <= 1'b0;
        end
        else begin
            reg_clk_x2_phase <= reg_clk_x2_phase + 1'b1;
        end
    end
    
    
    // Dynamic Phase Alignment
    localparam  DLP_WAIT = 15;
    reg                 reg_dpa_busy;       // DPA execution
    reg     [3:0]       reg_dpa_wait;       // wait count
    reg                 reg_move_center;
    reg     [5:0]       reg_dly_pos_m;      // master deley position
    reg     [5:0]       reg_dly_pos_s;      // slaver deley position
    reg     [5:0]       reg_dpa_eye_count;  // open eye width
    
    reg                 reg_idelay_ce;
    reg                 reg_idelay_inc;
    
    always @(posedge clk_x2) begin
        if ( reset ) begin
            reg_dpa_busy      <= 1'b0;
            reg_dpa_wait      <= {4{1'bx}};
            reg_move_center   <= 1'b0;
            reg_dly_pos_m     <= IDELAY_VALUE_MASTE;
            reg_dly_pos_s     <= IDELAY_VALUE_SLAVE;
            reg_dpa_eye_count <= 0;
            
            reg_idelay_ce     <= 1'b0;
            reg_idelay_inc    <= 1'bx;
        end
        else begin
            reg_idelay_ce     <= 1'b0;
            
            // delay tap position trace
            if ( reg_idelay_ce ) begin
                if ( reg_idelay_inc ) begin
                    reg_dly_pos_m <= reg_dly_pos_m + 1'b1;
                    reg_dly_pos_s <= reg_dly_pos_s + 1'b1;
                end
                else begin
                    reg_dly_pos_m <= reg_dly_pos_m - 1'b1;
                    reg_dly_pos_s <= reg_dly_pos_s - 1'b1;
                end
            end
            
            if ( !reg_dpa_busy ) begin
                if ( dpa_start & reg_clk_x2_phase ) begin
                    // start DPA
                    reg_dpa_busy   <= 1'b1;
                    reg_dpa_wait   <= DLP_WAIT;
                    reg_idelay_inc <= 1'b1;
                end
            end
            else begin
                if ( reg_idelay_inc ) begin
                    // search eye
                    if ( reg_dpa_wait > 0 ) begin
                        // wait
                        reg_dpa_wait <= reg_dpa_wait - 1'b1;
                    end
                    else if ( serdes_phase_valid ) begin
                        if ( serdes_phase_match && (reg_dly_pos_m < reg_dly_pos_s) ) begin
                            reg_dpa_eye_count <= reg_dpa_eye_count + 1'b1;
                            reg_idelay_ce     <= 1'b1;
                            reg_dpa_wait      <= DLP_WAIT;
                        end
                        else begin
                            if ( reg_dpa_eye_count >= DPA_EYE_WIDTH_TH ) begin
                                // search OK
                                reg_dpa_eye_count <= (reg_dpa_eye_count >> 1);
                                reg_idelay_inc    <= 1'b0;
                                reg_idelay_ce     <= 1'b1;
                            end
                            else begin
                                // search continue
                                reg_dpa_eye_count <= 0;
                                reg_idelay_ce     <= 1'b1;
                                reg_dpa_wait      <= DLP_WAIT;
                            end
                        end
                    end
                end
                else begin
                    // move eye center
                    if ( reg_dpa_eye_count == 0 ) begin
                        // complete DPA
                        reg_dpa_busy <= 1'b0;
                    end
                    else begin
                        reg_dpa_eye_count <= reg_dpa_eye_count - 1'b1;
                        reg_idelay_ce     <= 1'b1;
                    end
                end
            end
        end
    end
    
    assign dpa_busy = reg_dpa_busy;
    
    
    // bitslip
    reg     [5:0]   reg_bitslip_phase = 6'b00001;
    reg             reg_bitslip;
    always @(posedge clk_x2) begin
        if ( reset ) begin
            reg_bitslip_phase <= 6'b00001;
            reg_bitslip       <= 1'b0;
        end
        else begin
            if ( reg_clk_x2_phase & bitslip ) begin
                reg_bitslip_phase <= {reg_bitslip_phase[4:0], reg_bitslip_phase[5]};
            end
            reg_bitslip <= (bitslip & reg_clk_x2_phase & |reg_bitslip_phase[4:0]);
        end
    end
    
    
    // 5bit to 10bit
    reg                 reg_word_sel;
    reg     [9:0]       reg_data;
    reg     [9:0]       reg_out_data;
    always @(posedge clk_x2) begin
        if ( reset ) begin
            reg_word_sel <= 1'b0;
            reg_data     <= {10{1'bx}};
            reg_out_data <= {10{1'bx}};
        end
        else begin
            if ( reg_word_sel ) begin
                reg_data[4:0] <= serdes_data_master;
                reg_out_data  <= reg_data;
            end
            else begin
                reg_data[9:5] <= serdes_data_master;
            end
            
            if ( reg_clk_x2_phase &  bitslip & reg_bitslip_phase[5] ) begin
                reg_word_sel <= reg_word_sel;
            end
            else begin 
                reg_word_sel <= ~reg_word_sel;
            end
        end
    end
    
    assign out_data = reg_out_data;
    
    
    // error detect
    reg     reg_phase_valid_prev;
    reg     reg_phase_match_prev;
    reg     reg_phase_valid;
    reg     reg_phase_match;
    always @(posedge clk_x2) begin
        reg_phase_valid_prev <= serdes_phase_valid;
        reg_phase_match_prev <= serdes_phase_match || !serdes_phase_valid;
        if ( reg_clk_x2_phase ) begin
            reg_phase_valid <= serdes_phase_valid || reg_phase_valid_prev;
            reg_phase_match <= (serdes_phase_match || !serdes_phase_valid) && reg_phase_match_prev;
        end
    end
    
    assign phase_valid = reg_phase_valid;
    assign phase_match = reg_phase_match;
    
    
    
    jelly_serdes_1to5_dpa_7series
            #(
                .HIGH_PERFORMANCE_MODE      (HIGH_PERFORMANCE_MODE),
                .PIN_SWAP                   (PIN_SWAP),
                .IDELAY_VALUE_MASTE         (IDELAY_VALUE_MASTE),
                .IDELAY_VALUE_SLAVE         (IDELAY_VALUE_SLAVE),
                .IDELAYCTRL_GROUP           (IDELAYCTRL_GROUP),
                .IOSTANDARD                 (IOSTANDARD)
            )
        i_serdes_1to5_dpa_7series
            (
                .reset                      (reset),
                .clk                        (clk_x2),
                .clk_x5                     (clk_x10),
                
                .idelay_master_ce           (reg_idelay_ce),
                .idelay_master_inc          (reg_idelay_inc),
                .idelay_slave_ce            (reg_idelay_ce),
                .idelay_slave_inc           (reg_idelay_inc),
                
                .bitslip                    (reg_bitslip),
                
                .in_d_p                     (in_d_p),
                .in_d_n                     (in_d_n),
                
                .out_d                      (out_d),
                .out_data_master            (serdes_data_master),
                .out_data_slave             (serdes_data_slave)
            );
    
    
    
endmodule


`default_nettype wire


// end of file
