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



// Denormalized number to Floating point number
module jelly_denorm_to_fixed
        #(
            parameter   DENORM_SIGNED      = 1,
            parameter   DENORM_INT_WIDTH   = 48,
            parameter   DENORM_FRAC_WIDTH  = 8,
            parameter   DENORM_FIXED_WIDTH = DENORM_INT_WIDTH + DENORM_FRAC_WIDTH,
            parameter   DENORM_EXP_WIDTH   = 5,
            parameter   DENORM_EXP_BITS    = DENORM_EXP_WIDTH > 0 ? DENORM_EXP_WIDTH                : 1,
            parameter   DENORM_EXP_OFFSET  = DENORM_EXP_WIDTH > 0 ? (1 << (DENORM_EXP_WIDTH-1)) - 1 : 0,
            
            parameter   FIXED_INT_WIDTH    = 16,
            parameter   FIXED_FRAC_WIDTH   = 8,
            parameter   FIXED_WIDTH        = FIXED_INT_WIDTH + FIXED_FRAC_WIDTH,
                        
            parameter   USER_WIDTH         = 0,
            parameter   USER_BITS          = USER_WIDTH > 0 ? USER_WIDTH : 1,

            parameter   SHIFT_STEP_BITS    = 4,
            
            parameter   MASTER_IN_REGS     = 1,
            parameter   MASTER_OUT_REGS    = 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire    [USER_BITS-1:0]             s_user,
            input   wire    [DENORM_FIXED_WIDTH-1:0]    s_denorm_fixed,
            input   wire    [DENORM_EXP_BITS-1:0]       s_denorm_exp,
            input   wire                                s_valid,
            output  wire                                s_ready,
            
            output  wire    [USER_BITS-1:0]             m_user,
            output  wire    [FIXED_WIDTH-1:0]           m_fixed,
            output  wire                                m_valid,
            input   wire                                m_ready
        );
    
    localparam  DATA_WIDTH   = (1 << DENORM_EXP_WIDTH) + DENORM_FIXED_WIDTH;
    localparam  SHIFT_OFFSET = DENORM_EXP_OFFSET + DENORM_FRAC_WIDTH - FIXED_FRAC_WIDTH; 
    
    wire    signed  [DENORM_FIXED_WIDTH:0]  sdata = DENORM_SIGNED ? {s_denorm_fixed[DENORM_FIXED_WIDTH-1], s_denorm_fixed} : {1'b0, s_denorm_fixed};
    wire    signed  [DATA_WIDTH-1:0]        din   = sdata;
    wire    signed  [DATA_WIDTH-1:0]        dout;
    
    jelly_shift_pipeline
            #(
                .SHIFT_WIDTH        (DENORM_EXP_BITS),
                .DATA_WIDTH         (DATA_WIDTH),
                .STEP_BITS          (SHIFT_STEP_BITS),
                
                .ARITHMETIC         (DENORM_SIGNED),
                .LEFT               (1),
                
                .USER_WIDTH         (USER_WIDTH),
                
                .MASTER_IN_REGS     (MASTER_IN_REGS),
                .MASTER_OUT_REGS    (MASTER_OUT_REGS)
            )
        i_shift_pipeline
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                                     
                .s_user             (s_user),
                .s_shift            (s_denorm_exp),
                .s_data             (din),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                                     
                .m_user             (m_user),
                .m_data             (dout),
                .m_valid            (m_valid),
                .m_ready            (m_ready)
            );
    
    assign m_fixed = DENORM_SIGNED ? (dout >>> SHIFT_OFFSET) : (dout >> SHIFT_OFFSET);
    
    
    /*
    localparam  PIPELINE_STAGES = 1;
    
    wire    [PIPELINE_STAGES-1:0]   stage_cke;
    wire    [PIPELINE_STAGES-1:0]   stage_valid;
    
    wire    [USER_BITS-1:0]         src_user;
    wire    [DENORM_WIDTH-1:0]      src_fixed;
    wire    [DENORM_EXP_BITS-1:0]   src_exp;
    
    wire    [USER_BITS-1:0]         sink_user;
    wire    [FIXED_WIDTH-1:0]       sink_fixed;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (PIPELINE_STAGES),
                .S_DATA_WIDTH       (USER_BITS+DENORM_EXP_BITS+DENORM_WIDTH),
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
                
                .s_data             ({s_user, s_denorm_exp, s_denorm_fixed}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({m_user, m_fixed}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         ({PIPELINE_STAGES{1'bx}}),
                .src_data           ({src_user, src_exp, src_fixed}),
                .src_valid          (),
                .sink_data          ({sink_user, sink_fixed}),
                .buffered           ()
            );
    

    wire    signed  [DENORM_WIDTH-1:0]      src_fixed_signed = src_fixed;

    reg     signed  [DENORM_WIDTH-1:0]      st0_fixed_signed;
    
    reg             [USER_BITS-1:0]         st0_user;
    reg             [FIXED_WIDTH-1:0]       st0_fixed;
    
    always @(posedge clk) begin
        if ( stage_cke[0] ) begin
            st0_user  <= src_user;
            
            if ( DENORM_SIGNED ) begin
                st0_fixed_signed <= src_fixed_signed;
                st0_fixed        <= ({st0_fixed_signed, {DENORM_WIDTH{1'b0}}} >>> ((DENORM_EXP_OFFSET + DENORM_FRAC_WIDTH) - (src_exp + FIXED_FRAC_WIDTH) + DENORM_WIDTH));

//              if ( src_exp + FIXED_FRAC_WIDTH >= DENORM_EXP_OFFSET + DENORM_FRAC_WIDTH ) begin
//                  st0_fixed <= (src_fixed_signed <<< ((src_exp + FIXED_FRAC_WIDTH) - (DENORM_EXP_OFFSET + DENORM_FRAC_WIDTH)));
//              end
//              else begin
//                  st0_fixed <= (src_fixed_signed >>> ((DENORM_EXP_OFFSET + DENORM_FRAC_WIDTH) - (src_exp + FIXED_FRAC_WIDTH)));
//              end
            end
            else begin
                st0_fixed <= ({src_fixed, {DENORM_WIDTH{1'b0}}} >> ((DENORM_EXP_OFFSET + DENORM_FRAC_WIDTH) - (src_exp + FIXED_FRAC_WIDTH) + DENORM_WIDTH));

//              if ( src_exp + FIXED_FRAC_WIDTH >= DENORM_EXP_OFFSET + DENORM_FRAC_WIDTH ) begin
//                  st0_fixed <= (src_fixed << ((src_exp + FIXED_FRAC_WIDTH) - (DENORM_EXP_OFFSET + DENORM_FRAC_WIDTH)));
//              end
//              else begin
//                  st0_fixed <= (src_fixed >> ((DENORM_EXP_OFFSET + DENORM_FRAC_WIDTH) - (src_exp + FIXED_FRAC_WIDTH)));
//              end
            end
        end
    end
    
    assign sink_user  = st0_user;
    assign sink_fixed = st0_fixed;
    */
    
endmodule



`default_nettype wire



// end of file
