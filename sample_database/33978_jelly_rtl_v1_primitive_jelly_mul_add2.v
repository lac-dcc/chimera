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


// a*x + b*y + c
module jelly_mul_add2
        #(
            parameter   A_WIDTH      = 25,
            parameter   B_WIDTH      = 25,
            parameter   C_WIDTH      = 48,
            parameter   X_WIDTH      = 18,
            parameter   Y_WIDTH      = 18,
            parameter   P_WIDTH      = 48,
            parameter   STATIC_COEFF = 0,       // no dynamic change A,B,C
            parameter   DEVICE       = "RTL"    // "RTL" or "7SERIES"
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke0,
            input   wire                            cke1,
            input   wire                            cke2,
            input   wire                            cke3,
            
            input   wire    signed  [A_WIDTH-1:0]   a,
            input   wire    signed  [B_WIDTH-1:0]   b,
            input   wire    signed  [C_WIDTH-1:0]   c,
            input   wire    signed  [X_WIDTH-1:0]   x,
            input   wire    signed  [Y_WIDTH-1:0]   y,
            
            output  wire    signed  [P_WIDTH-1:0]   p
        );
    
    localparam  MX_WIDTH = A_WIDTH + X_WIDTH;
    localparam  MY_WIDTH = B_WIDTH + Y_WIDTH;
    
    
    generate
    if ( DEVICE == "VIRTEX6" || DEVICE == "SPARTAN6" || DEVICE == "7SERIES" ) begin : blk_dsp48e1
        
        reg     signed  [C_WIDTH-1:0]   st0_c;
        
        always @(posedge clk) begin
            if ( reset ) begin
                st0_c <= {C_WIDTH{1'b0}};
            end
            else begin
                if ( cke0 ) begin
                    st0_c <= c;
                end
            end
        end
        
        wire    [47:0]          y_pcout;
        
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
                    .cke_a0         (cke0),
                    .cke_b0         (cke0),
                    .cke_a1         (cke1),
                    .cke_b1         (cke1),
                    .cke_c          (1'b0),
                    .cke_m          (cke2),
                    .cke_p          (cke3),
                    
                    .op_load        (1'b1),
                    .alu_sub        (1'b0),
                    
                    .a              (a),
                    .b              (x),
                    .c              ({P_WIDTH{1'b0}}),
                    .p              (p),
                    
                    .pcin           (y_pcout),
                    .pcout          ()
                );
        
        jelly_mul_add_dsp48e1
                #(
                    .A_WIDTH        (B_WIDTH),
                    .B_WIDTH        (Y_WIDTH),
                    .C_WIDTH        (C_WIDTH),
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
            i_mul_add_dsp48_y
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
                    
                    .a              (b),
                    .b              (y),
                    .c              (STATIC_COEFF ? c : st0_c),
                    .p              (),
                    
                    .pcin           (),
                    .pcout          (y_pcout)
                );
    end
    else begin
        reg     signed  [A_WIDTH-1:0]   st0_a;
        reg     signed  [B_WIDTH-1:0]   st0_b;
        reg     signed  [C_WIDTH-1:0]   st0_c;
        reg     signed  [X_WIDTH-1:0]   st0_x;
        reg     signed  [Y_WIDTH-1:0]   st0_y;
        
        reg     signed  [A_WIDTH-1:0]   st1_a;
        reg     signed  [C_WIDTH-1:0]   st1_c;
        reg     signed  [X_WIDTH-1:0]   st1_x;
        reg     signed  [MY_WIDTH-1:0]  st1_y;
        
        reg     signed  [MX_WIDTH-1:0]  st2_x;
        reg     signed  [P_WIDTH-1:0]   st2_y;
        
        reg     signed  [P_WIDTH-1:0]   st3_p;
        
        always @(posedge clk) begin
            if ( reset ) begin
                st0_a <= {A_WIDTH{1'b0}};
                st0_b <= {B_WIDTH{1'b0}};
                st0_c <= {C_WIDTH{1'b0}};
                st0_x <= {X_WIDTH{1'b0}};
                st0_y <= {Y_WIDTH{1'b0}};
                
                st1_a <= {A_WIDTH{1'b0}};
                st1_c <= {C_WIDTH{1'b0}};
                st1_x <= {X_WIDTH{1'b0}};
                st1_y <= {MY_WIDTH{1'b0}};
                
                st2_x <= {MX_WIDTH{1'b0}};
                st2_y <= {P_WIDTH{1'b0}};
                
                st3_p <= {P_WIDTH{1'b0}};
            end
            else begin
                if ( cke0 ) begin
                    st0_a <= a;
                    st0_b <= b;
                    st0_c <= c;
                    st0_x <= x;
                    st0_y <= y;
                end
                
                if ( cke1 ) begin
                    st1_a <= st0_a;
                    st1_c <= STATIC_COEFF ? c : st0_c;
                    st1_x <= st0_x;
                    st1_y <= st0_b * st0_y;
                end
                
                if ( cke2 ) begin
                    st2_x <= st1_a * st1_x;
                    st2_y <= st1_c + st1_y;
                end
                
                if ( cke3 ) begin
                    st3_p <= st2_x + st2_y;
                end
            end
        end
        
        assign p = st3_p;
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
