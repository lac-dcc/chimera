
`timescale 1ns / 1ps
`default_nettype none


module tb_texture_writer();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_texture_writer.vcd");
        $dumpvars(1, tb_texture_writer);
        $dumpvars(1, tb_texture_writer.i_texture_writer_core);
//      $dumpvars(0, tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk);
//      $dumpvars(0, tb_texture_writer.i_texture_writer_line_to_blk);
        
//      #1000000;
//          $display("!!!!TIME OUT!!!!");
//          $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    
    // ランダム BUSY
    localparam  RAND_BUSY   = 1;
    
    localparam  MONO        = 0;    // 1;
    localparam  X_NUM       = 640;
    localparam  Y_NUM       = 480;
    
    localparam  BLK_X_SIZE  = 3;
    localparam  BLK_Y_SIZE  = 3;
    localparam  STEP_Y_SIZE = 2;
    
    
    localparam  COMPONENT_NUM        =  MONO ? 1 : 3;
    localparam  COMPONENT_DATA_WIDTH =  8;
    
    
    // -----------------------------------------
    //  TOP
    // -----------------------------------------
    
    /*
    parameter   STRIDE_WIDTH    = 14;
    parameter   SIZE_WIDTH      = 24;
    
    parameter   COMPONENT_NUM   = 3;
    parameter   COMPONENT_WIDTH = COMPONENT_NUM <= 2 ?  1 :
                                  COMPONENT_NUM <= 4 ?  2 : 3;
    parameter   STEP_SIZE       = 2;        // 2^n (0:1, 1:2, 2:4, 3:8... )
    parameter   BLK_X_SIZE      = 4;        // 2^n (0:1, 1:2, 2:4, 3:8... )
    parameter   BLK_Y_SIZE      = 3;        // 2^n (0:1, 1:2, 2:4, 3:8... )
    
    jelly_texture_writer_addr
            #(
//              .STRIDE_WIDTH       (STRIDE_WIDTH), 
//              .SIZE_WIDTH         (SIZE_WIDTH),
//              .COMPONENT_NUM      (COMPONENT_NUM),
//              .STEP_SIZE          (STEP_SIZE),
//              .BLK_X_SIZE         (BLK_X_SIZE),
//              .BLK_Y_SIZE         (BLK_Y_SIZE)
                
                .X_WIDTH            (4),
                .Y_WIDTH            (4),
                .SRC_STRIDE_WIDTH   (5),
                .DST_STRIDE_WIDTH   (5+2)
            )
        jelly_texture_writer_addr
            (
                .reset              (reset),
                .clk                (clk),
                
                .enable             (1'b1),
                .busy               (),
                
                .param_width        (12),
                .param_height       (12),
                .param_src_stride   (16),
                .param_dst_stride   (64),
                
                .m_last             (),
                .m_component        (),
//              .m_addr             (),
                .m_valid            (),
                .m_ready            (1'b1)
            );
    */
    
    
    parameter   AXI4_ID_WIDTH      = 6;
    parameter   AXI4_ADDR_WIDTH    = 32;
    parameter   AXI4_DATA_SIZE     = 3; // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ... ...
    parameter   AXI4_DATA_WIDTH    = (8 << AXI4_DATA_SIZE);
    parameter   AXI4_STRB_WIDTH    = (1 << AXI4_DATA_SIZE);
    parameter   AXI4_LEN_WIDTH     = 8;
    parameter   AXI4_QOS_WIDTH     = 4;
    
    wire    [AXI4_ID_WIDTH-1:0]     axi4_awid;
    wire    [AXI4_ADDR_WIDTH-1:0]   axi4_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    axi4_awlen;
    wire    [2:0]                   axi4_awsize;
    wire    [1:0]                   axi4_awburst;
    wire    [0:0]                   axi4_awlock;
    wire    [3:0]                   axi4_awcache;
    wire    [2:0]                   axi4_awprot;
    wire    [AXI4_QOS_WIDTH-1:0]    axi4_awqos;
    wire    [3:0]                   axi4_awregion;
    wire                            axi4_awvalid;
    wire                            axi4_awready;
    wire    [AXI4_DATA_WIDTH-1:0]   axi4_wdata;
    wire    [AXI4_STRB_WIDTH-1:0]   axi4_wstrb;
    wire                            axi4_wlast;
    wire                            axi4_wvalid;
    wire                            axi4_wready;
    wire    [AXI4_ID_WIDTH-1:0]     axi4_bid;
    wire    [1:0]                   axi4_bresp;
    wire                            axi4_bvalid;
    wire                            axi4_bready;
    
    
    wire    [0:0]                   axi4s_tuser;
    wire                            axi4s_tlast;
    wire    [23:0]                  axi4s_tdata;
    wire                            axi4s_tvalid;
    wire                            axi4s_tready;
    
    /*
    integer fp_dbg;
    initial fp_dbg = $fopen("wdata_log.txt", "w");
    always @(posedge clk) begin
        if ( !reset && axi4_wvalid && axi4_wready ) begin
            $fdisplay(fp_dbg, "%h %b %t", axi4_wdata, axi4_wstrb, $time());
        end
    end
    */
    
    wire            buf_wr_req  = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.buf_wr_req;
    wire            buf_rd_req  = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.buf_rd_req;
    wire            buf_wr_cke  = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.buf_wr_cke;
    wire    [11:0]  buf_wr_addr = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.buf_wr_addr;
    wire    [23:0]  buf_wr_din  = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.buf_wr_din;
    wire            buf_rd_cke  = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.buf_rd_cke;
    wire    [11:0]  buf_rd_addr = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.buf_rd_addr;
    wire    [191:0] buf_rd_dout = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.buf_rd_dout;
    wire            wr_cke      = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.wr_cke;
    wire            wr_busy     = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.wr_busy;
    wire            wr0_valid   = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.wr0_valid;
    wire            rd_cke      = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.rd_cke;
    wire            rd0_valid   = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.rd0_valid;
    wire            rd2_valid   = tb_texture_writer.i_texture_writer_core.i_texture_writer_line_to_blk.rd2_valid;
    
    integer         wr_req_count = 0;
    integer         rd_req_count = 0;
    integer         wr_count = 0;
    integer         rd_count = 0;
    
    integer fp_buf_wr;
    integer fp_buf_wr_l;
    integer fp_buf_rd;
    integer fp_buf_rd_l;
    initial begin
        fp_buf_wr   = $fopen("buf_wr.txt",   "w");
        fp_buf_wr_l = $fopen("buf_wr_l.txt", "w");
        fp_buf_rd   = $fopen("buf_rd.txt",   "w");
        fp_buf_rd_l = $fopen("buf_rd_l.txt", "w");
    end
    always @(posedge clk) begin
        if ( !reset ) begin
            wr_req_count <= wr_req_count + buf_wr_req;
            rd_req_count <= rd_req_count + buf_rd_req;
            
            if ( wr_cke && wr_busy && wr0_valid ) begin
                $fdisplay(fp_buf_wr,   "%h %h",          buf_wr_addr, buf_wr_din);
                $fdisplay(fp_buf_wr_l, "%h %h (%d, %d)", buf_wr_addr, buf_wr_din, wr_req_count, rd_req_count);
                wr_count <= wr_count + 1;
            end
            
            if ( rd_cke && rd2_valid ) begin
                $fdisplay(fp_buf_rd,   "%h",          buf_rd_dout);
                $fdisplay(fp_buf_rd_l, "%h (%d, %d)", buf_rd_dout, wr_req_count, rd_req_count);
                rd_count <= rd_count + 1;
            end
        end
    end
    
    
    
    
    reg                             enable;
    wire                            busy;
    
    always @(posedge clk) begin
        if ( reset ) begin
            enable <= 1'b0;
        end
        else begin
            enable <= !busy;
        end
    end
    
    
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH   (COMPONENT_NUM * COMPONENT_DATA_WIDTH),
                .X_NUM              (X_NUM),
                .Y_NUM              (Y_NUM + 3),    // わざと不整合にしてみる
                .PGM_FILE           (MONO  ? "image.pgm" : ""),
                .PPM_FILE           (!MONO ? "image.ppm" : ""),
                .BUSY_RATE          (RAND_BUSY ? 5 : 0)
            )
        i_axi4s_master_model
            (
                .aresetn            (~reset),
                .aclk               (clk),
                
                .m_axi4s_tuser      (axi4s_tuser),
                .m_axi4s_tlast      (axi4s_tlast),
                .m_axi4s_tdata      (axi4s_tdata),
                .m_axi4s_tvalid     (axi4s_tvalid),
                .m_axi4s_tready     (axi4s_tready)
            );
    
    integer     frame_num = 0;
    always @(posedge clk) begin
        if ( !reset ) begin
            if ( axi4s_tvalid && axi4s_tready && axi4s_tuser ) begin
                frame_num = frame_num + 1;
                $display("frame start");
                if ( frame_num > 2 ) begin
                    $finish;
                end
            end
        end
    end
    
    always @(negedge busy) begin
        if ( !reset ) begin
            $display("write end");
            i_axi4_slave_model.write_memh(MONO ? "axi4_mem_mono.txt" : "axi4_mem.txt");
        end
    end
    
    
//  assign axi4s_tready = 1;
    jelly_texture_writer_core
            #(
                .COMPONENT_NUM          (COMPONENT_NUM),
                .COMPONENT_DATA_WIDTH   (COMPONENT_DATA_WIDTH),
                
                .M_AXI4_ID_WIDTH        (AXI4_ID_WIDTH),
                .M_AXI4_ADDR_WIDTH      (AXI4_ADDR_WIDTH),
                .M_AXI4_DATA_SIZE       (AXI4_DATA_SIZE),       // 8^n (0:8bit, 1:16bit, 2:32bit, 3:64bit, ...)
                .M_AXI4_LEN_WIDTH       (AXI4_LEN_WIDTH),
                .M_AXI4_QOS_WIDTH       (AXI4_QOS_WIDTH),
                
                .BLK_X_SIZE             (BLK_X_SIZE),   // 2^n (0:1, 1:2, 2:4, 3:8, ... )
                .BLK_Y_SIZE             (BLK_Y_SIZE),   // 2^n (0:1, 1:2, 2:4, 3:8, ... )
                .STEP_Y_SIZE            (STEP_Y_SIZE),  // 2^n (0:1, 1:2, 2:4, 3:8, ... )
                
                .X_WIDTH                (10),
                .Y_WIDTH                (9),
                .STRIDE_C_WIDTH         (14),
                .STRIDE_X_WIDTH         (14),
                .STRIDE_Y_WIDTH         (14),
                
                .BUF_ADDR_WIDTH         (12+1),
                .BUF_RAM_TYPE           ("block")
            )
        i_texture_writer_core
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .endian                 (0),
                
                .enable                 (enable),
                .busy                   (busy),
                
                .param_addr             (32'h0000_0000),
                .param_awlen            (32'h03),
                .param_width            (X_NUM-1),
                .param_height           (Y_NUM-1),
                .param_stride_c         ((1 << BLK_X_SIZE) * (1 << BLK_Y_SIZE)),
                .param_stride_x         ((1 << BLK_X_SIZE) * (1 << BLK_Y_SIZE) * COMPONENT_NUM),
                .param_stride_y         (X_NUM             * (1 << BLK_Y_SIZE) * COMPONENT_NUM),
                
                .s_axi4s_tuser          (axi4s_tuser),
                .s_axi4s_tlast          (axi4s_tlast),
                .s_axi4s_tdata          (axi4s_tdata),
                .s_axi4s_tvalid         (axi4s_tvalid),
                .s_axi4s_tready         (axi4s_tready),
                
                .m_axi4_awid            (axi4_awid),
                .m_axi4_awaddr          (axi4_awaddr),
                .m_axi4_awlen           (axi4_awlen),
                .m_axi4_awsize          (axi4_awsize),
                .m_axi4_awburst         (axi4_awburst),
                .m_axi4_awlock          (axi4_awlock),
                .m_axi4_awcache         (axi4_awcache),
                .m_axi4_awprot          (axi4_awprot),
                .m_axi4_awqos           (axi4_awqos),
                .m_axi4_awregion        (axi4_awregion),
                .m_axi4_awvalid         (axi4_awvalid),
                .m_axi4_awready         (axi4_awready),
                .m_axi4_wdata           (axi4_wdata),
                .m_axi4_wstrb           (axi4_wstrb),
                .m_axi4_wlast           (axi4_wlast),
                .m_axi4_wvalid          (axi4_wvalid),
                .m_axi4_wready          (axi4_wready),
                .m_axi4_bid             (axi4_bid),
                .m_axi4_bresp           (axi4_bresp),
                .m_axi4_bvalid          (axi4_bvalid),
                .m_axi4_bready          (axi4_bready)
            );
    
    
    integer     w_count = 0;
    always @(posedge clk) begin
        if ( !reset ) begin
            if ( axi4_wvalid && axi4_wready ) begin
                w_count <= w_count + 1;
            end
        end
    end
    
    jelly_axi4_slave_model
            #(
                .AXI_ID_WIDTH           (AXI4_ID_WIDTH),
                .AXI_ADDR_WIDTH         (AXI4_ADDR_WIDTH),
                .AXI_QOS_WIDTH          (AXI4_QOS_WIDTH),
                .AXI_LEN_WIDTH          (AXI4_LEN_WIDTH),
                .AXI_DATA_SIZE          (AXI4_DATA_SIZE),
                .AXI_DATA_WIDTH         (AXI4_DATA_WIDTH),
                .AXI_STRB_WIDTH         (AXI4_STRB_WIDTH),
                .MEM_WIDTH              (17),
                
                .WRITE_LOG_FILE         ("axi4_write.txt"),
                .READ_LOG_FILE          (""),
                
                .AW_DELAY               (RAND_BUSY ? 64 : 0),
                .AR_DELAY               (RAND_BUSY ? 64 : 0),
                
                .AW_FIFO_PTR_WIDTH      (RAND_BUSY ? 4 : 0),
                .W_FIFO_PTR_WIDTH       (RAND_BUSY ? 4 : 0),
                .B_FIFO_PTR_WIDTH       (RAND_BUSY ? 4 : 0),
                .AR_FIFO_PTR_WIDTH      (0),
                .R_FIFO_PTR_WIDTH       (0),
                
                .AW_BUSY_RATE           (RAND_BUSY ? 80 : 0),
                .W_BUSY_RATE            (RAND_BUSY ? 80 : 0),
                .B_BUSY_RATE            (RAND_BUSY ? 80 : 0),
                .AR_BUSY_RATE           (0),
                .R_BUSY_RATE            (0)
            )
        i_axi4_slave_model
            (
                .aresetn                (~reset),
                .aclk                   (clk),
                
                .s_axi4_awid            (axi4_awid),
                .s_axi4_awaddr          (axi4_awaddr),
                .s_axi4_awlen           (axi4_awlen),
                .s_axi4_awsize          (axi4_awsize),
                .s_axi4_awburst         (axi4_awburst),
                .s_axi4_awlock          (axi4_awlock),
                .s_axi4_awcache         (axi4_awcache),
                .s_axi4_awprot          (axi4_awprot),
                .s_axi4_awqos           (axi4_awqos),
                .s_axi4_awvalid         (axi4_awvalid),
                .s_axi4_awready         (axi4_awready),
                .s_axi4_wdata           (axi4_wdata),
                .s_axi4_wstrb           (axi4_wstrb),
                .s_axi4_wlast           (axi4_wlast),
                .s_axi4_wvalid          (axi4_wvalid),
                .s_axi4_wready          (axi4_wready),
                .s_axi4_bid             (axi4_bid),
                .s_axi4_bresp           (axi4_bresp),
                .s_axi4_bvalid          (axi4_bvalid),
                .s_axi4_bready          (axi4_bready),
                
                .s_axi4_arid            (),
                .s_axi4_araddr          (),
                .s_axi4_arlen           (),
                .s_axi4_arsize          (),
                .s_axi4_arburst         (),
                .s_axi4_arlock          (),
                .s_axi4_arcache         (),
                .s_axi4_arprot          (),
                .s_axi4_arqos           (),
                .s_axi4_arvalid         (0),
                .s_axi4_arready         (),
                .s_axi4_rid             (),
                .s_axi4_rdata           (),
                .s_axi4_rresp           (),
                .s_axi4_rlast           (),
                .s_axi4_rvalid          (),
                .s_axi4_rready          (1)
            );
    
    
    /*
    jelly_texture_writer_line_to_blk
            #(
                .COMPONENT_NUM          (3),
                .BLK_X_SIZE             (3),        // 2^n (0:1, 1:2, 2:4, 3:8... )
                .BLK_Y_SIZE             (3),        // 2^n (0:1, 1:2, 2:4, 3:8... )
                .STEP_Y_SIZE            (2),        // 2^n (0:1, 1:2, 2:4, 3:8... )
                
                .X_WIDTH                (10),
                .Y_WIDTH                (10),
                
                .ADDR_WIDTH             (24),
                .S_DATA_WIDTH           (8*3),
                .M_DATA_SIZE            (1)
                
        //      parameter   BUF_ADDR_WIDTH       = 1 + X_WIDTH + STEP_Y_SIZE - M_DATA_SIZE,
        //      parameter   BUF_RAM_TYPE         = "block",
            )
        i_texture_writer_line_to_blk
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .endian                 (0),
                
                .enable                 (1),
                .busy                   (),
                
        //      .param_width            (64),
        //      .param_height           (48),

        //      .param_addr             ({32'h000a_0000, 32'h0005_0000, 32'h0000_0000}),
        //      .param_awlen            (32'h03),
                .param_width            (X_NUM),
                .param_height           (Y_NUM),
                .param_stride           (X_NUM<<3),
                
                .s_data                 (0),
                .s_valid                (1),
                .s_ready                (),
                
                .m_addr                 (),
                .m_data                 (),
                .m_last                 (),
                .m_valid                (),
                .m_ready                (1)
            );
    */
    
    
endmodule


`default_nettype wire


// end of file
