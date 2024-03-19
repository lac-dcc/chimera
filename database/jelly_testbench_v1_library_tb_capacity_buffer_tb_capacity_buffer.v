
`timescale 1ns / 1ps
`default_nettype none


module tb_capacity_buffer();
    localparam RATE = 1000.0/20.0;
    
    initial begin
        $dumpfile("tb_capacity_buffer.vcd");
        $dumpvars(0, tb_capacity_buffer);
        
//      #100000;
//         $finish;
    end
    
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    reg     cke = 1'b1;
    
    
    parameter   CAPACITY_WIDTH      = 32;
    parameter   REQUEST_WIDTH       = CAPACITY_WIDTH;
    parameter   ISSUE_WIDTH         = CAPACITY_WIDTH;
    parameter   REQUEST_SIZE_OFFSET = 1'b0;
    parameter   ISSUE_SIZE_OFFSET   = 1'b1;
    parameter   INIT_REQUEST        = {CAPACITY_WIDTH{1'b0}};
    
    
    wire    [CAPACITY_WIDTH-1:0]    queued_request;
    
    reg     [REQUEST_WIDTH-1:0]     s_request_size  = 0;
    reg                             s_request_valid = 0;
    
    wire    [ISSUE_WIDTH-1:0]       m_issue_size;
    wire                            m_issue_valid;
    reg                             m_issue_ready = 1;
    
    jelly_capacity_buffer
            #(
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .REQUEST_WIDTH          (REQUEST_WIDTH),
                .ISSUE_WIDTH            (ISSUE_WIDTH),
                .REQUEST_SIZE_OFFSET    (REQUEST_SIZE_OFFSET),
                .ISSUE_SIZE_OFFSET      (ISSUE_SIZE_OFFSET),
                .INIT_REQUEST           (INIT_REQUEST)
            )
        i_capacity_buffer
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .queued_request         (queued_request),
                
                .s_request_size         (s_request_size),
                .s_request_valid        (s_request_valid),
                
                .m_issue_size           (m_issue_size),
                .m_issue_valid          (m_issue_valid),
                .m_issue_ready          (m_issue_ready)
            );
    
    integer     i = 0;
    
    integer     count_request = 0;
    integer     count_issue   = 0;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_request_size  <= 0;
            s_request_valid <= 0;
            m_issue_ready   <= 0;
        end
        else if ( cke ) begin
            i = i + 1;
            if ( i < 2000 ) begin
                s_request_size  <= {$random()} & 32'hff;
                s_request_valid <= ({$random()} % 10 == 0);
                m_issue_ready   <= {$random()};
            end
            else begin
                s_request_valid <= 1'b0;
                m_issue_ready   <= 1'b1;
            end
            
            
            if ( s_request_valid ) begin
                count_request = count_request + s_request_size + REQUEST_SIZE_OFFSET;
            end
            
            if ( m_issue_valid && m_issue_ready ) begin
                count_issue = count_issue + m_issue_size + ISSUE_SIZE_OFFSET;
            end
            
            if ( i > 5000 ) begin
                $display("count_request = %d, count_issue=%d", count_request, count_issue);
                if ( count_request == count_issue ) begin
                    $display("OK");
                end
                else begin
                    $display("NG");
                end
                
                $finish();
            end
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
