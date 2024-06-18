// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_fixed_matrix3x4();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_fixed_matrix3x4.vcd");
        $dumpvars(0, tb_fixed_matrix3x4);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    
    parameter   COEFF_INT_WIDTH    = 17;
    parameter   COEFF_FRAC_WIDTH   = 8;
    parameter   COEFF_WIDTH        = COEFF_INT_WIDTH + COEFF_FRAC_WIDTH;
    
    parameter   S_FIXED_INT_WIDTH  = 17;
    parameter   S_FIXED_FRAC_WIDTH = 0;
    parameter   S_FIXED_WIDTH      = S_FIXED_INT_WIDTH + S_FIXED_FRAC_WIDTH;
    
    parameter   M_FIXED_INT_WIDTH  = 17;
    parameter   M_FIXED_FRAC_WIDTH = 8;
    parameter   M_FIXED_WIDTH      = M_FIXED_INT_WIDTH + M_FIXED_FRAC_WIDTH;
    
    parameter   STATIC_COEFF       = 0; // no dynamic change coeff
    
    parameter   MASTER_IN_REGS     = 1;
    parameter   MASTER_OUT_REGS    = 1;
    
    parameter   DEVICE             = "7SERIES"; // "RTL" or "7SERIES"
    
    
    
    reg                                     cke = 1;
    
    reg     signed  [COEFF_WIDTH-1:0]       coeff00 = 25'h0001_00;
    reg     signed  [COEFF_WIDTH-1:0]       coeff01 = 25'h0000_00;
    reg     signed  [COEFF_WIDTH-1:0]       coeff02 = 25'h0000_00;
    reg     signed  [COEFF_WIDTH-1:0]       coeff03 = 25'h0000_01;
    reg     signed  [COEFF_WIDTH-1:0]       coeff10 = 25'h0000_00;
    reg     signed  [COEFF_WIDTH-1:0]       coeff11 = 25'h0001_00;
    reg     signed  [COEFF_WIDTH-1:0]       coeff12 = 25'h0000_00;
    reg     signed  [COEFF_WIDTH-1:0]       coeff13 = 25'h0000_02;
    reg     signed  [COEFF_WIDTH-1:0]       coeff20 = 25'h0000_00;
    reg     signed  [COEFF_WIDTH-1:0]       coeff21 = 25'h0000_00;
    reg     signed  [COEFF_WIDTH-1:0]       coeff22 = 25'h0001_00;
    reg     signed  [COEFF_WIDTH-1:0]       coeff23 = 25'h0000_03;
    
    reg     signed  [S_FIXED_WIDTH-1:0]     s_fixed_x;
    reg     signed  [S_FIXED_WIDTH-1:0]     s_fixed_y;
    reg     signed  [S_FIXED_WIDTH-1:0]     s_fixed_z;
    reg                                     s_valid;
    wire                                    s_ready;
    
    wire    signed  [M_FIXED_WIDTH-1:0]     m_fixed_x;
    wire    signed  [M_FIXED_WIDTH-1:0]     m_fixed_y;
    wire    signed  [M_FIXED_WIDTH-1:0]     m_fixed_z;
    wire                                    m_valid;
    reg                                     m_ready = 1;
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_fixed_x <= 0;
            s_fixed_y <= 1;
            s_fixed_z <= 2;
            s_valid   <= 0;
        end
        else begin
            s_valid   <= 1;
            
            if ( s_valid & s_ready )  begin
                s_fixed_x <= s_fixed_x + 1;
                s_fixed_y <= s_fixed_y + 1;
                s_fixed_z <= s_fixed_z + 1;
            end
        end
    end
    
    
    
    jelly_fixed_matrix3x4
            #(
                .COEFF_INT_WIDTH        (COEFF_INT_WIDTH),
                .COEFF_FRAC_WIDTH       (COEFF_FRAC_WIDTH),
                .COEFF_WIDTH            (COEFF_WIDTH),
                
                .S_FIXED_INT_WIDTH      (S_FIXED_INT_WIDTH),
                .S_FIXED_FRAC_WIDTH     (S_FIXED_FRAC_WIDTH),
                .S_FIXED_WIDTH          (S_FIXED_WIDTH),
                
                .M_FIXED_INT_WIDTH      (M_FIXED_INT_WIDTH),
                .M_FIXED_FRAC_WIDTH     (M_FIXED_FRAC_WIDTH),
                .M_FIXED_WIDTH          (M_FIXED_WIDTH),
                
                .USER_WIDTH             (0),
                
                .STATIC_COEFF           (STATIC_COEFF),
                
                .MASTER_IN_REGS         (MASTER_IN_REGS),
                .MASTER_OUT_REGS        (MASTER_OUT_REGS),
                
                .DEVICE                 (DEVICE)
            )
        i_fixed_matrix3x4
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .coeff00                (coeff00),
                .coeff01                (coeff01),
                .coeff02                (coeff02),
                .coeff03                (coeff03),
                .coeff10                (coeff10),
                .coeff11                (coeff11),
                .coeff12                (coeff12),
                .coeff13                (coeff13),
                .coeff20                (coeff20),
                .coeff21                (coeff21),
                .coeff22                (coeff22),
                .coeff23                (coeff23),
                
                .s_user                 (),
                .s_fixed_x              (s_fixed_x),
                .s_fixed_y              (s_fixed_y),
                .s_fixed_z              (s_fixed_z),
                .s_valid                (s_valid),
                .s_ready                (s_ready),
                
                .m_user                 (),
                .m_fixed_x              (m_fixed_x),
                .m_fixed_y              (m_fixed_y),
                .m_fixed_z              (m_fixed_z),
                .m_valid                (m_valid),
                .m_ready                (m_ready)
            );
    
    
    
endmodule


`default_nettype wire


// end of file
