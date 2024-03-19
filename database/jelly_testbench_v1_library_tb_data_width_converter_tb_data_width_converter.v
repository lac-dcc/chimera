
`timescale 1ns / 1ps
`default_nettype none


module tb_data_width_converter();
    localparam RATE = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_data_width_converter.vcd");
        $dumpvars(0, tb_data_width_converter);
        
        #10000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    localparam  UNIT_WIDTH = 8;
    localparam  DATA0_SIZE = 2;
    localparam  DATA1_SIZE = 5;
//  localparam  DATA1_SIZE = 2;
//  localparam  DATA1_SIZE = 0;
    
    localparam  DATA0_WIDTH = (1 << DATA0_SIZE) * UNIT_WIDTH;
    localparam  DATA1_WIDTH = (1 << DATA1_SIZE) * UNIT_WIDTH;
    
    reg                         cke = 1;
    
    wire                        endian = 1'b0;
    
    reg     [DATA0_WIDTH-1:0]   d0_data;
    reg                         d0_first;
    reg                         d0_last;
    reg                         d0_valid;
    wire                        d0_ready;
    
    reg                         d1_busy;
    
    wire    [DATA1_WIDTH-1:0]   d1_data;
    wire                        d1_first;
    wire                        d1_last;
    wire                        d1_valid;
    wire                        d1_ready;
    
    wire    [DATA0_WIDTH-1:0]   m_data;
    wire                        m_first;
    wire                        m_last;
    wire                        m_valid;
    wire                        m_ready;
    
    
    
    jelly_data_width_converter
            #(
                .UNIT_WIDTH     (UNIT_WIDTH),
                .S_DATA_SIZE    (DATA0_SIZE),
                .M_DATA_SIZE    (DATA1_SIZE)
            )
        i_data_width_converter_0
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .endian         (endian),
                
                .s_data         (d0_data),
                .s_first        (d0_first),
                .s_last         (d0_last),
                .s_valid        (d0_valid),
                .s_ready        (d0_ready),
                
                .m_data         (d1_data),
                .m_first        (d1_first),
                .m_last         (d1_last),
                .m_valid        (d1_valid),
                .m_ready        (d1_ready & !d1_busy)
            );
    
    jelly_data_width_converter
            #(
                .UNIT_WIDTH     (UNIT_WIDTH),
                .S_DATA_SIZE    (DATA1_SIZE),
                .M_DATA_SIZE    (DATA0_SIZE)
            )
        i_data_width_converter_1
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .endian         (endian),
                
                .s_data         (d1_data),
                .s_first        (d1_first),
                .s_last         (d1_last),
                .s_valid        (d1_valid & !d1_busy),
                .s_ready        (d1_ready),
                
                .m_data         (m_data),
                .m_first        (m_first),
                .m_last         (m_last),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    // busy
    always @(posedge clk) begin
        if ( reset ) begin
            cke     <= 1'b1;
            d1_busy <= 1'b0;
        end
        else begin
            cke     <= {$random};
            if ( !(d1_valid & !d1_busy) || d1_ready ) begin
                d1_busy <= {$random};
            end
        end
    end
        
    // write
    always @(posedge clk) begin
        if ( reset ) begin
            d0_data   <= 0;
            d0_first  <= 1'b1;
            d0_last   <= 1'b0;
            d0_valid  <= 1'b0;
        end
        else if( cke ) begin
            if ( !(d0_valid && !d0_ready) ) begin
                d0_valid <= {$random};
            end
            
            if ( d0_valid && d0_ready ) begin
                d0_data  <= d0_data + 1'b1;
                d0_first <= ((d0_data + 1'b1) % 16 == 0);
                d0_last  <= ((d0_data + 1'b1) % 16 == 15);
            end
        end
    end
    
    
    // read
    integer     fp;
    initial begin
        fp = $fopen("log.txt", "w");
    end
    
    reg     [DATA0_WIDTH-1:0]   reg_expectation_value;
    reg                         reg_ready;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_expectation_value  <= 0;
            reg_ready              <= 1'b0;
        end
        else if( cke ) begin
            reg_ready <= {$random};
            
            if ( m_valid && m_ready ) begin
                $fdisplay(fp, "exp:%h data:%h first:%b last:%b", reg_expectation_value, m_data, m_first, m_last);
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
