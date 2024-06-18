// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_texture_cache();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
//      $dumpfile("tb_texture_cache.vcd");
//      $dumpvars(0, tb_texture_cache);
        
        #30000000;
            $display("!!!!TIME OUT!!!!");
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    
    
    parameter   CACHE_NUM            = 4;
    
    parameter   COMPONENT_NUM        = 3;
    parameter   COMPONENT_SEL_WIDTH  = COMPONENT_NUM <= 2  ?  1 :
                                       COMPONENT_NUM <= 4  ?  2 :
                                       COMPONENT_NUM <= 8  ?  3 :
                                       COMPONENT_NUM <= 16 ?  4 :
                                       COMPONENT_NUM <= 32 ?  5 :
                                       COMPONENT_NUM <= 64 ?  6 : 7;
    
    parameter   COMPONENT_DATA_WIDTH = 8;
    
    parameter   DATA_WIDTH           = COMPONENT_NUM * COMPONENT_DATA_WIDTH;
    parameter   STRB_WIDTH           = COMPONENT_NUM;
    
    parameter   USER_WIDTH           = 1;
    
    parameter   S_ADDR_X_WIDTH       = 12;
    parameter   S_ADDR_Y_WIDTH       = 12;
    parameter   S_DATA_WIDTH         = 24;
    
    parameter   TAG_ADDR_WIDTH       = 9; // 6;
    
    parameter   BLK_X_SIZE           = 3;   // 0:1pixel; 1:2pixel; 2:4pixel; 3:8pixel ...
    parameter   BLK_Y_SIZE           = 3;   // 0:1pixel; 1:2pixel; 2:4pixel; 3:8pixel ...
    
    parameter   PIX_ADDR_X_WIDTH     = BLK_X_SIZE;
    parameter   PIX_ADDR_Y_WIDTH     = BLK_Y_SIZE;
    parameter   BLK_ADDR_X_WIDTH     = S_ADDR_X_WIDTH - BLK_X_SIZE;
    parameter   BLK_ADDR_Y_WIDTH     = S_ADDR_Y_WIDTH - BLK_Y_SIZE;
    
    parameter   M_DATA_WIDE_SIZE     = 3;
    
    parameter   M_ADDR_X_WIDTH       = BLK_ADDR_X_WIDTH;
    parameter   M_ADDR_Y_WIDTH       = BLK_ADDR_Y_WIDTH;
    parameter   M_DATA_WIDTH         = (S_DATA_WIDTH << M_DATA_WIDE_SIZE);
    
    parameter   USE_M_RREADY         = 0;   // 0: m_rready is always 1'b1.   1: handshake mode.
    
    parameter   BORDER_DATA          = {S_DATA_WIDTH{1'b0}};
    
    parameter   TAG_RAM_TYPE         = "distributed";
    parameter   MEM_RAM_TYPE         = "block";
    
    
    parameter   ID_WIDTH             = 6;
    parameter   ADDR_WIDTH           = 24;
    
    parameter   M_AXI4_ID_WIDTH      = ID_WIDTH;
    parameter   M_AXI4_ADDR_WIDTH    = 32;
    parameter   M_AXI4_DATA_SIZE     = 3;   // 0:8bit; 1:16bit; 2:32bit ...
    parameter   M_AXI4_DATA_WIDTH    = (8 << M_AXI4_DATA_SIZE);
    parameter   M_AXI4_LEN_WIDTH     = 8;
    parameter   M_AXI4_QOS_WIDTH     = 4;
    parameter   M_AXI4_ARID          = {M_AXI4_ID_WIDTH{1'b0}};
    parameter   M_AXI4_ARSIZE        = M_AXI4_DATA_SIZE;
    parameter   M_AXI4_ARBURST       = 2'b01;
    parameter   M_AXI4_ARLOCK        = 1'b0;
    parameter   M_AXI4_ARCACHE       = 4'b0001;
    parameter   M_AXI4_ARPROT        = 3'b000;
    parameter   M_AXI4_ARQOS         = 0;
    parameter   M_AXI4_ARREGION      = 4'b0000;
    
    parameter   SLAVE_REGS           = 1;
    parameter   MASTER_REGS          = 1;
    parameter   M_AXI4_REGS          = 1;
    
    
    
    
    initial begin
        i_axi4_slave_model.read_memh("axi4_mem.txt");
    end
    
    
    wire    [CACHE_NUM*USER_WIDTH-1:0]      s_aruser;
    wire    [CACHE_NUM*S_ADDR_X_WIDTH-1:0]  s_araddrx;
    wire    [CACHE_NUM*S_ADDR_Y_WIDTH-1:0]  s_araddry;
    wire    [CACHE_NUM-1:0]                 s_arvalid;
    wire    [CACHE_NUM-1:0]                 s_arready;
    
    wire    [CACHE_NUM*USER_WIDTH-1:0]      s_ruser;
    wire    [CACHE_NUM*S_DATA_WIDTH-1:0]    s_rdata;
    wire    [CACHE_NUM-1:0]                 s_rvalid;
    wire    [CACHE_NUM-1:0]                 s_rready = 4'b1111;
    
    reg     [USER_WIDTH-1:0]                s_aruser0;
    reg     [S_ADDR_X_WIDTH-1:0]            s_araddrx0;
    reg     [S_ADDR_Y_WIDTH-1:0]            s_araddry0;
    reg                                     s_arvalid0 = 0;
    
    reg     [USER_WIDTH-1:0]                s_aruser1;
    reg     [S_ADDR_X_WIDTH-1:0]            s_araddrx1;
    reg     [S_ADDR_Y_WIDTH-1:0]            s_araddry1;
    reg                                     s_arvalid1 = 0;
    
    reg     [USER_WIDTH-1:0]                s_aruser2;
    reg     [S_ADDR_X_WIDTH-1:0]            s_araddrx2;
    reg     [S_ADDR_Y_WIDTH-1:0]            s_araddry2;
    reg                                     s_arvalid2 = 0;
    
    reg     [USER_WIDTH-1:0]                s_aruser3;
    reg     [S_ADDR_X_WIDTH-1:0]            s_araddrx3;
    reg     [S_ADDR_Y_WIDTH-1:0]            s_araddry3;
    reg                                     s_arvalid3 = 0;
    
    
    assign  s_aruser  = {s_aruser3,  s_aruser2 , s_aruser1,  s_aruser0 };
    assign  s_araddrx = {s_araddrx3, s_araddrx2, s_araddrx1, s_araddrx0};
    assign  s_araddry = {s_araddry3, s_araddry2, s_araddry1, s_araddry0};
    assign  s_arvalid = {s_arvalid3, s_arvalid2, s_arvalid1, s_arvalid0};
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_aruser0  <= 0;
            s_araddrx0 <= 0;
            s_araddry0 <= 0;
            s_arvalid0 <= 0;
            
            s_aruser1  <= 0;
            s_araddrx1 <= 160;
            s_araddry1 <= 0;
            s_arvalid1 <= 0;
            
            s_aruser2  <= 0;
            s_araddrx2 <= 160*2;
            s_araddry2 <= 0;
            s_arvalid2 <= 0;
            
            s_aruser3  <= 0;
            s_araddrx3 <= 160*3;
            s_araddry3 <= 0;
            s_arvalid3 <= 0;
        end
        else begin
            
            if ( s_arvalid[0] && s_arready[0] ) begin
                s_araddrx0 <= s_araddrx0 + 1;
                if ( s_araddrx0 == 160*1-1 ) begin
                    s_araddrx0 <= 160*0;
                    s_araddry0 <= s_araddry0 + 1;
                end
            end
            s_arvalid0 <= 1;
            
            if ( s_arvalid[1] && s_arready[1] ) begin
                s_araddrx1 <= s_araddrx1 + 1;
                if ( s_araddrx1 == 160*2-1 ) begin
                    s_araddrx1 <= 160*1;
                    s_araddry1 <= s_araddry1 + 1;
                end
            end
            s_arvalid1 <= 1;
            
            if ( s_arvalid[2] && s_arready[2] ) begin
                s_araddrx2 <= s_araddrx2 + 1;
                if ( s_araddrx2 == 160*3-1 ) begin
                    s_araddrx2 <= 160*2;
                    s_araddry2 <= s_araddry2 + 1;
                end
            end
            s_arvalid2 <= 1;
            
            if ( s_arvalid[3] && s_arready[3] ) begin
                s_araddrx3 <= s_araddrx3 + 1;
                if ( s_araddrx3 == 160*4-1 ) begin
                    s_araddrx3 <= 160*3;
                    s_araddry3 <= s_araddry3 + 1;
                end
            end
            s_arvalid3 <= 1;
            
            
            /*
            if ( s_arvalid[0] && s_arready[0] ) begin
                s_araddry0 <= s_araddry0 + 1;
                if ( s_araddry0 == 479 ) begin
                    s_araddry0 <= 0;
                    s_araddrx0 <= s_araddrx0 + 1;
                end
            end
            s_arvalid0 <= 1;
            */
            
            /*
            if ( s_arvalid[1] && s_arready[1] ) begin
                s_araddrx1 <= s_araddrx1 + 1;
                if ( s_araddrx1 == 639 ) begin
                    s_araddrx1 <= 0;
                    s_araddry1 <= s_araddry1 + 1;
                end
            end
            s_arvalid1 <= 1;
            */
            
            /*
            if ( s_arvalid[1] && s_arready[1] ) begin
                s_araddry1 <= s_araddry1 + 1;
                if ( s_araddry1 == 479 ) begin
                    s_araddry1 <= 0;
                    s_araddrx1 <= s_araddrx1 + 1;
                end
            end
            s_arvalid1 <= 1;
            */
        end
    end
    
    
    integer     fp0, fp1, fp2, fp3;
    integer     fp0l, fp1l;
    initial begin
        fp0 = $fopen("out0.ppm");
        $fdisplay(fp0, "P3");
        $fdisplay(fp0, "160 480");
        $fdisplay(fp0, "255");
        
        fp1 = $fopen("out1.ppm");
        $fdisplay(fp1, "P3");
        $fdisplay(fp1, "160 640");
        $fdisplay(fp1, "255");
        
        fp2 = $fopen("out2.ppm");
        $fdisplay(fp2, "P3");
        $fdisplay(fp2, "160 640");
        $fdisplay(fp2, "255");
        
        fp3 = $fopen("out3.ppm");
        $fdisplay(fp3, "P3");
        $fdisplay(fp3, "160 640");
        $fdisplay(fp3, "255");
        
//      fp0l = $fopen("out0.txt");
        
        $display("file open");
    end
    
    always @(posedge clk) begin
        if ( !reset ) begin
            if ( s_rvalid[0] && s_rready[0] ) begin
                $fdisplay(fp0,  "%d %d %d", s_rdata[7:0], s_rdata[15:8], s_rdata[23:16]);
//              $fdisplay(fp0l, "%x", s_rdata[23:0]);
            end
            
            if ( s_rvalid[1] && s_rready[1] ) begin
                $fdisplay(fp1,  "%d %d %d", s_rdata[24*1+0 +: 8], s_rdata[24*1+8 +: 8], s_rdata[24*1+16 +: 8]);
            end
            
            if ( s_rvalid[2] && s_rready[2] ) begin
                $fdisplay(fp2,  "%d %d %d", s_rdata[24*2+0 +: 8], s_rdata[24*2+8 +: 8], s_rdata[24*2+16 +: 8]);
            end
            
            if ( s_rvalid[3] && s_rready[3] ) begin
                $fdisplay(fp3,  "%d %d %d", s_rdata[24*3+0 +: 8], s_rdata[24*3+8 +: 8], s_rdata[24*3+16 +: 8]);
            end
            
    //      if ( s_rvalid[1] && s_rready[1] ) begin
    //          $fdisplay(fp1, "%d %d %d", s_rdata[31:24], s_rdata[39:32], s_rdata[47:40]);
    //      end
        end
    end
    
    wire    [M_AXI4_ID_WIDTH-1:0]       axi4_arid;
    wire    [M_AXI4_ADDR_WIDTH-1:0]     axi4_araddr;
    wire    [M_AXI4_LEN_WIDTH-1:0]      axi4_arlen;
    wire    [2:0]                       axi4_arsize;
    wire    [1:0]                       axi4_arburst;
    wire    [0:0]                       axi4_arlock;
    wire    [3:0]                       axi4_arcache;
    wire    [2:0]                       axi4_arprot;
    wire    [M_AXI4_QOS_WIDTH-1:0]      axi4_arqos;
    wire    [3:0]                       axi4_arregion;
    wire                                axi4_arvalid;
    wire                                axi4_arready;
    wire    [M_AXI4_ID_WIDTH-1:0]       axi4_rid;
    wire    [M_AXI4_DATA_WIDTH-1:0]     axi4_rdata;
    wire    [1:0]                       axi4_rresp;
    wire                                axi4_rlast;
    wire                                axi4_rvalid;
    wire                                axi4_rready;
    
    // -----------------------------------------
    //  TOP
    // -----------------------------------------
    
    jelly_texture_cache_core
            #(
                .L1_CACHE_NUM           (CACHE_NUM),
                .L2_CACHE_NUM           (4),

    //          .L2_CACHE_X_SIZE        (1),
    //          .L2_CACHE_Y_SIZE        (1),
                
                .COMPONENT_NUM          (COMPONENT_NUM),
                .COMPONENT_DATA_WIDTH   (COMPONENT_DATA_WIDTH),
                
    //          .DATA_WIDTH             (DATA_WIDTH),
    //          .STRB_WIDTH             (STRB_WIDTH),
                
                .USER_WIDTH             (USER_WIDTH),
                
                .ADDR_X_WIDTH           (S_ADDR_X_WIDTH),
                .ADDR_Y_WIDTH           (S_ADDR_Y_WIDTH),
                
                .L1_TAG_ADDR_WIDTH      (6),
                .L2_TAG_ADDR_WIDTH      (9),
                
                .L1_BLK_X_SIZE          (2),
                .L1_BLK_Y_SIZE          (2),
                .L2_BLK_X_SIZE          (3),
                .L2_BLK_Y_SIZE          (3),
                
    //          .PIX_ADDR_X_WIDTH       (PIX_ADDR_X_WIDTH),
    //          .PIX_ADDR_Y_WIDTH       (PIX_ADDR_Y_WIDTH),
    //          .BLK_ADDR_X_WIDTH       (BLK_ADDR_X_WIDTH),
    //          .BLK_ADDR_Y_WIDTH       (BLK_ADDR_Y_WIDTH),
                
                .L1_DATA_WIDE_SIZE      (1),
                
    //          .M_ADDR_X_WIDTH         (M_ADDR_X_WIDTH),
    //          .M_ADDR_Y_WIDTH         (M_ADDR_Y_WIDTH),
    //          .M_DATA_WIDTH           (M_DATA_WIDTH),
                
                .USE_S_RREADY           (1'b0),
                
                .BORDER_DATA            (BORDER_DATA),
                
                .ADDR_WIDTH             (ADDR_WIDTH),
                
                .M_AXI4_ID_WIDTH        (M_AXI4_ID_WIDTH),
                .M_AXI4_ADDR_WIDTH      (M_AXI4_ADDR_WIDTH),
                .M_AXI4_DATA_SIZE       (M_AXI4_DATA_SIZE),
                .M_AXI4_DATA_WIDTH      (M_AXI4_DATA_WIDTH),
                .M_AXI4_LEN_WIDTH       (M_AXI4_LEN_WIDTH),
                .M_AXI4_QOS_WIDTH       (M_AXI4_QOS_WIDTH),
                .M_AXI4_ARID            (M_AXI4_ARID),
                .M_AXI4_ARSIZE          (M_AXI4_ARSIZE),
                .M_AXI4_ARBURST         (M_AXI4_ARBURST),
                .M_AXI4_ARLOCK          (M_AXI4_ARLOCK),
                .M_AXI4_ARCACHE         (M_AXI4_ARCACHE),
                .M_AXI4_ARPROT          (M_AXI4_ARPROT),
                .M_AXI4_ARQOS           (M_AXI4_ARQOS),
                .M_AXI4_ARREGION        (M_AXI4_ARREGION),
                
                .M_AXI4_REGS            (M_AXI4_REGS)
            )
        i_texture_cache_core
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .endian                 (1'b0),
                
                .param_addr             ({32'h000a_0000, 32'h0005_0000, 32'h0000_0000}),
                .param_width            (640),
                .param_height           (480),
                .param_stride           (640*8),
        //      .param_arlen            (7),
                
                .clear_start            (0),
                .clear_busy             (),
                
                
                .s_aruser               (s_aruser),
                .s_araddrx              (s_araddrx),
                .s_araddry              (s_araddry),
                .s_arvalid              (s_arvalid),
                .s_arready              (s_arready),
                
                .s_ruser                (s_ruser),
                .s_rdata                (s_rdata),
                .s_rvalid               (s_rvalid),
                .s_rready               (s_rready),
                
                .m_axi4_arid            (axi4_arid),
                .m_axi4_araddr          (axi4_araddr),
                .m_axi4_arlen           (axi4_arlen),
                .m_axi4_arsize          (axi4_arsize),
                .m_axi4_arburst         (axi4_arburst),
                .m_axi4_arlock          (axi4_arlock),
                .m_axi4_arcache         (axi4_arcache),
                .m_axi4_arprot          (axi4_arprot),
                .m_axi4_arqos           (axi4_arqos),
                .m_axi4_arregion        (axi4_arregion),
                .m_axi4_arvalid         (axi4_arvalid),
                .m_axi4_arready         (axi4_arready),
                .m_axi4_rid             (axi4_rid),
                .m_axi4_rdata           (axi4_rdata),
                .m_axi4_rresp           (axi4_rresp),
                .m_axi4_rlast           (axi4_rlast),
                .m_axi4_rvalid          (axi4_rvalid),
                .m_axi4_rready          (axi4_rready)
            );
    
    
    jelly_axi4_slave_model
            #(
                .AXI_ID_WIDTH           (M_AXI4_ID_WIDTH),
                .AXI_ADDR_WIDTH         (M_AXI4_ADDR_WIDTH),
                .AXI_QOS_WIDTH          (M_AXI4_QOS_WIDTH),
                .AXI_LEN_WIDTH          (M_AXI4_LEN_WIDTH),
                .AXI_DATA_SIZE          (M_AXI4_DATA_SIZE),
                .MEM_WIDTH              (17),
                
                .WRITE_LOG_FILE         (""),
                .READ_LOG_FILE          ("axi4_read.txt"),
                
                .AW_DELAY               (20),
                .AR_DELAY               (20),
                
                .AW_FIFO_PTR_WIDTH      (4),
                .W_FIFO_PTR_WIDTH       (4),
                .B_FIFO_PTR_WIDTH       (4),
                .AR_FIFO_PTR_WIDTH      (4),
                .R_FIFO_PTR_WIDTH       (4),
                
                .AW_BUSY_RATE           (50),
                .W_BUSY_RATE            (50),
                .B_BUSY_RATE            (50),
                .AR_BUSY_RATE           (50),
                .R_BUSY_RATE            (50)
            )
        i_axi4_slave_model
            (
                .aresetn                (~reset),
                .aclk                   (clk),
                
                .s_axi4_awid            (),
                .s_axi4_awaddr          (),
                .s_axi4_awlen           (),
                .s_axi4_awsize          (),
                .s_axi4_awburst         (),
                .s_axi4_awlock          (),
                .s_axi4_awcache         (),
                .s_axi4_awprot          (),
                .s_axi4_awqos           (),
                .s_axi4_awvalid         (0),
                .s_axi4_awready         (),
                .s_axi4_wdata           (),
                .s_axi4_wstrb           (),
                .s_axi4_wlast           (),
                .s_axi4_wvalid          (0),
                .s_axi4_wready          (),
                .s_axi4_bid             (),
                .s_axi4_bresp           (),
                .s_axi4_bvalid          (),
                .s_axi4_bready          (0),
                
                .s_axi4_arid            (axi4_arid),
                .s_axi4_araddr          (axi4_araddr),
                .s_axi4_arlen           (axi4_arlen),
                .s_axi4_arsize          (axi4_arsize),
                .s_axi4_arburst         (axi4_arburst),
                .s_axi4_arlock          (axi4_arlock),
                .s_axi4_arcache         (axi4_arcache),
                .s_axi4_arprot          (axi4_arprot),
                .s_axi4_arqos           (axi4_arqos),
                .s_axi4_arvalid         (axi4_arvalid),
                .s_axi4_arready         (axi4_arready),
                .s_axi4_rid             (axi4_rid),
                .s_axi4_rdata           (axi4_rdata),
                .s_axi4_rresp           (axi4_rresp),
                .s_axi4_rlast           (axi4_rlast),
                .s_axi4_rvalid          (axi4_rvalid),
                .s_axi4_rready          (axi4_rready)
            );
    
    
    
    
endmodule


`default_nettype wire


// end of file
