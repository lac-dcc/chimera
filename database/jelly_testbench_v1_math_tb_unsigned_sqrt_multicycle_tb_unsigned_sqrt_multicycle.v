
`timescale 1ns / 1ps
`default_nettype none


module tb_unsigned_sqrt_multicycle();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_unsigned_sqrt_multicycle.vcd");
        $dumpvars(0, tb_unsigned_sqrt_multicycle);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    parameter   DATA_WIDTH = 32;
    
    wire                        cke = 1'b1;
    
    reg     [2*DATA_WIDTH-1:0]  s_data  = 0;
    reg                         s_valid = 1;
    wire                        s_ready;
    
    wire    [DATA_WIDTH-1:0]    m_data;
    wire                        m_valid;
    wire                        m_ready = 1'b1;
    
    integer                     n = 0;
    always @(posedge clk) begin
        if ( s_valid & s_ready ) begin
            s_data <= n * n;
            n <= n+1;
        end
        
        if ( m_valid & m_ready ) begin
            $display("%d", m_data);
        end
    end
    
    // マルチサイクル平方根
    jelly_unsigned_sqrt_multicycle
            #(
                .DATA_WIDTH     (DATA_WIDTH)
            )
        i_unsigned_sqrt_multicycle
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                                 
                .s_data         (s_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                                 
                .m_data         (m_data),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
