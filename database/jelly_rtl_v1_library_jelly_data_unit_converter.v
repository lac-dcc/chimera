// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_data_unit_converter
        #(
            parameter   USER_WIDTH = 1,
            parameter   UNIT_WIDTH = 8,
            parameter   S_NUM      = 3,
            parameter   M_NUM      = 4,
            parameter   S_REGS     = 1,
            parameter   M_REGS     = 1,
            
            // local
            parameter   USER_BITS    = USER_WIDTH > 0 ? USER_WIDTH : 1,
            parameter   S_DATA_WIDTH = S_NUM * UNIT_WIDTH,
            parameter   M_DATA_WIDTH = M_NUM * UNIT_WIDTH
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        endian,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire                        s_first,
            input   wire                        s_last,
            input   wire    [S_DATA_WIDTH-1:0]  s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [USER_BITS-1:0]     m_user_first,   // 最初のデータに付随するuser
            output  wire    [USER_BITS-1:0]     m_user_last,    // 末尾のデータに付随するuser
            output  wire                        m_first,
            output  wire                        m_last,
            output  wire    [M_DATA_WIDTH-1:0]  m_data,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    // -----------------------------------------
    //  localparam
    // -----------------------------------------
    
    localparam  BUF_NUM         = S_NUM + M_NUM - 1;
    
    localparam  BUF_COUNT_WIDTH = BUF_NUM <     2 ?  1 :
                                  BUF_NUM <     4 ?  2 :
                                  BUF_NUM <     8 ?  3 :
                                  BUF_NUM <    16 ?  4 :
                                  BUF_NUM <    32 ?  5 :
                                  BUF_NUM <    64 ?  6 :
                                  BUF_NUM <   128 ?  7 :
                                  BUF_NUM <   256 ?  8 :
                                  BUF_NUM <   512 ?  9 :
                                  BUF_NUM <  1024 ? 10 :
                                  BUF_NUM <  2048 ? 11 :
                                  BUF_NUM <  4096 ? 12 :
                                  BUF_NUM <  8192 ? 13 :
                                  BUF_NUM < 16384 ? 14 :
                                  BUF_NUM < 32768 ? 15 : 16;
    
    
    generate
    if ( S_NUM != M_NUM ) begin : blk_convert
        
        // -----------------------------------------
        //  insert FF
        // -----------------------------------------
        
        wire    [USER_BITS-1:0]         ff_s_user;
        wire                            ff_s_first;
        wire                            ff_s_last;
        wire    [S_DATA_WIDTH-1:0]      ff_s_data;
        wire                            ff_s_valid;
        wire                            ff_s_ready;
        
        wire    [USER_BITS-1:0]         ff_m_user_first;
        wire    [USER_BITS-1:0]         ff_m_user_last;
        wire                            ff_m_first;
        wire                            ff_m_last;
        wire    [M_DATA_WIDTH-1:0]      ff_m_data;
        wire                            ff_m_valid;
        wire                            ff_m_ready;
        
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH     (USER_BITS + 1 + 1 + S_DATA_WIDTH),
                    .SLAVE_REGS     (S_REGS),
                    .MASTER_REGS    (S_REGS)
                )
            i_pipeline_insert_ff_s
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data         ({s_user, s_last, s_first, s_data}),
                    .s_valid        (s_valid),
                    .s_ready        (s_ready),
                    
                    .m_data         ({ff_s_user, ff_s_last, ff_s_first, ff_s_data}),
                    .m_valid        (ff_s_valid),
                    .m_ready        (ff_s_ready),
                    
                    .buffered       (),
                    .s_ready_next   ()
                );
        
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH     (USER_BITS + USER_BITS + 1 + 1 + M_DATA_WIDTH),
                    .SLAVE_REGS     (M_REGS),
                    .MASTER_REGS    (M_REGS)
                )
            i_pipeline_insert_ff_m
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_data         ({ff_m_user_first, ff_m_user_last, ff_m_last, ff_m_first, ff_m_data}),
                    .s_valid        (ff_m_valid),
                    .s_ready        (ff_m_ready),
                    
                    .m_data         ({m_user_first, m_user_last, m_last, m_first, m_data}),
                    .m_valid        (m_valid),
                    .m_ready        (m_ready),
                    
                    .buffered       (),
                    .s_ready_next   ()
                );
        
        
        // -----------------------------------------
        //  convert
        // -----------------------------------------
        
        reg     [BUF_COUNT_WIDTH-1:0]       reg_data_count, next_data_count;
        
        reg     [BUF_NUM*UNIT_WIDTH-1:0]    reg_buf_data,   next_buf_data,   tmp_buf_data;
        reg     [BUF_NUM*USER_BITS-1:0]     reg_buf_user_f, next_buf_user_f, tmp_buf_user_f;
        reg     [BUF_NUM*USER_BITS-1:0]     reg_buf_user_l, next_buf_user_l, tmp_buf_user_l;
        reg                                 reg_buf_first,  next_buf_first;
        reg     [BUF_NUM-1:0]               reg_buf_last,   next_buf_last,   tmp_buf_last;
        
        reg                                 reg_m_valid,    next_m_valid;
        
        reg     [S_NUM*USER_BITS-1:0]       tmp_s_user_f;
        reg     [S_NUM*USER_BITS-1:0]       tmp_s_user_l;
        reg     [S_NUM-1:0]                 tmp_s_last;
        
        reg     [BUF_NUM-1:0]               tmp_msk;
        integer                             i;
        
        always @* begin
            next_data_count = reg_data_count;
            next_buf_data   = reg_buf_data;
            next_buf_user_f = reg_buf_user_f;
            next_buf_user_l = reg_buf_user_l;
            next_buf_first  = reg_buf_first;
            next_buf_last   = reg_buf_last;
            next_m_valid    = reg_m_valid;
            
            if ( ff_m_valid && ff_m_ready ) begin
                next_buf_first = 1'b0;
            end
            
            tmp_buf_data    = {(BUF_NUM*UNIT_WIDTH){1'bx}};
            tmp_buf_user_f  = {(BUF_NUM*USER_BITS){1'bx}};
            tmp_buf_user_l  = {(BUF_NUM*USER_BITS){1'bx}};
            tmp_buf_last    = {BUF_NUM{1'bx}};
            
            tmp_s_user_f    = {(S_NUM*USER_BITS){1'b0}};
            tmp_s_user_l    = {(S_NUM*USER_BITS){1'b0}};
            tmp_s_last      = {S_NUM{1'b0}};
            if ( endian ) begin
                tmp_s_user_f[(S_NUM-1)*USER_BITS +: USER_BITS] = ff_s_user;
                tmp_s_user_l[        0*USER_BITS +: USER_BITS] = ff_s_user;
                tmp_s_last  [0]                                = ff_s_last;
            end
            else begin
                tmp_s_user_f[        0*USER_BITS +: USER_BITS] = ff_s_user;
                tmp_s_user_l[(S_NUM-1)*USER_BITS +: USER_BITS] = ff_s_user;
                tmp_s_last  [S_NUM-1]                          = ff_s_last;
            end
            
            // master out
            if ( ff_m_valid && ff_m_ready ) begin
                if ( endian ) begin
                    next_buf_data   = (next_buf_data   << (M_NUM * UNIT_WIDTH));
                    next_buf_user_f = (next_buf_user_f << (M_NUM * USER_BITS));
                    next_buf_user_l = (next_buf_user_l << (M_NUM * USER_BITS));
                    next_buf_last   = (next_buf_last   <<  M_NUM);
                end
                else begin
                    next_buf_data   = (next_buf_data   >> (M_NUM * UNIT_WIDTH));
                    next_buf_user_f = (next_buf_user_f >> (M_NUM * USER_BITS));
                    next_buf_user_l = (next_buf_user_l >> (M_NUM * USER_BITS));
                    next_buf_last   = (next_buf_last   >>  M_NUM);
                end
                next_data_count = next_data_count - M_NUM;
            end
            
            
            // slave in
            if ( ff_s_valid && ff_s_ready ) begin
                if ( ff_s_first ) begin
                    next_data_count = 0;
                    next_buf_first  = 1'b1;
                end
                
                if ( endian ) begin
                    tmp_buf_data   = (ff_s_data      << ((BUF_NUM - S_NUM) * UNIT_WIDTH));
                    tmp_buf_user_f = (tmp_s_user_f   << ((BUF_NUM - S_NUM) * USER_BITS));
                    tmp_buf_user_l = (tmp_s_user_l   << ((BUF_NUM - S_NUM) * USER_BITS));
                    tmp_buf_last   = (tmp_s_last     <<  (BUF_NUM - S_NUM));
                    tmp_msk        = ({S_NUM{1'b1}}  <<  (BUF_NUM - S_NUM));
                    
                    tmp_buf_data   = (tmp_buf_data   >> (next_data_count * UNIT_WIDTH));
                    tmp_buf_user_f = (tmp_buf_user_f >> (next_data_count * USER_BITS));
                    tmp_buf_user_l = (tmp_buf_user_l >> (next_data_count * USER_BITS));
                    tmp_buf_last   = (tmp_buf_last   >>  next_data_count);
                    tmp_msk        = (tmp_msk        >>  next_data_count);
                end
                else begin
                    tmp_buf_data   = ff_s_data;
                    tmp_buf_user_f = tmp_s_user_f;
                    tmp_buf_user_l = tmp_s_user_l;
                    tmp_buf_last   = tmp_s_last;
                    tmp_msk        = {S_NUM{1'b1}};
                    
                    tmp_buf_data   = (tmp_buf_data   << (next_data_count * UNIT_WIDTH));
                    tmp_buf_user_f = (tmp_buf_user_f << (next_data_count * USER_BITS));
                    tmp_buf_user_l = (tmp_buf_user_l << (next_data_count * USER_BITS));
                    tmp_buf_last   = (tmp_buf_last   <<  next_data_count);
                    tmp_msk        = (tmp_msk        <<  next_data_count);
                end
                
                for ( i = 0; i < BUF_NUM; i = i+1 ) begin
                    if ( tmp_msk[i] ) begin
                        next_buf_data  [i*UNIT_WIDTH +: UNIT_WIDTH] = tmp_buf_data  [i*UNIT_WIDTH +: UNIT_WIDTH];
                        next_buf_user_f[i*USER_BITS  +: USER_BITS]  = tmp_buf_user_f[i*USER_BITS  +: USER_BITS];
                        next_buf_user_l[i*USER_BITS  +: USER_BITS]  = tmp_buf_user_l[i*USER_BITS  +: USER_BITS];
                        next_buf_last  [i]                          = tmp_buf_last  [i];
                    end
                end
                
                next_data_count = next_data_count + S_NUM;
            end
            
            next_m_valid = (next_data_count >= M_NUM);
        end
        
        always @(posedge clk) begin
            if ( reset ) begin
                reg_data_count <= {BUF_COUNT_WIDTH{1'b0}};
                reg_buf_data   <= {(BUF_NUM*UNIT_WIDTH){1'bx}};
                reg_buf_user_f <= {(BUF_NUM*USER_BITS){1'bx}};
                reg_buf_user_l <= {(BUF_NUM*USER_BITS){1'bx}};
                reg_buf_first  <= 1'bx;
                reg_buf_last   <= {BUF_NUM{1'bx}};
                reg_m_valid    <= 1'b0;
            end
            else if ( cke && (!ff_m_valid || ff_m_ready) ) begin
                reg_data_count <= next_data_count;
                reg_buf_data   <= next_buf_data;
                reg_buf_user_f <= next_buf_user_f;
                reg_buf_user_l <= next_buf_user_l;
                reg_buf_first  <= next_buf_first;
                reg_buf_last   <= next_buf_last;
                reg_m_valid    <= next_m_valid;
            end
        end
        
        assign ff_s_ready = ff_m_ready ? (reg_data_count < BUF_NUM + M_NUM - S_NUM) : (reg_data_count < BUF_NUM - S_NUM);
        
        wire    [M_NUM*UNIT_WIDTH-1:0]  tmp_m_data   = endian ? (reg_buf_data   >> ((BUF_NUM - M_NUM) * UNIT_WIDTH)) : reg_buf_data;
        wire    [M_NUM*USER_BITS-1:0]   tmp_m_user_f = endian ? (reg_buf_user_f >> ((BUF_NUM - M_NUM) * USER_BITS))  : reg_buf_user_f;
        wire    [M_NUM*USER_BITS-1:0]   tmp_m_user_l = endian ? (reg_buf_user_l >> ((BUF_NUM - M_NUM) * USER_BITS))  : reg_buf_user_l;
        wire    [M_NUM-1:0]             tmp_m_last   = endian ? (reg_buf_last   >> (BUF_NUM - M_NUM))                : reg_buf_last;
        
        assign ff_m_data       = tmp_m_data;
        assign ff_m_user_first = endian ? tmp_m_user_f[(M_NUM-1)*USER_BITS +: USER_BITS] : tmp_m_user_f[       0 *USER_BITS +: USER_BITS];
        assign ff_m_user_last  = endian ? tmp_m_user_l[       0 *USER_BITS +: USER_BITS] : tmp_m_user_l[(M_NUM-1)*USER_BITS +: USER_BITS];
        assign ff_m_first      = reg_buf_first;
        assign ff_m_last       = endian ? tmp_m_last  [0]                                : tmp_m_last  [M_NUM-1];
        assign ff_m_valid      = reg_m_valid;
    end
    else begin : blk_bypass
        assign m_user_first = s_user;
        assign m_user_last  = s_user;
        assign m_first      = s_first;
        assign m_last       = s_last;
        assign m_data       = s_data;
        assign m_valid      = s_valid;
        assign s_ready      = m_ready;
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
