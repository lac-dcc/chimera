// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// a*x + b*y + c*z + d
module jelly_mul_add3
        #(
            parameter   A_WIDTH      = 25,
            parameter   B_WIDTH      = 25,
            parameter   C_WIDTH      = 25,
            parameter   D_WIDTH      = 48,
            parameter   X_WIDTH      = 18,
            parameter   Y_WIDTH      = 18,
            parameter   Z_WIDTH      = 18,
            parameter   P_WIDTH      = 48,
            parameter   STATIC_COEFF = 0,       // no dynamic change A,B,C,D
            parameter   DEVICE       = "RTL"    // "RTL" or "7SERIES"
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke0,
            input   wire                            cke1,
            input   wire                            cke2,
            input   wire                            cke3,
            input   wire                            cke4,
            
            input   wire    signed  [A_WIDTH-1:0]   a,
            input   wire    signed  [B_WIDTH-1:0]   b,
            input   wire    signed  [C_WIDTH-1:0]   c,
            input   wire    signed  [D_WIDTH-1:0]   d,
            input   wire    signed  [X_WIDTH-1:0]   x,
            input   wire    signed  [Y_WIDTH-1:0]   y,
            input   wire    signed  [Z_WIDTH-1:0]   z,
            
            output  wire    signed  [P_WIDTH-1:0]   p
        );
    
    
    
        
    localparam  MX_WIDTH = A_WIDTH + X_WIDTH;
    localparam  MY_WIDTH = B_WIDTH + Y_WIDTH;
    localparam  MZ_WIDTH = C_WIDTH + Z_WIDTH;
    
    // verilator lint_off WIDTH
    generate
    if ( DEVICE == "VIRTEX6" || DEVICE == "SPARTAN6" || DEVICE == "7SERIES" ) begin : blk_dsp48e1
        
        reg     signed  [A_WIDTH-1:0]   st0_a;
        reg     signed  [D_WIDTH-1:0]   st0_d;
        reg     signed  [X_WIDTH-1:0]   st0_x;
        
        always @(posedge clk) begin
            if ( reset ) begin
                st0_a <= {A_WIDTH{1'b0}};
                st0_d <= {D_WIDTH{1'b0}};
                st0_x <= {X_WIDTH{1'b0}};
            end
            else begin
                if ( cke0 ) begin
                    st0_a <= a;
                    st0_d <= d;
                    st0_x <= x;
                end
            end
        end
        
        
        wire    [47:0]          y_pcout;
        wire    [47:0]          z_pcout;
        
        jelly_mul_add_dsp48e1
                #(
                    .A_WIDTH        (B_WIDTH),
                    .B_WIDTH        (X_WIDTH),
                    .C_WIDTH        (P_WIDTH),
                    .P_WIDTH        (P_WIDTH),
                    
                    .OPMODEREG      (0),
                    .ALUMODEREG     (0),
                    .AREG           (2),
                    .BREG           (2),
                    .CREG           (0),
                    .MREG           (1),
                    .PREG           (1),
                    
                    .USE_PCIN       (1),
                    .USE_PCOUT      (0),
                    
                    .DEVICE         (DEVICE)
                )
            i_mul_add_dsp48_x
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .cke_ctrl       (1'b0),
                    .cke_alumode    (1'b0),
                    .cke_a0         (cke1),
                    .cke_b0         (cke1),
                    .cke_a1         (cke2),
                    .cke_b1         (cke2),
                    .cke_c          (1'b0),
                    .cke_m          (cke3),
                    .cke_p          (cke4),
                    
                    .op_load        (1'b1),
                    .alu_sub        (1'b0),
                    
                    .a              (STATIC_COEFF ? a : st0_a),
                    .b              (st0_x),
                    .c              ({P_WIDTH{1'b0}}),
                    .p              (p),
                    
                    .pcin           (y_pcout),
                    .pcout          ()
                );
        
        jelly_mul_add_dsp48e1
                #(
                    .A_WIDTH        (A_WIDTH),
                    .B_WIDTH        (X_WIDTH),
                    .C_WIDTH        (P_WIDTH),
                    .P_WIDTH        (P_WIDTH),
                    
                    .OPMODEREG      (0),
                    .ALUMODEREG     (0),
                    .AREG           (2),
                    .BREG           (2),
                    .CREG           (1),
                    .MREG           (1),
                    .PREG           (1),
                    
                    .USE_PCIN       (1),
                    .USE_PCOUT      (1),
                    
                    .DEVICE         (DEVICE)
                )
            i_mul_add_dsp48_y
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .cke_ctrl       (1'b0),
                    .cke_alumode    (1'b0),
                    .cke_a0         (cke0),
                    .cke_b0         (cke0),
                    .cke_a1         (cke1),
                    .cke_b1         (cke1),
                    .cke_c          (1'b0),
                    .cke_m          (cke2),
                    .cke_p          (cke3),
                    
                    .op_load        (1'b1),
                    .alu_sub        (1'b0),
                    
                    .a              (b),
                    .b              (y),
                    .c              ({P_WIDTH{1'b0}}),
                    .p              (),
                    
                    .pcin           (z_pcout),
                    .pcout          (y_pcout)
                );

        jelly_mul_add_dsp48e1
                #(
                    .A_WIDTH        (C_WIDTH),
                    .B_WIDTH        (Z_WIDTH),
                    .C_WIDTH        (D_WIDTH),
                    .P_WIDTH        (P_WIDTH),
                    
                    .OPMODEREG      (0),
                    .ALUMODEREG     (0),
                    .AREG           (1),
                    .BREG           (1),
                    .CREG           (1),
                    .MREG           (1),
                    .PREG           (1),
                    
                    .USE_PCIN       (0),
                    .USE_PCOUT      (1),
                    
                    .DEVICE         (DEVICE)
                )
            i_mul_add_dsp48_z
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .cke_ctrl       (1'b0),
                    .cke_alumode    (1'b0),
                    .cke_a0         (1'b0),
                    .cke_b0         (1'b0),
                    .cke_a1         (cke0),
                    .cke_b1         (cke0),
                    .cke_c          (cke1),
                    .cke_m          (cke1),
                    .cke_p          (cke2),
                    
                    .op_load        (1'b1),
                    .alu_sub        (1'b0),
                    
                    .a              (c),
                    .b              (z),
                    .c              (STATIC_COEFF ? d : st0_d),
                    .p              (),
                    
                    .pcin           (),
                    .pcout          (z_pcout)
                );
    end
    else begin
        reg     signed  [A_WIDTH-1:0]   st0_a;
        reg     signed  [B_WIDTH-1:0]   st0_b;
        reg     signed  [C_WIDTH-1:0]   st0_c;
        reg     signed  [D_WIDTH-1:0]   st0_d;
        reg     signed  [X_WIDTH-1:0]   st0_x;
        reg     signed  [Y_WIDTH-1:0]   st0_y;
        reg     signed  [Z_WIDTH-1:0]   st0_z;
        
        reg     signed  [A_WIDTH-1:0]   st1_a;
        reg     signed  [B_WIDTH-1:0]   st1_b;
        reg     signed  [D_WIDTH-1:0]   st1_d;
        reg     signed  [X_WIDTH-1:0]   st1_x;
        reg     signed  [Y_WIDTH-1:0]   st1_y;
        reg     signed  [MZ_WIDTH-1:0]  st1_z;

        reg     signed  [A_WIDTH-1:0]   st2_a;
        reg     signed  [X_WIDTH-1:0]   st2_x;
        reg     signed  [MY_WIDTH-1:0]  st2_y;
        reg     signed  [P_WIDTH-1:0]   st2_z;
        
        reg     signed  [MX_WIDTH-1:0]  st3_x;
        reg     signed  [P_WIDTH-1:0]   st3_p;
        
        reg     signed  [P_WIDTH-1:0]   st4_p;
        
        always @(posedge clk) begin
            if ( reset ) begin
                st0_a <= {A_WIDTH{1'b0}};
                st0_b <= {B_WIDTH{1'b0}};
                st0_c <= {C_WIDTH{1'b0}};
                st0_d <= {D_WIDTH{1'b0}};
                st0_x <= {X_WIDTH{1'b0}};
                st0_y <= {Y_WIDTH{1'b0}};
                st0_z <= {Z_WIDTH{1'b0}};
                
                st1_a <= {A_WIDTH{1'b0}};
                st1_b <= {B_WIDTH{1'b0}};
                st1_d <= {D_WIDTH{1'b0}};
                st1_x <= {X_WIDTH{1'b0}};
                st1_y <= {Y_WIDTH{1'b0}};
                st1_z <= {MZ_WIDTH{1'b0}};
                
                st2_a <= {A_WIDTH{1'b0}};
                st2_x <= {X_WIDTH{1'b0}};
                st2_y <= {MY_WIDTH{1'b0}};
                st2_z <= {P_WIDTH{1'b0}};
                
                st3_x <= {MX_WIDTH{1'b0}};
                st3_p <= {P_WIDTH{1'b0}};
                
                st4_p <= {P_WIDTH{1'b0}};
            end
            else begin
                if ( cke0 ) begin
                    st0_a <= a;
                    st0_b <= b;
                    st0_c <= c;
                    st0_d <= d;
                    st0_x <= x;
                    st0_y <= y;
                    st0_z <= z;
                end
                
                if ( cke1 ) begin
                    st1_a <= STATIC_COEFF ? a : st0_a;
                    st1_b <= st0_b;
                    st1_d <= STATIC_COEFF ? d : st0_d;
                    st1_x <= st0_x;
                    st1_y <= st0_y;
                    st1_z <= st0_c * st0_z;
                end
                
                if ( cke2 ) begin
                    st2_a <= st1_a;
                    st2_x <= st1_x;
                    st2_y <= st1_b * st1_y;
                    st2_z <= st1_d + st1_z;
                end
                
                if ( cke3 ) begin
                    st3_x <= st2_a * st2_x;
                    st3_p <= st2_z + st2_y;
                end
                
                if ( cke4 ) begin
                    st4_p <= st3_p + st3_x;
                end
            end
        end
        
        assign p = st4_p;
    end
    endgenerate
    // verilator lint_on WIDTH
    
endmodule


`default_nettype wire


// end of file
