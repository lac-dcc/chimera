// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_fixed_float_mul
        #(
            parameter   USER_WIDTH           = 0,
            
            parameter   S_FLOAT_EXP_WIDTH    = 6,
            parameter   S_FLOAT_EXP_OFFSET   = (1 << (S_FLOAT_EXP_WIDTH-1)) - 1,
            parameter   S_FLOAT_FRAC_WIDTH   = 16,
            
            parameter   S_FIXED_INT_WIDTH    = 16,
            parameter   S_FIXED_FRAC_WIDTH   = 8,
            
            parameter   M_FIXED_INT_WIDTH    = 12,
            parameter   M_FIXED_FRAC_WIDTH   = 4,
            
            parameter   CLIP                 = 1,
            
            parameter   MASTER_IN_REGS       = 1,
            parameter   MASTER_OUT_REGS      = 1,
            
            parameter   DEVICE               = "7SERIES", // "RTL"
    
            // local
            parameter   USER_BITS            = USER_WIDTH > 0 ? USER_WIDTH : 1,
            parameter   S_FLOAT_WIDTH        = 1 + S_FLOAT_EXP_WIDTH + S_FLOAT_FRAC_WIDTH,  // sign + exp + frac
            parameter   S_FIXED_WIDTH        = S_FIXED_INT_WIDTH + S_FIXED_FRAC_WIDTH,
            parameter   M_FIXED_WIDTH        = M_FIXED_INT_WIDTH + M_FIXED_FRAC_WIDTH
        )
        (
            input   wire                                        reset,
            input   wire                                        clk,
            input   wire                                        cke,
            
            input   wire            [USER_BITS-1:0]             s_user,
            input   wire            [S_FLOAT_WIDTH-1:0]         s_float,
            input   wire    signed  [S_FIXED_WIDTH-1:0]         s_fixed,
            input   wire                                        s_valid,
            output  wire                                        s_ready,
            
            output  wire            [USER_BITS-1:0]             m_user,
            output  wire    signed  [M_FIXED_WIDTH-1:0]         m_fixed,
            output  wire                                        m_valid,
            input   wire                                        m_ready
        );
    
    localparam  FRAC_DIFF       = M_FIXED_FRAC_WIDTH > S_FIXED_FRAC_WIDTH ? M_FIXED_FRAC_WIDTH - S_FIXED_FRAC_WIDTH : S_FIXED_FRAC_WIDTH - M_FIXED_FRAC_WIDTH;
    localparam  MUL_WIDTH       = S_FIXED_WIDTH + (S_FLOAT_FRAC_WIDTH+2);
    localparam  MUL_SHIFT_WIDTH = MUL_WIDTH + (1 << S_FLOAT_EXP_WIDTH) + FRAC_DIFF;
    
    localparam  PIPELINE_STAGES = CLIP ? 6 : 5;
    
    wire            [PIPELINE_STAGES-1:0]       stage_cke;
    wire            [PIPELINE_STAGES-1:0]       stage_valid;
    
    wire            [USER_BITS-1:0]             src_user;
    wire            [S_FLOAT_WIDTH-1:0]         src_float;
    wire    signed  [S_FIXED_WIDTH-1:0]         src_fixed;
    
    wire                                        src_float_sign;
    wire            [S_FLOAT_EXP_WIDTH-1:0]     src_float_exp;
    wire            [S_FLOAT_FRAC_WIDTH-1:0]    src_float_frac;
    
    wire            [USER_BITS-1:0]             sink_user;
    wire            [M_FIXED_WIDTH-1:0]         sink_fixed;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (PIPELINE_STAGES),
                .S_DATA_WIDTH       (USER_BITS+S_FLOAT_WIDTH+S_FIXED_WIDTH),
                .M_DATA_WIDTH       (USER_BITS+M_FIXED_WIDTH),
                .AUTO_VALID         (1),
                .MASTER_IN_REGS     (MASTER_IN_REGS),
                .MASTER_OUT_REGS    (MASTER_OUT_REGS)
            )
        i_pipeline_control
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             ({s_user, s_float, s_fixed}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({m_user, m_fixed}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         ({PIPELINE_STAGES{1'bx}}),
                .src_data           ({src_user, src_float, src_fixed}),
                .src_valid          (),
                .sink_data          ({sink_user, sink_fixed}),
                .buffered           ()
            );
    
    assign {src_float_sign, src_float_exp, src_float_frac} = src_float;
    
    wire    signed  [M_FIXED_WIDTH-1:0]         clip_min = {1'b1, {(M_FIXED_WIDTH-1){1'b0}}};
    wire    signed  [M_FIXED_WIDTH-1:0]         clip_max = {1'b0, {(M_FIXED_WIDTH-1){1'b1}}};
    
    reg             [USER_BITS-1:0]             st0_user;
    reg             [S_FLOAT_EXP_WIDTH-1:0]     st0_float_exp;
    reg     signed  [S_FLOAT_FRAC_WIDTH+1:0]    st0_float_frac;
    
    reg             [USER_BITS-1:0]             st1_user;
    reg             [S_FLOAT_EXP_WIDTH-1:0]     st1_float_exp;
    
    reg             [USER_BITS-1:0]             st2_user;
    reg             [S_FLOAT_EXP_WIDTH-1:0]     st2_float_exp;
    
    reg             [USER_BITS-1:0]             st3_user;
    reg             [S_FLOAT_EXP_WIDTH-1:0]     st3_float_exp;
    wire    signed  [MUL_WIDTH-1:0]             st3_mul;
    wire    signed  [MUL_SHIFT_WIDTH-1:0]       st3_shift = st3_mul;
    
    reg             [USER_BITS-1:0]             st4_user;
    reg     signed  [MUL_SHIFT_WIDTH-1:0]       st4_fixed;
        
    always @(posedge clk) begin
        // stage 0
        if ( stage_cke[0] ) begin
            st0_user       <= src_user;
            st0_float_exp  <= src_float_exp;
            st0_float_frac <= src_float_sign ? -{2'b01, src_float_frac} : {2'b01, src_float_frac};
        end
        
        // stage 1
        if ( stage_cke[1] ) begin
            st1_user       <= st0_user;
            st1_float_exp  <= st0_float_exp;
        end
        
        // stage 2
        if ( stage_cke[2] ) begin
            st2_user       <= st1_user;
            st2_float_exp  <= st1_float_exp;
        end
        
        // stage 3
        if ( stage_cke[3] ) begin
            st3_user       <= st2_user;
            st3_float_exp  <= st2_float_exp;
        end
        
        // stage 4
        if ( stage_cke[4] ) begin
            st4_user   <= st3_user;
            
            if ( M_FIXED_FRAC_WIDTH > S_FIXED_FRAC_WIDTH ) begin
                st4_fixed  <= (((st3_shift <<< FRAC_DIFF) <<< st3_float_exp) >>> (S_FLOAT_EXP_OFFSET + S_FLOAT_FRAC_WIDTH));
            end
            else begin
                st4_fixed  <= ((st3_shift <<< st3_float_exp) >>> (S_FLOAT_EXP_OFFSET + S_FLOAT_FRAC_WIDTH + FRAC_DIFF));
            end
        end
    end

    // stage 5
    generate
    if ( CLIP ) begin : blk_clip
        reg             [USER_BITS-1:0]             st5_user;
        reg     signed  [M_FIXED_WIDTH-1:0]         st5_fixed;
        always @(posedge clk) begin
            if (  stage_cke[5] ) begin
                st5_user  <= st4_user;
                st5_fixed <= st4_fixed;
                if ( st4_fixed < clip_min ) begin st5_fixed <= clip_min; end
                if ( st4_fixed > clip_max ) begin st5_fixed <= clip_max; end
            end
        end
        
        assign sink_user  = st5_user;
        assign sink_fixed = st5_fixed;
    end
    else begin : blk_no_clip
        assign sink_user  = st4_user;
        assign sink_fixed = st4_fixed;
    end
    endgenerate
    
    jelly_mul_add_dsp48e1
            #(
                .A_WIDTH        (S_FLOAT_FRAC_WIDTH+2),
                .B_WIDTH        (S_FIXED_WIDTH),
                .C_WIDTH        (1),
                .P_WIDTH        (MUL_WIDTH),
                .M_WIDTH        (MUL_WIDTH),
                
                .OPMODEREG      (0),
                .ALUMODEREG     (0),
                
                .AREG           (1),
                .BREG           (2),
                .CREG           (1),
                .MREG           (1),
                .PREG           (1),
                
                .USE_PCIN       (0),
                .USE_PCOUT      (0),
                
                .DEVICE         (DEVICE)
            )
        i_mul_add_dsp48e1
            (
                .reset          (reset),
                .clk            (clk),
                
                .cke_ctrl       (1'b0),
                .cke_alumode    (1'b0),
                .cke_a0         (1'b0),
                .cke_a1         (stage_cke[1]),
                .cke_b0         (stage_cke[0]),
                .cke_b1         (stage_cke[1]),
                .cke_c          (1'b0),
                .cke_m          (stage_cke[2]),
                .cke_p          (stage_cke[3]),
                
                .op_load        (1'b1),
                .alu_sub        (1'b0),
                
                .a              (st0_float_frac),
                .b              (src_fixed),
                .c              (1'b0),
                .p              (st3_mul),
                
                .pcin           (),
                .pcout          ()
            );
    
    
endmodule



`default_nettype wire



// end of file
