// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none




module jelly_fixed_matrix3x4
        #(
            parameter   COEFF_INT_WIDTH    = 17,
            parameter   COEFF_FRAC_WIDTH   = 8,
            parameter   COEFF_WIDTH        = COEFF_INT_WIDTH + COEFF_FRAC_WIDTH,
            parameter   COEFF3_INT_WIDTH   = COEFF_INT_WIDTH,
            parameter   COEFF3_FRAC_WIDTH  = COEFF_FRAC_WIDTH,
            parameter   COEFF3_WIDTH       = COEFF3_INT_WIDTH + COEFF3_FRAC_WIDTH,
            
            parameter   S_FIXED_INT_WIDTH  = 17,
            parameter   S_FIXED_FRAC_WIDTH = 0,
            parameter   S_FIXED_WIDTH      = S_FIXED_INT_WIDTH + S_FIXED_FRAC_WIDTH,
            
            parameter   M_FIXED_INT_WIDTH  = 17,
            parameter   M_FIXED_FRAC_WIDTH = 8,
            parameter   M_FIXED_WIDTH      = M_FIXED_INT_WIDTH + M_FIXED_FRAC_WIDTH,
            
            parameter   USER_WIDTH         = 0,
            parameter   USER_BITS          = USER_WIDTH > 0 ? USER_WIDTH : 1,
            
            parameter   STATIC_COEFF       = 1, // no dynamic change coeff
            
            parameter   MASTER_IN_REGS     = 1,
            parameter   MASTER_OUT_REGS    = 1,
                        
            parameter   DEVICE             = "RTL" // "RTL" or "7SERIES"
        )
        (
            input   wire                                        reset,
            input   wire                                        clk,
            input   wire                                        cke,
            
            input   wire    signed  [COEFF_WIDTH-1:0]           coeff00,
            input   wire    signed  [COEFF_WIDTH-1:0]           coeff01,
            input   wire    signed  [COEFF_WIDTH-1:0]           coeff02,
            input   wire    signed  [COEFF3_WIDTH-1:0]          coeff03,
            input   wire    signed  [COEFF_WIDTH-1:0]           coeff10,
            input   wire    signed  [COEFF_WIDTH-1:0]           coeff11,
            input   wire    signed  [COEFF_WIDTH-1:0]           coeff12,
            input   wire    signed  [COEFF3_WIDTH-1:0]          coeff13,
            input   wire    signed  [COEFF_WIDTH-1:0]           coeff20,
            input   wire    signed  [COEFF_WIDTH-1:0]           coeff21,
            input   wire    signed  [COEFF_WIDTH-1:0]           coeff22,
            input   wire    signed  [COEFF3_WIDTH-1:0]          coeff23,
            
            input   wire            [USER_BITS-1:0]             s_user,
            input   wire    signed  [S_FIXED_WIDTH-1:0]         s_fixed_x,
            input   wire    signed  [S_FIXED_WIDTH-1:0]         s_fixed_y,
            input   wire    signed  [S_FIXED_WIDTH-1:0]         s_fixed_z,
            input   wire                                        s_valid,
            output  wire                                        s_ready,
            
            output  wire            [USER_BITS-1:0]             m_user,
            output  wire    signed  [M_FIXED_WIDTH-1:0]         m_fixed_x,
            output  wire    signed  [M_FIXED_WIDTH-1:0]         m_fixed_y,
            output  wire    signed  [M_FIXED_WIDTH-1:0]         m_fixed_z,
            output  wire                                        m_valid,
            input   wire                                        m_ready
        );
    
    
    localparam  PIPELINE_STAGES = 5;
    
    wire            [PIPELINE_STAGES-1:0]       stage_cke;
    wire            [PIPELINE_STAGES-1:0]       stage_valid;
    
    wire    signed  [COEFF_WIDTH-1:0]           src_coeff00;
    wire    signed  [COEFF_WIDTH-1:0]           src_coeff01;
    wire    signed  [COEFF_WIDTH-1:0]           src_coeff02;
    wire    signed  [COEFF3_WIDTH-1:0]          src_coeff03;
    wire    signed  [COEFF_WIDTH-1:0]           src_coeff10;
    wire    signed  [COEFF_WIDTH-1:0]           src_coeff11;
    wire    signed  [COEFF_WIDTH-1:0]           src_coeff12;
    wire    signed  [COEFF3_WIDTH-1:0]          src_coeff13;
    wire    signed  [COEFF_WIDTH-1:0]           src_coeff20;
    wire    signed  [COEFF_WIDTH-1:0]           src_coeff21;
    wire    signed  [COEFF_WIDTH-1:0]           src_coeff22;
    wire    signed  [COEFF3_WIDTH-1:0]          src_coeff23;
    wire            [USER_BITS-1:0]             src_user;
    wire    signed  [S_FIXED_WIDTH-1:0]         src_fixed_x;
    wire    signed  [S_FIXED_WIDTH-1:0]         src_fixed_y;
    wire    signed  [S_FIXED_WIDTH-1:0]         src_fixed_z;
    
    wire            [USER_BITS-1:0]             sink_user;
    wire            [M_FIXED_WIDTH-1:0]         sink_fixed_x;
    wire            [M_FIXED_WIDTH-1:0]         sink_fixed_y;
    wire            [M_FIXED_WIDTH-1:0]         sink_fixed_z;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (PIPELINE_STAGES),
                .S_DATA_WIDTH       (9*COEFF_WIDTH + 3*COEFF3_WIDTH + USER_BITS + 3*S_FIXED_WIDTH),
                .M_DATA_WIDTH       (USER_BITS + 3*M_FIXED_WIDTH),
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
                                        coeff00,
                                        coeff01,
                                        coeff02,
                                        coeff03,
                                        coeff10,
                                        coeff11,
                                        coeff12,
                                        coeff13,
                                        coeff20,
                                        coeff21,
                                        coeff22,
                                        coeff23,
                                        s_user,
                                        s_fixed_x,
                                        s_fixed_y,
                                        s_fixed_z
                                    }),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({
                                        m_user,
                                        m_fixed_x,
                                        m_fixed_y,
                                        m_fixed_z
                                    }),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         ({PIPELINE_STAGES{1'bx}}),
                .src_data           ({
                                        src_coeff00,
                                        src_coeff01,
                                        src_coeff02,
                                        src_coeff03,
                                        src_coeff10,
                                        src_coeff11,
                                        src_coeff12,
                                        src_coeff13,
                                        src_coeff20,
                                        src_coeff21,
                                        src_coeff22,
                                        src_coeff23,
                                        src_user,
                                        src_fixed_x,
                                        src_fixed_y,
                                        src_fixed_z
                                    }),
                .src_valid          (),
                .sink_data          ({
                                        sink_user,
                                        sink_fixed_x,
                                        sink_fixed_y,
                                        sink_fixed_z
                                    }),
                .buffered           ()
            );
    
    localparam  MUL_WIDTH    = COEFF_WIDTH + S_FIXED_WIDTH;
    localparam  OFFSET_WIDTH = COEFF3_WIDTH + S_FIXED_FRAC_WIDTH + (COEFF3_FRAC_WIDTH - COEFF_FRAC_WIDTH);
    
    localparam  P_WIDTH      = (MUL_WIDTH > OFFSET_WIDTH) ? MUL_WIDTH : OFFSET_WIDTH;
    
    
    wire    signed  [P_WIDTH-1:0]   x_d;
    wire    signed  [P_WIDTH-1:0]   y_d;
    wire    signed  [P_WIDTH-1:0]   z_d;
    // verilator lint_off WIDTH
    generate
    if ( S_FIXED_FRAC_WIDTH > (COEFF3_FRAC_WIDTH - COEFF_FRAC_WIDTH) ) begin
        assign x_d = (src_coeff03 <<< (S_FIXED_FRAC_WIDTH - (COEFF3_FRAC_WIDTH - COEFF_FRAC_WIDTH)));
        assign y_d = (src_coeff13 <<< (S_FIXED_FRAC_WIDTH - (COEFF3_FRAC_WIDTH - COEFF_FRAC_WIDTH)));
        assign z_d = (src_coeff23 <<< (S_FIXED_FRAC_WIDTH - (COEFF3_FRAC_WIDTH - COEFF_FRAC_WIDTH)));
    end
    else begin
        assign x_d = (src_coeff03 >>> ((COEFF3_FRAC_WIDTH - COEFF_FRAC_WIDTH) - S_FIXED_FRAC_WIDTH));
        assign y_d = (src_coeff13 >>> ((COEFF3_FRAC_WIDTH - COEFF_FRAC_WIDTH) - S_FIXED_FRAC_WIDTH));
        assign z_d = (src_coeff23 >>> ((COEFF3_FRAC_WIDTH - COEFF_FRAC_WIDTH) - S_FIXED_FRAC_WIDTH));
    end
    endgenerate
    
    wire    signed  [P_WIDTH-1:0]   x_p;
    wire    signed  [P_WIDTH-1:0]   y_p;
    wire    signed  [P_WIDTH-1:0]   z_p;
    
    generate
    if ( (COEFF_FRAC_WIDTH+S_FIXED_FRAC_WIDTH) >= M_FIXED_FRAC_WIDTH ) begin
        assign sink_fixed_x = (x_p >>> ((COEFF_FRAC_WIDTH+S_FIXED_FRAC_WIDTH) - M_FIXED_FRAC_WIDTH));
        assign sink_fixed_y = (y_p >>> ((COEFF_FRAC_WIDTH+S_FIXED_FRAC_WIDTH) - M_FIXED_FRAC_WIDTH));
        assign sink_fixed_z = (z_p >>> ((COEFF_FRAC_WIDTH+S_FIXED_FRAC_WIDTH) - M_FIXED_FRAC_WIDTH));
    end
    else begin
        assign sink_fixed_x = (x_p <<< (M_FIXED_FRAC_WIDTH - (COEFF_FRAC_WIDTH+S_FIXED_FRAC_WIDTH)));
        assign sink_fixed_y = (y_p <<< (M_FIXED_FRAC_WIDTH - (COEFF_FRAC_WIDTH+S_FIXED_FRAC_WIDTH)));
        assign sink_fixed_z = (z_p <<< (M_FIXED_FRAC_WIDTH - (COEFF_FRAC_WIDTH+S_FIXED_FRAC_WIDTH)));
    end
    endgenerate
    // verilator lint_on WIDTH


    reg     [USER_BITS-1:0]         st0_user;
    reg     [USER_BITS-1:0]         st1_user;
    reg     [USER_BITS-1:0]         st2_user;
    reg     [USER_BITS-1:0]         st3_user;
    reg     [USER_BITS-1:0]         st4_user;
    always @(posedge clk) begin
        if ( stage_cke[0] ) begin st0_user <= src_user; end
        if ( stage_cke[1] ) begin st1_user <= st0_user; end
        if ( stage_cke[2] ) begin st2_user <= st1_user; end
        if ( stage_cke[3] ) begin st3_user <= st2_user; end
        if ( stage_cke[4] ) begin st4_user <= st3_user; end
    end
    
    assign sink_user = st4_user;
    
    
    jelly_mul_add3
            #(
                .A_WIDTH        (COEFF_WIDTH),
                .B_WIDTH        (COEFF_WIDTH),
                .C_WIDTH        (COEFF_WIDTH),
                .D_WIDTH        (P_WIDTH),
                .X_WIDTH        (S_FIXED_WIDTH),
                .Y_WIDTH        (S_FIXED_WIDTH),
                .Z_WIDTH        (S_FIXED_WIDTH),
                .P_WIDTH        (P_WIDTH),
                .STATIC_COEFF   (STATIC_COEFF),
                .DEVICE         (DEVICE)
            )
        i_mul_add3_x
            (
                .reset          (reset),
                .clk            (clk),
                .cke0           (stage_cke[0]),
                .cke1           (stage_cke[1]),
                .cke2           (stage_cke[2]),
                .cke3           (stage_cke[3]),
                .cke4           (stage_cke[4]),
                
                .a              (src_coeff00),
                .b              (src_coeff01),
                .c              (src_coeff02),
                .d              (x_d),
                .x              (src_fixed_x),
                .y              (src_fixed_y),
                .z              (src_fixed_z),
                
                .p              (x_p)
            );
    
    
    jelly_mul_add3
            #(
                .A_WIDTH        (COEFF_WIDTH),
                .B_WIDTH        (COEFF_WIDTH),
                .C_WIDTH        (COEFF_WIDTH),
                .D_WIDTH        (P_WIDTH),
                .X_WIDTH        (S_FIXED_WIDTH),
                .Y_WIDTH        (S_FIXED_WIDTH),
                .Z_WIDTH        (S_FIXED_WIDTH),
                .P_WIDTH        (P_WIDTH),
                .STATIC_COEFF   (STATIC_COEFF),
                .DEVICE         (DEVICE)
            )
        i_mul_add3_y
            (
                .reset          (reset),
                .clk            (clk),
                .cke0           (stage_cke[0]),
                .cke1           (stage_cke[1]),
                .cke2           (stage_cke[2]),
                .cke3           (stage_cke[3]),
                .cke4           (stage_cke[4]),
                
                .a              (src_coeff10),
                .b              (src_coeff11),
                .c              (src_coeff12),
                .d              (y_d),
                .x              (src_fixed_x),
                .y              (src_fixed_y),
                .z              (src_fixed_z),
                
                .p              (y_p)
            );
    
    
        jelly_mul_add3
            #(
                .A_WIDTH        (COEFF_WIDTH),
                .B_WIDTH        (COEFF_WIDTH),
                .C_WIDTH        (COEFF_WIDTH),
                .D_WIDTH        (P_WIDTH),
                .X_WIDTH        (S_FIXED_WIDTH),
                .Y_WIDTH        (S_FIXED_WIDTH),
                .Z_WIDTH        (S_FIXED_WIDTH),
                .P_WIDTH        (P_WIDTH),
                .STATIC_COEFF   (STATIC_COEFF),
                .DEVICE         (DEVICE)
            )
        i_mul_add3_z
            (
                .reset          (reset),
                .clk            (clk),
                .cke0           (stage_cke[0]),
                .cke1           (stage_cke[1]),
                .cke2           (stage_cke[2]),
                .cke3           (stage_cke[3]),
                .cke4           (stage_cke[4]),
                
                .a              (src_coeff20),
                .b              (src_coeff21),
                .c              (src_coeff22),
                .d              (z_d),
                .x              (src_fixed_x),
                .y              (src_fixed_y),
                .z              (src_fixed_z),
                
                .p              (z_p)
            );
    
endmodule



`default_nettype wire



// end of file
