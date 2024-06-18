// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_pipeline_insert_ff();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_pipeline_insert_ff.vcd");
        $dumpvars(0, tb_pipeline_insert_ff);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    localparam  DATA_WIDTH = 16;
    
    wire    [DATA_WIDTH-1:0]    s_data;
    wire                        s_valid;
    wire                        s_ready;
    
    wire    [DATA_WIDTH-1:0]    m_data;
    wire                        m_valid;
    wire                        m_ready;
    
    wire                        buffered;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (DATA_WIDTH),
                .SLAVE_REGS     (1),
                .MASTER_REGS    (1)
            )
        i_pipeline_insert_ff
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_data         (s_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         (m_data),
                .m_valid        (m_valid),
                .m_ready        (m_ready),
                
                .buffered       (buffered)
            );
    
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
    integer     fp;
    initial begin
        fp = $fopen("log.txt", "w");
    end
    
    reg     [DATA_WIDTH-1:0]    reg_expectation_value;
    reg                         reg_ready;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_expectation_value  <= 0;
            reg_ready              <= 1'b0;
        end
        else begin
            reg_ready <= {$random};
            
            if ( m_valid && m_ready ) begin
                $fdisplay(fp, "%h %h", m_data, reg_expectation_value);
                if ( m_data != reg_expectation_value ) begin
                    $display("error!");
                end
                
                reg_expectation_value <= reg_expectation_value + 1'b1;
            end
        end
    end
    assign m_ready = reg_ready;
    
endmodule


`default_nettype wire


// end of file
