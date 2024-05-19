// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  stepping motor control
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module stepper_motor_control_calc
        #(
            parameter   X_WIDTH = 48,
            parameter   V_WIDTH = 16,
            parameter   A_WIDTH = 16
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            start,
            
            input   wire    signed  [X_WIDTH-1:0]   target_x,
            input   wire    signed  [X_WIDTH-1:0]   cur_x,
            input   wire    signed  [V_WIDTH:0]     cur_v,
            input   wire            [A_WIDTH-1:0]   max_a,
            input   wire            [A_WIDTH-1:0]   max_a_near,
            
            output  wire    signed  [A_WIDTH:0]     out_a,
            output  wire                            out_valid
        );
    
    // v = (-a + sqrt(a*(a + 8*l)))/2
    
    localparam  D_WIDTH = 2*V_WIDTH;
    localparam  L_WIDTH = (D_WIDTH+A_WIDTH+1)/2;
    
    
    wire            [D_WIDTH-1:0]   max_d = {D_WIDTH{1'b1}};
    
    reg     signed  [X_WIDTH:0]     st0_d;
    reg                             st0_valid;
    
    reg     signed  [X_WIDTH+1:0]   st1_d;
    reg     signed  [V_WIDTH:0]     st1_v;
    reg                             st1_sign;
    reg                             st1_valid;
    
    reg             [X_WIDTH+4:0]   st2_d;
    reg                             st2_near;
    reg                             st2_valid;
    
    reg             [D_WIDTH-1:0]   st3_d;
    reg                             st3_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_d     <= {(1+X_WIDTH){1'bx}};
            st0_valid <= 1'b0;
            
            st1_d     <= {(2+X_WIDTH){1'bx}};
            st1_v     <= {(1+V_WIDTH){1'bx}};
            st1_sign  <= 1'bx;
            st1_valid <= 1'b0;
            
            st2_d     <= {(X_WIDTH+5){1'bx}};
            st2_near  <= 1'bx;
            st2_valid <= 1'b0;
            
            st3_d     <= {X_WIDTH{1'bx}};
            st3_valid <= 1'b0;
        end
        else begin
            // stage 0
            st0_d     <= target_x - cur_x;
            st0_valid <= start;
            
            // stage 1
            if ( st0_d < 0 ) begin
                st1_d    <= -st0_d;
                st1_v    <= -cur_v;
                st1_sign <= 1'b1;
            end
            else begin
                st1_d    <= st0_d;
                st1_v    <= cur_v;
                st1_sign <= 1'b0;
            end
            st1_valid <= st0_valid;
            
            // stage 2
            st2_near  <= (st1_d <= max_a);
            st2_d     <= (st1_d << 3) + max_a;
            st2_valid <= st1_valid;
            
            // stage 3
            st3_d     <= (st2_d > max_d) ? max_d : st2_d;
            st3_valid <= st2_valid;
        end
    end
    
    wire                            d_sign = st1_sign;       // 符号(方向)
    wire                            d_near = st2_near;       // 目標近傍
    wire    signed  [X_WIDTH:0]     d_dir  = st1_d;          // 目標方向の距離(絶対値)
    wire    signed  [V_WIDTH:0]     v_dir  = st1_v;          // 目標方向の速度
    
    
    // stage 4
    wire    [D_WIDTH+A_WIDTH-1:0]   st4_p;
    wire                            st4_valid;
    jelly_unsigned_multiply_multicycle
            #(
                .DATA_WIDTH0    (D_WIDTH),
                .DATA_WIDTH1    (A_WIDTH)
            )
        i_unsigned_multiply_multicycle
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (st3_d),
                .s_data1        (max_a),
                .s_valid        (st3_valid),
                .s_ready        (),
                
                .m_data         (st4_p),
                .m_valid        (st4_valid),
                .m_ready        (1'b1)
            );
    
    
    // stage 5
    wire    [L_WIDTH-1:0]       st5_lim_v;
    wire                        st5_valid;
    jelly_unsigned_sqrt_multicycle
            #(
                .DATA_WIDTH     (L_WIDTH)
            )
        i_unsigned_sqrt_multicycle
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (st4_p),
                .s_valid        (st4_valid),
                .s_ready        (),
                
                .m_data         (st5_lim_v),
                .m_valid        (st5_valid),
                .m_ready        (1'b1)
            );
    
    
    reg             [L_WIDTH-1:0]   st6_lim_v;
    reg                             st6_valid;
    
    reg     signed  [L_WIDTH:0]     st7_lim_v;
    reg                             st7_valid;
    
    reg     signed  [L_WIDTH:0]     st8_a;
    reg     signed  [L_WIDTH:0]     st8_max_a;
    wire    signed  [L_WIDTH:0]     st8_min_a = -st8_max_a;
    reg                             st8_valid;
    
    reg     signed  [A_WIDTH-1:0]   st9_a;
    reg                             st9_valid;
    
    reg     signed  [A_WIDTH:0]     st10_a;
    reg                             st10_valid;
    always @(posedge clk) begin
        if ( reset ) begin
            st6_lim_v  <= {L_WIDTH{1'bx}};
            st6_valid  <= 1'b0;
            st7_lim_v  <= {(1+L_WIDTH){1'bx}};
            st7_valid  <= 1'b0;
            st8_a      <= {(1+L_WIDTH){1'bx}};
            st8_max_a  <= {(1+L_WIDTH){1'bx}};
            st8_valid  <= 1'b0;
            st9_a      <= {(1+A_WIDTH){1'bx}};
            st9_valid  <= 1'b0;
            st10_a     <= {(1+A_WIDTH){1'bx}};
            st10_valid <= 1'b0;
        end
        else begin
            // stage 6
            st6_lim_v <= (st5_lim_v - max_a) >> 1;
            st6_valid <= st5_valid;
            
            // stage 7
            st7_lim_v <= d_near ? d_dir : {1'b0, st6_lim_v};
            st7_valid <= st6_valid;
            
            // stage 8
            st8_a     <= st7_lim_v - v_dir;
            st8_max_a <= d_near ? max_a_near : max_a;
            st8_valid <= st7_valid;
            
            // stage 9
            st9_a <= st8_a;
            if ( st8_a > st8_max_a ) begin st9_a <= st8_max_a; end
            if ( st8_a < st8_min_a ) begin st9_a <= st8_min_a; end
            st9_valid <= st8_valid;
            
            // stage 10
            if ( st9_valid ) begin
                st10_a <= d_sign ? -st9_a : +st9_a;
            end
            st10_valid <= st9_valid;
        end
    end
    
    assign out_a     = st10_a;
    assign out_valid = st10_valid;
    
endmodule


`default_nettype wire


// end of file
