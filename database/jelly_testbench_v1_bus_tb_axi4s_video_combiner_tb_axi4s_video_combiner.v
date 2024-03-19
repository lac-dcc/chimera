
`timescale 1ns / 1ps
`default_nettype none


module tb_axi4s_video_combiner();
    localparam RATE  = 10.0;
    
    initial begin
        $dumpfile("tb_axi4s_video_combiner.vcd");
        $dumpvars(0, tb_axi4s_video_combiner);
    
    #10000000
        $finish;
    end
    
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial begin
        #(RATE*100);
        @(posedge clk)  reset <= 1'b0;
    end
    
    
    reg     timeout_busy = 0;
    initial begin
        #(RATE*5000)    timeout_busy = 1'b1;
        #(RATE*100)     timeout_busy = 1'b0;
    end
    
    
    
    parameter   NUM         = 3;
    parameter   TUSER_WIDTH = 1;
    parameter   TDATA_WIDTH = 32;
    parameter   S_REGS      = 1;
    parameter   M_REGS      = 1;
    
    genvar                          i;
    
    wire                            aresetn = ~reset;
    wire                            aclk    = clk;
    wire                            aclken  = 1'b1;
    
    wire    [NUM*TUSER_WIDTH-1:0]   axi4s_src_tuser;
    wire    [NUM-1:0]               axi4s_src_tlast;
    wire    [NUM*TDATA_WIDTH-1:0]   axi4s_src_tdata;
    wire    [NUM-1:0]               axi4s_src_tvalid;
    wire    [NUM-1:0]               axi4s_src_tready;
    
    wire    [NUM*TUSER_WIDTH-1:0]   axi4s_fifo_tuser;
    wire    [NUM-1:0]               axi4s_fifo_tlast;
    wire    [NUM*TDATA_WIDTH-1:0]   axi4s_fifo_tdata;
    wire    [NUM-1:0]               axi4s_fifo_tvalid;
    wire    [NUM-1:0]               axi4s_fifo_tready;
    
    wire    [NUM*TUSER_WIDTH-1:0]   axi4s_dst_tuser;
    wire    [NUM-1:0]               axi4s_dst_tlast;
    wire    [NUM*TDATA_WIDTH-1:0]   axi4s_dst_tdata;
    wire                            axi4s_dst_tvalid;
    wire                            axi4s_dst_tready;
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_master
        
        // model
        jelly_axi4s_master_model
                #(
                    .AXI4S_DATA_WIDTH   (TDATA_WIDTH),
                    .X_NUM              (64),
                    .Y_NUM              (16 + i),
                    .PPM_FILE           (""),
                    .BUSY_RATE          (50),
                    .RANDOM_SEED        (i)
                )
            i_axi4s_master_model
                (
                    .aresetn            (aresetn),
                    .aclk               (aclk),
                    
                    .m_axi4s_tuser      (axi4s_src_tuser[i*TUSER_WIDTH +: TUSER_WIDTH]),
                    .m_axi4s_tlast      (axi4s_src_tlast[i]),
                    .m_axi4s_tdata      (axi4s_src_tdata[i*TDATA_WIDTH +: TDATA_WIDTH]),
                    .m_axi4s_tvalid     (axi4s_src_tvalid[i]),
                    .m_axi4s_tready     (axi4s_src_tready[i])
                );
        
        jelly_axi4s_video_fifo
                #(
                    .TUSER_WIDTH        (TUSER_WIDTH),
                    .TDATA_WIDTH        (TDATA_WIDTH),
                    .ASYNC              (1),
                    .PTR_WIDTH          (10)
                )
            i_axi4s_video_fifo
                (
                    .s_axi4s_aresetn    (aresetn),
                    .s_axi4s_aclk       (aclk),
                    .s_axi4s_tuser      (axi4s_src_tuser[i*TUSER_WIDTH +: TUSER_WIDTH]),
                    .s_axi4s_tlast      (axi4s_src_tlast[i]),
                    .s_axi4s_tdata      (axi4s_src_tdata[i*TDATA_WIDTH +: TDATA_WIDTH]),
                    .s_axi4s_tvalid     (axi4s_src_tvalid[i]),
                    .s_axi4s_tready     (axi4s_src_tready[i]),
                    .s_fifo_free_count  (),
                    
                    .m_axi4s_aresetn    (aresetn),
                    .m_axi4s_aclk       (aclk),
                    .m_axi4s_tuser      (axi4s_fifo_tuser[i*TUSER_WIDTH +: TUSER_WIDTH]),
                    .m_axi4s_tlast      (axi4s_fifo_tlast[i]),
                    .m_axi4s_tdata      (axi4s_fifo_tdata[i*TDATA_WIDTH +: TDATA_WIDTH]),
                    .m_axi4s_tvalid     (axi4s_fifo_tvalid[i]),
                    .m_axi4s_tready     (axi4s_fifo_tready[i]),
                    .m_fifo_data_count  ()
                );
    end
    endgenerate
    
    
    jelly_axi4s_video_combiner
            #(
                .NUM                (NUM),
                .TUSER_WIDTH        (TUSER_WIDTH),
                .TDATA_WIDTH        (TDATA_WIDTH),
                .S_REGS             (S_REGS),
                .M_REGS             (M_REGS)
            )
        i_axi4s_video_combiner
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (aclken),
                
                .s_axi4s_tuser      (axi4s_fifo_tuser),
                .s_axi4s_tlast      (axi4s_fifo_tlast),
                .s_axi4s_tdata      (axi4s_fifo_tdata),
                .s_axi4s_tvalid     (axi4s_fifo_tvalid),
                .s_axi4s_tready     (axi4s_fifo_tready),
                
                .m_axi4s_tuser      (axi4s_dst_tuser),
                .m_axi4s_tlast      (axi4s_dst_tlast),
                .m_axi4s_tdata      (axi4s_dst_tdata),
                .m_axi4s_tvalid     (axi4s_dst_tvalid),
                .m_axi4s_tready     (axi4s_dst_tready)
            );
    
    reg     reg_ready;
    always @(posedge aclk) begin
        reg_ready <= {$random()};
    end
    
    assign axi4s_dst_tready = reg_ready;
    
endmodule


`default_nettype wire


// end of file
