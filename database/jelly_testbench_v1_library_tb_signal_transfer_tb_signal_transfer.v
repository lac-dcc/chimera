
`timescale 1ns / 1ps
`default_nettype none


module tb_signal_transfer();
    localparam S_RATE  = 1000.0/200.0;
    localparam M_RATE  = 1000.0/200.0;
    
    
    initial begin
        $dumpfile("tb_signal_transfer.vcd");
        $dumpvars(0, tb_signal_transfer);
    
    #1000000
        $finish;
    end
    
    
    reg     s_clk = 1'b1;
    always #(S_RATE/2.0)    s_clk = ~s_clk;
    
    reg     s_reset = 1'b1;
    initial #(S_RATE*100)   s_reset <= 1'b0;
    
    reg     m_clk = 1'b1;
    always #(M_RATE/2.0)    m_clk = ~m_clk;
    
    reg     m_reset = 1'b1;
    initial #(M_RATE*100)   m_reset <= 1'b0;
    
    
    
    parameter   ASYNC          = 1;
    parameter   CAPACITY_WIDTH = 8;
    
    reg     enable = 1;
    
    reg     s_valid;
    
    wire    m_valid;
    reg     m_ready;
    
    jelly_signal_transfer
            #(
                .ASYNC          (ASYNC),
                .CAPACITY_WIDTH (CAPACITY_WIDTH)
            )
        i_signal_transfer
            (
                .s_reset        (s_reset),
                .s_clk          (s_clk),
                .s_valid        (s_valid),
                
                .m_reset        (m_reset),
                .m_clk          (m_clk),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    integer     count_s;
    always @(posedge s_clk) begin
        if ( s_reset ) begin
            s_valid <= 1'b0;
            count_s <= 0;
        end
        else begin
            s_valid <= {$random()} & enable;
            
            count_s <= count_s + s_valid;
        end
    end
    
    integer     count_m;
    always @(posedge m_clk) begin
        if ( m_reset ) begin
            m_ready <= 1'b0;
            count_m <= 0;
        end
        else begin
            m_ready <= {$random()};
            
            count_m <= count_m + (m_valid & m_ready);
        end
    end
    
    initial begin
        #100000;
        enable = 0;
        #10000;
        $finish();
    end
    
    
    
endmodule


`default_nettype wire


// end of file
