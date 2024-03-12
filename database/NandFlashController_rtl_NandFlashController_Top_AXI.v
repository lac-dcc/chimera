`timescale 1ns / 1ps

module NandFlashController_Top_AXI
#
(
    parameter AXI_HPorACP          = 1, // 1 means hp port, 0 means acp port
    /*
    * AXI-lite slave interface
    */
    parameter AXIL_ADDR_WIDTH      = 32,
    parameter AXIL_DATA_WIDTH      = 32,
    parameter AXIL_STRB_WIDTH      = AXIL_DATA_WIDTH/8,
    /*
    * AXI master interface
    */
    parameter AXI_ID_WIDTH         = 2 ,
    parameter AXI_ADDR_WIDTH       = 32,
    parameter AXI_DATA_WIDTH       = 64,
    parameter AXI_MAX_BURST_LEN    = 16,
    parameter AXI_STRB_WIDTH       = AXI_DATA_WIDTH/8,
    parameter AXI_ARUSER_WIDTH     = 5,
    parameter AXI_AWUSER_WIDTH     = 5,
    
    parameter IDelayValue          = 15,
    parameter InputClockBufferType = 0 ,
    parameter NumberOfWays         = 2 ,
    parameter PageSize             = 8640
)
(
    input  wire                       s_axil_clk         ,
    input  wire                       s_axil_rst         ,
    /*
    * AXI-lite slave interface
    */
    input  wire [AXIL_ADDR_WIDTH-1:0]      s_axil_awaddr      ,
    input  wire [2:0]                 s_axil_awprot      ,
    input  wire                       s_axil_awvalid     ,
    output wire                       s_axil_awready     ,
    input  wire [AXIL_DATA_WIDTH-1:0]      s_axil_wdata       ,
    input  wire [AXIL_STRB_WIDTH-1:0]      s_axil_wstrb       ,
    input  wire                       s_axil_wvalid      ,
    output wire                       s_axil_wready      ,
    output wire [1:0]                 s_axil_bresp       ,
    output wire                       s_axil_bvalid      ,
    input  wire                       s_axil_bready      ,
    input  wire [AXIL_ADDR_WIDTH-1:0]      s_axil_araddr      ,
    input  wire [2:0]                 s_axil_arprot      ,
    input  wire                       s_axil_arvalid     ,
    output wire                       s_axil_arready     ,
    output wire [AXIL_DATA_WIDTH-1:0]      s_axil_rdata       ,
    output wire [1:0]                 s_axil_rresp       ,
    output wire                       s_axil_rvalid      ,
    input  wire                       s_axil_rready      ,
    
    output wire                       m_axi_clk          ,
    output wire                       m_axi_rst          ,
    /*
     * AXI master interface
     */
    output wire [AXI_ID_WIDTH-1:0]    m_axi_awid,
    output wire [AXI_ADDR_WIDTH-1:0]  m_axi_awaddr,
    output wire [7:0]                 m_axi_awlen,
    output wire [2:0]                 m_axi_awsize,
    output wire [1:0]                 m_axi_awburst,
    output wire                       m_axi_awlock,
    output wire [3:0]                 m_axi_awcache,
    output wire [2:0]                 m_axi_awprot,

    output wire [3:0]                 m_axi_awqos,
    // output wire                       m_axi_awregion,
    output wire [AXI_AWUSER_WIDTH-1:0]    m_axi_awuser,

    output wire                       m_axi_awvalid,
    input  wire                       m_axi_awready,
    output wire [AXI_DATA_WIDTH-1:0]  m_axi_wdata,
    output wire [AXI_STRB_WIDTH-1:0]  m_axi_wstrb,
    output wire                       m_axi_wlast,

    // output wire [WUSER_WIDTH-1:0]     m_axi_wuser,

    output wire                       m_axi_wvalid,
    input  wire                       m_axi_wready,
    input  wire [AXI_ID_WIDTH-1:0]    m_axi_bid,
    input  wire [1:0]                 m_axi_bresp,

    // input  wire [BUSER_WIDTH-1:0]     m_axi_buser,

    input  wire                       m_axi_bvalid,
    output wire                       m_axi_bready,
    output wire [AXI_ID_WIDTH-1:0]    m_axi_arid,
    output wire [AXI_ADDR_WIDTH-1:0]  m_axi_araddr,
    output wire [7:0]                 m_axi_arlen,
    output wire [2:0]                 m_axi_arsize,
    output wire [1:0]                 m_axi_arburst,
    output wire                       m_axi_arlock,
    output wire [3:0]                 m_axi_arcache,
    output wire [2:0]                 m_axi_arprot,

    output wire [3:0]                 m_axi_arqos,
    // output wire                       m_axi_arregion,
    output wire [AXI_ARUSER_WIDTH-1:0]    m_axi_aruser,

    output wire                       m_axi_arvalid,
    input  wire                       m_axi_arready,
    input  wire [AXI_ID_WIDTH-1:0]    m_axi_rid,
    input  wire [AXI_DATA_WIDTH-1:0]  m_axi_rdata,
    input  wire [1:0]                 m_axi_rresp,
    input  wire                       m_axi_rlast,

    // input  wire [RUSER_WIDTH-1:0]     m_axi_ruser,
    
    input  wire                       m_axi_rvalid,
    output wire                       m_axi_rready,

    // output wire  [NumberOfWays - 1:0] dbg_RB,
    
    input  wire                       iSystemClock       ,
    input  wire                       iDelayRefClock     ,
    // input  wire                       iOutputDrivingClock,
    input  wire                       iSystemClock_120    ,
    // input  wire                       iSystemClock_4x,
    input  wire                       iReset             ,
    /*
    * Pin Pad
    */
    inout  wire                       IO_NAND_DQS        ,
    inout  wire                [7:0]  IO_NAND_DQ         ,
    output wire [NumberOfWays - 1:0]  O_NAND_CE          ,
    output wire                       O_NAND_WE          ,
    output wire                       O_NAND_RE          ,
    output wire                       O_NAND_ALE         ,
    output wire                       O_NAND_CLE         ,
    input  wire [NumberOfWays - 1:0]  I_NAND_RB          ,
    output wire                       O_NAND_WP    
);

    wire                         waxil_AxilValid   ;
    wire [ 5:0]                  waxil_DelayTapLoad;
    wire [31:0]                  waxil_Command     ;
    wire                         waxil_CommandValid;
    wire [31:0]                  waxil_Address     ;
    wire [15:0]                  waxil_Length      ;
    wire                         waxil_CommandFail ;
    wire [31:0]                  waxil_DMARAddress ;
    wire [31:0]                  waxil_DMAWAddress ;
    wire [31:0]                  waxil_NFCStatus   ;
    wire [31:0]                  waxil_NandRBStatus;

    wire                         wAxilValid   ;
    wire [ 5:0]                  wDelayTapLoad;
    wire [31:0]                  wCommand     ;
    wire                         wCommandValid;
    wire [31:0]                  wAddress     ;
    wire [15:0]                  wLength      ;
    wire                         wCommandFail ;
    wire [31:0]                  wDMARAddress ;
    wire [31:0]                  wDMAWAddress ;
    wire [31:0]                  wTNFCStatus   ;
    wire [31:0]                  wNandRBStatus;

    wire                         waxil_WriteTransValid;
    wire                         waxil_ReadTransValid;

    wire  [5:0]                  wNFCOpcode                 ;
    wire  [4:0]                  wNFCTargetID               ;
    wire  [4:0]                  wNFCSourceID               ;
    wire  [31:0]                 wNFCAddress                ;
    wire  [15:0]                 wNFCLength                 ;
    wire                         wNFCCMDValid               ;
    wire                         wNFCCMDReady               ;

    wire  [15:0]                 wNFCWriteData              ;
    wire                         wNFCWriteLast              ;
    wire                         wNFCWriteValid             ;
    wire  [1:0]                  wNFCWriteKeep              ;
    wire                         wNFCWriteReady             ;
    wire                         wNFCWriteTransValid        ;
    
    wire  [23:0]                 wNFCStatus                 ;
    wire                         wNFCStatusValid            ;

    wire  [15:0]                 wNFCReadData               ;
    wire                         wNFCReadLast               ;
    wire                         wNFCReadValid              ;
    wire  [1:0]                  wNFCReadKeep               ;
    wire                         wNFCReadReady              ;
    wire                         wNFCReadTransValid         ;
    
    wire  [NumberOfWays - 1:0]   wNFCReadyBusy              ;
    // assign dbg_RB = wNFCReadyBusy;

    assign m_axi_clk = s_axil_clk;
    assign m_axi_rst = s_axil_rst;


    assign m_axi_awqos = 4'b0000;
    assign m_axi_arqos = 4'b0000;

    assign m_axi_awprot = 3'b000;
    assign m_axi_arprot = 3'b000;

    generate
        if (AXI_HPorACP == 0) begin
            assign m_axi_awuser = 5'b00001;
            assign m_axi_aruser = 5'b00001;
        end else begin
            assign m_axi_awuser = 5'b00000;
            assign m_axi_aruser = 5'b00000;
        end
    endgenerate
    // acp coherent request


    NandFlashController_AXIL_Reg #(
            .DATA_WIDTH(AXIL_DATA_WIDTH),
            .ADDR_WIDTH(AXIL_ADDR_WIDTH),
            .PIPELINE_OUTPUT(0)
        ) inst_NandFlashController_AXIL_Reg (
            .clk            (s_axil_clk         ),
            .rst            (~s_axil_rst         ),
            .s_axil_awaddr  (s_axil_awaddr      ),
            .s_axil_awprot  (s_axil_awprot      ),
            .s_axil_awvalid (s_axil_awvalid     ),
            .s_axil_awready (s_axil_awready     ),
            .s_axil_wdata   (s_axil_wdata       ),
            .s_axil_wstrb   (s_axil_wstrb       ),
            .s_axil_wvalid  (s_axil_wvalid      ),
            .s_axil_wready  (s_axil_wready      ),
            .s_axil_bresp   (s_axil_bresp       ),
            .s_axil_bvalid  (s_axil_bvalid      ),
            .s_axil_bready  (s_axil_bready      ),
            .s_axil_araddr  (s_axil_araddr      ),
            .s_axil_arprot  (s_axil_arprot      ),
            .s_axil_arvalid (s_axil_arvalid     ),
            .s_axil_arready (s_axil_arready     ),
            .s_axil_rdata   (s_axil_rdata       ),
            .s_axil_rresp   (s_axil_rresp       ),
            .s_axil_rvalid  (s_axil_rvalid      ),
            .s_axil_rready  (s_axil_rready      ),

            .oAxilValid     (waxil_AxilValid    ),
            .oDelayTapLoad  (waxil_DelayTapLoad ),

            .oCommand       (waxil_Command      ),
            .oCommandValid  (waxil_CommandValid ),
            .oAddress       (waxil_Address      ),
            .oLength        (waxil_Length       ),
            .iCommandFail   (waxil_CommandFail  ),
            .oDMARAddress   (waxil_DMARAddress  ),
            .oDMAWAddress   (waxil_DMAWAddress  ),
            .iNFCStatus     (waxil_NFCStatus    ),
            .iNandRBStatus  (waxil_NandRBStatus )
        );

    axis_async_fifo #(
        .DEPTH(16),
        .DATA_WIDTH(32+32+16+1+6),
        .KEEP_ENABLE(0),
        .KEEP_WIDTH(1),
        .LAST_ENABLE(0),
        .ID_ENABLE(0),
        .ID_WIDTH(8),
        .DEST_ENABLE(0),
        .DEST_WIDTH(8),
        .USER_ENABLE(0),
        .USER_WIDTH(8),
        .FRAME_FIFO(0),
        .USER_BAD_FRAME_VALUE(1'b1),
        .USER_BAD_FRAME_MASK(1'b1),
        .DROP_BAD_FRAME(0),
        .DROP_WHEN_FULL(0)
    )
    axil_sys (
        // Common reset
        .async_rst(~s_axil_rst),
        // AXI input
        .s_clk(s_axil_clk),
        .s_axis_tdata({waxil_Command,waxil_Address,waxil_Length,waxil_CommandValid, waxil_DelayTapLoad}),
        .s_axis_tkeep(1),
        .s_axis_tvalid(waxil_AxilValid),
        .s_axis_tready(),
    //    .s_axis_tlast(s_axis_tlast),
    //    .s_axis_tid(s_axis_tid),
    //    .s_axis_tdest(s_axis_tdest),
    //    .s_axis_tuser(s_axis_tuser),
        // AXI output
        .m_clk(iSystemClock),
        .m_axis_tdata({wCommand,wAddress,wLength,wCommandValid,wDelayTapLoad}),
        .m_axis_tkeep(),
        .m_axis_tvalid(wAxilValid),
        .m_axis_tready(1)
    //    .m_axis_tlast(m_axis_tlast),
    //    .m_axis_tid(m_axis_tid),
    //    .m_axis_tdest(m_axis_tdest),
    //    .m_axis_tuser(m_axis_tuser)
    );

    axis_async_fifo #(
        .DEPTH(16),
        .DATA_WIDTH(1+32+32+1+1),
        .KEEP_ENABLE(0),
        .KEEP_WIDTH(1),
        .LAST_ENABLE(0),
        .ID_ENABLE(0),
        .ID_WIDTH(8),
        .DEST_ENABLE(0),
        .DEST_WIDTH(8),
        .USER_ENABLE(0),
        .USER_WIDTH(8),
        .FRAME_FIFO(0),
        .USER_BAD_FRAME_VALUE(1'b1),
        .USER_BAD_FRAME_MASK(1'b1),
        .DROP_BAD_FRAME(0),
        .DROP_WHEN_FULL(0)
    )
    sys_axil (
        // Common reset
        .async_rst(~s_axil_rst),
        // AXI input
        .s_clk(iSystemClock),
        .s_axis_tdata({wCommandFail,wTNFCStatus,wNandRBStatus,wNFCWriteTransValid,wNFCReadTransValid}),
        .s_axis_tkeep(1),
        .s_axis_tvalid(1),
        .s_axis_tready(),
    //    .s_axis_tlast(s_axis_tlast),
    //    .s_axis_tid(s_axis_tid),
    //    .s_axis_tdest(s_axis_tdest),
    //    .s_axis_tuser(s_axis_tuser),
        // AXI output
        .m_clk(s_axil_clk),
        .m_axis_tdata({waxil_CommandFail,waxil_NFCStatus,waxil_NandRBStatus, waxil_WriteTransValid, waxil_ReadTransValid}),
        .m_axis_tkeep(),
        .m_axis_tvalid(),
        .m_axis_tready(1)
    //    .m_axis_tlast(m_axis_tlast),
    //    .m_axis_tid(m_axis_tid),
    //    .m_axis_tdest(m_axis_tdest),
    //    .m_axis_tuser(m_axis_tuser)
    );


    NandFlashController_Interface_adapter #(
            .NumberOfWays(NumberOfWays)
        ) inst_NandFlashController_Interface_adapter (
            .iSystemClock  (iSystemClock),
            .iReset        (iReset),

            .iAxilValid    (wAxilValid),
            .iCommand      (wCommand),
            .iCommandValid (wCommandValid),
            .iAddress      (wAddress),
            .iLength       (wLength),
            .oCommandFail  (wCommandFail),
            .oNFCStatus    (wTNFCStatus),
            .oNandRBStatus (wNandRBStatus),

            .oOpcode       (wNFCOpcode),
            .oTargetID     (wNFCTargetID),
            .oSourceID     (wNFCSourceID),
            .oAddress      (wNFCAddress),
            .oLength       (wNFCLength),
            .oCMDValid     (wNFCCMDValid),
            .iCMDReady     (wNFCCMDReady),

            .iStatus       (wNFCStatus),
            .iStatusValid  (wNFCStatusValid),
            .iReadyBusy    (wNFCReadyBusy)
        );

    NandFlashController_Top #(
            .IDelayValue(IDelayValue),
            .InputClockBufferType(InputClockBufferType),
            .NumberOfWays(NumberOfWays),
            .PageSize(PageSize)
        ) inst_NandFlashController_Top (
            .iSystemClock        (iSystemClock),
            .iDelayRefClock      (iDelayRefClock),
            // .iOutputDrivingClock (iOutputDrivingClock),
            .iSystemClock_120     (iSystemClock_120),
            // .iSystemClock_4x     (iSystemClock_4x),
            .iReset              (iReset),

            .iOpcode             (wNFCOpcode),
            .iTargetID           (wNFCTargetID),
            .iSourceID           (wNFCSourceID),
            .iAddress            (wNFCAddress),
            .iLength             (wNFCLength),
            .iCMDValid           (wNFCCMDValid),
            .oCMDReady           (wNFCCMDReady),

            .iWriteData          (wNFCWriteData),
            .iWriteLast          (wNFCWriteLast),
            .iWriteValid         (wNFCWriteValid),
            .iWriteKeep          (wNFCWriteKeep),
            .oWriteReady         (wNFCWriteReady),
            .oWriteTransValid    (wNFCWriteTransValid),

            .oReadData           (wNFCReadData),
            .oReadLast           (wNFCReadLast),
            .oReadValid          (wNFCReadValid),
            .oReadKeep           (wNFCReadKeep),
            .iReadReady          (wNFCReadReady),
            .oReadTransValid     (wNFCReadTransValid),

            .oReadyBusy          (wNFCReadyBusy),

            .oStatus             (wNFCStatus     ),
            .oStatusValid        (wNFCStatusValid),

            .iDelayTapValid      (wDelayTapLoad[5]),
            .iDelayTap           (wDelayTapLoad[4:0]),

            .IO_NAND_DQS         (IO_NAND_DQS),
            .IO_NAND_DQ          (IO_NAND_DQ),
            .O_NAND_CE           (O_NAND_CE),
            .O_NAND_WE           (O_NAND_WE),
            .O_NAND_RE           (O_NAND_RE),
            .O_NAND_ALE          (O_NAND_ALE),
            .O_NAND_CLE          (O_NAND_CLE),
            .I_NAND_RB           (I_NAND_RB),
            .O_NAND_WP           (O_NAND_WP)
        );

    // Parameters
    // localparam AXI_DATA_WIDTH    = 16;
    // localparam AXI_ADDR_WIDTH    = 16;
    // localparam AXI_STRB_WIDTH    = (AXI_DATA_WIDTH/8);
    // localparam AXI_ID_WIDTH      = 8;
    // localparam AXI_MAX_BURST_LEN = 256;
    localparam AXIS_DATA_WIDTH   = AXI_DATA_WIDTH;
    localparam AXIS_KEEP_ENABLE  = (AXIS_DATA_WIDTH>8);
    localparam AXIS_KEEP_WIDTH   = (AXIS_DATA_WIDTH/8);
    localparam AXIS_LAST_ENABLE  = 1;
    localparam AXIS_ID_ENABLE    = 0;
    localparam AXIS_ID_WIDTH     = 8;
    localparam AXIS_DEST_ENABLE  = 0;
    localparam AXIS_DEST_WIDTH   = 8;
    localparam AXIS_USER_ENABLE  = 0;
    localparam AXIS_USER_WIDTH   = 1;
    localparam LEN_WIDTH         = 16;
    localparam TAG_WIDTH         = 8;
    localparam ENABLE_SG         = 0;
    localparam ENABLE_UNALIGNED  = 0;
    // Inputs

    wire                       s_axis_read_desc_valid  = waxil_WriteTransValid;
    wire                       s_axis_read_desc_ready                         ;
    wire [AXI_ADDR_WIDTH-1:0]  s_axis_read_desc_addr   = waxil_DMARAddress    ;
    wire [LEN_WIDTH-1:0]       s_axis_read_desc_len    = waxil_Length         ;
    wire [TAG_WIDTH-1:0]       s_axis_read_desc_tag    = 0                    ;
    wire [AXIS_ID_WIDTH-1:0]   s_axis_read_desc_id     = 0                    ;
    wire [AXIS_DEST_WIDTH-1:0] s_axis_read_desc_dest   = 0                    ;
    wire [AXIS_USER_WIDTH-1:0] s_axis_read_desc_user   = 0                    ;

        // ila_0 ila0(
        // .clk(s_axil_clk),
        // .probe0(waxil_WriteTransValid),
        // .probe1(waxil_DMARAddress),
        // .probe2(waxil_Length[15:0]));

        // ila_0 ila1(
        // .clk(s_axil_clk),
        // .probe0(waxil_ReadTransValid),
        // .probe1(waxil_DMAWAddress),
        // .probe2(waxil_Length[15:0]));
    wire                       s_axis_write_desc_valid = waxil_ReadTransValid ;
    wire                       s_axis_write_desc_ready                        ;
    wire [AXI_ADDR_WIDTH-1:0]  s_axis_write_desc_addr  = waxil_DMAWAddress    ;
    wire [LEN_WIDTH-1:0]       s_axis_write_desc_len   = waxil_Length         ;
    wire [TAG_WIDTH-1:0]       s_axis_write_desc_tag   = 0                    ;

    wire                       m_axis_read_data_tvalid                   ;
    wire                       m_axis_read_data_tready                   ;
    wire [AXIS_DATA_WIDTH-1:0] m_axis_read_data_tdata                    ;
    wire [AXIS_KEEP_WIDTH-1:0] m_axis_read_data_tkeep                    ;
    wire                       m_axis_read_data_tlast                    ;
    wire [AXIS_ID_WIDTH-1:0]   m_axis_read_data_tid                      ;
    wire [AXIS_DEST_WIDTH-1:0] m_axis_read_data_tdest                    ;
    wire [AXIS_USER_WIDTH-1:0] m_axis_read_data_tuser                    ;

    wire                       s_axis_write_data_tvalid                  ;
    wire                       s_axis_write_data_tready                  ;
    wire [AXIS_DATA_WIDTH-1:0] s_axis_write_data_tdata                   ;
    wire [AXIS_KEEP_WIDTH-1:0] s_axis_write_data_tkeep                   ;
    wire                       s_axis_write_data_tlast                   ;
    wire [AXIS_ID_WIDTH-1:0]   s_axis_write_data_tid    = 0              ;
    wire [AXIS_DEST_WIDTH-1:0] s_axis_write_data_tdest  = 0              ;
    wire [AXIS_USER_WIDTH-1:0] s_axis_write_data_tuser  = 0              ;

    wire                       read_enable              = 1              ;
    wire                       write_enable             = 1              ;
    wire                       write_abort              = 0              ;
    
    // Outputs
    wire [TAG_WIDTH-1:0]       m_axis_read_desc_status_tag               ;
    wire                       m_axis_read_desc_status_valid             ;

    wire                       m_axis_write_desc_status_valid            ;
    wire [LEN_WIDTH-1:0]       m_axis_write_desc_status_len              ;
    wire [TAG_WIDTH-1:0]       m_axis_write_desc_status_tag              ;
    wire [AXIS_ID_WIDTH-1:0]   m_axis_write_desc_status_id               ;
    wire [AXIS_DEST_WIDTH-1:0] m_axis_write_desc_status_dest             ;
    wire [AXIS_USER_WIDTH-1:0] m_axis_write_desc_status_user             ;

    axi_dma #(
        .AXI_DATA_WIDTH    (AXI_DATA_WIDTH    ),
        .AXI_ADDR_WIDTH    (AXI_ADDR_WIDTH    ),
        .AXI_STRB_WIDTH    (AXI_STRB_WIDTH    ),
        .AXI_ID_WIDTH      (AXI_ID_WIDTH      ),
        .AXI_MAX_BURST_LEN (AXI_MAX_BURST_LEN ),

        .AXIS_DATA_WIDTH   (AXIS_DATA_WIDTH   ),
        .AXIS_KEEP_ENABLE  (AXIS_KEEP_ENABLE  ),
        .AXIS_KEEP_WIDTH   (AXIS_KEEP_WIDTH   ),
        .AXIS_LAST_ENABLE  (AXIS_LAST_ENABLE  ),
        .AXIS_ID_ENABLE    (AXIS_ID_ENABLE    ),
        .AXIS_ID_WIDTH     (AXIS_ID_WIDTH     ),
        .AXIS_DEST_ENABLE  (AXIS_DEST_ENABLE  ),
        .AXIS_DEST_WIDTH   (AXIS_DEST_WIDTH   ),
        .AXIS_USER_ENABLE  (AXIS_USER_ENABLE  ),
        .AXIS_USER_WIDTH   (AXIS_USER_WIDTH   ),
        .LEN_WIDTH         (LEN_WIDTH         ),
        .TAG_WIDTH         (TAG_WIDTH         ),
        .ENABLE_SG         (ENABLE_SG         ),
        .ENABLE_UNALIGNED  (ENABLE_UNALIGNED  )
    )
    axi_dma (
        .clk                            (s_axil_clk                      ),
        .rst                            (~s_axil_rst                      ),

        .s_axis_read_desc_addr          (s_axis_read_desc_addr          ),
        .s_axis_read_desc_len           (s_axis_read_desc_len           ),
        .s_axis_read_desc_tag           (s_axis_read_desc_tag           ),
        .s_axis_read_desc_id            (s_axis_read_desc_id            ),
        .s_axis_read_desc_dest          (s_axis_read_desc_dest          ),
        .s_axis_read_desc_user          (s_axis_read_desc_user          ),
        .s_axis_read_desc_valid         (s_axis_read_desc_valid         ),
        .s_axis_read_desc_ready         (s_axis_read_desc_ready         ),
        .m_axis_read_desc_status_tag    (m_axis_read_desc_status_tag    ),
        .m_axis_read_desc_status_valid  (m_axis_read_desc_status_valid  ),
        
        .m_axis_read_data_tdata         (m_axis_read_data_tdata         ),
        .m_axis_read_data_tkeep         (m_axis_read_data_tkeep         ),
        .m_axis_read_data_tvalid        (m_axis_read_data_tvalid        ),
        .m_axis_read_data_tready        (m_axis_read_data_tready        ),
        .m_axis_read_data_tlast         (m_axis_read_data_tlast         ),
        .m_axis_read_data_tid           (m_axis_read_data_tid           ),
        .m_axis_read_data_tdest         (m_axis_read_data_tdest         ),
        .m_axis_read_data_tuser         (m_axis_read_data_tuser         ),
        
        .s_axis_write_desc_addr         (s_axis_write_desc_addr         ),
        .s_axis_write_desc_len          (s_axis_write_desc_len          ),
        .s_axis_write_desc_tag          (s_axis_write_desc_tag          ),
        .s_axis_write_desc_valid        (s_axis_write_desc_valid        ),
        .s_axis_write_desc_ready        (s_axis_write_desc_ready        ),
        .m_axis_write_desc_status_len   (m_axis_write_desc_status_len   ),
        .m_axis_write_desc_status_tag   (m_axis_write_desc_status_tag   ),
        .m_axis_write_desc_status_id    (m_axis_write_desc_status_id    ),
        .m_axis_write_desc_status_dest  (m_axis_write_desc_status_dest  ),
        .m_axis_write_desc_status_user  (m_axis_write_desc_status_user  ),
        .m_axis_write_desc_status_valid (m_axis_write_desc_status_valid ),
        
        .s_axis_write_data_tdata        (s_axis_write_data_tdata        ),
        .s_axis_write_data_tkeep        (s_axis_write_data_tkeep        ),
        .s_axis_write_data_tvalid       (s_axis_write_data_tvalid       ),
        .s_axis_write_data_tready       (s_axis_write_data_tready       ),
        .s_axis_write_data_tlast        (s_axis_write_data_tlast        ),
        .s_axis_write_data_tid          (s_axis_write_data_tid          ),
        .s_axis_write_data_tdest        (s_axis_write_data_tdest        ),
        .s_axis_write_data_tuser        (s_axis_write_data_tuser        ),

        .m_axi_awid    (m_axi_awid    ),
        .m_axi_awaddr  (m_axi_awaddr  ),
        .m_axi_awlen   (m_axi_awlen   ),
        .m_axi_awsize  (m_axi_awsize  ),
        .m_axi_awburst (m_axi_awburst ),
        .m_axi_awlock  (m_axi_awlock  ),
        .m_axi_awcache (m_axi_awcache ),
        // .m_axi_awprot  (m_axi_awprot  ),
        .m_axi_awvalid (m_axi_awvalid ),
        .m_axi_awready (m_axi_awready ),
        .m_axi_wdata   (m_axi_wdata   ),
        .m_axi_wstrb   (m_axi_wstrb   ),
        .m_axi_wlast   (m_axi_wlast   ),
        .m_axi_wvalid  (m_axi_wvalid  ),
        .m_axi_wready  (m_axi_wready  ),
        .m_axi_bid     (m_axi_bid     ),
        .m_axi_bresp   (m_axi_bresp   ),
        .m_axi_bvalid  (m_axi_bvalid  ),
        .m_axi_bready  (m_axi_bready  ),
        .m_axi_arid    (m_axi_arid    ),
        .m_axi_araddr  (m_axi_araddr  ),
        .m_axi_arlen   (m_axi_arlen   ),
        .m_axi_arsize  (m_axi_arsize  ),
        .m_axi_arburst (m_axi_arburst ),
        .m_axi_arlock  (m_axi_arlock  ),
        .m_axi_arcache (m_axi_arcache ),
        // .m_axi_arprot  (m_axi_arprot  ),
        .m_axi_arvalid (m_axi_arvalid ),
        .m_axi_arready (m_axi_arready ),
        .m_axi_rid     (m_axi_rid     ),
        .m_axi_rdata   (m_axi_rdata   ),
        .m_axi_rresp   (m_axi_rresp   ),
        .m_axi_rlast   (m_axi_rlast   ),
        .m_axi_rvalid  (m_axi_rvalid  ),
        .m_axi_rready  (m_axi_rready  ),
        .read_enable   (read_enable   ),
        .write_enable  (write_enable  ),
        .write_abort   (write_abort   )
    );


    axis_async_fifo_adapter #(
        .DEPTH(PageSize),
        .S_DATA_WIDTH(16),
        .S_KEEP_ENABLE(1),
        .S_KEEP_WIDTH(2),
        .M_DATA_WIDTH(AXI_DATA_WIDTH),
        .M_KEEP_ENABLE(1),
        .M_KEEP_WIDTH(AXI_DATA_WIDTH/8),
        .ID_ENABLE(0),
        .ID_WIDTH(8),
        .DEST_ENABLE(0),
        .DEST_WIDTH(8),
        .USER_ENABLE(0),
        .USER_WIDTH(8),
        .FRAME_FIFO(0),
        .USER_BAD_FRAME_VALUE(1'b1),
        .USER_BAD_FRAME_MASK(1'b1),
        .DROP_BAD_FRAME(0),
        .DROP_WHEN_FULL(0)
    )
    Read_async_fifo (
        // AXI input
        .s_clk(iSystemClock),
        .s_rst(iReset),
        .s_axis_tdata (wNFCReadData ),
        .s_axis_tkeep (wNFCReadKeep ),
        .s_axis_tvalid(wNFCReadValid),
        .s_axis_tready(wNFCReadReady),
        .s_axis_tlast (wNFCReadLast ),
        // .s_axis_tid(s_axis_tid),
        // .s_axis_tdest(s_axis_tdest),
        // .s_axis_tuser(s_axis_tuser),
        // AXI output
        .m_clk(s_axil_clk),
        .m_rst(~s_axil_rst),
        .m_axis_tdata (s_axis_write_data_tdata),
        .m_axis_tkeep (s_axis_write_data_tkeep),
        .m_axis_tvalid(s_axis_write_data_tvalid),
        .m_axis_tready(s_axis_write_data_tready),
        .m_axis_tlast (s_axis_write_data_tlast),
        // .m_axis_tid(m_axis_tid),
        // .m_axis_tdest(m_axis_tdest),
        // .m_axis_tuser(m_axis_tuser),
        // Status
        .s_status_overflow(),
        .s_status_bad_frame(),
        .s_status_good_frame(),
        .m_status_overflow(),
        .m_status_bad_frame(),
        .m_status_good_frame()
    );

    axis_async_fifo_adapter #(
        .DEPTH(PageSize),
        .S_DATA_WIDTH(AXI_DATA_WIDTH),
        .S_KEEP_ENABLE(1),
        .S_KEEP_WIDTH(AXI_DATA_WIDTH/8),
        .M_DATA_WIDTH(16),
        .M_KEEP_ENABLE(1),
        .M_KEEP_WIDTH(2),
        .ID_ENABLE(0),
        .ID_WIDTH(8),
        .DEST_ENABLE(0),
        .DEST_WIDTH(8),
        .USER_ENABLE(0),
        .USER_WIDTH(8),
        .FRAME_FIFO(0),
        .USER_BAD_FRAME_VALUE(1'b1),
        .USER_BAD_FRAME_MASK(1'b1),
        .DROP_BAD_FRAME(0),
        .DROP_WHEN_FULL(0)
    )
    Write_async_fifo (
        // AXI input
        .s_clk(s_axil_clk),
        .s_rst(~s_axil_rst),
        .s_axis_tdata (m_axis_read_data_tdata ),
        .s_axis_tkeep (m_axis_read_data_tkeep ),
        .s_axis_tvalid(m_axis_read_data_tvalid),
        .s_axis_tready(m_axis_read_data_tready),
        .s_axis_tlast (m_axis_read_data_tlast ),
        // .s_axis_tid(s_axis_tid),
        // .s_axis_tdest(s_axis_tdest),
        // .s_axis_tuser(s_axis_tuser),
        // AXI output
        .m_clk(iSystemClock),
        .m_rst(iReset),
        .m_axis_tdata (wNFCWriteData),
        .m_axis_tkeep (wNFCWriteKeep),
        .m_axis_tvalid(wNFCWriteValid),
        .m_axis_tready(wNFCWriteReady),
        .m_axis_tlast (wNFCWriteLast),
        // .m_axis_tid(m_axis_tid),
        // .m_axis_tdest(m_axis_tdest),
        // .m_axis_tuser(m_axis_tuser),
        // Status
        .s_status_overflow(),
        .s_status_bad_frame(),
        .s_status_good_frame(),
        .m_status_overflow(),
        .m_status_bad_frame(),
        .m_status_good_frame()
    );
endmodule
