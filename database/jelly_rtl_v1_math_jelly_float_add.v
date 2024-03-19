// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// add
module jelly_float_add
        #(
            parameter   EXP_WIDTH       = 8,
            parameter   EXP_OFFSET      = (1 << (EXP_WIDTH-1)) - 1,
            parameter   FRAC_WIDTH      = 23,
            parameter   FLOAT_WIDTH     = 1 + EXP_WIDTH + FRAC_WIDTH,   // sign + exp + frac
            
            parameter   USER_WIDTH      = 0,
            
            parameter   MASTER_IN_REGS  = 1,
            parameter   MASTER_OUT_REGS = 1,
            
            parameter   USER_BITS       = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire    [FLOAT_WIDTH-1:0]   s_float0,
            input   wire    [FLOAT_WIDTH-1:0]   s_float1,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire    [FLOAT_WIDTH-1:0]   m_float,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    localparam  PIPELINE_STAGES = 6;
    
    wire    [PIPELINE_STAGES-1:0]   stage_cke;
    wire    [PIPELINE_STAGES-1:0]   stage_valid;
    
    wire    [USER_BITS-1:0]         src_user;
    wire                            src_sign0;
    wire    [EXP_WIDTH-1:0]         src_exp0;
    wire    [FRAC_WIDTH-1:0]        src_frac0;
    wire                            src_sign1;
    wire    [EXP_WIDTH-1:0]         src_exp1;
    wire    [FRAC_WIDTH-1:0]        src_frac1;
    
    wire    [USER_BITS-1:0]         sink_user;
    wire                            sink_sign;
    wire    [EXP_WIDTH-1:0]         sink_exp;
    wire    [FRAC_WIDTH-1:0]        sink_frac;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (PIPELINE_STAGES),
                .S_DATA_WIDTH       (USER_BITS+FLOAT_WIDTH+FLOAT_WIDTH),
                .M_DATA_WIDTH       (USER_BITS+FLOAT_WIDTH),
                .AUTO_VALID         (1),
                .MASTER_IN_REGS     (MASTER_IN_REGS),
                .MASTER_OUT_REGS    (MASTER_OUT_REGS)
            )
        i_pipeline_control
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             ({s_user, s_float1, s_float0}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({m_user, m_float}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         ({PIPELINE_STAGES{1'bx}}),
                .src_data           ({src_user, src_sign1, src_exp1, src_frac1, src_sign0, src_exp0, src_frac0}),
                .src_valid          (),
                .sink_data          ({sink_user, sink_sign, sink_exp, sink_frac}),
                .buffered           ()
            );
    
    localparam  MUL_LO_WIDTH = (FRAC_WIDTH+1) / 2;
    localparam  MUL_HI_WIDTH = (FRAC_WIDTH+1) - MUL_LO_WIDTH;
    
    reg     [USER_BITS-1:0]             st0_user;
    reg                                 st0_sign0;
    reg                                 st0_sign1;
    reg     [EXP_WIDTH-1:0]             st0_exp0;
    reg     [EXP_WIDTH-1:0]             st0_exp1;
    reg     [FRAC_WIDTH:0]              st0_frac0;
    reg     [FRAC_WIDTH:0]              st0_frac1;
    reg                                 st0_comp;
    
    reg     [USER_BITS-1:0]             st1_user;
    reg                                 st1_sign;
    reg     [EXP_WIDTH-1:0]             st1_exp;
    reg     [FRAC_WIDTH:0]              st1_frac0;
    reg     [FRAC_WIDTH:0]              st1_frac1;
    reg                                 st1_sub;
    reg     [EXP_WIDTH-1:0]             st1_shift;
    
    reg     [USER_BITS-1:0]             st2_user;
    reg                                 st2_sign;
    reg     [EXP_WIDTH-1:0]             st2_exp;
    reg     [FRAC_WIDTH:0]              st2_frac0;
    reg     [FRAC_WIDTH:0]              st2_frac1;
    reg                                 st2_sub;
    
    reg     [USER_BITS-1:0]             st3_user;
    reg                                 st3_sign;
    reg     [EXP_WIDTH-1:0]             st3_exp;
    reg     [FRAC_WIDTH+1:0]            st3_frac;
    
    integer                             i;
    reg     [EXP_WIDTH-1:0]             tmp_clz;
    reg     [FRAC_WIDTH+1:0]            tmp_frac;
    
    reg     [USER_BITS-1:0]             st4_user;
    reg                                 st4_sign;
    reg     [EXP_WIDTH-1:0]             st4_exp;
    reg     [FRAC_WIDTH:0]              st4_frac;
    reg     [EXP_WIDTH-1:0]             st4_clz;
    
    reg     [USER_BITS-1:0]             st5_user;
    reg                                 st5_sign;
    reg     [EXP_WIDTH-1:0]             st5_exp;
    reg     [FRAC_WIDTH-1:0]            st5_frac;
    
    always @(posedge clk) begin
        if ( stage_cke[0] ) begin
            st0_user  <= src_user;
            st0_sign0 <= src_sign0;
            st0_sign1 <= src_sign1;
            st0_exp0  <= src_exp0;
            st0_exp1  <= src_exp1;
            st0_frac0 <= (src_exp0 == {EXP_WIDTH{1'b0}}) ? {1'b0, src_frac0} : {1'b1, src_frac0};
            st0_frac1 <= (src_exp1 == {EXP_WIDTH{1'b0}}) ? {1'b0, src_frac1} : {1'b1, src_frac1};
            st0_comp  <= ({src_exp1, src_frac1} <= {src_exp0, src_frac0});
        end
        if ( stage_cke[1] ) begin
            st1_user <= st0_user;
            if ( st0_comp ) begin
                st1_sign  <= st0_sign0;
                st1_exp   <= st0_exp0;
                st1_frac0 <= st0_frac0;
                st1_frac1 <= st0_frac1;
                st1_sub   <= st0_sign1 ^ st0_sign0;
                st1_shift <= st0_exp0 - st0_exp1;
            end
            else begin
                st1_sign  <= st0_sign1;
                st1_exp   <= st0_exp1;
                st1_frac0 <= st0_frac1;
                st1_frac1 <= st0_frac0;
                st1_sub   <= st0_sign0 ^ st0_sign1;
                st1_shift <= st0_exp1 - st0_exp0;
            end
        end
        
        if ( stage_cke[2] ) begin
            st2_user  <= st1_user;
            st2_sign  <= st1_sign;
            st2_exp   <= st1_exp;
            st2_frac0 <= st1_frac0;
            st2_frac1 <= (st1_frac1 >> st1_shift);
            st2_sub   <= st1_sub;
        end
        
        if ( stage_cke[3] ) begin
            st3_user  <= st2_user;
            st3_sign  <= st2_sign;
            st3_exp   <= st2_exp;
            st3_frac  <= st2_sub ? st2_frac0 - st2_frac1 : st2_frac0 + st2_frac1;
        end
        
        if ( stage_cke[4] ) begin
            tmp_clz  = 0;
            tmp_frac = st3_frac;
            for ( i = 0; i < (FRAC_WIDTH + 1); i = i+1 ) begin
                if ( tmp_frac[FRAC_WIDTH+1] == 1'b0 ) begin
                    tmp_clz  = tmp_clz + 1'b1;
                    tmp_frac = (tmp_frac << 1);
                end
            end
            st4_user <= st3_user;
            st4_sign <= st3_sign;
            st4_exp  <= st3_exp;
//          st4_frac <= tmp_frac[FRAC_WIDTH+1:1];
            st4_frac <= st3_frac[FRAC_WIDTH:0];
            st4_clz  <= tmp_clz;
        end
        
        if ( stage_cke[5] ) begin
            st5_user <= st4_user;
//          st5_sign <= st4_frac[FRAC_WIDTH] ? st4_sign : 1'b0;
//          st5_exp  <= st4_frac[FRAC_WIDTH] ? (st4_exp - st4_clz + 1'b1) : {EXP_WIDTH{1'b0}};
//          st5_frac <= st4_frac[FRAC_WIDTH-1:0];

            st5_sign <= (st4_clz < (FRAC_WIDTH+1)) ? st4_sign : 1'b0;
            st5_exp  <= (st4_clz < (FRAC_WIDTH+1)) ? (st4_exp - st4_clz + 1'b1) : {EXP_WIDTH{1'b0}};
            st5_frac <= ((st4_frac << st4_clz) >> 1);
        end
    end
    
    assign sink_user = st5_user;
    assign sink_sign = st5_sign;
    assign sink_exp  = st5_exp;
    assign sink_frac = st5_frac;
    
endmodule



`default_nettype wire



// end of file
