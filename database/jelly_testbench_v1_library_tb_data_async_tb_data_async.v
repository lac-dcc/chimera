
`timescale 1ns / 1ps
`default_nettype none


module tb_data_async();
    localparam S_RATE    = 1000.0/200.0;
    localparam M_RATE    = 1000.0/21.7;
    
    initial begin
        $dumpfile("tb_data_async.vcd");
        $dumpvars(0, tb_data_async);
        
        #100000;
            $finish;
    end
    
    reg     s_clk = 1'b1;
    always #(S_RATE/2.0)    s_clk = ~s_clk;
    
    reg     m_clk = 1'b1;
    always #(M_RATE/2.0)    m_clk = ~m_clk;
    
    reg     reset = 1'b1;
    initial #(S_RATE*100)   reset = 1'b0;
    
    
    localparam  DATA_WIDTH = 16;
    
    wire    [DATA_WIDTH-1:0]    s_data;
    wire                        s_valid;
    wire                        s_ready;
    
    wire    [DATA_WIDTH-1:0]    m_data;
    wire                        m_valid;
    wire                        m_ready;
    
    jelly_data_async
            #(
                .DATA_WIDTH     (DATA_WIDTH)
            )
        i_data_async
            (
                .s_reset        (reset),
                .s_clk          (s_clk),
                .s_data         (s_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_reset        (reset),
                .m_clk          (m_clk),
                .m_data         (m_data),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    
    // write
    reg     [DATA_WIDTH-1:0]    reg_data;
    reg                         reg_valid;
    always @(posedge s_clk) begin
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
    always @(posedge m_clk) begin
        if ( reset ) begin
            reg_expectation_value  <= 0;
            reg_ready              <= 1'b0;
        end
        else begin
            reg_ready <= {$random};
            
            if ( m_valid && m_ready ) begin
                if ( m_data != reg_expectation_value ) begin
                    $display("error!");
                end
                
                reg_expectation_value <= reg_expectation_value + 1'b1;
            end
        end
    end
    assign m_ready = reg_ready;
    
    
    
    
    
    reg     [7:0]       reg_puls_count = 0;
    always @(posedge s_clk) begin
        reg_puls_count <= reg_puls_count + 1;
    end
    
    wire                pulse_async;
    
    jelly_pulse_async
        i_pulse_async
            (
                .s_reset    (reset),
                .s_clk      (s_clk),
                .s_pulse    (1), // reg_puls_count == 0),
                
                .m_reset    (reset),
                .m_clk      (m_clk),
                .m_pulse    (pulse_async)
            );
    
    
    
    
    
endmodule


`default_nettype wire


// end of file
