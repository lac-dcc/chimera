// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_mul_add();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_mul_add.vcd");
        $dumpvars(0, tb_mul_add);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    parameter   A_WIDTH = 25;
    parameter   B_WIDTH = 25;
    parameter   C_WIDTH = 25;
    parameter   D_WIDTH = 48;
    parameter   X_WIDTH = 18;
    parameter   Y_WIDTH = 18;
    parameter   Z_WIDTH = 18;
    parameter   P_WIDTH = 48;
    
    
    reg                             cke0 = 1;
    reg                             cke1 = 1;
    reg                             cke2 = 1;
    reg                             cke3 = 1;
    reg                             cke4 = 1;
    reg                             cke5 = 1;
    reg                             cke6 = 1;
    reg                             cke7 = 1;
    reg                             cke8 = 1;
    
    reg     signed  [A_WIDTH-1:0]   a;
    reg     signed  [B_WIDTH-1:0]   b;
    reg     signed  [C_WIDTH-1:0]   c;
    reg     signed  [D_WIDTH-1:0]   d;
    reg     signed  [X_WIDTH-1:0]   x;
    reg     signed  [Y_WIDTH-1:0]   y;
    reg     signed  [Y_WIDTH-1:0]   z;
    
    reg                             op_load;
    reg                             alu_sub;
    
    
    wire    signed  [P_WIDTH-1:0]   p3_rtl;
    wire    signed  [P_WIDTH-1:0]   p3_dsp;
    wire    ok3 = (p3_rtl == p3_dsp);
    
    wire    signed  [P_WIDTH-1:0]   p2_rtl;
    wire    signed  [P_WIDTH-1:0]   p2_dsp;
    wire    ok2 = (p2_rtl == p2_dsp);
    
    wire    signed  [P_WIDTH-1:0]   dsp_p_rtl;
    wire    signed  [P_WIDTH-1:0]   dsp_p_dsp;
    wire    ok_dsp = (dsp_p_rtl == dsp_p_dsp);
    
    always @(posedge clk) begin
        if ( reset ) begin
            a <= 0;
            b <= 0;
            c <= 0;
            d <= 0;
            x <= 0;
            y <= 0;
            z <= 0;
            
            op_load <= 0;
            alu_sub <= 0;
        end
        else begin
            cke0 <= {$random()};
            cke1 <= {$random()};
            cke2 <= {$random()};
            cke3 <= {$random()};
            cke4 <= {$random()};
            cke5 <= {$random()};
            cke6 <= {$random()};
            cke7 <= {$random()};
            cke8 <= {$random()};
            
            a <= $random();
            b <= $random();
            c <= $random();
            d <= {$random(), $random()};
            x <= $random();
            y <= $random();
            z <= $random();
            
            
            op_load <= {$random()};
            alu_sub <= {$random()};
            
            
            /*
            a <= 1;
            b <= 1;
            c <= 1;
            d <= 1;
            x <= 1;
            y <= 1;
            z <= 1;
            
            op_load <= 1;
            alu_sub <= 1;
            */
        end
    end
    
    
    
    
    
    
    
    
    // ----------------------------
    //  a*x + b*y + c*z + d
    // ----------------------------
    
    jelly_mul_add3
            #(
                .A_WIDTH    (A_WIDTH),
                .B_WIDTH    (B_WIDTH),
                .C_WIDTH    (C_WIDTH),
                .D_WIDTH    (D_WIDTH),
                .X_WIDTH    (X_WIDTH),
                .Y_WIDTH    (Y_WIDTH),
                .Z_WIDTH    (Z_WIDTH),
                .P_WIDTH    (P_WIDTH),
                .DEVICE     ("RTL")
            )
        i_mul_add3_rtl
            (
                .reset      (reset),
                .clk        (clk),
                .cke0       (cke0),
                .cke1       (cke1),
                .cke2       (cke2),
                .cke3       (cke3),
                .cke4       (cke4),
                
                .a          (a),
                .b          (b),
                .c          (c),
                .d          (d),
                .x          (x),
                .y          (y),
                .z          (z),
                
                .p          (p3_rtl)
            );
    
        jelly_mul_add3
            #(
                .A_WIDTH    (A_WIDTH),
                .B_WIDTH    (B_WIDTH),
                .C_WIDTH    (C_WIDTH),
                .D_WIDTH    (D_WIDTH),
                .X_WIDTH    (X_WIDTH),
                .Y_WIDTH    (Y_WIDTH),
                .Z_WIDTH    (Z_WIDTH),
                .P_WIDTH    (P_WIDTH),
                .DEVICE     ( "7SERIES" )
            )
        i_mul_add3_dsp
            (
                .reset      (reset),
                .clk        (clk),
                .cke0       (cke0),
                .cke1       (cke1),
                .cke2       (cke2),
                .cke3       (cke3),
                .cke4       (cke4),
                
                .a          (a),
                .b          (b),
                .c          (c),
                .d          (d),
                .x          (x),
                .y          (y),
                .z          (z),
                
                .p          (p3_dsp)
            );
    
    
    
    // ----------------------------
    //  a*x + b*y + c
    // ----------------------------
    
    // add2
    jelly_mul_add2
            #(
                .A_WIDTH    (A_WIDTH),
                .B_WIDTH    (B_WIDTH),
                .C_WIDTH    (D_WIDTH),
                .X_WIDTH    (X_WIDTH),
                .Y_WIDTH    (Y_WIDTH),
                .P_WIDTH    (P_WIDTH),
                .DEVICE     ( "RTL" )
            )
        i_mul_add2_rtl
            (
                .reset      (reset),
                .clk        (clk),
                .cke0       (cke0),
                .cke1       (cke1),
                .cke2       (cke2),
                .cke3       (cke3),
                             
                .a          (a),
                .b          (b),
                .c          (d),
                .x          (x),
                .y          (y),
                
                .p          (p2_rtl)
            );
    
    jelly_mul_add2
            #(
                .A_WIDTH    (A_WIDTH),
                .B_WIDTH    (B_WIDTH),
                .C_WIDTH    (D_WIDTH),
                .X_WIDTH    (X_WIDTH),
                .Y_WIDTH    (Y_WIDTH),
                .P_WIDTH    (P_WIDTH),
                .DEVICE     ("7SERIES")
            )
        i_mul_add2_dsp
            (
                .reset      (reset),
                .clk        (clk),
                .cke0       (cke0),
                .cke1       (cke1),
                .cke2       (cke2),
                .cke3       (cke3),
                             
                .a          (a),
                .b          (b),
                .c          (d),
                .x          (x),
                .y          (y),
                
                .p          (p2_dsp)
            );
    
    
    
    // ----------------------------
    //  primitive
    // ----------------------------
    
    jelly_mul_add_dsp48e1
            #(
                .A_WIDTH        (A_WIDTH),
                .B_WIDTH        (X_WIDTH),
                .C_WIDTH        (D_WIDTH),
                .P_WIDTH        (P_WIDTH),
                
                .OPMODEREG      (1),
                .ALUMODEREG     (1),
                .AREG           (2),
                .BREG           (2),
                .CREG           (1),
                .MREG           (1),
                .PREG           (1),
                
                .USE_PCIN       (0),
                .USE_PCOUT      (0),
                
                .DEVICE         ("RTL") // "7SERIES"
            )
        i_mul_add_dsp48e1_rtl
            (
                .reset          (reset),
                .clk            (clk),
                
                .cke_ctrl       (cke0),
                .cke_alumode    (cke1),
                .cke_a0         (cke2),
                .cke_a1         (cke3),
                .cke_b0         (cke4),
                .cke_b1         (cke5),
                .cke_c          (cke6),
                .cke_m          (cke7),
                .cke_p          (cke8),
                
                .op_load        (op_load),
                .alu_sub        (alu_sub),
                
                .a              (a),
                .b              (x),
                .c              (d),
                .p              (dsp_p_rtl),
                
                .pcin           (),
                .pcout          ()
            );
    
    jelly_mul_add_dsp48e1
            #(
                .A_WIDTH        (A_WIDTH),
                .B_WIDTH        (X_WIDTH),
                .C_WIDTH        (D_WIDTH),
                .P_WIDTH        (P_WIDTH),
                
                .OPMODEREG      (1),
                .ALUMODEREG     (1),
                .AREG           (2),
                .BREG           (2),
                .CREG           (1),
                .MREG           (1),
                .PREG           (1),
                
                .USE_PCIN       (0),
                .USE_PCOUT      (0),
                
                .DEVICE         ("7SERIES")
            )
        i_mul_add_dsp48e1_dsp
            (
                .reset          (reset),
                .clk            (clk),
                
                .cke_ctrl       (cke0),
                .cke_alumode    (cke1),
                .cke_a0         (cke2),
                .cke_a1         (cke3),
                .cke_b0         (cke4),
                .cke_b1         (cke5),
                .cke_c          (cke6),
                .cke_m          (cke7),
                .cke_p          (cke8),
                
                .op_load        (op_load),
                .alu_sub        (alu_sub),
                
                .a              (a),
                .b              (x),
                .c              (d),
                .p              (dsp_p_dsp),
                
                .pcin           (),
                .pcout          ()
            );
    
    
endmodule


`default_nettype wire


// end of file
