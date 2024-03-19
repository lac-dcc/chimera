
`timescale 1ns / 1ps
`default_nettype none


module tb_fifo_width_convert();
    localparam S_RATE  = 1000.0/100.0;
    localparam M_RATE  = 1000.0/100.0;
    
    
    initial begin
        $dumpfile("tb_fifo_width_convert.vcd");
        $dumpvars(0, tb_fifo_width_convert);
    
    #10000000
        $finish;
    end
    
    
    reg     s_clk = 1'b1;
    always #(S_RATE/2.0)    s_clk = ~s_clk;
    
    reg     m_clk = 1'b1;
    always #(S_RATE/2.0)    m_clk = ~m_clk;
    
    reg     reset = 1'b1;
    initial #(S_RATE*100)   reset <= 1'b0;
    
    
    parameter ASYNC            = 1;
    parameter UNIT_WIDTH       = 8;
    parameter S_NUM            = 4;
    parameter M_NUM            = 8;
    parameter S_DATA_WIDTH     = (UNIT_WIDTH * S_NUM);
    parameter M_DATA_WIDTH     = (UNIT_WIDTH * M_NUM);
    
    parameter FIFO_PTR_WIDTH   = 8;
    parameter FIFO_RAM_TYPE    = "block";
    parameter FIFO_LOW_DEALY   = 0;
    parameter FIFO_DOUT_REGS   = 1;
    parameter FIFO_S_REGS      = 1;
    parameter FIFO_M_REGS      = 1;
    
    
    
    genvar                          i;
    
    reg     [S_DATA_WIDTH-1:0]      src_data;
    reg                             src_valid;
    wire                            src_ready;
    
    wire    [M_DATA_WIDTH-1:0]      dst_data;
    wire                            dst_valid;
    reg                             dst_ready;
    
    always @(posedge s_clk) begin
        if ( reset ) begin
            src_data  <= 0;
            src_valid <= 0;
        end
        else begin
            if ( src_valid & src_ready ) begin
                src_data <= src_data + 1;
            end
            src_valid <= {$random()};
        end
    end
    
    always @(posedge m_clk) begin
        dst_ready <= {$random()};
    end
    
    
    
    // target
    jelly_fifo_width_convert
            #(
                .ASYNC              (ASYNC),
                .UNIT_WIDTH         (UNIT_WIDTH),
                .S_NUM              (S_NUM),
                .M_NUM              (M_NUM),
                .FIFO_PTR_WIDTH     (FIFO_PTR_WIDTH),
                .FIFO_RAM_TYPE      (FIFO_RAM_TYPE),
                .FIFO_LOW_DEALY     (FIFO_LOW_DEALY),
                .FIFO_DOUT_REGS     (FIFO_DOUT_REGS),
                .FIFO_S_REGS        (FIFO_S_REGS),
                .FIFO_M_REGS        (FIFO_M_REGS)
            )
        i_fifo_width_convert
            (
                .endian             (1'b0),
                
                .s_reset            (reset),
                .s_clk              (s_clk),
                .s_data             (src_data),
                .s_valid            (src_valid),
                .s_ready            (src_ready),
                .s_fifo_free_count  (),
                .s_fifo_wr_signal   (),
                
                .m_reset            (reset),
                .m_clk              (m_clk),
                .m_data             (dst_data),
                .m_valid            (dst_valid),
                .m_ready            (dst_ready),
                .m_fifo_data_count  (),
                .m_fifo_rd_signal   ()
            );
    
    
endmodule


`default_nettype wire


// end of file
