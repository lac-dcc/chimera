
`timescale 1ns / 1ps
`default_nettype none


module tb_capacity_async();
    localparam S_RATE = 1000.0/200.0;
//  localparam M_RATE = 1000.0/150.1;
    localparam M_RATE = 1000.0/1500.1;
    
    initial begin
        $dumpfile("tb_capacity_async.vcd");
        $dumpvars(0, tb_capacity_async);
        
//      #100000;
//         $finish;
    end
    
    
    reg     s_clk = 1'b1;
    always #(S_RATE/2.0)  s_clk = ~s_clk;
    
    reg     m_clk = 1'b1;
    always #(M_RATE/2.0)  m_clk = ~m_clk;
    
    reg     reset = 1'b1;
    initial #(S_RATE*100) reset = 1'b0;
    
    
    
    parameter   ASYNC               = 1;
    parameter   CAPACITY_WIDTH      = 32;
    parameter   REQUEST_WIDTH       = CAPACITY_WIDTH;
    parameter   ISSUE_WIDTH         = CAPACITY_WIDTH;
    parameter   REQUEST_SIZE_OFFSET = 1'b0;
    parameter   ISSUE_SIZE_OFFSET   = 1'b0;
    parameter   INIT_REQUEST        = {CAPACITY_WIDTH{1'b0}};
    
    reg     [REQUEST_WIDTH-1:0]     s_request_size  = 0;
    reg                             s_request_valid = 0;
    wire    [CAPACITY_WIDTH-1:0]    s_queued_request;
    
    wire    [ISSUE_WIDTH-1:0]       m_issue_size;
    wire                            m_issue_valid;
    reg                             m_issue_ready = 1;
    wire    [CAPACITY_WIDTH-1:0]    m_queued_request;
    
    jelly_capacity_async
            #(
                .ASYNC                  (ASYNC),
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .REQUEST_WIDTH          (REQUEST_WIDTH),
                .ISSUE_WIDTH            (ISSUE_WIDTH),
                .REQUEST_SIZE_OFFSET    (REQUEST_SIZE_OFFSET),
                .ISSUE_SIZE_OFFSET      (ISSUE_SIZE_OFFSET),
                .INIT_REQUEST           (INIT_REQUEST)
            )
        i_capacity_async
            (
                .s_reset                (reset),
                .s_clk                  (s_clk),
                .s_request_size         (s_request_size),
                .s_request_valid        (s_request_valid),
                .s_queued_request       (s_queued_request),
                
                .m_reset                (reset),
                .m_clk                  (m_clk),
                .m_issue_size           (m_issue_size),
                .m_issue_valid          (m_issue_valid),
                .m_issue_ready          (m_issue_ready),
                .m_queued_request       (m_queued_request)
            );
    
    integer     i = 0;
    
    integer     request_count = 0;
    integer     issue_count   = 0;
    
    always @(posedge s_clk) begin
        if ( reset ) begin
            s_request_size  <= 0;
            s_request_valid <= 0;
        end
        else begin
            i = i + 1;
            if ( i < 2000 ) begin
                s_request_size  <= {$random()} & 32'hff;
                s_request_valid <= ({$random()} % 2 == 0);
            end
            else begin
                s_request_valid <= 1'b0;
            end
            
            
            if ( s_request_valid ) begin
                request_count = request_count + s_request_size + REQUEST_SIZE_OFFSET;
            end
            
            if ( i > 3000 ) begin
                $display("request_count = %d, issue_count=%d", request_count, issue_count);
                if ( request_count == issue_count ) begin
                    $display("OK");
                end
                else begin
                    $display("NG");
                end
                
                $finish();
            end
        end
    end
    
    always @(posedge m_clk) begin
        if ( reset ) begin
            m_issue_ready <= 0;
        end
        else begin
            m_issue_ready <= {$random()};
            
            if ( m_issue_valid && m_issue_ready ) begin
                issue_count = issue_count + m_issue_size + ISSUE_SIZE_OFFSET;
            end
        end
    end
    
    
    
endmodule


`default_nettype wire


// end of file
