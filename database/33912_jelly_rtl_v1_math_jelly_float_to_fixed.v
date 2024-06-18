// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// float_to_fixed
module jelly_float_to_fixed
        #(
            parameter   FLOAT_EXP_WIDTH  = 8,
            parameter   FLOAT_EXP_OFFSET = (1 << (FLOAT_EXP_WIDTH-1)) - 1,
            parameter   FLOAT_FRAC_WIDTH = 23,
            parameter   FLOAT_WIDTH      = 1 + FLOAT_EXP_WIDTH + FLOAT_FRAC_WIDTH,  // sign + exp + frac
            
            parameter   FIXED_INT_WIDTH  = 32,
            parameter   FIXED_FRAC_WIDTH = 0,
            parameter   FIXED_WIDTH      = FIXED_INT_WIDTH + FIXED_FRAC_WIDTH,
            
            parameter   USER_WIDTH       = 0,
            parameter   USER_BITS        = USER_WIDTH > 0 ? USER_WIDTH : 1,
            
            parameter   MASTER_IN_REGS   = 1,
            parameter   MASTER_OUT_REGS  = 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire    [FLOAT_WIDTH-1:0]   s_float,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire    [FIXED_WIDTH-1:0]   m_fixed,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    localparam  PIPELINE_STAGES = 3;
    
    wire    [PIPELINE_STAGES-1:0]   stage_cke;
    wire    [PIPELINE_STAGES-1:0]   stage_valid;
    
    wire    [USER_BITS-1:0]         src_user;
    wire                            src_sign;
    wire    [FLOAT_EXP_WIDTH-1:0]   src_exp;
    wire    [FLOAT_FRAC_WIDTH-1:0]  src_frac;
    
    wire    [USER_BITS-1:0]         sink_user;
    wire    [FIXED_WIDTH-1:0]       sink_fixed;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (PIPELINE_STAGES),
                .S_DATA_WIDTH       (USER_BITS+FLOAT_WIDTH),
                .M_DATA_WIDTH       (USER_BITS+FIXED_WIDTH),
                .AUTO_VALID         (1),
                .MASTER_IN_REGS     (MASTER_IN_REGS),
                .MASTER_OUT_REGS    (MASTER_OUT_REGS)
            )
        i_pipeline_control
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             ({s_user, s_float}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({m_user, m_fixed}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         ({PIPELINE_STAGES{1'bx}}),
                .src_data           ({src_user, src_sign, src_exp, src_frac}),
                .src_valid          (),
                .sink_data          ({sink_user, sink_fixed}),
                .buffered           ()
            );
    
    
    
    reg     [USER_BITS-1:0]         st0_user;
    reg                             st0_sign;
    reg     [FLOAT_EXP_WIDTH-1:0]   st0_exp;
    reg     [FLOAT_FRAC_WIDTH:0]    st0_frac;
    
    reg     [USER_BITS-1:0]         st1_user;
    reg                             st1_sign;
    reg     [FIXED_WIDTH-1:0]       st1_fixed;
    
    reg     [USER_BITS-1:0]         st2_user;
    reg     [FIXED_WIDTH-1:0]       st2_fixed;
    
    always @(posedge clk) begin
        if ( stage_cke[0] ) begin
            st0_user <= src_user;
            st0_sign <= src_sign;
            st0_exp  <= ((FLOAT_FRAC_WIDTH + FIXED_INT_WIDTH) - (src_exp - FLOAT_EXP_OFFSET));
            if ( src_exp == {FLOAT_EXP_WIDTH{1'b0}} ) begin
                st0_frac <= {1'b0, src_frac};
            end
            else begin
                st0_frac <= {1'b1, src_frac};
            end
        end
        
        if ( stage_cke[1] ) begin
            st1_user  <= st0_user;
            st1_sign  <= st0_sign;
            st1_fixed <= ({st0_frac, {FIXED_WIDTH{1'b0}}} >> st0_exp);
        end
        
        if ( stage_cke[2] ) begin
            st2_user  <= st1_user;
            st2_fixed <= st1_sign ? -st1_fixed : st1_fixed;
        end
    end
    
    assign sink_user  = st2_user;
    assign sink_fixed = st2_fixed;
    
endmodule



`default_nettype wire



// end of file
