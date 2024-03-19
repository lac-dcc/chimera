
`timescale 1ns / 1ps
`default_nettype none


module tb_data_multiplexer();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_data_multiplexer.vcd");
        $dumpvars(0, tb_data_multiplexer);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    parameter   NUM        = 5;
    parameter   DATA_WIDTH = 8;
    
    reg     [DATA_WIDTH-1:0]            src_data;
    reg                                 src_valid;
    wire                                src_ready;
    
    wire    [NUM*DATA_WIDTH-1:0]        port_data;
    wire                                port_valid;
    wire                                port_ready;
    
    wire    [DATA_WIDTH-1:0]            sink_data;
    wire                                sink_valid;
    reg                                 sink_ready = 1;
    
    always @(posedge clk) begin
        sink_ready <= {$random};
    end
    
    jelly_data_demultiplexer
            #(
                .NUM            (NUM),
                .DATA_WIDTH     (DATA_WIDTH)
            )
        i_data_demultiplexer
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1),
                
                .endian         (0),
                
                .s_data         (src_data),
                .s_valid        (src_valid),
                .s_ready        (src_ready),
                
                .m_data         (port_data),
                .m_valid        (port_valid),
                .m_ready        (port_ready)
            );
    
    jelly_data_multiplexer
            #(
                .NUM            (NUM),
                .DATA_WIDTH     (DATA_WIDTH)
            )
        i_data_multiplexer
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1),
                
                .endian         (0),
                
                .s_data         (port_data),
                .s_valid        (port_valid),
                .s_ready        (port_ready),
                
                .m_data         (sink_data),
                .m_valid        (sink_valid),
                .m_ready        (sink_ready)
            );
    
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            src_data  <= 0;
            src_valid <= 0;
        end
        else begin
            if ( src_valid && src_ready ) begin
                src_data <= src_data + 1;
            end
            
            if ( !src_valid || src_ready ) begin
                src_valid <= {$random};
            end
        end
    end
    
    
    reg     [DATA_WIDTH-1:0]    exp_data;
    always @(posedge clk) begin
        if ( reset ) begin
            exp_data <= 0;
        end
        else begin
            if ( sink_valid && sink_ready ) begin
                if ( sink_data != exp_data ) begin
                    $display("Error!");
                end
    //          $display("%h", sink_data);
                exp_data <= exp_data + 1;
            end
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
