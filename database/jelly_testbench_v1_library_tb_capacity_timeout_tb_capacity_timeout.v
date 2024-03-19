
`timescale 1ns / 1ps
`default_nettype none


module tb_capacity_timeout();
    localparam RATE = 1000.0/20.0;
    
    initial begin
        $dumpfile("tb_capacity_timeout.vcd");
        $dumpvars(0, tb_capacity_timeout);
        
//      #100000;
//         $finish;
    end
    
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    reg     cke = 1'b1;
    
    
    parameter   TIMER_WIDTH         = 8;
    parameter   CAPACITY_WIDTH      = 32;
    parameter   REQUEST_WIDTH       = CAPACITY_WIDTH;
    parameter   ISSUE_WIDTH         = 8;
    parameter   REQUEST_SIZE_OFFSET = 1'b0;
    parameter   ISSUE_SIZE_OFFSET   = 1'b1;
    parameter   INIT_REQUEST        = {CAPACITY_WIDTH{1'b0}};
    
    
    reg     [ISSUE_WIDTH-1:0]       max_issue_size = 8'h7f;
    wire    [TIMER_WIDTH-1:0]       timeout        = 8'h0f;
    wire    [CAPACITY_WIDTH-1:0]    queued_request;
    wire    [TIMER_WIDTH-1:0]       current_timer;
    
    reg     [REQUEST_WIDTH-1:0]     s_request_size  = 0;
    reg                             s_request_valid = 0;
    
    wire    [ISSUE_WIDTH-1:0]       m_issue_size;
    wire                            m_issue_valid;
    reg                             m_issue_ready = 1;
    
    jelly_capacity_timeout
            #(
                .TIMER_WIDTH            (TIMER_WIDTH),
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .REQUEST_WIDTH          (REQUEST_WIDTH),
                .ISSUE_WIDTH            (ISSUE_WIDTH),
                .REQUEST_SIZE_OFFSET    (REQUEST_SIZE_OFFSET),
                .ISSUE_SIZE_OFFSET      (ISSUE_SIZE_OFFSET),
                .INIT_REQUEST           (INIT_REQUEST)
            )
        i_capacity_timeout
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .max_issue_size         (max_issue_size),
                .timeout                (timeout),
                
                .queued_request         (queued_request),
                .current_timer          (current_timer),
                
                .s_request_size         (s_request_size),
                .s_request_valid        (s_request_valid),
                
                .m_issue_size           (m_issue_size),
                .m_issue_valid          (m_issue_valid),
                .m_issue_ready          (m_issue_ready)
            );
    
    integer     i = 0;
    
    integer     request_count = 0;
    integer     issue_count   = 0;
    
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
                request_count = request_count + s_request_size + REQUEST_SIZE_OFFSET;
            end
            
            if ( m_issue_valid && m_issue_ready ) begin
                issue_count = issue_count + m_issue_size + ISSUE_SIZE_OFFSET;
            end
            
            if ( i > 5000 ) begin
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
    
    
endmodule


`default_nettype wire


// end of file
