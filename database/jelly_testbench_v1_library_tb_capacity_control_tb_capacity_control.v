// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_capacity_control();
    localparam RATE = 1000.0/20.0;
    
    initial begin
        $dumpfile("tb_capacity_control.vcd");
        $dumpvars(0, tb_capacity_control);
        
        #1000000;
//          $finish;
    end
    
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    reg     cke = 1'b1;
    
    
    
    parameter   CAPACITY_WIDTH      = 32;
    parameter   REQUEST_WIDTH       = 8;
    parameter   CHARGE_WIDTH        = 8;
    parameter   ISSUE_WIDTH         = CAPACITY_WIDTH;
    parameter   REQUEST_SIZE_OFFSET = 1'b0;
    parameter   CHARGE_SIZE_OFFSET  = 1'b1;
    parameter   ISSUE_SIZE_OFFSET   = 1'b0;
    parameter   INIT_CAPACITY       = {CAPACITY_WIDTH{1'b0}};
    parameter   INIT_REQUEST        = {CAPACITY_WIDTH{1'b0}};
    
    
    integer                         i = 0;
    
    wire    [CAPACITY_WIDTH-1:0]    initial_capacity = 0;
    wire    [CAPACITY_WIDTH-1:0]    initial_request  = 0;
    
    wire    [CAPACITY_WIDTH-1:0]    current_capacity;
    wire    [CAPACITY_WIDTH-1:0]    queued_request;
    
    reg     [REQUEST_WIDTH-1:0]     s_request_size  = 0;
    reg                             s_request_valid = 0;

    reg     [CHARGE_WIDTH-1:0]      s_charge_size = 0;
    reg                             s_charge_valid = 0;
    
    wire    [ISSUE_WIDTH-1:0]       m_issue_size;
    wire                            m_issue_valid;
    reg                             m_issue_ready = 1;
    
    
    jelly_capacity_control
            #(
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .REQUEST_WIDTH          (REQUEST_WIDTH),
                .CHARGE_WIDTH           (CHARGE_WIDTH),
                .ISSUE_WIDTH            (ISSUE_WIDTH),
                .REQUEST_SIZE_OFFSET    (REQUEST_SIZE_OFFSET),
                .CHARGE_SIZE_OFFSET     (CHARGE_SIZE_OFFSET),
                .ISSUE_SIZE_OFFSET      (ISSUE_SIZE_OFFSET)
//                .INIT_CAPACITY          (INIT_CAPACITY),
//                .INIT_REQUEST           (INIT_REQUEST)
            )
        i_capacity_control
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .initial_capacity       (initial_capacity),
                .initial_request        (initial_request),
                
                .current_capacity       (current_capacity),
                .queued_request         (queued_request),
                
                .s_request_size         (s_request_size),
                .s_request_valid        (s_request_valid),
                
                .s_charge_size          (s_charge_size),
                .s_charge_valid         (s_charge_valid),
                
                .m_issue_size           (m_issue_size),
                .m_issue_valid          (m_issue_valid),
                .m_issue_ready          (m_issue_ready)
            );
    
    
    integer     req_rate = 2;
    integer     chg_rate = 2;
    
    integer     counter_request = 0;
    integer     counter_charge  = 0;
    integer     counter_issue   = 0;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_request_size  <= 0;
            s_request_valid <= 0;
            s_charge_size   <= 0;
            s_charge_valid  <= 0;
            m_issue_ready   <= 0;
        end
        else if ( cke ) begin
            i = i + 1;
            if ( (i % 1000) < 800 ) begin
                s_request_size  <= {$random()} & 32'hff;
                s_request_valid <= ({$random()} % req_rate == 0);
                s_charge_size   <= {$random()} & 32'hff;
                s_charge_valid  <= ({$random()} % chg_rate == 0);
                m_issue_ready   <= {$random()};
            end
            else begin
                s_request_valid <= 1'b0;
                s_charge_valid  <= 1'b0;
                m_issue_ready   <= 1'b1;
            end
            
            if ( (i % 1000) == 990 ) begin
                $display("counter_request  = %d", counter_request);
                $display("counter_charge   = %d", counter_charge);
                $display("counter_issue    = %d", counter_issue);
                $display("current_capacity = %d", current_capacity);
                $display("queued_request   = %d", queued_request);
                if ( counter_issue + current_capacity == counter_charge
                  && counter_issue + queued_request   == counter_request ) begin
                    $display("OK");
                end
                else begin
                    $display("!!!!NG!!!!");
                    $stop();
                end
                
                if ( (i / 1000) < 3 ) begin
                    req_rate = 2;
                    chg_rate = 3;
                end
                else begin
                    req_rate = 3;
                    chg_rate = 2;
                end
            end
            
            if ( s_request_valid ) begin
                counter_request = counter_request + s_request_size + REQUEST_SIZE_OFFSET;
            end
            
            if ( s_charge_valid ) begin
                counter_charge = counter_charge + s_charge_size + CHARGE_SIZE_OFFSET;
            end
            
            if ( m_issue_valid && m_issue_ready ) begin
                counter_issue = counter_issue + m_issue_size + ISSUE_SIZE_OFFSET;
            end
            
            if ( i / 1000 >= 10 ) begin
                $finish();
            end
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
