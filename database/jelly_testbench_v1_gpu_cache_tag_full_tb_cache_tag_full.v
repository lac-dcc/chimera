
`timescale 1ns / 1ps
`default_nettype none


module tb_cache_tag_full();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_cache_tag_full.vcd");
        $dumpvars(0, tb_cache_tag_full);
        
        #1000000;
            $display("!!!!TIME OUT!!!!");
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    
    parameter   ADDR_WIDTH = 12;
    parameter   TAG_WIDTH  = 2;
    
    reg                         cke = 1;
    
    reg     [ADDR_WIDTH-1:0]    s_addr;
    reg                         s_valid;
    
    wire    [ADDR_WIDTH-1:0]    m_addr;
    wire    [TAG_WIDTH-1:0]     m_tag;
    wire                        m_hit;
    wire                        m_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_addr  <= {ADDR_WIDTH{1'b0}};
            s_valid <= 1'b0;
        end
        else if ( cke ) begin
            s_addr[TAG_WIDTH:0] <= {$random()}; // s_addr[TAG_WIDTH:0] + 1;
            s_valid             <= 1'b1;
        end
    end
    
    jelly_cache_tag_full
            #(
                .USER_WIDTH     (0),
                .ADDR_WIDTH     (ADDR_WIDTH),
                .TAG_WIDTH      (TAG_WIDTH)
            )
        i_cache_tag_full
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (),
                .s_addr         (s_addr),
                .s_valid        (s_valid),
                
                .m_user         (),
                .m_addr         (m_addr),
                .m_tag          (m_tag),
                .m_hit          (m_hit),
                .m_valid        (m_valid)
            );
    
    
    
endmodule


`default_nettype wire


// end of file
