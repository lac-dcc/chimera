
`timescale 1ns / 1ps
`default_nettype none


module tb_fixed_float_projective_transformation_2d();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_fixed_float_projective_transformation_2d.vcd");
        $dumpvars(0, tb_fixed_float_projective_transformation_2d);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    // ---------------------------------------------
    //  parameter
    // ---------------------------------------------
    
    parameter   FLOAT_EXP_WIDTH         = 8;
    parameter   FLOAT_EXP_OFFSET        = (1 << (FLOAT_EXP_WIDTH-1)) - 1;
    parameter   FLOAT_FRAC_WIDTH        = 23;
    parameter   FLOAT_WIDTH             = 1 + FLOAT_EXP_WIDTH + FLOAT_FRAC_WIDTH;   // sign + exp + frac
    
    parameter   S_FIXED_INT_WIDTH       = 12;
    parameter   S_FIXED_FRAC_WIDTH      = 0;
    parameter   S_FIXED_WIDTH           = S_FIXED_INT_WIDTH + S_FIXED_FRAC_WIDTH;
    
    parameter   M_FIXED_INT_WIDTH       = 16;
    parameter   M_FIXED_FRAC_WIDTH      = 8;
    parameter   M_FIXED_WIDTH           = M_FIXED_INT_WIDTH + M_FIXED_FRAC_WIDTH;
    
    parameter   MUL_DENORM_W_EXP_WIDTH   = FLOAT_EXP_WIDTH;
    parameter   MUL_DENORM_W_EXP_OFFSET  = FLOAT_EXP_OFFSET;
    parameter   MUL_DENORM_W_INT_WIDTH   = 20;
    parameter   MUL_DENORM_W_FRAC_WIDTH  = 8;
    parameter   MUL_DENORM_W_FIXED_WIDTH = MUL_DENORM_W_INT_WIDTH + MUL_DENORM_W_FRAC_WIDTH;
    
    parameter   RECIP_FLOAT_EXP_WIDTH   = FLOAT_EXP_WIDTH;
    parameter   RECIP_FLOAT_EXP_OFFSET  = FLOAT_EXP_OFFSET;
    parameter   RECIP_FLOAT_FRAC_WIDTH  = 16 ; //23 ;// 16;
    parameter   RECIP_FLOAT_WIDTH       = 1 + RECIP_FLOAT_EXP_WIDTH + RECIP_FLOAT_FRAC_WIDTH;
    
    /*
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
    */
    
    parameter   MASTER_IN_REGS       = 1;
    parameter   MASTER_OUT_REGS      = 1;
    
    
    
    // ---------------------------------------------
    //  real <=> float
    // ---------------------------------------------
    
    parameter   EXP_WIDTH   = FLOAT_EXP_WIDTH;
    parameter   EXP_OFFSET  = (1 << (EXP_WIDTH-1)) - 1;
    parameter   FRAC_WIDTH  = FLOAT_FRAC_WIDTH;
    
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
    
    
    /*
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
    */
    
    

    
    // ---------------------------------------------
    //  test bench
    // ---------------------------------------------
    
    reg     cke;
    always @(posedge clk) begin
    //  cke <= 1'b1 ; // 
        cke <= {$random()};
    end
    
    reg     signed  [S_FIXED_WIDTH-1:0] x;
    reg     signed  [S_FIXED_WIDTH-1:0] y;
    
    real    mat00 = 10.0;
    real    mat01 = 0.1;
    real    mat02 = 0.2;
    real    mat10 = 0.3;
    real    mat11 = 10.0;
    real    mat12 = 0.4;
    real    mat20 = 0.01;
    real    mat21 = 0.02;
    real    mat22 = 1.00;
    
    real    exp_x;
    real    exp_y;
    real    exp_w;
    
    reg             [FLOAT_WIDTH-1:0]   matrix00;
    reg             [FLOAT_WIDTH-1:0]   matrix01;
    reg             [FLOAT_WIDTH-1:0]   matrix02;
    reg             [FLOAT_WIDTH-1:0]   matrix10;
    reg             [FLOAT_WIDTH-1:0]   matrix11;
    reg             [FLOAT_WIDTH-1:0]   matrix12;
    reg             [FLOAT_WIDTH-1:0]   matrix20;
    reg             [FLOAT_WIDTH-1:0]   matrix21;
    reg             [FLOAT_WIDTH-1:0]   matrix22;
    
    real                                s_exp_x;
    real                                s_exp_y;
    
    reg     signed  [S_FIXED_WIDTH-1:0] s_x;
    reg     signed  [S_FIXED_WIDTH-1:0] s_y;
    reg                                 s_valid;
    wire                                s_ready;
    
    wire    signed  [S_FIXED_WIDTH-1:0] m_int_y;
    wire    signed  [S_FIXED_WIDTH-1:0] m_int_x;
    wire            [63:0]              m_real_y;
    wire            [63:0]              m_real_x;
    
    wire    signed  [M_FIXED_WIDTH-1:0] m_x;
    wire    signed  [M_FIXED_WIDTH-1:0] m_y;
    wire                                m_valid;
    reg                                 m_ready = 1'b1;
    
    always @(posedge clk) begin
        if ( cke ) begin
            m_ready <= {$random()};
        end
    end
    
    real    result_x;
    real    result_y;
    
    integer fp;
    integer fp_exp;
    
    initial begin
        fp     = $fopen("out.txt", "w");
        fp_exp = $fopen("exp.txt", "w");
    end
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_valid <= 1'b0;
            x = 0;
            y = 0;
        end
        else if ( cke ) begin
            if ( s_ready ) begin
                s_valid <= 1'b0;
            end
            
            if ( !s_valid || s_ready ) begin
                if ( {$random()} % 2 == 0 ) begin
                    
                    
                    x = $random();
                    y = $random();
                    
                    /*
                    x = x + 1;
                    if ( x >= 1024 ) begin
                        x = 0;
                        y = y + 1;
                    end
                    */
                    
                    exp_w = x*mat20 + y*mat21 + mat22;
                    
                    exp_x = x*mat00 + y*mat01 + mat02;
                    exp_y = x*mat10 + y*mat11 + mat12;
                    
                    $fdisplay(fp_exp, "(%d %d) %f %f %f : %f %f %f", x, y, exp_x, exp_y , exp_w, exp_x/exp_w, exp_y/exp_w, 1/exp_w);
                    
                    exp_x = exp_x / exp_w;
                    exp_y = exp_y / exp_w;
                    
                    
                    s_x      <= x;
                    s_y      <= y;
                    s_exp_x  <= exp_x;
                    s_exp_y  <= exp_y;
                    
                    s_valid  <= 1'b1;
                    matrix00 <= real2float(mat00);
                    matrix01 <= real2float(mat01);
                    matrix02 <= real2float(mat02);
                    matrix10 <= real2float(mat10);
                    matrix11 <= real2float(mat11);
                    matrix12 <= real2float(mat12);
                    matrix20 <= real2float(mat20);
                    matrix21 <= real2float(mat21);
                    matrix22 <= real2float(mat22);
                end
            end
            
            if ( cke && m_valid && m_ready ) begin
                
                result_x = m_x;
                result_y = m_y;
                result_x = result_x / (1<<M_FIXED_FRAC_WIDTH);
                result_y = result_y / (1<<M_FIXED_FRAC_WIDTH);
                
        //      $display("%f %f : %f %f %d %d", result_x , result_y, $bitstoreal(m_real_x), $bitstoreal(m_real_y), m_int_x, m_int_y);
        
                $display(     "(%f %f) %f %f : %f %f %d %d", result_x - $bitstoreal(m_real_x), result_y - $bitstoreal(m_real_y),
                                result_x , result_y, $bitstoreal(m_real_x), $bitstoreal(m_real_y), m_int_x, m_int_y);
                                
                $fdisplay(fp, "(%f %f) %f %f : %f %f %d %d", result_x - $bitstoreal(m_real_x), result_y - $bitstoreal(m_real_y),
                                result_x , result_y, $bitstoreal(m_real_x), $bitstoreal(m_real_y), m_int_x, m_int_y);
            end
        end
    end
    
    
    function real recip_float2real(input [RECIP_FLOAT_WIDTH-1:0] f);
    reg     [63:0]  b;
    begin
        b                               = 64'd0;
        b[63]                           = f[RECIP_FLOAT_WIDTH-1];
        b[62:52]                        = (f[RECIP_FLOAT_FRAC_WIDTH +: EXP_WIDTH] - RECIP_FLOAT_EXP_OFFSET) + 1023;
        b[51 -: RECIP_FLOAT_FRAC_WIDTH] = f[0 +: RECIP_FLOAT_FRAC_WIDTH];
        recip_float2real                = $bitstoreal(b);
    end
    endfunction
    
    
    function real recip_denorm2real(input [MUL_DENORM_W_EXP_WIDTH-1:0] exp, input signed [MUL_DENORM_W_FIXED_WIDTH-1:0] fixed);
    begin
        recip_denorm2real = fixed;
        recip_denorm2real = recip_denorm2real / (1 << MUL_DENORM_W_FRAC_WIDTH);
        if ( exp >= MUL_DENORM_W_EXP_OFFSET ) begin
            recip_denorm2real = recip_denorm2real * (1 << (exp - MUL_DENORM_W_EXP_OFFSET));
        end
        else begin
            recip_denorm2real = recip_denorm2real / (1 << (MUL_DENORM_W_EXP_OFFSET - exp));
        end
    end
    endfunction
    
    
    
    integer fp0;
    integer fp1;
    integer fp2;
    real    recip_exp;
    
    initial begin
        fp0 = $fopen("log0.txt", "w");
        fp1 = $fopen("log1.txt", "w");
        fp2 = $fopen("log2.txt", "w");
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
        end
        else if ( cke ) begin
            if ( i_top.mul_valid ) begin
                /*
                recip_exp = i_top.mul_denorm_w_fixed;
                recip_exp = recip_exp / (1 << MUL_DENORM_W_FRAC_WIDTH);
                if ( i_top.mul_denorm_w_exp >= MUL_DENORM_W_EXP_OFFSET ) begin
                    recip_exp = recip_exp * (1 << (i_top.mul_denorm_w_exp - MUL_DENORM_W_EXP_OFFSET));
                end
                else begin
                    recip_exp = recip_exp / (1 << (MUL_DENORM_W_EXP_OFFSET - i_top.mul_denorm_w_exp));
                end
                */
                
                recip_exp = recip_denorm2real(i_top.mul_denorm_w_exp, i_top.mul_denorm_w_fixed);
                
                $fdisplay(fp0, "%d %x %f %f",
                    $signed(i_top.mul_denorm_w_exp - MUL_DENORM_W_EXP_OFFSET),
                    i_top.mul_denorm_w_fixed,
                    recip_exp,
                    1.0/recip_exp);
            end
            
            if ( i_top.recip_valid ) begin
                $fdisplay(fp1, "%f %f %f %x %x", 
                    recip_denorm2real(i_top.recip_denorm_x_exp, i_top.recip_denorm_x_fixed),
                    recip_denorm2real(i_top.recip_denorm_y_exp, i_top.recip_denorm_y_fixed),
                    recip_float2real(i_top.recip_float_w),
                    i_top.recip_denorm_x_fixed,
                    i_top.recip_denorm_y_fixed);
            end
            
            if ( i_top.div_valid ) begin
                $fdisplay(fp2, "%f %f %x %x",
                    recip_denorm2real(i_top.div_denorm_x_exp, i_top.div_denorm_x_fixed),
                    recip_denorm2real(i_top.div_denorm_y_exp, i_top.div_denorm_y_fixed),
                    i_top.div_denorm_x_fixed,
                    i_top.div_denorm_y_fixed);
            end
        end
    end
    
    
    
    jelly_fixed_float_projective_transformation_2d
            #(
                .FLOAT_EXP_WIDTH    (FLOAT_EXP_WIDTH),
                .FLOAT_EXP_OFFSET   (FLOAT_EXP_OFFSET),
                .FLOAT_FRAC_WIDTH   (FLOAT_FRAC_WIDTH),
                
                .S_FIXED_INT_WIDTH  (S_FIXED_INT_WIDTH),
                .S_FIXED_FRAC_WIDTH (S_FIXED_FRAC_WIDTH),
                
                .M_FIXED_INT_WIDTH  (M_FIXED_INT_WIDTH),
                .M_FIXED_FRAC_WIDTH (M_FIXED_FRAC_WIDTH),
                
                .MUL_DENORM_W_INT_WIDTH     (MUL_DENORM_W_INT_WIDTH ),
                .MUL_DENORM_W_FRAC_WIDTH    (MUL_DENORM_W_FRAC_WIDTH),
                
                .RECIP_FLOAT_FRAC_WIDTH (RECIP_FLOAT_FRAC_WIDTH),
                
                .USER_WIDTH         (S_FIXED_WIDTH+S_FIXED_WIDTH+64+64),
                
                .MASTER_IN_REGS     (0),
                .MASTER_OUT_REGS    (0),
                
                .DEVICE             ("7SERIES") // "RTL"
            )
        i_top
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                                     
                .matrix00           (matrix00),
                .matrix01           (matrix01),
                .matrix02           (matrix02),
                .matrix10           (matrix10),
                .matrix11           (matrix11),
                .matrix12           (matrix12),
                .matrix20           (matrix20),
                .matrix21           (matrix21),
                .matrix22           (matrix22),
                
                .s_user             ({s_y, s_x, $realtobits(s_exp_y), $realtobits(s_exp_x)}),
                .s_x                (s_x),
                .s_y                (s_y),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_user             ({m_int_y, m_int_x, m_real_y, m_real_x}),
                .m_x                (m_x),
                .m_y                (m_y),
                .m_valid            (m_valid),
                .m_ready            (m_ready)
            );
    
    
    
    
    
    
    wire    [RECIP_FLOAT_WIDTH-1:0] denorm_float;
    real    real_denorm;
    always @* begin
        real_denorm = recip_float2real(denorm_float);
    end
    
    
    jelly_denorm_to_float
            #(
                .DENORM_SIGNED          (1),
                .DENORM_INT_WIDTH       (MUL_DENORM_W_INT_WIDTH),
                .DENORM_FRAC_WIDTH      (MUL_DENORM_W_FRAC_WIDTH),
                .DENORM_EXP_WIDTH       (MUL_DENORM_W_EXP_WIDTH),
                
                .FLOAT_EXP_WIDTH        (RECIP_FLOAT_EXP_WIDTH),
                .FLOAT_FRAC_WIDTH       (RECIP_FLOAT_FRAC_WIDTH),
                
                .USER_WIDTH             (0)
            )
        i_denorm_to_float
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (),
                .s_denorm_fixed         (24'h0001_80),
                .s_denorm_exp           (8'h7f-1),
                .s_valid                (1),
                .s_ready                (),
                
                .m_user                 (),
                .m_float                (denorm_float),
                .m_valid                (),
                .m_ready                (1'b1)
            );
    
endmodule


`default_nettype wire


// end of file
