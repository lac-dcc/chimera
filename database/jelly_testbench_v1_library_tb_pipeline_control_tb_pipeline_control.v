// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_pipeline_control();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_pipeline_control.vcd");
        $dumpvars(0, tb_pipeline_control);
        
        #100000;
            $display("Timeout");
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    localparam  DATA_WIDTH = 16;
    
    reg                             cke = 1;
    always @(posedge clk) begin
        cke <= {$random};
    end
    
    
    wire    [DATA_WIDTH-1:0]        s_data;
    wire                            s_valid;
    wire                            s_ready;
    
    wire    [DATA_WIDTH-1:0]        m_data;
    wire                            m_valid;
    wire                            m_ready;
    
    wire    [2:0]                   stage_cke;
    wire    [2:0]                   stage_valid;
    wire    [2:0]                   next_valid;
    wire    [DATA_WIDTH-1:0]        src_data;
    wire                            src_valid;
    wire    [DATA_WIDTH-1:0]        sink_data;
    wire                            buffered;
    
    jelly_pipeline_control
            #(
                .PIPELINE_STAGES    (3),
    //          .AUTO_VALID         (1),
                .S_DATA_WIDTH       (DATA_WIDTH),
                .M_DATA_WIDTH       (DATA_WIDTH),
                .MASTER_IN_REGS     (1'b1),
                .MASTER_OUT_REGS    (1'b1)
            )
        i_pipeline_control
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             (s_valid ? s_data : {DATA_WIDTH{1'bx}}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             (m_data),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .stage_cke          (stage_cke),
                .stage_valid        (stage_valid),
                .next_valid         (next_valid),
                .src_data           (src_data),
                .src_valid          (src_valid),
                .sink_data          (sink_data),
                .buffered           (buffered)
            );
    
    assign next_valid[0] = src_valid;
    assign next_valid[1] = stage_valid[0];
    assign next_valid[2] = stage_valid[1];
    
    
    reg     [DATA_WIDTH-1:0]    st0_data;
    reg     [DATA_WIDTH-1:0]    st1_data;
    reg     [DATA_WIDTH-1:0]    st2_data;
    always @(posedge clk) begin
        if ( stage_cke[0] ) begin st0_data <= src_data; end
        if ( stage_cke[1] ) begin st1_data <= st0_data; end
        if ( stage_cke[2] ) begin st2_data <= st1_data; end
    end
    assign sink_data = st2_data;
    
    
    // write
    reg     [DATA_WIDTH-1:0]    reg_data;
    reg                         reg_valid;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_data  <= 0;
            reg_valid <= 1'b0;
        end
        else if ( cke ) begin
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
    always @(posedge clk) begin
        if ( reset ) begin
            reg_expectation_value  <= 0;
            reg_ready              <= 1'b0;
        end
        else if ( cke ) begin
            reg_ready <= {$random};
            
            if ( m_valid && m_ready ) begin
                if ( m_data != reg_expectation_value ) begin
                    $display("error:%h", m_data);
                end
                
                if ( reg_expectation_value > 1000 ) begin
                    $display("OK");
                    $finish;
                end
                
                reg_expectation_value <= reg_expectation_value + 1'b1;
            end
        end
    end
    assign m_ready = reg_ready;
    
endmodule


`default_nettype wire


// end of file
