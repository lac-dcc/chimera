// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_unsigned_alpha_blend();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_unsigned_alpha_blend.vcd");
        $dumpvars(0, tb_unsigned_alpha_blend);
        
        #10000;
            $finish;
    end
    
    parameter   RAND_BUSY = 1;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0)      clk = ~clk;
    
    reg     cke = 1'b1;
    always @(posedge clk)   cke <= RAND_BUSY ? {$random} : 1'b1;
    
    parameter   ALPHA_WIDTH = 8;
    parameter   DATA_WIDTH  = 12;
    parameter   USER_WIDTH  = 12;
    parameter   M_REGS      = 1;
    
    
    reg     [ALPHA_WIDTH-1:0]   s_alpha;
    reg     [DATA_WIDTH-1:0]    s_data0;
    reg     [DATA_WIDTH-1:0]    s_data1;
    reg     [USER_WIDTH-1:0]    s_user;
    reg                         s_valid;
    wire                        s_ready;
    
    wire    [DATA_WIDTH-1:0]    m_data;
    wire    [USER_WIDTH-1:0]    m_user;
    wire                        m_valid;
    reg                         m_ready = 1'b1;
    
    real                        s_real_alpha;
    real                        s_real_data;
    reg     [DATA_WIDTH-1:0]    s_exp_data;
    always @* begin
        s_real_alpha = $itor(s_alpha) / $itor({ALPHA_WIDTH{1'b1}});
        s_real_data  = $itor(s_data0) * s_real_alpha + $itor(s_data1) * (1.0 -s_real_alpha);
        s_exp_data   = $rtoi(s_real_data + 0.5);
    end
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_valid <= 1'b0;
        end
        else if ( cke ) begin
            if ( !s_valid || s_ready ) begin
                s_alpha <= {$random()};
                s_data0 <= {$random()};
                s_data1 <= {$random()};
                s_valid <= RAND_BUSY ? {$random()} : 1'b1;
            end
            
            m_ready  <= RAND_BUSY ? {$random()} : 1'b1;
        end
    end
    
    
    jelly_unsigned_alpha_blend
            #(
                .ALPHA_WIDTH    (ALPHA_WIDTH),
                .DATA_WIDTH     (DATA_WIDTH),
                .USER_WIDTH     (USER_WIDTH),
                .M_REGS         (M_REGS)
            )
        jelly_unsigned_alpha_blend
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_alpha        (s_alpha),
                .s_data0        (s_data0),
                .s_data1        (s_data1),
                .s_user         (s_exp_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         (m_data),
                .m_user         (m_user),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    wire    exp_eq = (m_data == m_user);
    
endmodule


`default_nettype wire


// end of file
