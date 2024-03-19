// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// fixed_to_float
module jelly_fixed_to_float
        #(
            parameter   FIXED_SIGNED     = 1,
            parameter   FIXED_INT_WIDTH  = 32,
            parameter   FIXED_FRAC_WIDTH = 0,
            parameter   FIXED_WIDTH      = FIXED_INT_WIDTH + FIXED_FRAC_WIDTH,
            parameter   FIXED_EXP_WIDTH  = 0,
            parameter   FIXED_EXP_BITS   = FIXED_EXP_WIDTH > 0 ? FIXED_EXP_WIDTH                : 1,
            parameter   FIXED_EXP_OFFSET = FIXED_EXP_WIDTH > 0 ? (1 << (FIXED_EXP_WIDTH-1)) - 1 : 0,
            
            parameter   FLOAT_EXP_WIDTH  = 8,
            parameter   FLOAT_EXP_OFFSET = (1 << (FLOAT_EXP_WIDTH-1)) - 1,
            parameter   FLOAT_FRAC_WIDTH = 23,
            parameter   FLOAT_WIDTH      = 1 + FLOAT_EXP_WIDTH + FLOAT_FRAC_WIDTH,  // sign + exp + frac
            
            parameter   USE_FIXED_EXP    = (FIXED_EXP_WIDTH > 0),
            
            parameter   USER_WIDTH       = 0,
            parameter   USER_BITS        = USER_WIDTH > 0 ? USER_WIDTH : 1,
            
            parameter   MASTER_IN_REGS   = 1,
            parameter   MASTER_OUT_REGS  = 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [USER_BITS-1:0]         s_user,
            input   wire    [FIXED_WIDTH-1:0]       s_fixed,
            input   wire    [FIXED_EXP_BITS-1:0]    s_exp,
            input   wire                            s_valid,
            output  wire                            s_ready,
            
            output  wire    [USER_BITS-1:0]         m_user,
            output  wire    [FLOAT_WIDTH-1:0]       m_float,
            output  wire                            m_valid,
            input   wire                            m_ready
        );
    
    localparam  PIPELINE_STAGES = 4;
    
    wire    [PIPELINE_STAGES-1:0]   stage_cke;
    wire    [PIPELINE_STAGES-1:0]   stage_valid;
    
    wire    [USER_BITS-1:0]         src_user;
    wire    [FIXED_WIDTH-1:0]       src_fixed;
    wire    [FIXED_EXP_BITS-1:0]    src_exp;
    
    wire    [USER_BITS-1:0]         sink_user;
    wire    [FLOAT_WIDTH-1:0]       sink_float;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (PIPELINE_STAGES),
                .S_DATA_WIDTH       (USER_BITS+FIXED_EXP_BITS+FIXED_WIDTH),
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
                
                .s_data             ({s_user, s_exp, s_fixed}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({m_user, m_float}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         ({PIPELINE_STAGES{1'bx}}),
                .src_data           ({src_user, src_exp, src_fixed}),
                .src_valid          (),
                .sink_data          ({sink_user, sink_float}),
                .buffered           ()
            );
    
    localparam  UNSIGNED_WIDTH   = FIXED_SIGNED ? FIXED_WIDTH - 1 : FIXED_INT_WIDTH;
    localparam  ZERO_COUNT_WIDTH = UNSIGNED_WIDTH <=   2 ? 1 :
                                   UNSIGNED_WIDTH <=   4 ? 2 :
                                   UNSIGNED_WIDTH <=   8 ? 3 :
                                   UNSIGNED_WIDTH <=  16 ? 4 :
                                   UNSIGNED_WIDTH <=  32 ? 5 :
                                   UNSIGNED_WIDTH <=  64 ? 6 :
                                   UNSIGNED_WIDTH <= 127 ? 7 : 8;
    
    integer                                     i;
    
    reg     [USER_BITS-1:0]                     st0_user;
    reg                                         st0_zero;
    reg                                         st0_sign;
    reg     [UNSIGNED_WIDTH-1:0]                st0_fixed;
    reg     [FIXED_EXP_BITS-1:0]                st0_exp;
    
    reg     [USER_BITS-1:0]                     st1_user;
    reg                                         st1_zero;
    reg                                         st1_sign;
    reg     [ZERO_COUNT_WIDTH-1:0]              st1_clz;
    reg     [UNSIGNED_WIDTH-1:0]                st1_fixed;
    reg     [FIXED_EXP_BITS-1:0]                st1_exp;
    
    reg     [USER_BITS-1:0]                     st2_user;
    reg                                         st2_zero;
    reg                                         st2_sign;
    wire    [ZERO_COUNT_WIDTH-1:0]              st2_clz;
    reg     [UNSIGNED_WIDTH-1:0]                st2_fixed;
    reg     [FIXED_EXP_BITS-1:0]                st2_exp;
    
    reg     [USER_BITS-1:0]                     st3_user;
    reg                                         st3_sign;
    reg     [FLOAT_EXP_WIDTH-1:0]               st3_exp;
    reg     [FLOAT_FRAC_WIDTH-1:0]              st3_frac;
    
    jelly_integer_clz
            #(
                .PIPELINES      (2),
                .COUNT_WIDTH    (ZERO_COUNT_WIDTH),
                .DATA_WIDTH     (UNSIGNED_WIDTH),
                .UNIT_WIDTH     (16)
            )
        i_integer_clz
            (
                .clk            (clk),
                .cke            (stage_cke[2:1]),
                
                .in_data        (st0_fixed),
                
                .out_clz        (st2_clz)
            );
    
    
    always @(posedge clk) begin
        if ( stage_cke[0] ) begin
            st0_user <= src_user;
            st0_zero <= (src_fixed == {FIXED_WIDTH{1'b0}});
            st0_exp  <= src_exp;
            if ( FIXED_SIGNED ) begin
                st0_sign  <= src_fixed[FIXED_WIDTH-1];
                st0_fixed <= src_fixed[FIXED_WIDTH-1] ? -src_fixed : src_fixed;
            end
            else begin
                st0_sign  <= 1'b0;
                st0_fixed <= src_fixed;
            end
        end
        
        if ( stage_cke[1] ) begin
            st1_user  <= st0_user;
            st1_zero  <= st0_zero;
            st1_sign  <= st0_sign;
            st1_fixed <= st0_fixed;
            st1_exp   <= st0_exp;
        end
        
        if ( stage_cke[2] ) begin
            st2_user  <= st1_user;
            st2_zero  <= st1_zero;
            st2_sign  <= st1_sign;
            st2_fixed <= st1_fixed;
            st2_exp   <= st1_exp;
        end
        
        if ( stage_cke[3] ) begin
            st3_user  <= st2_user;
            if ( st2_zero ) begin
                st3_sign <= 1'b0;
                st3_exp  <= {FLOAT_EXP_WIDTH{1'b0}};
            end
            else begin
                st3_sign <= st2_sign;
                if ( USE_FIXED_EXP ) begin
                    st3_exp  <= FLOAT_EXP_OFFSET + (UNSIGNED_WIDTH-1 - FIXED_FRAC_WIDTH) - st2_clz + (st2_exp - FIXED_EXP_OFFSET);
                end
                else begin
                    st3_exp  <= FLOAT_EXP_OFFSET + (UNSIGNED_WIDTH-1 - FIXED_FRAC_WIDTH) - st2_clz;
                end
            end
            
            if ( FLOAT_FRAC_WIDTH > UNSIGNED_WIDTH ) begin
                st3_frac <= ((st2_fixed << (st2_clz+1)) << (FLOAT_FRAC_WIDTH - UNSIGNED_WIDTH));
            end
            else begin
                st3_frac <= ((st2_fixed << (st2_clz+1)) >> (UNSIGNED_WIDTH - FLOAT_FRAC_WIDTH));
            end
        end
    end
    
    assign sink_user  = st3_user;
    assign sink_float = {st3_sign, st3_exp, st3_frac};
    
    
endmodule



`default_nettype wire



// end of file
