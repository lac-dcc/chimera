// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_denorm_float_mul
        #(
            parameter   S_DENORM_EXP_WIDTH   = 8,
            parameter   S_DENORM_EXP_BITS    = S_DENORM_EXP_WIDTH > 0 ? S_DENORM_EXP_WIDTH                : 1,
            parameter   S_DENORM_EXP_OFFSET  = S_DENORM_EXP_WIDTH > 0 ? (1 << (S_DENORM_EXP_WIDTH-1)) - 1 : 0,
            parameter   S_DENORM_INT_WIDTH   = 25,
            parameter   S_DENORM_FRAC_WIDTH  = 8,
            parameter   S_DENORM_FIXED_WIDTH = S_DENORM_INT_WIDTH + S_DENORM_FRAC_WIDTH,
            
            parameter   S_FLOAT_EXP_WIDTH    = 8,
            parameter   S_FLOAT_EXP_OFFSET   = (1 << (S_FLOAT_EXP_WIDTH-1)) - 1,
            parameter   S_FLOAT_FRAC_WIDTH   = 16,
            parameter   S_FLOAT_WIDTH        = 1 + S_FLOAT_EXP_WIDTH + S_FLOAT_FRAC_WIDTH,  // sign + exp + frac
            
            parameter   M_DENORM_EXP_WIDTH   = S_FLOAT_EXP_WIDTH,
            parameter   M_DENORM_EXP_OFFSET  = (1 << (M_DENORM_EXP_WIDTH-1)) - 1,
            parameter   M_DENORM_INT_WIDTH   = 25,
            parameter   M_DENORM_FRAC_WIDTH  = 8,
            parameter   M_DENORM_FIXED_WIDTH = M_DENORM_INT_WIDTH + M_DENORM_FRAC_WIDTH,
            
            parameter   USER_WIDTH           = 0,
            parameter   USER_BITS            = USER_WIDTH > 0 ? USER_WIDTH : 1,
            
            parameter   MASTER_IN_REGS       = 1,
            parameter   MASTER_OUT_REGS      = 1,
            
            parameter   DEVICE               = "RTL" // "7SERIES"
        )
        (
            input   wire                                        reset,
            input   wire                                        clk,
            input   wire                                        cke,
            
            input   wire            [USER_BITS-1:0]             s_user,
            input   wire            [S_DENORM_EXP_WIDTH-1:0]    s_denorm_exp,
            input   wire    signed  [S_DENORM_FIXED_WIDTH-1:0]  s_denorm_fixed,
            input   wire            [S_FLOAT_WIDTH-1:0]         s_float,
            input   wire                                        s_valid,
            output  wire                                        s_ready,
            
            output  wire            [USER_BITS-1:0]             m_user,
            output  wire            [M_DENORM_EXP_WIDTH-1:0]    m_denorm_exp,
            output  wire    signed  [M_DENORM_FIXED_WIDTH-1:0]  m_denorm_fixed,
            output  wire                                        m_valid,
            input   wire                                        m_ready
        );
    
    
    localparam  PIPELINE_STAGES = 3;
    
    wire            [PIPELINE_STAGES-1:0]       stage_cke;
    wire            [PIPELINE_STAGES-1:0]       stage_valid;
    
    
    wire            [USER_BITS-1:0]             src_user;
    wire    signed  [S_DENORM_EXP_WIDTH-1:0]    src_denorm_exp;
    wire    signed  [S_DENORM_FIXED_WIDTH-1:0]  src_denorm_fixed;
    wire                                        src_float_sign;
    wire            [S_FLOAT_EXP_WIDTH-1:0]     src_float_exp;
    wire            [S_FLOAT_FRAC_WIDTH-1:0]    src_float_frac;
    
    wire            [USER_BITS-1:0]             sink_user;
    wire            [M_DENORM_EXP_WIDTH-1:0]    sink_denorm_exp;
    wire    signed  [M_DENORM_FIXED_WIDTH-1:0]  sink_denorm_fixed;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (PIPELINE_STAGES),
                .S_DATA_WIDTH       (USER_BITS+S_DENORM_EXP_WIDTH+S_DENORM_FIXED_WIDTH+S_FLOAT_WIDTH),
                .M_DATA_WIDTH       (USER_BITS+M_DENORM_EXP_WIDTH+M_DENORM_FIXED_WIDTH),
                .AUTO_VALID         (1),
                .MASTER_IN_REGS     (MASTER_IN_REGS),
                .MASTER_OUT_REGS    (MASTER_OUT_REGS)
            )
        i_pipeline_control
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             ({
                                        s_user,
                                        s_denorm_exp,
                                        s_denorm_fixed,
                                        s_float
                                    }),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({m_user, m_denorm_exp, m_denorm_fixed}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         ({PIPELINE_STAGES{1'bx}}),
                .src_data           ({
                                        src_user,
                                        src_denorm_exp,
                                        src_denorm_fixed,
                                        src_float_sign,
                                        src_float_exp,
                                        src_float_frac
                                    }),
                .src_valid          (),
                .sink_data          ({sink_user, sink_denorm_exp, sink_denorm_fixed}),
                .buffered           ()
            );
    
    
    
    localparam  S_FLOAT_INT_WIDTH = S_FLOAT_FRAC_WIDTH + 2;
    localparam  INT_WIDTH         = S_DENORM_FIXED_WIDTH + S_FLOAT_INT_WIDTH;
    
    wire                                        src_float_one = (src_float_exp != 0);
    wire    signed  [S_FLOAT_INT_WIDTH-1:0]     src_float_int = src_float_sign ? -{1'b0, src_float_one, src_float_frac} : {1'b0, src_float_one, src_float_frac};
    
    reg             [USER_BITS-1:0]             st0_user;
    reg             [S_FLOAT_INT_WIDTH-1:0]     st0_float_int;
    reg             [M_DENORM_EXP_WIDTH-1:0]    st0_denorm_exp;
    
    reg             [USER_BITS-1:0]             st1_user;
    reg             [M_DENORM_EXP_WIDTH-1:0]    st1_denorm_exp;
    
    reg             [USER_BITS-1:0]             st2_user;
    reg             [M_DENORM_EXP_WIDTH-1:0]    st2_denorm_exp;
    wire    signed  [INT_WIDTH-1:0]             st2_int;
    
    always @(posedge clk) begin
        // stage 0
        if ( stage_cke[0] ) begin
            st0_user       <= src_user;
            st0_float_int  <= src_float_int;
//          st0_denorm_exp <= (src_denorm_exp - S_DENORM_EXP_OFFSET) + (src_float_exp - S_FLOAT_EXP_OFFSET) + M_DENORM_EXP_OFFSET;
            st0_denorm_exp <= (src_denorm_exp + src_float_exp - (S_DENORM_EXP_OFFSET + S_FLOAT_EXP_OFFSET - M_DENORM_EXP_OFFSET));
        end
        
        if ( stage_cke[1] ) begin
            st1_user       <= st0_user;
            st1_denorm_exp <= st0_denorm_exp;
        end
        
        if ( stage_cke[2] ) begin
            st2_user       <= st1_user;
            st2_denorm_exp <= st1_denorm_exp;
        end
    end
    
    
    assign sink_user       = st2_user;
    assign sink_denorm_exp = st2_denorm_exp;
    
    generate
    if ( (S_DENORM_FRAC_WIDTH + S_FLOAT_FRAC_WIDTH) > M_DENORM_FRAC_WIDTH ) begin
        assign sink_denorm_fixed = (st2_int >>> ((S_DENORM_FRAC_WIDTH + S_FLOAT_FRAC_WIDTH) - M_DENORM_FRAC_WIDTH));
    end
    else begin
        assign sink_denorm_fixed = (st2_int >>> (M_DENORM_FRAC_WIDTH - (S_DENORM_FRAC_WIDTH + S_FLOAT_FRAC_WIDTH)));
    end
    endgenerate
    
    
    jelly_mul_add_dsp48e1
                #(
                    .A_WIDTH        (S_FLOAT_INT_WIDTH),
                    .B_WIDTH        (S_DENORM_FIXED_WIDTH),
                    .C_WIDTH        (INT_WIDTH),
                    .P_WIDTH        (INT_WIDTH),
                    
                    .OPMODEREG      (0),
                    .ALUMODEREG     (0),
                    .AREG           (1),
                    .BREG           (2),
                    .CREG           (0),
                    .MREG           (0),
                    .PREG           (1),
                    
                    .USE_PCIN       (0),
                    .USE_PCOUT      (0),
                    
                    .DEVICE         (DEVICE)
                )
            i_mul_add_dsp48
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .cke_ctrl       (1'b0),
                    .cke_alumode    (1'b0),
                    .cke_a0         (1'b0),
                    .cke_b0         (stage_cke[0]),
                    .cke_a1         (stage_cke[1]),
                    .cke_b1         (stage_cke[1]),
                    .cke_c          (1'b0),
                    .cke_m          (1'b0),
                    .cke_p          (stage_cke[2]),
                    
                    .op_load        (1'b1),
                    .alu_sub        (1'b0),
                    
                    .a              (st0_float_int),
                    .b              (src_denorm_fixed),
                    .c              ({INT_WIDTH{1'b0}}),
                    .p              (st2_int),
                    
                    .pcin           (),
                    .pcout          ()
                );
    
    
endmodule



`default_nettype wire



// end of file
