// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_axi4s_video_fifo_width_converter();
    localparam S_RATE  = 1000.0/100.0;
    localparam M_RATE  = 1000.0/100.0;
    
    
    initial begin
        $dumpfile("tb_axi4s_video_fifo_width_converter.vcd");
        $dumpvars(0, tb_axi4s_video_fifo_width_converter);
    
    #10000000
        $finish;
    end
    
    
    reg     s_clk = 1'b1;
    always #(S_RATE/2.0)    s_clk = ~s_clk;
    
    reg     m_clk = 1'b1;
    always #(S_RATE/2.0)    m_clk = ~m_clk;
    
    reg     reset = 1'b1;
    initial #(S_RATE*100)   reset <= 1'b0;
    
    
    parameter   ASYNC            = 1;
    parameter   UNIT_WIDTH       = 8;
    parameter   S_TDATA_SIZE     = 2;   // log2 (0:1byte, 1:2byte, 2:4byte, 3:81byte...)
    parameter   M_TDATA_SIZE     = 1;   // log2 (0:1byte, 1:2byte, 2:4byte, 3:81byte...)
    
    parameter   FIFO_PTR_WIDTH   = 10;
    parameter   FIFO_RAM_TYPE    = "block";
    parameter   FIFO_LOW_DEALY   = 0;
    parameter   FIFO_DOUT_REGS   = 1;
    parameter   FIFO_SLAVE_REGS  = 1;
    parameter   FIFO_MASTER_REGS = 1;
    
    parameter   S_TDATA_WIDTH = (UNIT_WIDTH << S_TDATA_SIZE);
    parameter   M_TDATA_WIDTH = (UNIT_WIDTH << M_TDATA_SIZE);
    
        
    genvar                          i;
    
    wire    [0:0]                   axi4s_src_tuser;
    wire                            axi4s_src_tlast;
    wire    [S_TDATA_WIDTH-1:0]     axi4s_src_tdata;
    wire                            axi4s_src_tvalid;
    wire                            axi4s_src_tready;
    
    wire    [0:0]                   axi4s_dst_tuser;
    wire                            axi4s_dst_tlast;
    wire    [M_TDATA_WIDTH-1:0]     axi4s_dst_tdata;
    wire                            axi4s_dst_tvalid;
    wire                            axi4s_dst_tready;
    
    // model
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH   (S_TDATA_WIDTH),
                .X_NUM              (64),
                .Y_NUM              (16),
                .PPM_FILE           (""),
                .BUSY_RATE          (50),
                .RANDOM_SEED        (0)
            )
        i_axi4s_master_model
            (
                .aresetn            (~reset),
                .aclk               (s_clk),
                
                .m_axi4s_tuser      (axi4s_src_tuser),
                .m_axi4s_tlast      (axi4s_src_tlast),
                .m_axi4s_tdata      (axi4s_src_tdata),
                .m_axi4s_tvalid     (axi4s_src_tvalid),
                .m_axi4s_tready     (axi4s_src_tready)
            );
    
    // target
    jelly_axi4s_video_fifo_width_converter
            #(
                .ASYNC              (ASYNC),
                .UNIT_WIDTH         (UNIT_WIDTH),
                .S_TDATA_SIZE       (S_TDATA_SIZE),
                .M_TDATA_SIZE       (M_TDATA_SIZE),
                .FIFO_PTR_WIDTH     (FIFO_PTR_WIDTH),
                .FIFO_RAM_TYPE      (FIFO_RAM_TYPE),
                .FIFO_LOW_DEALY     (FIFO_LOW_DEALY),
                .FIFO_DOUT_REGS     (FIFO_DOUT_REGS),
                .FIFO_SLAVE_REGS    (FIFO_SLAVE_REGS)
            )
        i_axi4s_video_fifo_width_converter
            (
                .endian             (1'b0),
                
                .s_axi4s_aresetn    (~reset),
                .s_axi4s_aclk       (s_clk),
                .s_axi4s_tuser      (axi4s_src_tuser),
                .s_axi4s_tlast      (axi4s_src_tlast),
                .s_axi4s_tdata      (axi4s_src_tdata),
                .s_axi4s_tvalid     (axi4s_src_tvalid),
                .s_axi4s_tready     (axi4s_src_tready),
                .s_fifo_free_count  (),
                .s_fifo_wr_signal   (),
                
                .m_axi4s_aresetn    (~reset),
                .m_axi4s_aclk       (m_clk),
                .m_axi4s_tuser      (axi4s_dst_tuser),
                .m_axi4s_tlast      (axi4s_dst_tlast),
                .m_axi4s_tdata      (axi4s_dst_tdata),
                .m_axi4s_tvalid     (axi4s_dst_tvalid),
                .m_axi4s_tready     (axi4s_dst_tready),
                .m_fifo_data_count  (),
                .s_fifo_rd_signal   ()
            );
    
    reg     reg_ready;
    always @(posedge m_clk) begin
        reg_ready <= {$random()};
    end
    
    assign axi4s_dst_tready = reg_ready;
    
endmodule


`default_nettype wire


// end of file
