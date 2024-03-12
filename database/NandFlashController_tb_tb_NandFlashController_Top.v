`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/02 22:39:41
// Design Name: 
// Module Name: tb_phy
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_NandFlashController_Top;

    parameter IDelayValue          = 7;
    parameter InputClockBufferType = 0;
    parameter NumberOfWays         = 2;
    
    reg                           iSystemClock            ; // SDR 100MHz
    reg                           iDelayRefClock          ; // SDR 200Mhz
    reg                           iOutputDrivingClock     ; // SDR 200Mhz
    reg                           iReset                  ;
    // glbl glbl();
    // 100 MHz
    initial                 
    begin
        iSystemClock     <= 1'b0;
        #10000;
        forever
        begin    
            iSystemClock <= 1'b1;
            #6000;
            iSystemClock <= 1'b0;
            #6000;
        end
    end

    // 200 MHz
    initial                 
    begin
        iDelayRefClock          <= 1'b0;
        iOutputDrivingClock     <= 1'b0;
        #10000;
        forever
        begin    
            iDelayRefClock      <= 1'b1;
            iOutputDrivingClock <= 1'b1;
            #3000;
            iDelayRefClock      <= 1'b0;
            iOutputDrivingClock <= 1'b0;
            #3000;
        end
    end
 
    reg   [5:0]                   iOpcode              ;
    reg   [4:0]                   iTargetID            ;
    reg   [4:0]                   iSourceID            ;
    reg   [31:0]                  iAddress             ;
    reg   [15:0]                  iLength              ;
    reg                           iCMDValid            ;
    wire                          oCMDReady            ;

    reg   [15:0]                  iWriteData           ;
    reg                           iWriteLast           ;
    reg                           iWriteValid          ;
    reg   [1:0]                   iWriteKeep           ;
    wire                          oWriteReady          ;

    wire  [15:0]                  oReadData            ;
    wire                          oReadLast            ;
    wire                          oReadValid           ;
    wire   [1:0]                  oReadKeep            ;
    wire                          iReadReady           ;
    wire                          oReadTransValid      ;

    wire  [NumberOfWays - 1:0]    oReadyBusy           ;

    wire  [23:0]                  oStatus                 ;
    wire                          oStatusValid            ;

// pinpad
    wire                          IO_NAND_DQS                 ;
    wire                  [7:0]   IO_NAND_DQ                  ;
    wire   [NumberOfWays - 1:0]   O_NAND_CE                   ;
    wire                          O_NAND_WE                   ;
    wire                          O_NAND_RE                   ;
    wire                          O_NAND_ALE                  ;
    wire                          O_NAND_CLE                  ;
    wire   [NumberOfWays - 1:0]   I_NAND_RB                   ;
    wire                          O_NAND_WP                   ;

    NandFlashController_Top #(
            .IDelayValue(IDelayValue),
            .InputClockBufferType(InputClockBufferType),
            .NumberOfWays(NumberOfWays)
        ) inst_NandFlashController_Top (
            .iSystemClock        (iSystemClock),
            .iDelayRefClock      (iDelayRefClock),
            .iOutputDrivingClock (iOutputDrivingClock),
            .iReset              (iReset),

            .iOpcode             (iOpcode),
            .iTargetID           (iTargetID),
            .iSourceID           (iSourceID),
            .iAddress            (iAddress),
            .iLength             (iLength),
            .iCMDValid           (iCMDValid),
            .oCMDReady           (oCMDReady),

            .iWriteData          (iWriteData),
            .iWriteLast          (iWriteLast),
            .iWriteValid         (iWriteValid),
            .iWriteKeep          (iWriteKeep),
            .oWriteReady         (oWriteReady),

            .oReadData           (oReadData),
            .oReadLast           (oReadLast),
            .oReadValid          (oReadValid),
            .oReadKeep           (oReadKeep),
            .iReadReady          (iReadReady),
            .oReadTransValid     (oReadTransValid),

            .oReadyBusy          (oReadyBusy),

            .oStatus             (oStatus     ),
            .oStatusValid        (oStatusValid),

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


    nand_model nand_b0_1 (
        //clocks
        .Clk_We_n(O_NAND_WE), //same connection to both wen/nclk
        
        //CE
        .Ce_n(O_NAND_CE[0]),
        .Ce2_n(O_NAND_CE[1]),
        
        //Ready/busy
        .Rb_n(I_NAND_RB[0]),
        .Rb2_n(I_NAND_RB[1]),
         
        //DQ DQS
        .Dqs(IO_NAND_DQS), 
        //Reversed DQ
        .Dq_Io(IO_NAND_DQ),
         
        //ALE CLE WR WP
        .Cle(O_NAND_CLE), 
        //.Cle2(),
        .Ale(O_NAND_ALE), 
        //.Ale2(),
        .Wr_Re_n(O_NAND_RE), 
        //.Wr_Re2_n(),
        .Wp_n(O_NAND_WP) 
        //.Wp2_n()
        );  

    // Parameters
    parameter AXI_DATA_WIDTH    = 16;
    parameter AXI_ADDR_WIDTH    = 16;
    parameter AXI_STRB_WIDTH    = (AXI_DATA_WIDTH/8);
    parameter AXI_ID_WIDTH      = 8;
    parameter AXI_MAX_BURST_LEN = 256;
    parameter AXIS_DATA_WIDTH   = AXI_DATA_WIDTH;
    parameter AXIS_KEEP_ENABLE  = (AXIS_DATA_WIDTH>8);
    parameter AXIS_KEEP_WIDTH   = (AXIS_DATA_WIDTH/8);
    parameter AXIS_LAST_ENABLE  = 1;
    parameter AXIS_ID_ENABLE    = 1;
    parameter AXIS_ID_WIDTH     = 8;
    parameter AXIS_DEST_ENABLE  = 0;
    parameter AXIS_DEST_WIDTH   = 8;
    parameter AXIS_USER_ENABLE  = 1;
    parameter AXIS_USER_WIDTH   = 1;
    parameter LEN_WIDTH         = 20;
    parameter TAG_WIDTH         = 8;
    parameter ENABLE_SG         = 0;
    parameter ENABLE_UNALIGNED  = 0;
    // Inputs
    wire                       clk                      = iSystemClock   ;
    wire                       rst                      = iReset         ;
    
    reg [AXI_ADDR_WIDTH-1:0]   s_axis_read_desc_addr    = 0              ;
    reg [LEN_WIDTH-1:0]        s_axis_read_desc_len     = 4320           ;
    reg [TAG_WIDTH-1:0]        s_axis_read_desc_tag     = 0              ;
    reg [AXIS_ID_WIDTH-1:0]    s_axis_read_desc_id      = 0              ;
    reg [AXIS_DEST_WIDTH-1:0]  s_axis_read_desc_dest    = 0              ;
    reg [AXIS_USER_WIDTH-1:0]  s_axis_read_desc_user    = 0              ;
    reg                        s_axis_read_desc_valid   = 0              ;
    wire                       m_axis_read_data_tready  = 1              ;
    
    wire [AXI_ADDR_WIDTH-1:0]  s_axis_write_desc_addr   = 0              ;
    wire [LEN_WIDTH-1:0]       s_axis_write_desc_len    = 4320           ;
    wire [TAG_WIDTH-1:0]       s_axis_write_desc_tag    = 0              ;
    wire                       s_axis_write_desc_valid  = oReadTransValid;
    
    
    wire [AXIS_DATA_WIDTH-1:0] s_axis_write_data_tdata  = oReadData      ;
    wire [AXIS_KEEP_WIDTH-1:0] s_axis_write_data_tkeep  = oReadKeep      ;
    wire                       s_axis_write_data_tvalid = oReadValid     ;
    wire                       s_axis_write_data_tlast  = oReadLast      ;
    wire [AXIS_ID_WIDTH-1:0]   s_axis_write_data_tid    = 0              ;
    wire [AXIS_DEST_WIDTH-1:0] s_axis_write_data_tdest  = 0              ;
    wire [AXIS_USER_WIDTH-1:0] s_axis_write_data_tuser  = 0              ;
    
    wire                       m_axi_awready            ;//= 0              ;
    wire                       m_axi_wready             ;//= 0              ;
    wire [AXI_ID_WIDTH-1:0]    m_axi_bid                ;//= 0              ;
    wire [1:0]                 m_axi_bresp              ;//= 0              ;
    wire                       m_axi_bvalid             ;//= 0              ;
    wire                       m_axi_arready            ;//= 0              ;
    wire [AXI_ID_WIDTH-1:0]    m_axi_rid                ;//= 0              ;
    wire [AXI_DATA_WIDTH-1:0]  m_axi_rdata              ;//= 0              ;
    wire [1:0]                 m_axi_rresp              ;//= 0              ;
    wire                       m_axi_rlast              ;//= 0              ;
    wire                       m_axi_rvalid             ;//= 0              ;
    
    wire                       read_enable              = 1              ;
    wire                       write_enable             = 1              ;
    wire                       write_abort              = 0              ;
    
    // Outputs
    wire                       s_axis_read_desc_ready                    ;
    wire [TAG_WIDTH-1:0]       m_axis_read_desc_status_tag               ;
    wire                       m_axis_read_desc_status_valid             ;
    wire [AXIS_DATA_WIDTH-1:0] m_axis_read_data_tdata                    ;
    wire [AXIS_KEEP_WIDTH-1:0] m_axis_read_data_tkeep                    ;
    wire                       m_axis_read_data_tvalid                   ;
    wire                       m_axis_read_data_tlast                    ;
    wire [AXIS_ID_WIDTH-1:0]   m_axis_read_data_tid                      ;
    wire [AXIS_DEST_WIDTH-1:0] m_axis_read_data_tdest                    ;
    wire [AXIS_USER_WIDTH-1:0] m_axis_read_data_tuser                    ;
    wire                       s_axis_write_desc_ready                   ;
    wire [LEN_WIDTH-1:0]       m_axis_write_desc_status_len              ;
    wire [TAG_WIDTH-1:0]       m_axis_write_desc_status_tag              ;
    wire [AXIS_ID_WIDTH-1:0]   m_axis_write_desc_status_id               ;
    wire [AXIS_DEST_WIDTH-1:0] m_axis_write_desc_status_dest             ;
    wire [AXIS_USER_WIDTH-1:0] m_axis_write_desc_status_user             ;
    wire                       m_axis_write_desc_status_valid            ;
    wire                       s_axis_write_data_tready                  ;

    assign                     iReadReady = s_axis_write_data_tready;

    wire [AXI_ID_WIDTH-1:0]    m_axi_awid                                ;
    wire [AXI_ADDR_WIDTH-1:0]  m_axi_awaddr                              ;
    wire [7:0]                 m_axi_awlen                               ;
    wire [2:0]                 m_axi_awsize                              ;
    wire [1:0]                 m_axi_awburst                             ;
    wire                       m_axi_awlock                              ;
    wire [3:0]                 m_axi_awcache                             ;
    wire [2:0]                 m_axi_awprot                              ;
    wire                       m_axi_awvalid                             ;
    wire [AXI_DATA_WIDTH-1:0]  m_axi_wdata                               ;
    wire [AXI_STRB_WIDTH-1:0]  m_axi_wstrb                               ;
    wire                       m_axi_wlast                               ;
    wire                       m_axi_wvalid                              ;
    wire                       m_axi_bready                              ;
    wire [AXI_ID_WIDTH-1:0]    m_axi_arid                                ;
    wire [AXI_ADDR_WIDTH-1:0]  m_axi_araddr                              ;
    wire [7:0]                 m_axi_arlen                               ;
    wire [2:0]                 m_axi_arsize                              ;
    wire [1:0]                 m_axi_arburst                             ;
    wire                       m_axi_arlock                              ;
    wire [3:0]                 m_axi_arcache                             ;
    wire [2:0]                 m_axi_arprot                              ;
    wire                       m_axi_arvalid                             ;
    wire                       m_axi_rready                              ;
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
        .clk                            (clk                            ),
        .rst                            (rst                            ),
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
        .m_axi_awprot  (m_axi_awprot  ),
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
        .m_axi_arprot  (m_axi_arprot  ),
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

    parameter DATA_WIDTH = 16;
    parameter ADDR_WIDTH = 16;
    parameter STRB_WIDTH = (DATA_WIDTH/8);
    parameter ID_WIDTH = 8;
    parameter PIPELINE_OUTPUT = 0;

    axi_ram #(
        .DATA_WIDTH      (DATA_WIDTH      ),
        .ADDR_WIDTH      (ADDR_WIDTH      ),
        .STRB_WIDTH      (STRB_WIDTH      ),
        .ID_WIDTH        (ID_WIDTH        ),
        .PIPELINE_OUTPUT (PIPELINE_OUTPUT )
    )
    axi_ram (
        .clk           (clk           ),
        .rst           (rst           ),
        .s_axi_awid    (m_axi_awid    ),
        .s_axi_awaddr  (m_axi_awaddr  ),
        .s_axi_awlen   (m_axi_awlen   ),
        .s_axi_awsize  (m_axi_awsize  ),
        .s_axi_awburst (m_axi_awburst ),
        .s_axi_awlock  (m_axi_awlock  ),
        .s_axi_awcache (m_axi_awcache ),
        .s_axi_awprot  (m_axi_awprot  ),
        .s_axi_awvalid (m_axi_awvalid ),
        .s_axi_awready (m_axi_awready ),
        .s_axi_wdata   (m_axi_wdata   ),
        .s_axi_wstrb   (m_axi_wstrb   ),
        .s_axi_wlast   (m_axi_wlast   ),
        .s_axi_wvalid  (m_axi_wvalid  ),
        .s_axi_wready  (m_axi_wready  ),
        .s_axi_bid     (m_axi_bid     ),
        .s_axi_bresp   (m_axi_bresp   ),
        .s_axi_bvalid  (m_axi_bvalid  ),
        .s_axi_bready  (m_axi_bready  ),
        .s_axi_arid    (m_axi_arid    ),
        .s_axi_araddr  (m_axi_araddr  ),
        .s_axi_arlen   (m_axi_arlen   ),
        .s_axi_arsize  (m_axi_arsize  ),
        .s_axi_arburst (m_axi_arburst ),
        .s_axi_arlock  (m_axi_arlock  ),
        .s_axi_arcache (m_axi_arcache ),
        .s_axi_arprot  (m_axi_arprot  ),
        .s_axi_arvalid (m_axi_arvalid ),
        .s_axi_arready (m_axi_arready ),
        .s_axi_rid     (m_axi_rid     ),
        .s_axi_rdata   (m_axi_rdata   ),
        .s_axi_rresp   (m_axi_rresp   ),
        .s_axi_rlast   (m_axi_rlast   ),
        .s_axi_rvalid  (m_axi_rvalid  ),
        .s_axi_rready  (m_axi_rready  )
    );

    reg [7:0]  global_way;
    reg [15:0] global_col;
    reg [23:0] global_row;

    reg RDY  ;
    reg ARDY ;

    integer seed;

    initial  begin seed =  0; end

    reg [15:0] memory [0:12*2160-1];

    task NFC_signal;
        input   [5:0]                   rOpcode              ;
        input   [4:0]                   rTargetID            ;
        input   [4:0]                   rSourceID            ;
        input   [31:0]                  rAddress             ;
        input   [15:0]                  rLength              ;
        input                           rCMDValid            ;
        input   [31:0]                  rWriteData           ;
        input                           rWriteLast           ;
        input                           rWriteValid          ;
        input                           rReadReady           ;

        begin
            @(posedge iSystemClock);   
                iOpcode     <= rOpcode    ;
                iTargetID   <= rTargetID  ;
                iSourceID   <= rSourceID  ;
                iAddress    <= rAddress   ;
                iLength     <= rLength    ;
                iCMDValid   <= rCMDValid  ;

                iWriteData  <= rWriteData ;
                iWriteLast  <= rWriteLast ;
                iWriteValid <= rWriteValid;
                // iReadReady  <= 1 ;      
        end
    endtask

    task reset_ffh;
        begin

        NFC_signal(6'b000001, 5'b00101, 0, 32'h00000000, 16'h0000, 1, 16'h0000, 0, 0, 0);
        NFC_signal(6'b000001, 5'b00101, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);
        @(posedge iSystemClock);
        wait(oCMDReady == 0);
        end
    endtask

    task setfeature_efh;
        begin
        NFC_signal(6'b000010, 5'b00101, 0, 32'h00000000, 16'h0000, 1, 16'h0000, 0, 0, 0);
        NFC_signal(6'b000010, 5'b00101, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);
        @(posedge iSystemClock);
        wait(oCMDReady == 0);
        end
    endtask


    task getfeature_eeh;
        begin
        NFC_signal(6'b000101, 5'b00101, 0, 32'h00000000, 16'h0008, 1, 16'h0000, 0, 0, 0);
        NFC_signal(6'b000101, 5'b00101, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);
        @(posedge iSystemClock);
        wait(oCMDReady == 0);
        end
    endtask



    task progpage_80h_10h;
        input [15:0] number;
        begin
        NFC_signal(6'b000011, 5'b00000, 0, 32'h00000000,   number, 1, 16'h0000, 0, 0, 0);
        NFC_signal(6'b000011, 5'b00000, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);
        // @(posedge iSystemClock);
        // wait(oCMDReady == 0);
        end
    endtask

    task progpage_80h_15h_cache;
        input [15:0] number;
        begin
        NFC_signal(6'b000011, 5'b00001, 0, 32'h00000000,   number, 1, 16'h0000, 0, 0, 0);
        NFC_signal(6'b000011, 5'b00001, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);
        // @(posedge iSystemClock);
        // wait(oCMDReady == 0);
        end
    endtask

    task progpage_80h_10h_multplane;
        input [15:0] number;
        begin
        NFC_signal(6'b000011, 5'b00010, 0, 32'h00000000,   number, 1, 16'h0000, 0, 0, 0);
        NFC_signal(6'b000011, 5'b00010, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);
        // @(posedge iSystemClock);
        // wait(oCMDReady == 0);
        end
    endtask
        reg [15:0] reg1 = 0;
        reg [15:0] reg2 = 0;
    task readpage_00h_30h;
        input [15:0] number;
        input check;
        integer m;
        integer base_adr;

        begin
        NFC_signal(6'b000100, 5'b00101, 0, 32'h00000000,   number, 1, 16'h0000, 0, 0, 0);
        NFC_signal(6'b000100, 5'b00101, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);


        wait(m_axis_write_desc_status_valid == 1);
        @(posedge iSystemClock);
        s_axis_read_desc_valid <= 1;
        @(posedge iSystemClock);
        s_axis_read_desc_valid <= 0;
        @(posedge iSystemClock);


        // wait(m_axis_read_desc_status_valid == 1);
        // @(posedge iSystemClock);

        

        if (check) begin
            m = 0;
            base_adr = global_row[7]*6 + global_row[2:0];
            @(posedge iSystemClock);
            wait((m_axis_read_data_tvalid & m_axis_read_data_tready) == 1);
            while ((~ m_axis_read_data_tlast)) begin
                @(posedge iSystemClock);
                reg1 <= memory[base_adr*2160 + m];
                reg2 <= m_axis_read_data_tdata;

                if ((m_axis_read_data_tvalid & m_axis_read_data_tready) == 1) begin
                    m <= m + 1;
                    if (memory[base_adr*2160 + m] != m_axis_read_data_tdata) begin
                        $display("Error Read data wrong %d %d %04x %04x",base_adr,m,memory[base_adr*2160 + m],oReadData);
                        $stop;
                    end
                end else begin
                    m <= m;
                end
            end 
        end else begin
            // @(posedge iSystemClock);
            // wait(oCMDReady == 0);
        end

        end
    endtask

    task eraseblock_60h_d0h;
        begin
        NFC_signal(6'b000110, 5'b00000, 0, 32'h00000000, 16'h0008, 1, 16'h0000, 0, 0, 0);
        NFC_signal(6'b000110, 5'b00000, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);
        @(posedge iSystemClock);
        wait(oCMDReady == 0);
        end
    endtask

    task eraseblock_60h_d1h_multiplane;
        begin
        NFC_signal(6'b000110, 5'b00010, 0, 32'h00000000, 16'h0008, 1, 16'h0000, 0, 0, 0);
        NFC_signal(6'b000110, 5'b00010, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);
        @(posedge iSystemClock);
        wait(oCMDReady == 0);
        end
    endtask

    task readstatus_70h;
        begin
        NFC_signal(6'b000111, 5'b00100, 0, 32'h00000000, 16'h0008, 1, 16'h0000, 0, 0, 0);
        NFC_signal(6'b000111, 5'b00100, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);
        @(posedge iSystemClock);
        wait(oCMDReady == 0);
        end
    endtask

    task readstatus_78h;
        begin
        NFC_signal(6'b000111, 5'b00101, 0, 32'h00000000, 16'h0008, 1, 16'h0000, 0, 0, 0);
        NFC_signal(6'b000111, 5'b00101, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);
        @(posedge iSystemClock);
        wait(oCMDReady == 0);
        end
    endtask



    task select_way;
        input [7:0] way;
        begin
        global_way = way;
        NFC_signal(6'b100000, 5'b00000, 0, {24'd0,way}, 16'h0008, 1, 16'h0000, 0, 0, 0);
        end
    endtask

    task set_coladdr;
        input [15:0] col;
        begin
        global_col = col;
        NFC_signal(6'b100010, 5'b00000, 0, {16'd0,col}, 16'h0008, 1, 16'h0000, 0, 0, 0);
        end
    endtask

    task set_rowaddr;
        input [23:0] row;
        begin
        global_row = row;
        NFC_signal(6'b100100, 5'b00000, 0, {8'd0,row}, 16'h0008, 1, 16'h0000, 0, 0, 0);
        end
    endtask



    always @ (posedge iSystemClock) begin
        if (iReset) begin
            RDY  <= 0;
            ARDY <= 0;
        end else if (oStatusValid)  begin
            RDY  <= oStatus[6];
            ARDY <= oStatus[5];
        end
    end


    task s_axis_input;
        input [23:0] rowaddr;
        input [15:0] number;
        integer base_adr;
        integer j;
        begin
            base_adr = rowaddr[7]*6 + rowaddr[2:0];
            for(j=0;j<number[15:1];j=j+1)
            begin
                if (j == 0) begin
                    @(posedge iSystemClock);   
                    iWriteValid = 1;
                    iWriteData  = rowaddr[15:0];
                    iWriteKeep  = 2'b11;
                    iWriteLast  = 0;
                end else if (j == 1) begin
                    @(posedge iSystemClock);   
                    iWriteValid = 1;
                    iWriteData  = {8'h00, rowaddr[23:16]};
                    iWriteKeep  = 2'b11;
                    iWriteLast  = 0;
                end else if (j == 2159) begin
                    @(posedge iSystemClock);   
                    iWriteValid = 1;
                    iWriteData  = $random(seed);
                    iWriteKeep  = 2'b11;
                    iWriteLast  = 1;
                end else begin
                    @(posedge iSystemClock);   
                    iWriteValid = 1;
                    iWriteData  = $random(seed);
                    iWriteKeep  = 2'b11;
                    iWriteLast  = 0;
                end
                memory[base_adr*2160 + j] = iWriteData;
            end
            @(posedge iSystemClock);   
            iWriteValid = 0;
            iWriteData  = 16'h0000;
            iWriteKeep  = 2'b00;
            iWriteLast  = 1;
        end
    endtask


    integer I;
    task program_multiplane_cache;
        input [11:0] block;
        input [6:0] page;
        input finished;

        reg [11:0] rblock;
        reg [6:0] rpage;
        begin
            rblock <= block + 1'b1;
            rpage <= page + 1'b1;

            // plane0 page0
            set_rowaddr({{5'd0},{block},page});
            readstatus_70h;
            while (RDY == 0) begin
                readstatus_70h;
            end
            progpage_80h_10h_multplane(16'd4320);
            s_axis_input({{5'd0},{block},{page}}, 16'd4320);
            @(posedge iSystemClock);
            wait(oCMDReady == 0);

            // plane1 page0
            set_rowaddr({{5'd0},{rblock},page});
            readstatus_78h;
            while (RDY == 0) begin
                readstatus_78h;
            end
            progpage_80h_15h_cache(16'd4320);
            s_axis_input({{5'd0},{rblock},{page}}, 16'd4320);
            @(posedge iSystemClock);
            wait(oCMDReady == 0);

            // plane0 page1 cache
            
            set_rowaddr({{5'd0},{block},{rpage}});
            readstatus_78h;
            while (RDY == 0) begin
                readstatus_78h;
            end
            progpage_80h_10h_multplane(16'd4320);
            s_axis_input({{5'd0},{block},{rpage}}, 16'd4320);
            @(posedge iSystemClock);
            wait(oCMDReady == 0);

            // plane1 page1 cache
            set_rowaddr({{5'd0},{rblock},{rpage}});
            readstatus_78h;
            while (RDY == 0) begin
                readstatus_78h;
            end
            s_axis_input({{5'd0},{rblock},{rpage}}, 16'd4320);
            if (finished)
                progpage_80h_10h(16'd4320);
            else
                progpage_80h_15h_cache(16'd4320);

            @(posedge iSystemClock);
            wait(oCMDReady == 0);
        end
    endtask

    initial
    
        begin
        // $dumpfile("./tb_NFC_Physical_Top.vcd");
        // $dumpvars(0, tb_NFC_Physical_Top);
        iReset <= 1;
        NFC_signal(6'b000001, 5'b00101, 0, 32'h00000000, 16'h0000, 0, 16'h0000, 0, 0, 0);
        for (I = 0; I < 10; I = I + 1)
            @(posedge iSystemClock);
        iReset <= 0;
        # 1000000
        for (I = 0; I < 10; I = I + 1)
            @(posedge iSystemClock);
        
        select_way(8'd1);
        reset_ffh;
        setfeature_efh;
        // getfeature_eeh;

        program_multiplane_cache(11'd0, 7'd0, 0);
        program_multiplane_cache(11'd0, 7'd2, 0);
        program_multiplane_cache(11'd0, 7'd4, 1);

        while (ARDY == 0) begin
            readstatus_70h;
        end

        set_rowaddr({{5'd0},{11'd0},{7'd0}});
        readpage_00h_30h(16'd4320,1);
        set_rowaddr({{5'd0},{11'd0},{7'd1}});
        readpage_00h_30h(16'd4320,1);
        set_rowaddr({{5'd0},{11'd0},{7'd2}});
        readpage_00h_30h(16'd4320,1);
        set_rowaddr({{5'd0},{11'd0},{7'd3}});
        readpage_00h_30h(16'd4320,1);
        set_rowaddr({{5'd0},{11'd0},{7'd4}});
        readpage_00h_30h(16'd4320,1);
        set_rowaddr({{5'd0},{11'd0},{7'd5}});
        readpage_00h_30h(16'd4320,1);


        set_rowaddr({{5'd0},{11'd1},{7'd0}});
        readpage_00h_30h(16'd4320,1);
        set_rowaddr({{5'd0},{11'd1},{7'd1}});
        readpage_00h_30h(16'd4320,1);
        set_rowaddr({{5'd0},{11'd1},{7'd2}});
        readpage_00h_30h(16'd4320,1);
        set_rowaddr({{5'd0},{11'd1},{7'd3}});
        readpage_00h_30h(16'd4320,1);
        set_rowaddr({{5'd0},{11'd1},{7'd4}});
        readpage_00h_30h(16'd4320,1);
        set_rowaddr({{5'd0},{11'd1},{7'd5}});
        readpage_00h_30h(16'd4320,1);


        set_rowaddr({{5'd0},{11'd0},{7'd0}});
        eraseblock_60h_d1h_multiplane;
        set_rowaddr({{5'd0},{11'd1},{7'd0}});
        readstatus_78h;
        while (ARDY == 0) begin
            readstatus_78h;
        end

        eraseblock_60h_d0h;
        readstatus_78h;
        while (ARDY == 0) begin
            readstatus_78h;
        end

        set_rowaddr({{5'd0},{11'd0},{7'd0}});
        readpage_00h_30h(16'd4320,0);
        set_rowaddr({{5'd0},{11'd0},{7'd1}});
        readpage_00h_30h(16'd4320,0);
        set_rowaddr({{5'd0},{11'd0},{7'd2}});
        readpage_00h_30h(16'd4320,0);
        set_rowaddr({{5'd0},{11'd0},{7'd3}});
        readpage_00h_30h(16'd4320,0);
        set_rowaddr({{5'd0},{11'd0},{7'd4}});
        readpage_00h_30h(16'd4320,0);
        set_rowaddr({{5'd0},{11'd0},{7'd5}});
        readpage_00h_30h(16'd4320,0);


        set_rowaddr({{5'd0},{11'd1},{7'd0}});
        readpage_00h_30h(16'd4320,0);
        set_rowaddr({{5'd0},{11'd1},{7'd1}});
        readpage_00h_30h(16'd4320,0);
        set_rowaddr({{5'd0},{11'd1},{7'd2}});
        readpage_00h_30h(16'd4320,0);
        set_rowaddr({{5'd0},{11'd1},{7'd3}});
        readpage_00h_30h(16'd4320,0);
        set_rowaddr({{5'd0},{11'd1},{7'd4}});
        readpage_00h_30h(16'd4320,0);
        set_rowaddr({{5'd0},{11'd1},{7'd5}});
        readpage_00h_30h(16'd4320,0);

        $display("test finished!");
        repeat (50) @(posedge iSystemClock);
        // $finish;
        end
    
endmodule
