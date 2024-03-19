
`timescale 1ns / 1ps
`default_nettype none


module tb_address_generator_range();
    localparam RATE = 1000.0/20.0;
    
    initial begin
        $dumpfile("tb_address_generator_range.vcd");
        $dumpvars(0, tb_address_generator_range);
        
//      #100000;
//         $finish;
    end
    
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    reg     cke = 1'b1;
    
    
    parameter   SIZE_WIDTH  = 8;
    parameter   LEN_WIDTH   = 4;
    parameter   SIZE_OFFSET = 1'b0;
    parameter   LEN_OFFSET  = 1'b1;
    parameter   S_REGS      = 1'b1;
    parameter   INIT_ADDR   = 0;
    
    wire    [SIZE_WIDTH-1:0]    param_size = 33;
    
    reg     [LEN_WIDTH-1:0]     s_len;
    reg                         s_valid;
    wire                        s_ready;
    
    wire    [SIZE_WIDTH-1:0]    m_addr;
    wire    [LEN_WIDTH-1:0]     m_len;
    wire                        m_valid;
    reg                         m_ready;
    
    jelly_address_generator_range
            #(
                .SIZE_WIDTH     (SIZE_WIDTH),
                .LEN_WIDTH      (LEN_WIDTH),
                .SIZE_OFFSET    (SIZE_OFFSET),
                .LEN_OFFSET     (LEN_OFFSET),
                .S_REGS         (S_REGS),
                .INIT_ADDR      (INIT_ADDR)
            )
        i_address_generator_range
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .param_size     (param_size),
                
                .s_len          (s_len),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_addr         (m_addr),
                .m_len          (m_len),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    
    integer     i = 0;
    
    integer     count_s_size  = 0;
    integer     count_m_size  = 0;
    wire    [SIZE_WIDTH-1:0]    exp_addr = count_m_size % (param_size + SIZE_OFFSET);
    reg                         err = 0;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_valid <= 0;
            m_ready <= 0;
        end
        else if ( cke ) begin
            i = i + 1;
            if ( i < 1000 ) begin
                s_len   <= {$random()};
                s_valid <= {$random()};
                m_ready <= {$random()};
            end
            else begin
                s_valid <= 1'b0;
                m_ready <= 1'b1;
            end
            
            if ( s_valid && s_ready ) begin
                count_s_size = count_s_size + s_len + LEN_OFFSET;
            end
            
            err = 0;
            if ( m_valid && m_ready ) begin
                count_m_size = count_m_size + m_len + LEN_OFFSET;
                if ( m_addr != exp_addr || {1'b0, m_addr} + m_len + LEN_OFFSET > {1'b0, param_size} + SIZE_OFFSET ) begin
                    $display("error");
                    err = 1;
                end
            end
            
            if ( i > 2000 ) begin
                $finish();
            end
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
