
`timescale 1ns / 1ps
`default_nettype none


module tb_unsigned_multiply_multicycle();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_unsigned_multiply_multicycle.vcd");
        $dumpvars(0, tb_unsigned_multiply_multicycle);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    parameter   DATA_WIDTH = 32;
    
    wire                        cke = 1'b1;
    
    reg     [DATA_WIDTH-1:0]    s_data0 = 7;
    reg     [DATA_WIDTH-1:0]    s_data1 = 2;
    reg                         s_valid = 1;
    wire                        s_ready;
    
    wire    [2*DATA_WIDTH-1:0]  m_data;
    wire                        m_valid;
    wire                        m_ready = 1'b1;
    
    wire    [2*DATA_WIDTH-1:0]  exp_data = s_data0 * s_data1;
    
    always @(posedge clk) begin
        if ( s_valid & s_ready ) begin
            s_data0 <= {$random()};
            s_data1 <= {$random()} + 1;
        end
        
        if ( m_valid & m_ready ) begin
//          $display("%d", m_data);
        end
    end
    
    jelly_unsigned_multiply_multicycle
            #(
                .DATA_WIDTH0    (DATA_WIDTH),
                .DATA_WIDTH1    (DATA_WIDTH)
            )
        i_unsigned_multiply_multicycle
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (s_data0),
                .s_data1        (s_data1),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         (m_data),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
