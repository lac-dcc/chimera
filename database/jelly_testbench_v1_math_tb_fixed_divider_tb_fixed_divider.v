
`timescale 1ns / 1ps
`default_nettype none


module tb_fixed_divider();
    localparam RATE    = 5.0;
    
    initial begin
        $dumpfile("tb_fixed_divider.vcd");
        $dumpvars(0, tb_fixed_divider);
        
        #1000000        $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    
    // ---------------------------------------------
    //  parameter
    // ---------------------------------------------
    
    parameter   RAND_BUSY = 0;
    
    
    parameter   USER_WIDTH            = 0;
    parameter   S_DIVIDEND_INT_WIDTH  = 16;
    parameter   S_DIVIDEND_FRAC_WIDTH = 9;
    parameter   S_DIVISOR_INT_WIDTH   = 8;
    parameter   S_DIVISOR_FRAC_WIDTH  = 8;
    parameter   M_QUOTIENT_INT_WIDTH  = 10;
    parameter   M_QUOTIENT_FRAC_WIDTH = 16;
    
    parameter   MASTER_IN_REGS        = 1;
    parameter   MASTER_OUT_REGS       = 1;
    
    parameter   DEVICE                = "RTL";
    
    parameter   S_DIVIDEND_WIDTH      = S_DIVIDEND_INT_WIDTH + S_DIVIDEND_FRAC_WIDTH;
    parameter   S_DIVISOR_WIDTH       = S_DIVISOR_INT_WIDTH + S_DIVISOR_FRAC_WIDTH;
    parameter   M_QUOTIENT_WIDTH      = M_QUOTIENT_INT_WIDTH + M_QUOTIENT_FRAC_WIDTH;
    
    
    
    
    // ---------------------------------------------
    //  test bench
    // ---------------------------------------------
    
    reg                                     cke = 1;
    always @(posedge clk) begin
        cke <= RAND_BUSY ? {$random} : 1;
    end
    
    reg                                     s_end;
    
    real                                    s_real_divisor;
    real                                    s_real_dividend;
    real                                    s_real_quotient;
    reg     signed  [S_DIVIDEND_WIDTH-1:0]  s_dividend;
    reg     signed  [S_DIVISOR_WIDTH-1:0]   s_divisor;
    reg                                     s_valid;
    wire                                    s_ready;
    
    real                                    m_real_divisor;
    real                                    m_real_dividend;
    real                                    m_real_quotient;
    real                                    m_exp_quotient;
    wire    signed  [S_DIVIDEND_WIDTH-1:0]  m_src_dividend;
    wire    signed  [S_DIVISOR_WIDTH-1:0]   m_src_divisor;
    wire    signed  [M_QUOTIENT_WIDTH-1:0]  m_quotient;
    wire                                    m_valid;
    reg                                     m_ready = 1;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_end      <= 0;
            
            s_divisor  <= 1;
            s_dividend <= 0;
            s_valid    <= 0;
        end
        else if ( cke ) begin
            if ( !s_valid || s_ready ) begin
                s_valid <= !s_end && (RAND_BUSY ? {$random} : 1);
            end
            
            if ( s_valid && s_ready ) begin
                if ( {s_divisor, s_dividend} == (1 << (S_DIVIDEND_WIDTH + S_DIVISOR_WIDTH))-1 ) begin
                    s_end   <= 1'b1;
                    s_valid <= 1'b0;
                end
                else begin
//                  {s_divisor, s_dividend} <= {s_divisor, s_dividend} + 1'b1;
                    
                    s_dividend <= $random; // (1 << S_DIVIDEND_FRAC_WIDTH);
                    s_divisor  <= $random; // (1 << S_DIVISOR_FRAC_WIDTH);
                end
            end
        end
    end
    
    always @* begin
        s_real_dividend = $itor(s_dividend) / (1 << S_DIVIDEND_FRAC_WIDTH);
        s_real_divisor  = $itor(s_divisor)  / (1 << S_DIVISOR_FRAC_WIDTH);
        if ( s_real_divisor != 0 ) begin
            s_real_quotient = s_real_dividend / s_real_divisor;
        end
        
        m_real_dividend = $itor(m_src_dividend) / (1 << S_DIVIDEND_FRAC_WIDTH);
        m_real_divisor  = $itor(m_src_divisor)  / (1 << S_DIVISOR_FRAC_WIDTH);
        m_real_quotient = $itor(m_quotient)     / (1 << M_QUOTIENT_FRAC_WIDTH);
        if ( m_real_divisor != 0 ) begin
            m_exp_quotient  = m_real_dividend / m_real_divisor;
        end
    end
    
    
    always @(posedge clk) begin
        m_ready <= RAND_BUSY ? {$random} : 1;
    end
    
    
    
    jelly_fixed_divider
            #(
                .USER_WIDTH             (S_DIVIDEND_WIDTH+S_DIVISOR_WIDTH),
                .S_DIVIDEND_INT_WIDTH   (S_DIVIDEND_INT_WIDTH),
                .S_DIVIDEND_FRAC_WIDTH  (S_DIVIDEND_FRAC_WIDTH),
                .S_DIVISOR_INT_WIDTH    (S_DIVISOR_INT_WIDTH),
                .S_DIVISOR_FRAC_WIDTH   (S_DIVISOR_FRAC_WIDTH),
                .M_QUOTIENT_INT_WIDTH   (M_QUOTIENT_INT_WIDTH),
                .M_QUOTIENT_FRAC_WIDTH  (M_QUOTIENT_FRAC_WIDTH),
                .MASTER_IN_REGS         (MASTER_IN_REGS),
                .MASTER_OUT_REGS        (MASTER_OUT_REGS),
                .DEVICE                 (DEVICE)
            )
        i_fixed_divider
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_user             ({s_dividend, s_divisor}),
                .s_dividend         (s_dividend),
                .s_divisor          (s_divisor),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_user             ({m_src_dividend, m_src_divisor}),
                .m_quotient         (m_quotient),
                .m_valid            (m_valid),
                .m_ready            (m_ready)
            );
    
//  wire    exp_ok   = cke && m_valid && m_ready && ((m_quotient == m_exp_quotient) || (m_remainder == m_exp_remainder));
//  wire    exp_diff = cke && m_valid && m_ready && ((m_quotient != m_exp_quotient) || (m_remainder != m_exp_remainder));
    
    
    /*
    integer fp;
    initial fp = $fopen("out.txt", "w");
    
    always @(posedge clk) begin
        if ( cke ) begin
            if ( m_valid && m_ready ) begin
                $fdisplay(fp, "%d / %d : %d %d (%d %d)", m_src_dividend, m_src_divisor, m_quotient, m_remainder, m_exp_quotient, m_exp_remainder);
                
                if ( (m_quotient != m_exp_quotient) || (m_remainder != m_exp_remainder) ) begin
                    $display("ERROR!");
                    $fdisplay(fp, "ERROR!");
                end
                
                if ( {m_src_divisor, m_src_dividend} == (1 << (S_DIVIDEND_WIDTH + S_DIVISOR_WIDTH))-1 ) begin
                    $display("END");
                    $finish;
                end
            end
        end
    end
    */
    
    
endmodule


`default_nettype wire


// end of file
