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


module jelly_float_projective_transformation_2d
        #(
            parameter   EXP_WIDTH   = 8,
            parameter   FRAC_WIDTH  = 23,
            parameter   FLOAT_WIDTH = 1 + EXP_WIDTH + FRAC_WIDTH,   // sign + exp + frac

            parameter   USER_WIDTH  = 0,
            parameter   USER_BITS   = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [FLOAT_WIDTH-1:0]   matrix00,
            input   wire    [FLOAT_WIDTH-1:0]   matrix01,
            input   wire    [FLOAT_WIDTH-1:0]   matrix02,
            input   wire    [FLOAT_WIDTH-1:0]   matrix10,
            input   wire    [FLOAT_WIDTH-1:0]   matrix11,
            input   wire    [FLOAT_WIDTH-1:0]   matrix12,
            input   wire    [FLOAT_WIDTH-1:0]   matrix20,
            input   wire    [FLOAT_WIDTH-1:0]   matrix21,
            input   wire    [FLOAT_WIDTH-1:0]   matrix22,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire    [FLOAT_WIDTH-1:0]   s_x,
            input   wire    [FLOAT_WIDTH-1:0]   s_y,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire    [FLOAT_WIDTH-1:0]   m_x,
            output  wire    [FLOAT_WIDTH-1:0]   m_y,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    
    
    // -----------------------------------------
    //  multiply
    // -----------------------------------------
    
    wire    [USER_BITS-1:0]     mul_user;
    wire    [FLOAT_WIDTH-1:0]   mul_float00;
    wire    [FLOAT_WIDTH-1:0]   mul_float01;
    wire    [FLOAT_WIDTH-1:0]   mul_float10;
    wire    [FLOAT_WIDTH-1:0]   mul_float11;
    wire    [FLOAT_WIDTH-1:0]   mul_float20;
    wire    [FLOAT_WIDTH-1:0]   mul_float21;
    wire                        mul_valid;
    wire                        mul_ready;
    
    jelly_float_multiply
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (USER_BITS)
            )
        i_float_multiply_00
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (s_user),
                .s_float0       (s_x),
                .s_float1       (matrix00),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_user         (mul_user),
                .m_float        (mul_float00),
                .m_valid        (mul_valid),
                .m_ready        (mul_ready)
            );
    
    jelly_float_multiply
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (0)
            )
        i_float_multiply_01
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (),
                .s_float0       (s_y),
                .s_float1       (matrix01),
                .s_valid        (s_valid),
                .s_ready        (),
                
                .m_user         (),
                .m_float        (mul_float01),
                .m_valid        (),
                .m_ready        (mul_ready)
            );
    
    jelly_float_multiply
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (0)
            )
        i_float_multiply_10
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (),
                .s_float0       (s_x),
                .s_float1       (matrix10),
                .s_valid        (s_valid),
                .s_ready        (),
                
                .m_user         (),
                .m_float        (mul_float10),
                .m_valid        (),
                .m_ready        (mul_ready)
            );
    
    jelly_float_multiply
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (0)
            )
        i_float_multiply_11
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (),
                .s_float0       (s_y),
                .s_float1       (matrix11),
                .s_valid        (s_valid),
                .s_ready        (),
                
                .m_user         (),
                .m_float        (mul_float11),
                .m_valid        (),
                .m_ready        (mul_ready)
            );
    
    jelly_float_multiply
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (0)
            )
        i_float_multiply_20
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (),
                .s_float0       (s_x),
                .s_float1       (matrix20),
                .s_valid        (s_valid),
                .s_ready        (),
                
                .m_user         (),
                .m_float        (mul_float20),
                .m_valid        (),
                .m_ready        (mul_ready)
            );
    
    jelly_float_multiply
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (0)
            )
        i_float_multiply_21
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (),
                .s_float0       (s_y),
                .s_float1       (matrix21),
                .s_valid        (s_valid),
                .s_ready        (),
                
                .m_user         (),
                .m_float        (mul_float21),
                .m_valid        (),
                .m_ready        (mul_ready)
            );
    
    
    // -----------------------------------------
    //  add0
    // -----------------------------------------
    
    wire    [USER_BITS-1:0]     add0_user;
    wire    [FLOAT_WIDTH-1:0]   add0_float0;
    wire    [FLOAT_WIDTH-1:0]   add0_float1;
    wire    [FLOAT_WIDTH-1:0]   add0_float2;
    wire                        add0_valid;
    wire                        add0_ready;
    
    jelly_float_add
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (USER_BITS)
            )
        i_float_add0_0
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (mul_user),
                .s_float0       (mul_float00),
                .s_float1       (mul_float01),
                .s_valid        (mul_valid),
                .s_ready        (mul_ready),
                
                .m_user         (add0_user),
                .m_float        (add0_float0),
                .m_valid        (add0_valid),
                .m_ready        (add0_ready)
            );
    
    jelly_float_add
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (0)
            )
        i_float_add0_1
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (),
                .s_float0       (mul_float10),
                .s_float1       (mul_float11),
                .s_valid        (mul_valid),
                .s_ready        (),
                
                .m_user         (),
                .m_float        (add0_float1),
                .m_valid        (),
                .m_ready        (add0_ready)
            );
    
    jelly_float_add
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (0)
            )
        i_float_add0_2
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (),
                .s_float0       (mul_float20),
                .s_float1       (mul_float21),
                .s_valid        (mul_valid),
                .s_ready        (),
                
                .m_user         (),
                .m_float        (add0_float2),
                .m_valid        (),
                .m_ready        (add0_ready)
            );
    
    
    // -----------------------------------------
    //  add1
    // -----------------------------------------
    
    wire    [USER_BITS-1:0]     add1_user;
    wire    [FLOAT_WIDTH-1:0]   add1_float0;
    wire    [FLOAT_WIDTH-1:0]   add1_float1;
    wire    [FLOAT_WIDTH-1:0]   add1_float2;
    wire                        add1_valid;
    wire                        add1_ready;
    
    jelly_float_add
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (USER_BITS)
            )
        i_float_add1_0
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (add0_user),
                .s_float0       (add0_float0),
                .s_float1       (matrix02),
                .s_valid        (add0_valid),
                .s_ready        (add0_ready),
                
                .m_user         (add1_user),
                .m_float        (add1_float0),
                .m_valid        (add1_valid),
                .m_ready        (add1_ready)
            );
    
    jelly_float_add
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (0)
            )
        i_float_add1_1
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (),
                .s_float0       (add0_float1),
                .s_float1       (matrix12),
                .s_valid        (add0_valid),
                .s_ready        (),
                
                .m_user         (),
                .m_float        (add1_float1),
                .m_valid        (),
                .m_ready        (add1_ready)
            );
    
    jelly_float_add
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (0)
            )
        i_float_add1_2
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (),
                .s_float0       (add0_float2),
                .s_float1       (matrix22),
                .s_valid        (add0_valid),
                .s_ready        (),
                
                .m_user         (),
                .m_float        (add1_float2),
                .m_valid        (),
                .m_ready        (add1_ready)
            );
    
    
    // -----------------------------------------
    //  div
    // -----------------------------------------
    
    wire    [USER_BITS-1:0]     recip_user;
    wire    [FLOAT_WIDTH-1:0]   recip_float0;
    wire    [FLOAT_WIDTH-1:0]   recip_float1;
    wire    [FLOAT_WIDTH-1:0]   recip_float2;
    wire                        recip_valid;
    wire                        recip_ready;
    
    jelly_float_reciprocal
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (USER_BITS+FLOAT_WIDTH+FLOAT_WIDTH),
                .D_WIDTH        (9)
            )
        i_float_reciprocal
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         ({add1_user, add1_float1, add1_float0}),
                .s_float        (add1_float2),
                .s_valid        (add1_valid),
                .s_ready        (add1_ready),
                
                .m_user         ({recip_user, recip_float1, recip_float0}),
                .m_float        (recip_float2),
                .m_valid        (recip_valid),
                .m_ready        (recip_ready)
            );
    
    
    jelly_float_multiply
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (USER_BITS)
            )
        i_float_multiply_div0
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (recip_user),
                .s_float0       (recip_float0),
                .s_float1       (recip_float2),
                .s_valid        (recip_valid),
                .s_ready        (recip_ready),
                
                .m_user         (m_user),
                .m_float        (m_x),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    jelly_float_multiply
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .USER_WIDTH     (0)
            )
        i_float_multiply_div1
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (),
                .s_float0       (recip_float1),
                .s_float1       (recip_float2),
                .s_valid        (recip_valid),
                .s_ready        (),
                
                .m_user         (),
                .m_float        (m_y),
                .m_valid        (),
                .m_ready        (m_ready)
            );
    
endmodule


`default_nettype wire


// end of file
