// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// 浮動小数点の順次インクリメント/デクリメント値生成コア
module jelly_float_step
        #(
            parameter   EXP_WIDTH  = 8,
            parameter   FRAC_WIDTH = 23,
            parameter   DATA_WIDTH = 1 + EXP_WIDTH + FRAC_WIDTH
        )
        (
            input   wire                        clk,
            
            input   wire    [5:0]               stage_cke,
            
            // input
            input   wire    [DATA_WIDTH-1:0]    s_param_init,
            input   wire    [DATA_WIDTH-1:0]    s_param_step,
            input   wire                        s_initial,
            input   wire                        s_increment,
            
            // output
            output  wire    [DATA_WIDTH-1:0]    m_data
        );
    
    
    wire                                src_init_sign = s_param_init[DATA_WIDTH-1];
    wire            [EXP_WIDTH-1:0]     src_init_exp  = s_param_init[FRAC_WIDTH +: EXP_WIDTH];
    wire            [FRAC_WIDTH-1:0]    src_init_frac = s_param_init[FRAC_WIDTH-1:0];
    wire                                src_step_sign = s_param_step[DATA_WIDTH-1];
    wire            [EXP_WIDTH-1:0]     src_step_exp  = s_param_step[FRAC_WIDTH +: EXP_WIDTH];
    wire            [FRAC_WIDTH-1:0]    src_step_frac = s_param_step[FRAC_WIDTH-1:0];
    wire                                src_initial   = s_initial;
    wire                                src_increment = s_increment;
    
    reg                                 st0_init_sign;
    reg             [EXP_WIDTH-1:0]     st0_init_shift;
    reg             [EXP_WIDTH-1:0]     st0_init_exp;
    reg             [FRAC_WIDTH-1:0]    st0_init_frac;
    reg                                 st0_step_sign;
    reg             [EXP_WIDTH-1:0]     st0_step_shift;
    reg             [FRAC_WIDTH-1:0]    st0_step_frac;
    reg                                 st0_initial;
    reg                                 st0_increment;
    
    reg                                 st1_init_sign;
    reg             [EXP_WIDTH-1:0]     st1_init_exp;
    reg             [FRAC_WIDTH:0]      st1_init_frac;
    reg                                 st1_step_sign;
    reg             [FRAC_WIDTH:0]      st1_step_frac;
    reg                                 st1_initial;
    reg                                 st1_increment;
    
    reg                                 st2_base_sign;
    reg             [EXP_WIDTH-1:0]     st2_base_exp;
    reg     signed  [FRAC_WIDTH+2:0]    st2_base_frac;
    reg     signed  [FRAC_WIDTH+1:0]    st2_step_frac;
    reg                                 st2_shift;
    wire    signed  [FRAC_WIDTH+2:0]    st2_inc_frac = ((st2_base_frac >>> st2_shift) + st2_step_frac);
    
    reg                                 st3_sign;
    reg             [EXP_WIDTH-1:0]     st3_exp;
    reg             [FRAC_WIDTH:0]      st3_frac;
    
    reg                                 st4_sign;
    reg             [EXP_WIDTH-1:0]     st4_exp;
    reg             [FRAC_WIDTH:0]      st4_frac;
    reg             [EXP_WIDTH-1:0]     st4_shift;
    
    reg                                 st5_sign;
    reg             [EXP_WIDTH-1:0]     st5_exp;
    reg             [FRAC_WIDTH-1:0]    st5_frac;
    
    integer                             i;
    
    always @(posedge clk) begin
        // stage 0 (指数部をどちらに合わせるか判別)
        if ( stage_cke[0] ) begin
            st0_init_sign <= src_init_sign;
            st0_init_frac <= src_init_frac;
            st0_step_sign <= src_step_sign;
            st0_step_frac <= src_step_frac;
            if ( src_init_exp >= src_step_exp ) begin
                st0_init_exp   <= src_init_exp;
                st0_init_shift <= 0;
                st0_step_shift <= src_init_exp - src_step_exp;
            end
            else begin
                st0_init_exp   <= src_step_exp;
                st0_init_shift <= src_step_exp - src_init_exp;
                st0_step_shift <= 0;
            end
            st0_initial   <= src_initial;
            st0_increment <= src_increment;
        end
        
        
        // stage 1 (桁あわせ)
        if ( stage_cke[1] ) begin
            st1_init_sign <= st0_init_sign;
            st1_init_exp  <= st0_init_exp;
            st1_init_frac <= ({1'b1, st0_init_frac} >> st0_init_shift);
            st1_step_sign <= st0_step_sign;
            st1_step_frac <= ({1'b1, st0_step_frac} >> st0_step_shift);
            st1_initial   <= st0_initial;
            st1_increment <= st0_increment;
        end
        
        
        // stage 2 (インクリメント計算)
        if ( stage_cke[2] ) begin
            if ( st1_initial ) begin
                // 初期化
                st2_base_sign <= st1_init_sign;
                st2_base_exp  <= st1_init_exp;
                st2_base_frac <= {1'b0, st1_init_frac};
                st2_step_frac <= (st1_init_sign == st1_step_sign) ? {1'b0, st1_step_frac} : -{1'b0, st1_step_frac};
                st2_shift     <= 1'b0;
            end
            else if ( st1_increment ) begin
                // インクリメント
                st2_shift <= (st2_inc_frac[FRAC_WIDTH+2] != st2_inc_frac[FRAC_WIDTH+1])
                                || (st2_inc_frac[FRAC_WIDTH+1] && st2_inc_frac[FRAC_WIDTH:0] == 0);
                st2_base_exp  <= st2_base_exp + st2_shift;
                st2_base_frac <= st2_inc_frac;
            end
        end
        
        
        // stage 3 (符号整形)
        if ( stage_cke[3] ) begin
            st3_sign  <= st2_base_frac[FRAC_WIDTH+2] ? ~st2_base_sign : st2_base_sign ;
            st3_exp   <= st2_base_exp + st2_shift;
            st3_frac  <= st2_base_frac[FRAC_WIDTH+1] ? -(st2_base_frac >>> st2_shift) : (st2_base_frac >>> st2_shift);
        end
        
        
        // stage 4 (桁落ち検出)
        if ( stage_cke[4] ) begin
            st4_sign  <= st3_sign;
            st4_exp   <= st3_exp;
            st4_frac  <= st3_frac;
            st4_shift <= 0;
            for ( i = FRAC_WIDTH; i >= 0; i = i - 1 ) begin
                if ( st3_frac[FRAC_WIDTH - i] ) begin
                    st4_shift <= i;
                end
            end
        end
        
        // stage 5 (桁落ち補正)
        if ( stage_cke[5] ) begin
            st5_sign  <= st4_sign;
            st5_exp   <= st4_exp - st4_shift;
            if ( st4_frac == 0 ) begin
                st5_exp   <= 0;
            end
            st5_frac  <= (st4_frac << st4_shift);
        end
    end
    
    assign m_data  = {st5_sign, st5_exp, st5_frac};
    
endmodule


`default_nettype wire


// end of file
