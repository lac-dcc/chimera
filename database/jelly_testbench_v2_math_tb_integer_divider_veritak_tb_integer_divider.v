// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_integer_divider();
    localparam RATE    = 5.0;
    
    initial begin
        $dumpfile("tb_integer_divider.vcd");
        $dumpvars(0, tb_integer_divider);
        
        #1000000        $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    
    // ---------------------------------------------
    //  parameter
    // ---------------------------------------------
    
    parameter   RAND_BUSY = 1;
    
    
    parameter   USER_WIDTH       = 0;
    parameter   S_DIVIDEND_WIDTH = 8;
    parameter   S_DIVISOR_WIDTH  = 6;
    
    parameter   MASTER_IN_REGS   = 1;
    parameter   MASTER_OUT_REGS  = 1;
    
    parameter   DEVICE           = "RTL";
    
    parameter   USER_BITS        = USER_WIDTH > 0 ? USER_WIDTH : 1;
    parameter   M_QUOTIENT_WIDTH       = S_DIVIDEND_WIDTH;
    parameter   M_REMAINDER_WIDTH      = S_DIVISOR_WIDTH;
    
    
    
    
    // ---------------------------------------------
    //  test bench
    // ---------------------------------------------
    
    reg                                     cke = 1;
    always @(posedge clk) begin
        cke <= RAND_BUSY ? {$random} : 1;
    end
    
    reg                                     s_end;
    
    wire            [M_QUOTIENT_WIDTH-1:0]      s_exp_quotient;
    wire            [M_REMAINDER_WIDTH-1:0]     s_exp_remainder;
    reg     signed  [S_DIVIDEND_WIDTH-1:0]  s_dividend = -123;
    reg     signed  [S_DIVISOR_WIDTH-1:0]   s_divisor  = 7;
    reg                                     s_valid    = 1;
    wire                                    s_ready;
    
    wire    signed  [S_DIVIDEND_WIDTH-1:0]  m_src_dividend;
    wire    signed  [S_DIVISOR_WIDTH-1:0]   m_src_divisor;
    wire    signed  [M_QUOTIENT_WIDTH-1:0]      m_exp_quotient;
    wire    signed  [M_REMAINDER_WIDTH-1:0]     m_exp_remainder;
    wire    signed  [M_QUOTIENT_WIDTH-1:0]      m_quotient;
    wire            [M_REMAINDER_WIDTH-1:0]     m_remainder;
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
                    {s_divisor, s_dividend} <= {s_divisor, s_dividend} + 1'b1;
                end
            end
        end
    end
    
    always @(posedge clk) begin
        m_ready <= RAND_BUSY ? {$random} : 1;
    end
    
    
    assign s_exp_quotient  = s_dividend / s_divisor;
    assign s_exp_remainder = s_dividend % s_divisor;
    
    jelly_integer_divider
            #(
                .USER_WIDTH         (S_DIVIDEND_WIDTH+S_DIVISOR_WIDTH+M_QUOTIENT_WIDTH+M_REMAINDER_WIDTH),
                .S_DIVIDEND_WIDTH   (S_DIVIDEND_WIDTH),
                .S_DIVISOR_WIDTH    (S_DIVISOR_WIDTH),
                .M_QUOTIENT_WIDTH   (M_QUOTIENT_WIDTH),
                .M_REMAINDER_WIDTH  (M_REMAINDER_WIDTH),
                
                .MASTER_IN_REGS     (MASTER_IN_REGS),
                .MASTER_OUT_REGS    (MASTER_OUT_REGS),
                
                .DEVICE             (DEVICE)
            )
        i_integer_divider
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_user             ({s_dividend, s_divisor, s_exp_quotient, s_exp_remainder}),
                .s_dividend         (s_dividend),
                .s_divisor          (s_divisor),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_user             ({m_src_dividend, m_src_divisor, m_exp_quotient, m_exp_remainder}),
                .m_quotient         (m_quotient),
                .m_remainder        (m_remainder),
                .m_valid            (m_valid),
                .m_ready            (m_ready)
            );
    
    wire    exp_ok   = cke && m_valid && m_ready && ((m_quotient == m_exp_quotient) || (m_remainder == m_exp_remainder));
    wire    exp_diff = cke && m_valid && m_ready && ((m_quotient != m_exp_quotient) || (m_remainder != m_exp_remainder));
    
    
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
    
    
endmodule


`default_nettype wire


// end of file
