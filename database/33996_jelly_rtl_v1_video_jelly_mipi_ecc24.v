// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_mipi_ecc24
        #(
            parameter   USER_WIDTH = 0,
            
            parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire    [23:0]              s_data,
            input   wire    [5:0]               s_ecc,
            input   wire                        s_valid,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire    [23:0]              m_data,
            output  wire                        m_error,
            output  wire                        m_corrected,
            output  wire                        m_valid
        );
    
    
    // ecc table
    wire    [5:0]   ecc_tbl_0  = 6'h07;
    wire    [5:0]   ecc_tbl_1  = 6'h0b;
    wire    [5:0]   ecc_tbl_2  = 6'h0d;
    wire    [5:0]   ecc_tbl_3  = 6'h0e;
    wire    [5:0]   ecc_tbl_4  = 6'h13;
    wire    [5:0]   ecc_tbl_5  = 6'h15;
    wire    [5:0]   ecc_tbl_6  = 6'h16;
    wire    [5:0]   ecc_tbl_7  = 6'h19;
    wire    [5:0]   ecc_tbl_8  = 6'h1a;
    wire    [5:0]   ecc_tbl_9  = 6'h1c;
    wire    [5:0]   ecc_tbl_10 = 6'h23;
    wire    [5:0]   ecc_tbl_11 = 6'h25;
    wire    [5:0]   ecc_tbl_12 = 6'h26;
    wire    [5:0]   ecc_tbl_13 = 6'h29;
    wire    [5:0]   ecc_tbl_14 = 6'h2a;
    wire    [5:0]   ecc_tbl_15 = 6'h2c;
    wire    [5:0]   ecc_tbl_16 = 6'h31;
    wire    [5:0]   ecc_tbl_17 = 6'h32;
    wire    [5:0]   ecc_tbl_18 = 6'h34;
    wire    [5:0]   ecc_tbl_19 = 6'h38;
    wire    [5:0]   ecc_tbl_20 = 6'h1f;
    wire    [5:0]   ecc_tbl_21 = 6'h2f;
    wire    [5:0]   ecc_tbl_22 = 6'h37;
    wire    [5:0]   ecc_tbl_23 = 6'h3b;
    
    
    
    reg     [USER_BITS-1:0]     st0_user;
    reg     [23:0]              st0_data;
    reg     [5:0]               st0_ecc;
    reg                         st0_valid;
    
    reg     [USER_BITS-1:0]     st1_user;
    reg     [23:0]              st1_data;
    reg     [5:0]               st1_recv_ecc;
    reg     [5:0]               st1_calc_ecc;
    reg                         st1_valid;
    
    reg     [USER_BITS-1:0]     st2_user;
    reg     [23:0]              st2_data;
    reg     [5:0]               st2_syndrome;
    reg                         st2_valid;
    
    reg     [USER_BITS-1:0]     st3_user;
    reg     [23:0]              st3_data;
    reg     [23:0]              st3_xor;
    reg                         st3_error;
    reg                         st3_crrected;
    reg                         st3_valid;
    
    reg     [USER_BITS-1:0]     st4_user;
    reg     [23:0]              st4_data;
    reg                         st4_error;
    reg                         st4_corrected;
    reg                         st4_valid;
    
    always @(posedge clk) begin
        if ( cke ) begin
            // stage 0
            st0_user      <= s_user;
            st0_data      <= s_data;
            st0_ecc       <= s_ecc;
            
            // stage 1
            st1_user      <= st0_user;
            st1_data      <= st0_data;
            st1_recv_ecc  <= st0_ecc;
            st1_calc_ecc  <= (st0_data[0]  ? ecc_tbl_0  : 6'd0)
                           ^ (st0_data[1]  ? ecc_tbl_1  : 6'd0)
                           ^ (st0_data[2]  ? ecc_tbl_2  : 6'd0)
                           ^ (st0_data[3]  ? ecc_tbl_3  : 6'd0)
                           ^ (st0_data[4]  ? ecc_tbl_4  : 6'd0)
                           ^ (st0_data[5]  ? ecc_tbl_5  : 6'd0)
                           ^ (st0_data[6]  ? ecc_tbl_6  : 6'd0)
                           ^ (st0_data[7]  ? ecc_tbl_7  : 6'd0)
                           ^ (st0_data[8]  ? ecc_tbl_8  : 6'd0)
                           ^ (st0_data[9]  ? ecc_tbl_9  : 6'd0)
                           ^ (st0_data[10] ? ecc_tbl_10 : 6'd0)
                           ^ (st0_data[11] ? ecc_tbl_11 : 6'd0)
                           ^ (st0_data[12] ? ecc_tbl_12 : 6'd0)
                           ^ (st0_data[13] ? ecc_tbl_13 : 6'd0)
                           ^ (st0_data[14] ? ecc_tbl_14 : 6'd0)
                           ^ (st0_data[15] ? ecc_tbl_15 : 6'd0)
                           ^ (st0_data[16] ? ecc_tbl_16 : 6'd0)
                           ^ (st0_data[17] ? ecc_tbl_17 : 6'd0)
                           ^ (st0_data[18] ? ecc_tbl_18 : 6'd0)
                           ^ (st0_data[19] ? ecc_tbl_19 : 6'd0)
                           ^ (st0_data[20] ? ecc_tbl_20 : 6'd0)
                           ^ (st0_data[21] ? ecc_tbl_21 : 6'd0)
                           ^ (st0_data[22] ? ecc_tbl_22 : 6'd0)
                           ^ (st0_data[23] ? ecc_tbl_23 : 6'd0);
            
            // stage 2
            st2_user      <= st1_user;
            st2_data      <= st1_data;
            st2_syndrome  <= st1_recv_ecc ^ st1_calc_ecc;
            
            // stage 3
            st3_user      <= st2_user;
            st3_data      <= st2_data;
            st3_xor[0]    <= (st2_syndrome == ecc_tbl_0);
            st3_xor[1]    <= (st2_syndrome == ecc_tbl_1);
            st3_xor[2]    <= (st2_syndrome == ecc_tbl_2);
            st3_xor[3]    <= (st2_syndrome == ecc_tbl_3);
            st3_xor[4]    <= (st2_syndrome == ecc_tbl_4);
            st3_xor[5]    <= (st2_syndrome == ecc_tbl_5);
            st3_xor[6]    <= (st2_syndrome == ecc_tbl_6);
            st3_xor[7]    <= (st2_syndrome == ecc_tbl_7);
            st3_xor[8]    <= (st2_syndrome == ecc_tbl_8);
            st3_xor[9]    <= (st2_syndrome == ecc_tbl_9);
            st3_xor[10]   <= (st2_syndrome == ecc_tbl_10);
            st3_xor[11]   <= (st2_syndrome == ecc_tbl_11);
            st3_xor[12]   <= (st2_syndrome == ecc_tbl_12);
            st3_xor[13]   <= (st2_syndrome == ecc_tbl_13);
            st3_xor[14]   <= (st2_syndrome == ecc_tbl_14);
            st3_xor[15]   <= (st2_syndrome == ecc_tbl_15);
            st3_xor[16]   <= (st2_syndrome == ecc_tbl_16);
            st3_xor[17]   <= (st2_syndrome == ecc_tbl_17);
            st3_xor[18]   <= (st2_syndrome == ecc_tbl_18);
            st3_xor[19]   <= (st2_syndrome == ecc_tbl_19);
            st3_xor[20]   <= (st2_syndrome == ecc_tbl_20);
            st3_xor[21]   <= (st2_syndrome == ecc_tbl_21);
            st3_xor[22]   <= (st2_syndrome == ecc_tbl_22);
            st3_xor[23]   <= (st2_syndrome == ecc_tbl_23);
            st3_error     <= (st2_syndrome != 0);
            st3_crrected  <= (st2_syndrome == 6'b000001)
                          || (st2_syndrome == 6'b000010)
                          || (st2_syndrome == 6'b000100)
                          || (st2_syndrome == 6'b001000)
                          || (st2_syndrome == 6'b010000)
                          || (st2_syndrome == 6'b100000);
            
            // stage 4
            st4_user      <= st3_user;
            st4_data      <= st3_data ^ st3_xor;
            st4_error     <= st3_error;
            st4_corrected <= st3_crrected || (st3_xor != 0);
        end
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_valid <= 1'b0;
            st1_valid <= 1'b0;
            st2_valid <= 1'b0;
            st3_valid <= 1'b0;
            st4_valid <= 1'b0;
        end
        else if ( cke ) begin
            st0_valid <= s_valid;
            st1_valid <= st0_valid;
            st2_valid <= st1_valid;
            st3_valid <= st2_valid;
            st4_valid <= st3_valid;
        end
    end
    
    assign m_user      = st4_user;
    assign m_data      = st4_data;
    assign m_error     = st4_error;
    assign m_corrected = st4_corrected;
    assign m_valid     = st4_valid;
    
endmodule



`default_nettype wire



// end of file
