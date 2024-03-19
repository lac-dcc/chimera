
`timescale 1ns / 1ps
`default_nettype none


module tb_fixed_float_mul_add();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_fixed_float_mul_add.vcd");
        $dumpvars(0, tb_fixed_float_mul_add);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    // ---------------------------------------------
    //  parameter
    // ---------------------------------------------
    
    parameter   S_FIXED_INT_WIDTH    = 12;
    parameter   S_FIXED_FRAC_WIDTH   = 0;
    parameter   S_FIXED_WIDTH        = S_FIXED_INT_WIDTH + S_FIXED_FRAC_WIDTH;
    
    parameter   S_FLOAT_EXP_WIDTH    = 8;
    parameter   S_FLOAT_EXP_OFFSET   = (1 << (S_FLOAT_EXP_WIDTH-1)) - 1;
    parameter   S_FLOAT_FRAC_WIDTH   = 23;
    parameter   S_FLOAT_WIDTH        = 1 + S_FLOAT_EXP_WIDTH + S_FLOAT_FRAC_WIDTH;  // sign + exp + frac
    
    parameter   M_DENORM_EXP_WIDTH   = S_FLOAT_EXP_WIDTH;
    parameter   M_DENORM_EXP_OFFSET  = (1 << (M_DENORM_EXP_WIDTH-1)) - 1;
    parameter   M_DENORM_INT_WIDTH   = 16; // 40;
    parameter   M_DENORM_FRAC_WIDTH  = 8;
    parameter   M_DENORM_FIXED_WIDTH = M_DENORM_INT_WIDTH + M_DENORM_FRAC_WIDTH;
    
    parameter   INT_WIDTH            = 48;
    
    parameter   USER_WIDTH           = 64;
    parameter   USER_BITS            = USER_WIDTH > 0 ? USER_WIDTH : 1;
    
    parameter   MASTER_IN_REGS       = 1;
    parameter   MASTER_OUT_REGS      = 1;
    
    
    
    // ---------------------------------------------
    //  real <=> float
    // ---------------------------------------------
    
    parameter   EXP_WIDTH   = S_FLOAT_EXP_WIDTH;
    parameter   EXP_OFFSET  = (1 << (EXP_WIDTH-1)) - 1;
    parameter   FRAC_WIDTH  = S_FLOAT_FRAC_WIDTH;
    parameter   FLOAT_WIDTH = 1 + EXP_WIDTH + FRAC_WIDTH;
    
    function [FLOAT_WIDTH-1:0] real2float(input real r);
    reg     [63:0]  b;
    begin
        b                                    = $realtobits(r);
        real2float[FLOAT_WIDTH-1]            = b[63];
        real2float[FRAC_WIDTH +: EXP_WIDTH]  = (b[62:52] - 1023) + EXP_OFFSET;
        real2float[0          +: FRAC_WIDTH] = b[51 -: FRAC_WIDTH];
        
        if ( r == 0 ) begin
            real2float = 0;
        end
    end
    endfunction
    
    
    function real float2real(input [FLOAT_WIDTH-1:0] f);
    reg     [63:0]  b;
    begin
        b                   = 64'd0;
        b[63]               = f[FLOAT_WIDTH-1];
        b[62:52]            = (f[FRAC_WIDTH +: EXP_WIDTH] - EXP_OFFSET) + 1023;
        b[51 -: FRAC_WIDTH] = f[0 +: FRAC_WIDTH];
        float2real          = $bitstoreal(b);
    end
    endfunction
    
    function real isnan_float(input [FLOAT_WIDTH-1:0] f);
    begin
        isnan_float = ((f[FRAC_WIDTH +: EXP_WIDTH] == {EXP_WIDTH{1'b0}}) || (f[FRAC_WIDTH +: EXP_WIDTH] == {EXP_WIDTH{1'b1}}));
    end
    endfunction
    
    
    
    function real fixed2real(input signed [M_DENORM_FIXED_WIDTH-1:0] f, input [M_DENORM_EXP_WIDTH-1:0] e);
    real        r;
    begin
        r = $itor(f) / (1 << M_DENORM_FRAC_WIDTH);
        if ( e > M_DENORM_EXP_OFFSET ) begin
            r = r * (1 << (e - M_DENORM_EXP_OFFSET));
        end
        else begin
            r = r / (1 << (M_DENORM_EXP_OFFSET - e));
        end
        
        fixed2real = r;
    end
    endfunction
    
    
    
    // ---------------------------------------------
    //  test bench
    // ---------------------------------------------
    
    localparam  REAL_INT_WIDTH  = 20;
    localparam  REAL_FRAC_WIDTH = 16;
    
    reg     signed  [S_FIXED_WIDTH-1:0]         x;
    reg     signed  [S_FIXED_WIDTH-1:0]         y;
    reg     signed  [REAL_INT_WIDTH-1:0]        a_int;
    real                                        a;
    reg     signed  [REAL_INT_WIDTH-1:0]        b_int;
    real                                        b;
    reg     signed  [REAL_INT_WIDTH-1:0]        c_int;
    real                                        c;
    real                                        expectation;
    
    reg             [USER_BITS-1:0]             s_user;
    reg     signed  [S_FIXED_WIDTH-1:0]         s_fixed_x;
    reg     signed  [S_FIXED_WIDTH-1:0]         s_fixed_y;
    reg             [S_FLOAT_WIDTH-1:0]         s_float_a;
    reg             [S_FLOAT_WIDTH-1:0]         s_float_b;
    reg             [S_FLOAT_WIDTH-1:0]         s_float_c;
    reg                                         s_valid;
    wire                                        s_ready;
    
    wire            [USER_BITS-1:0]             m_user;
    wire            [M_DENORM_EXP_WIDTH-1:0]    m_denorm_exp;
    wire    signed  [M_DENORM_FIXED_WIDTH-1:0]  m_denorm_fixed;
    wire                                        m_valid;
    wire                                        m_ready = 1'b1;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_valid <= 1'b0;
        end
        else begin
            x      = $random();
            y      = $random();
            a_int  = {$random(), $random()};
            b_int  = {$random(), $random()};
            c_int  = {$random(), $random()};
            a      = $itor(a_int) / (1 << REAL_FRAC_WIDTH);
            b      = $itor(b_int) / (1 << REAL_FRAC_WIDTH);
            c      = $itor(c_int) / (1 << REAL_FRAC_WIDTH);
            
            
    //      x      = 1;
    //      y      = 1;
    //      a      = 0.5;
    //      b      = 1.0;
    //      c      = 8.125;
            
            expectation = a*x + b*y + c;
    //      $display("x:%x %x %f", x, $realtobits(expectation), expectation);
            
            s_user    <= $realtobits(expectation);
            s_fixed_x <= x;
            s_fixed_y <= y;
            s_float_a <= real2float(a);
            s_float_b <= real2float(b);
            s_float_c <= real2float(c);
            s_valid   <= 1'b1;
            
            
            if ( m_valid && m_ready ) begin
                $display("%x %x : %f %f", m_denorm_fixed, m_denorm_exp, fixed2real(m_denorm_fixed, m_denorm_exp), $bitstoreal(m_user));
            end
        end
    end
    
    
    
    jelly_fixed_float_mul_add2
            #(
                .S_FIXED_INT_WIDTH      (S_FIXED_INT_WIDTH),
                .S_FIXED_FRAC_WIDTH     (S_FIXED_FRAC_WIDTH),
                                         
                .S_FLOAT_EXP_WIDTH      (S_FLOAT_EXP_WIDTH),
                .S_FLOAT_FRAC_WIDTH     (S_FLOAT_FRAC_WIDTH),
                
                .M_DENORM_EXP_WIDTH     (M_DENORM_EXP_WIDTH),
                .M_DENORM_INT_WIDTH     (M_DENORM_INT_WIDTH),
                .M_DENORM_FRAC_WIDTH    (M_DENORM_FRAC_WIDTH),
                
                .INT_WIDTH              (INT_WIDTH),
                
                .USER_WIDTH             (USER_WIDTH),
                
                .MASTER_IN_REGS         (MASTER_IN_REGS),
                .MASTER_OUT_REGS        (MASTER_OUT_REGS),
                
    //          .DEVICE                 ("RTL") // "7SERIES"
                .DEVICE                 ("7SERIES") // ("RTL") // "7SERIES"
            )
        i_fixed_float_mul_add2
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (1'b1),
                                         
                .s_user                 (s_user),
                .s_fixed_x              (s_fixed_x),
                .s_fixed_y              (s_fixed_y),
                .s_float_a              (s_float_a),
                .s_float_b              (s_float_b),
                .s_float_c              (s_float_c),
                .s_valid                (s_valid),
                .s_ready                (s_ready),
                                         
                .m_user                 (m_user),
                .m_denorm_exp           (m_denorm_exp),
                .m_denorm_fixed         (m_denorm_fixed),
                .m_valid                (m_valid),
                .m_ready                (m_ready)
            );
    
    
    jelly_fixed_float_projective_transformation_2d
        i_fixed_float_projective_transformation_2d
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (1'b1)
            );
    
endmodule


`default_nettype wire


// end of file
