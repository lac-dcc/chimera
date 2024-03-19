
`timescale 1ns / 1ps
`default_nettype none


module tb_fifo_fwft();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_fifo_fwft.vcd");
        $dumpvars(0, tb_fifo_fwft);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    localparam  DATA_WIDTH = 16;
    localparam  PTR_WIDTH  = 4;
    
    wire    [DATA_WIDTH-1:0]    s_data;
    wire                        s_valid;
    wire                        s_ready;
    wire    [PTR_WIDTH:0]       s_free_count;
    
    wire    [DATA_WIDTH-1:0]    m_data;
    wire                        m_valid;
    wire                        m_ready;
    wire    [PTR_WIDTH:0]       m_data_count;
    
    jelly_fifo_fwtf
//  jelly_fifo_fwtf2
            #(
                .DATA_WIDTH     (DATA_WIDTH),
                .PTR_WIDTH      (PTR_WIDTH),
                .DOUT_REGS      (0),
                .RAM_TYPE       ("distributed"),
                .LOW_DEALY      (1),
                .MASTER_REGS    (0)
            )
        i_fifo_fwtf
            (
                .reset          (reset),
                .clk            (clk),
                
                .s_data         (s_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                .s_free_count   (s_free_count),
                
                .m_data         (m_data),
                .m_valid        (m_valid),
                .m_ready        (m_ready),
                .m_data_count   (m_data_count)
            );
    
    // 連続性テスト
    /*
    reg     [DATA_WIDTH-1:0]    reg_data  = 0;
    reg                         reg_valid = 0;
    reg                         reg_ready = 0;
    
    assign s_data  = reg_data;
    assign s_valid = reg_valid;
    assign m_ready = reg_ready;
    
    localparam  TEST_SIZE = 8;
    integer i;
    
    initial begin
        #(RATE*200);
        
        while ( 1 ) begin
            reg_data = 0;
            while ( s_data < TEST_SIZE ) begin
                @(negedge clk);
                if ( s_valid && s_ready ) begin reg_data = reg_data + 1; end
                
                if ( !s_valid || s_ready ) begin
                    reg_valid = {$random};
                end
            end
            reg_valid = 1'b0;
            
            for ( i = 0; i < 16; i = i+1 ) begin
                @(negedge clk);
            end
            
            reg_ready = 1'b1;
            for ( i = 0; i < TEST_SIZE; i = i+1 ) begin
                @(negedge clk);
            end
            reg_ready = 1'b0;
            
            for ( i = 0; i < 16; i = i+1 ) begin
                @(negedge clk);
            end
        end
    end
    */
    
    
    // ランダムテスト
    
    // write
    reg     [DATA_WIDTH-1:0]    reg_data;
    reg                         reg_valid;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_data  <= 0;
            reg_valid <= 1'b0;
        end
        else begin
            if ( !(s_valid && !s_ready) ) begin
                reg_valid <= {$random};
            end
            
            if ( s_valid && s_ready ) begin
                reg_data <= reg_data + 1'b1;
            end
        end
    end
    assign s_data  = reg_data;
    assign s_valid = reg_valid;
    
    
    // read
    reg     [DATA_WIDTH-1:0]    reg_expectation_value;
    reg                         reg_ready;
    reg                         reg_error;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_expectation_value  <= 0;
            reg_ready              <= 1'b0;
        end
        else begin
            reg_ready <= {$random};
            
            if ( m_valid && m_ready ) begin
                reg_error <= 1'b0;
                if ( m_data != reg_expectation_value ) begin
                    $display("error!");
                    reg_error <= 1'b1;
                end
                
                reg_expectation_value <= reg_expectation_value + 1'b1;
            end
        end
    end
    assign m_ready = reg_ready;
    
    
    
endmodule


`default_nettype wire


// end of file
