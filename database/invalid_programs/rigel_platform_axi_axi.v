module stage
  (
    inout wire [53:0] MIO,
    inout wire PS_SRSTB,
    inout wire PS_CLK,
    inout wire PS_PORB,
    inout wire DDR_Clk,
    inout wire DDR_Clk_n,
    inout wire DDR_CKE,
    inout wire DDR_CS_n,
    inout wire DDR_RAS_n,
    inout wire DDR_CAS_n,
    output wire DDR_WEB,
    inout wire [2:0] DDR_BankAddr,
    inout wire [14:0] DDR_Addr,
    inout wire DDR_ODT,
    inout wire DDR_DRSTB,
    inout wire [31:0] DDR_DQ,
    inout wire [3:0] DDR_DM,
    inout wire [3:0] DDR_DQS,
    inout wire [3:0] DDR_DQS_n,
    inout wire DDR_VRN,
    inout wire DDR_VRP,
    output wire [7:0] LED
  );

  wire [3:0] fclk;
  wire [3:0] fclkresetn;
  wire FCLK0;
  BUFG bufg(.I(fclk[0]),.O(FCLK0));
  wire ARESETN;
  assign ARESETN = fclkresetn[0];
  
  
    wire [31:0] PS7_ARADDR;
    wire [11:0] PS7_ARID;
    wire [2:0] PS7_ARPROT;
    wire PS7_ARREADY;
    wire PS7_ARVALID;
    wire [31:0] PS7_AWADDR;
    wire [11:0] PS7_AWID;
    wire [2:0] PS7_AWPROT;
    wire PS7_AWREADY;
    wire PS7_AWVALID;
    wire [11:0] PS7_BID;
    wire PS7_BREADY;
    wire [1:0] PS7_BRESP;
    wire PS7_BVALID;
    wire [31:0] PS7_RDATA;
    wire [11:0] PS7_RID;
    wire PS7_RLAST;
    wire PS7_RREADY;
    wire [1:0] PS7_RRESP;
    wire PS7_RVALID;
    wire [31:0] PS7_WDATA;
    wire PS7_WREADY;
    wire [3:0] PS7_WSTRB;
    wire PS7_WVALID;

    wire [31:0] M_AXI_ARADDR;
    wire M_AXI_ARREADY;
    wire  M_AXI_ARVALID;
    wire [31:0] M_AXI_AWADDR;
    wire M_AXI_AWREADY;
    wire  M_AXI_AWVALID;
    wire  M_AXI_BREADY;
    wire [1:0] M_AXI_BRESP;
    wire M_AXI_BVALID;
    wire [63:0] M_AXI_RDATA;
    wire M_AXI_RREADY;
    wire [1:0] M_AXI_RRESP;
    wire M_AXI_RVALID;
    wire [63:0] M_AXI_WDATA;
    wire M_AXI_WREADY;
    wire [7:0] M_AXI_WSTRB;
    wire M_AXI_WVALID;
    wire M_AXI_RLAST;
    wire M_AXI_WLAST;
    
    wire [3:0] M_AXI_ARLEN;
    wire [1:0] M_AXI_ARSIZE;
    wire [1:0] M_AXI_ARBURST;
    
    wire [3:0] M_AXI_AWLEN;
    wire [1:0] M_AXI_AWSIZE;
    wire [1:0] M_AXI_AWBURST;
    
    wire CONFIG_VALID;
    wire [31:0] CONFIG_CMD;
    wire [31:0] CONFIG_SRC;
    wire [31:0] CONFIG_DEST;
    wire [31:0] CONFIG_LEN;
    wire CONFIG_IRQ;
  
    wire READER_READY;
    wire WRITER_READY;

   wire  CONFIG_READY;
   
    assign CONFIG_READY = READER_READY && WRITER_READY;
    
    Conf #(.ADDR_BASE(32'h70000000)) conf(
    .ACLK(FCLK0),
    .ARESETN(ARESETN),
    .S_AXI_ARADDR(PS7_ARADDR), 
    .S_AXI_ARID(PS7_ARID),  
    .S_AXI_ARREADY(PS7_ARREADY), 
    .S_AXI_ARVALID(PS7_ARVALID), 
    .S_AXI_AWADDR(PS7_AWADDR), 
    .S_AXI_AWID(PS7_AWID), 
    .S_AXI_AWREADY(PS7_AWREADY), 
    .S_AXI_AWVALID(PS7_AWVALID), 
    .S_AXI_BID(PS7_BID), 
    .S_AXI_BREADY(PS7_BREADY), 
    .S_AXI_BRESP(PS7_BRESP), 
    .S_AXI_BVALID(PS7_BVALID), 
    .S_AXI_RDATA(PS7_RDATA), 
    .S_AXI_RID(PS7_RID), 
    .S_AXI_RLAST(PS7_RLAST), 
    .S_AXI_RREADY(PS7_RREADY), 
    .S_AXI_RRESP(PS7_RRESP), 
    .S_AXI_RVALID(PS7_RVALID), 
    .S_AXI_WDATA(PS7_WDATA), 
    .S_AXI_WREADY(PS7_WREADY), 
    .S_AXI_WSTRB(PS7_WSTRB), 
    .S_AXI_WVALID(PS7_WVALID),
    .CONFIG_VALID(CONFIG_VALID),
    .CONFIG_READY(CONFIG_READY),
    .CONFIG_CMD(CONFIG_CMD),
    .CONFIG_SRC(CONFIG_SRC),
    .CONFIG_DEST(CONFIG_DEST),
    .CONFIG_LEN(CONFIG_LEN),
    .CONFIG_IRQ(CONFIG_IRQ));

   // lengthInput/lengthOutput are in bytes
   wire [31:0] lengthInput;
   assign lengthInput = {4'b0000,CONFIG_LEN[27:0]};
   wire [31:0] lengthOutput;
   assign lengthOutput = (CONFIG_LEN[27:0] << 8'd8) >> CONFIG_LEN[31:28];

   reg [31:0]  clkcnt = 0;
//   assign LED = clkcnt[20:13];
   assign  LED = clkcnt[28:21];
   
  always @(posedge FCLK0) begin
//    if(ARESETN == 0)
//        LED <= 0;
//    else if(CONFIG_VALID)
//        LED <= {CONFIG_CMD[1:0],CONFIG_SRC[2:0],CONFIG_DEST[2:0]};
     clkcnt <= clkcnt+1;

  end

  wire [63:0] pipelineInput;
  wire       pipelineInputValid;
   
  wire [64:0] pipelineOutputPacked;
  wire [63:0] pipelineOutput;
  assign pipelineOutput = pipelineOutputPacked[63:0];   
  wire pipelineOutputValid;
  assign pipelineOutputValid = pipelineOutputPacked[64];
   
  wire       pipelineReady;
  wire      downstreamReady;

  ___PIPELINE_TAPS
    
  ___PIPELINE_MODULE_NAME pipeline(.CLK(FCLK0),.reset(CONFIG_READY),.ready(pipelineReady),.ready_downstream(downstreamReady),.process_input({pipelineInputValid,pipelineInput}),.process_output(pipelineOutputPacked) ___PIPELINE_TAPINPUT );

//   UnderflowShim #(.WAIT_CYCLES(___PIPELINE_WAIT_CYCLES)) OS(.CLK(FCLK0),.RST(CONFIG_READY),.lengthOutput(lengthOutput),.inp(pipelineOutputPacked[63:0]),.inp_valid(pipelineOutputPacked[64]),.out(pipelineOutput),.out_valid(pipelineOutputValid));
   
  DRAMReader reader(
    .ACLK(FCLK0),
    .ARESETN(ARESETN),
    .M_AXI_ARADDR(M_AXI_ARADDR),
    .M_AXI_ARREADY(M_AXI_ARREADY),
    .M_AXI_ARVALID(M_AXI_ARVALID),
    .M_AXI_RDATA(M_AXI_RDATA),
    .M_AXI_RREADY(M_AXI_RREADY),
    .M_AXI_RRESP(M_AXI_RRESP),
    .M_AXI_RVALID(M_AXI_RVALID),
    .M_AXI_RLAST(M_AXI_RLAST),
    .M_AXI_ARLEN(M_AXI_ARLEN),
    .M_AXI_ARSIZE(M_AXI_ARSIZE),
    .M_AXI_ARBURST(M_AXI_ARBURST),
    
    .CONFIG_VALID(CONFIG_VALID),
    .CONFIG_READY(READER_READY),
    .CONFIG_START_ADDR(CONFIG_SRC),
    .CONFIG_NBYTES(___PIPELINE_INPUT_BYTES),

    .DATA_READY_DOWNSTREAM(pipelineReady),
    .DATA_VALID(pipelineInputValid),
    .DATA(pipelineInput)
  );
  
  DRAMWriter writer(
    .ACLK(FCLK0),
    .ARESETN(ARESETN),
    .M_AXI_AWADDR(M_AXI_AWADDR),
    .M_AXI_AWREADY(M_AXI_AWREADY),
    .M_AXI_AWVALID(M_AXI_AWVALID),
    .M_AXI_WDATA(M_AXI_WDATA),
    .M_AXI_WREADY(M_AXI_WREADY),
    .M_AXI_WVALID(M_AXI_WVALID),
    .M_AXI_WLAST(M_AXI_WLAST),
    .M_AXI_WSTRB(M_AXI_WSTRB),
    
    .M_AXI_BRESP(M_AXI_BRESP),
    .M_AXI_BREADY(M_AXI_BREADY),
    .M_AXI_BVALID(M_AXI_BVALID),
    
    .M_AXI_AWLEN(M_AXI_AWLEN),
    .M_AXI_AWSIZE(M_AXI_AWSIZE),
    .M_AXI_AWBURST(M_AXI_AWBURST),
    
    .CONFIG_VALID(CONFIG_VALID),
    .CONFIG_READY(WRITER_READY),
    .CONFIG_START_ADDR(CONFIG_DEST),
    .CONFIG_NBYTES(___PIPELINE_OUTPUT_BYTES),

    .DATA_READY(downstreamReady),
    .DATA_VALID(pipelineOutputValid),
    .DATA(pipelineOutput)
  );

  PS7 ps7_0(
    .DMA0DATYPE(), 	// out std_logic_vector(1 downto 0);
    .DMA0DAVALID(), 	// out std_ulogic;
    .DMA0DRREADY(), 	// out std_ulogic;
    .DMA0RSTN(), 	// out std_ulogic;
    .DMA1DATYPE(), 	// out std_logic_vector(1 downto 0);
    .DMA1DAVALID(), 	// out std_ulogic;
    .DMA1DRREADY(), 	// out std_ulogic;
    .DMA1RSTN(), 	// out std_ulogic;
    .DMA2DATYPE(), 	// out std_logic_vector(1 downto 0);
    .DMA2DAVALID(), 	// out std_ulogic;
    .DMA2DRREADY(), 	// out std_ulogic;
    .DMA2RSTN(), 	// out std_ulogic;
    .DMA3DATYPE(), 	// out std_logic_vector(1 downto 0);
    .DMA3DAVALID(), 	// out std_ulogic;
    .DMA3DRREADY(), 	// out std_ulogic;
    .DMA3RSTN(), 	// out std_ulogic;
    .EMIOCAN0PHYTX(), 	// out std_ulogic;
    .EMIOCAN1PHYTX(), 	// out std_ulogic;
    .EMIOENET0GMIITXD(), 	// out std_logic_vector(7 downto 0);
    .EMIOENET0GMIITXEN(), 	// out std_ulogic;
    .EMIOENET0GMIITXER(), 	// out std_ulogic;
    .EMIOENET0MDIOMDC(), 	// out std_ulogic;
    .EMIOENET0MDIOO(), 	// out std_ulogic;
    .EMIOENET0MDIOTN(), 	// out std_ulogic;
    .EMIOENET0PTPDELAYREQRX(), 	// out std_ulogic;
    .EMIOENET0PTPDELAYREQTX(), 	// out std_ulogic;
    .EMIOENET0PTPPDELAYREQRX(), 	// out std_ulogic;
    .EMIOENET0PTPPDELAYREQTX(), 	// out std_ulogic;
    .EMIOENET0PTPPDELAYRESPRX(), 	// out std_ulogic;
    .EMIOENET0PTPPDELAYRESPTX(), 	// out std_ulogic;
    .EMIOENET0PTPSYNCFRAMERX(), 	// out std_ulogic;
    .EMIOENET0PTPSYNCFRAMETX(), 	// out std_ulogic;
    .EMIOENET0SOFRX(), 	// out std_ulogic;
    .EMIOENET0SOFTX(), 	// out std_ulogic;
    .EMIOENET1GMIITXD(), 	// out std_logic_vector(7 downto 0);
    .EMIOENET1GMIITXEN(), 	// out std_ulogic;
    .EMIOENET1GMIITXER(), 	// out std_ulogic;
    .EMIOENET1MDIOMDC(), 	// out std_ulogic;
    .EMIOENET1MDIOO(), 	// out std_ulogic;
    .EMIOENET1MDIOTN(), 	// out std_ulogic;
    .EMIOENET1PTPDELAYREQRX(), 	// out std_ulogic;
    .EMIOENET1PTPDELAYREQTX(), 	// out std_ulogic;
    .EMIOENET1PTPPDELAYREQRX(), 	// out std_ulogic;
    .EMIOENET1PTPPDELAYREQTX(), 	// out std_ulogic;
    .EMIOENET1PTPPDELAYRESPRX(), 	// out std_ulogic;
    .EMIOENET1PTPPDELAYRESPTX(), 	// out std_ulogic;
    .EMIOENET1PTPSYNCFRAMERX(), 	// out std_ulogic;
    .EMIOENET1PTPSYNCFRAMETX(), 	// out std_ulogic;
    .EMIOENET1SOFRX(), 	// out std_ulogic;
    .EMIOENET1SOFTX(), 	// out std_ulogic;
    .EMIOGPIOO(), 	 // out std_logic_vector(63 downto 0);
    .EMIOGPIOTN(),  // out std_logic_vector(63 downto 0);
    .EMIOI2C0SCLO(), 	 // out std_ulogic;
    .EMIOI2C0SCLTN(),  // out std_ulogic;
    .EMIOI2C0SDAO(), 	 // out std_ulogic;
    .EMIOI2C0SDATN(),  // out std_ulogic;
    .EMIOI2C1SCLO(), 	 // out std_ulogic;
    .EMIOI2C1SCLTN(),  // out std_ulogic;
    .EMIOI2C1SDAO(), 	 // out std_ulogic;
    .EMIOI2C1SDATN(),  // out std_ulogic;
    .EMIOPJTAGTDO(), 	// out std_ulogic;
    .EMIOPJTAGTDTN(), 	// out std_ulogic;
    .EMIOSDIO0BUSPOW(), 	// out std_ulogic;
    .EMIOSDIO0BUSVOLT(), 	// out std_logic_vector(2 downto 0);
    .EMIOSDIO0CLK(), 	// out std_ulogic;
    .EMIOSDIO0CMDO(), 	// out std_ulogic;
    .EMIOSDIO0CMDTN(), 	// out std_ulogic;
    .EMIOSDIO0DATAO(), 	// out std_logic_vector(3 downto 0);
    .EMIOSDIO0DATATN(), 	// out std_logic_vector(3 downto 0);
    .EMIOSDIO0LED(), 	// out std_ulogic;
    .EMIOSDIO1BUSPOW(), 	// out std_ulogic;
    .EMIOSDIO1BUSVOLT(), 	// out std_logic_vector(2 downto 0);
    .EMIOSDIO1CLK(), 	// out std_ulogic;
    .EMIOSDIO1CMDO(), 	// out std_ulogic;
    .EMIOSDIO1CMDTN(), 	// out std_ulogic;
    .EMIOSDIO1DATAO(), 	// out std_logic_vector(3 downto 0);
    .EMIOSDIO1DATATN(), 	// out std_logic_vector(3 downto 0);
    .EMIOSDIO1LED(), 	// out std_ulogic;
    .EMIOSPI0MO(), 	// out std_ulogic;
    .EMIOSPI0MOTN(), 	// out std_ulogic;
    .EMIOSPI0SCLKO(), 	// out std_ulogic;
    .EMIOSPI0SCLKTN(), 	// out std_ulogic;
    .EMIOSPI0SO(), 	// out std_ulogic;
    .EMIOSPI0SSNTN(), 	// out std_ulogic;
    .EMIOSPI0SSON(), 	// out std_logic_vector(2 downto 0);
    .EMIOSPI0STN(), 	// out std_ulogic;
    .EMIOSPI1MO(), 	// out std_ulogic;
    .EMIOSPI1MOTN(), 	// out std_ulogic;
    .EMIOSPI1SCLKO(), 	// out std_ulogic;
    .EMIOSPI1SCLKTN(), 	// out std_ulogic;
    .EMIOSPI1SO(), 	// out std_ulogic;
    .EMIOSPI1SSNTN(), 	// out std_ulogic;
    .EMIOSPI1SSON(), 	// out std_logic_vector(2 downto 0);
    .EMIOSPI1STN(), 	// out std_ulogic;
    .EMIOTRACECTL(), 	// out std_ulogic;
    .EMIOTRACEDATA(), 	// out std_logic_vector(31 downto 0);
    .EMIOTTC0WAVEO(), 	// out std_logic_vector(2 downto 0);
    .EMIOTTC1WAVEO(), 	// out std_logic_vector(2 downto 0);
    .EMIOUART0DTRN(), 	// out std_ulogic;
    .EMIOUART0RTSN(), 	// out std_ulogic;
    .EMIOUART0TX(), 	// out std_ulogic;
    .EMIOUART1DTRN(), 	// out std_ulogic;
    .EMIOUART1RTSN(), 	// out std_ulogic;
    .EMIOUART1TX(), 	// out std_ulogic;
    .EMIOUSB0PORTINDCTL(), 	// out std_logic_vector(1 downto 0);
    .EMIOUSB0VBUSPWRSELECT(), 	// out std_ulogic;
    .EMIOUSB1PORTINDCTL(), 	// out std_logic_vector(1 downto 0);
    .EMIOUSB1VBUSPWRSELECT(), 	// out std_ulogic;
    .EMIOWDTRSTO(), 	// out std_ulogic;
    .EVENTEVENTO(), 	// out std_ulogic;
    .EVENTSTANDBYWFE(), 	// out std_logic_vector(1 downto 0);
    .EVENTSTANDBYWFI(), 	// out std_logic_vector(1 downto 0);
    .FCLKCLK(fclk), 	 // out std_logic_vector(3 downto 0);
    .FCLKRESETN(fclkresetn), 	// out std_logic_vector(3 downto 0);
    .FTMTF2PTRIGACK(), 	// out std_logic_vector(3 downto 0);
    .FTMTP2FDEBUG(), 	// out std_logic_vector(31 downto 0);
    .FTMTP2FTRIG(), 	// out std_logic_vector(3 downto 0);
    .IRQP2F(), 	// out std_logic_vector(28 downto 0);
    
    .MAXIGP0ACLK(FCLK0), 	// in std_ulogic;
    .MAXIGP0ARADDR(PS7_ARADDR),  // out std_logic_vector(31 downto 0);
    .MAXIGP0ARBURST(),  // out std_logic_vector(1 downto 0);
    .MAXIGP0ARCACHE(),  // out std_logic_vector(3 downto 0);
    .MAXIGP0ARESETN(),  // out std_ulogic;
    .MAXIGP0ARID(PS7_ARID), 	 // out std_logic_vector(11 downto 0);
    .MAXIGP0ARLEN(),  // out std_logic_vector(3 downto 0);
    .MAXIGP0ARLOCK(),  // out std_logic_vector(1 downto 0);
    .MAXIGP0ARPROT(),  // out std_logic_vector(2 downto 0);
    .MAXIGP0ARQOS(),  // out std_logic_vector(3 downto 0);
    .MAXIGP0ARREADY(PS7_ARREADY), // in std_ulogic;
    .MAXIGP0ARSIZE(),  // out std_logic_vector(1 downto 0);
    .MAXIGP0ARVALID(PS7_ARVALID),  // out std_ulogic;
    .MAXIGP0AWADDR(PS7_AWADDR),  // out std_logic_vector(31 downto 0);
    .MAXIGP0AWBURST(),  // out std_logic_vector(1 downto 0);
    .MAXIGP0AWCACHE(),  // out std_logic_vector(3 downto 0);
    .MAXIGP0AWID(PS7_AWID), 	 // out std_logic_vector(11 downto 0);
    .MAXIGP0AWLEN(),  // out std_logic_vector(3 downto 0);
    .MAXIGP0AWLOCK(),  // out std_logic_vector(1 downto 0);
    .MAXIGP0AWPROT(),  // out std_logic_vector(2 downto 0);
    .MAXIGP0AWQOS(),  // out std_logic_vector(3 downto 0);
    .MAXIGP0AWREADY(PS7_AWREADY), // in std_ulogic;
    .MAXIGP0AWSIZE(),  // out std_logic_vector(1 downto 0);
    .MAXIGP0AWVALID(PS7_AWVALID),  // out std_ulogic;
    .MAXIGP0BID(PS7_BID), 	// in std_logic_vector(11 downto 0);
    .MAXIGP0BREADY(PS7_BREADY),  // out std_ulogic;
    .MAXIGP0BRESP(PS7_BRESP), // in std_logic_vector(1 downto 0);
    .MAXIGP0BVALID(PS7_BVALID), // in std_ulogic;
    .MAXIGP0RDATA(PS7_RDATA), // in std_logic_vector(31 downto 0);
    .MAXIGP0RID(PS7_RID), 	// in std_logic_vector(11 downto 0);
    .MAXIGP0RLAST(PS7_RLAST), // in std_ulogic;
    .MAXIGP0RREADY(PS7_RREADY),  // out std_ulogic;
    .MAXIGP0RRESP(PS7_RRESP), // in std_logic_vector(1 downto 0);    
    .MAXIGP0RVALID(PS7_RVALID), // in std_ulogic;
    .MAXIGP0WDATA(PS7_WDATA),  // out std_logic_vector(31 downto 0);
    .MAXIGP0WID(), 	 // out std_logic_vector(11 downto 0);
    .MAXIGP0WLAST(),  // out std_ulogic;
    .MAXIGP0WREADY(PS7_WREADY), // in std_ulogic;
    .MAXIGP0WSTRB(PS7_WSTRB),  // out std_logic_vector(3 downto 0);
    .MAXIGP0WVALID(PS7_WVALID),  // out std_ulogic;
    
    .MAXIGP1ARADDR(),  // out std_logic_vector(31 downto 0);
    .MAXIGP1ARBURST(),  // out std_logic_vector(1 downto 0);
    .MAXIGP1ARCACHE(),  // out std_logic_vector(3 downto 0);
    .MAXIGP1ARESETN(),  // out std_ulogic;
    .MAXIGP1ARID(), 	 // out std_logic_vector(11 downto 0);
    .MAXIGP1ARLEN(),  // out std_logic_vector(3 downto 0);
    .MAXIGP1ARLOCK(),  // out std_logic_vector(1 downto 0);
    .MAXIGP1ARPROT(),  // out std_logic_vector(2 downto 0);
    .MAXIGP1ARQOS(),  // out std_logic_vector(3 downto 0);
    .MAXIGP1ARSIZE(),  // out std_logic_vector(1 downto 0);
    .MAXIGP1ARVALID(),  // out std_ulogic;
    .MAXIGP1AWADDR(),  // out std_logic_vector(31 downto 0);
    .MAXIGP1AWBURST(),  // out std_logic_vector(1 downto 0);
    .MAXIGP1AWCACHE(),  // out std_logic_vector(3 downto 0);
    .MAXIGP1AWID(), 	 // out std_logic_vector(11 downto 0);
    .MAXIGP1AWLEN(),  // out std_logic_vector(3 downto 0);
    .MAXIGP1AWLOCK(),  // out std_logic_vector(1 downto 0);
    .MAXIGP1AWPROT(),  // out std_logic_vector(2 downto 0);
    .MAXIGP1AWQOS(),  // out std_logic_vector(3 downto 0);
    .MAXIGP1AWSIZE(),  // out std_logic_vector(1 downto 0);
    .MAXIGP1AWVALID(),  // out std_ulogic;
    .MAXIGP1BREADY(),  // out std_ulogic;
    .MAXIGP1RREADY(),  // out std_ulogic;
    .MAXIGP1WDATA(),  // out std_logic_vector(31 downto 0);
    .MAXIGP1WID(), 	 // out std_logic_vector(11 downto 0);
    .MAXIGP1WLAST(),  // out std_ulogic;
    .MAXIGP1WSTRB(),  // out std_logic_vector(3 downto 0);
    .MAXIGP1WVALID(),  // out std_ulogic;
    .SAXIGP0ARESETN(), 	// out std_ulogic;
    .SAXIGP0ARREADY(), 	// out std_ulogic;
    .SAXIGP0AWREADY(), 	// out std_ulogic;
    .SAXIGP0BID(), 	// out std_logic_vector(5 downto 0);
    .SAXIGP0BRESP(), 	// out std_logic_vector(1 downto 0);
    .SAXIGP0BVALID(), 	// out std_ulogic;
    .SAXIGP0RDATA(), 	// out std_logic_vector(31 downto 0);
    .SAXIGP0RID(), 	// out std_logic_vector(5 downto 0);
    .SAXIGP0RLAST(), 	// out std_ulogic;
    .SAXIGP0RRESP(), 	// out std_logic_vector(1 downto 0);
    .SAXIGP0RVALID(), 	// out std_ulogic;
    .SAXIGP0WREADY(), 	// out std_ulogic;
    .SAXIGP1ARESETN(), 	// out std_ulogic;
    .SAXIGP1ARREADY(), 	// out std_ulogic;
    .SAXIGP1AWREADY(), 	// out std_ulogic;
    .SAXIGP1BID(), 	// out std_logic_vector(5 downto 0);
    .SAXIGP1BRESP(), 	// out std_logic_vector(1 downto 0);
    .SAXIGP1BVALID(), 	// out std_ulogic;
    .SAXIGP1RDATA(), 	// out std_logic_vector(31 downto 0);
    .SAXIGP1RID(), 	// out std_logic_vector(5 downto 0);
    .SAXIGP1RLAST(), 	// out std_ulogic;
    .SAXIGP1RRESP(), 	// out std_logic_vector(1 downto 0);
    .SAXIGP1RVALID(), 	// out std_ulogic;
    .SAXIGP1WREADY(), 	// out std_ulogic;
    
    
    
    .SAXIHP0ACLK(1'b0), 		// in std_ulogic;
    .SAXIHP0ARADDR(32'b0),	// in std_logic_vector(31 downto 0);
    .SAXIHP0ARBURST(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIHP0ARCACHE(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIHP0ARESETN(), 	// out std_ulogic;
    .SAXIHP0ARID(6'b0),	// in std_logic_vector(2 downto 0);
    .SAXIHP0ARLEN(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIHP0ARLOCK(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIHP0ARPROT(3'b0),	// in std_logic_vector(2 downto 0);
    .SAXIHP0ARQOS(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIHP0ARREADY(), 	// out std_ulogic;
    .SAXIHP0ARSIZE(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIHP0ARVALID(1'b0), 		// in std_ulogic;
    .SAXIHP0AWADDR(32'b0),	// in std_logic_vector(31 downto 0);
    .SAXIHP0AWBURST(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIHP0AWCACHE(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIHP0AWID(6'b0),	// in std_logic_vector(2 downto 0);
    .SAXIHP0AWLEN(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIHP0AWLOCK(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIHP0AWPROT(3'b0),	// in std_logic_vector(2 downto 0);
    .SAXIHP0AWQOS(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIHP0AWREADY(), 	// out std_ulogic;
    .SAXIHP0AWSIZE(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIHP0AWVALID(1'b0), 		// in std_ulogic;
    .SAXIHP0BID(), 	// out std_logic_vector(2 downto 0);
    .SAXIHP0BREADY(1'b0), 		// in std_ulogic;
    .SAXIHP0BRESP(), 	// out std_logic_vector(1 downto 0);
    .SAXIHP0BVALID(), 	// out std_ulogic;
    .SAXIHP0RDATA(), 	// out std_logic_vector(63 downto 0);
    .SAXIHP0RID(), 	// out std_logic_vector(2 downto 0);
    .SAXIHP0RLAST(), 	// out std_ulogic;
    .SAXIHP0RREADY(1'b0), 		// in std_ulogic;
    .SAXIHP0RRESP(), 	// out std_logic_vector(1 downto 0);
    .SAXIHP0RVALID(), 	// out std_ulogic;
    .SAXIHP0WDATA(64'b0),	// in std_logic_vector(63 downto 0);
    .SAXIHP0WID(6'b0),	// in std_logic_vector(2 downto 0);
    .SAXIHP0WLAST(1'b0), 		// in std_ulogic;
    .SAXIHP0WREADY(), 	// out std_ulogic;
    .SAXIHP0WSTRB(8'b0),	// in std_logic_vector(7 downto 0);
    .SAXIHP0WVALID(1'b0), 		// in std_ulogic;
    
    .SAXIACPARUSER(5'b0),	// in std_logic_vector(4 downto 0);
    .SAXIACPAWUSER(5'b0),	// in std_logic_vector(4 downto 0);
    
    .SAXIACPACLK(FCLK0), 	// in std_ulogic;
    .SAXIACPARADDR(M_AXI_ARADDR),
    .SAXIACPARBURST(M_AXI_ARBURST), // in std_logic_vector(1 downto 0);
    .SAXIACPARCACHE(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIACPARESETN(),  // out std_ulogic;
    .SAXIACPARID(3'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIACPARLEN(M_AXI_ARLEN), // in std_logic_vector(3 downto 0);
    .SAXIACPARLOCK(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIACPARPROT(3'b0), // in std_logic_vector(2 downto 0);
    .SAXIACPARQOS(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIACPARREADY(M_AXI_ARREADY),
    .SAXIACPARSIZE(M_AXI_ARSIZE), // in std_logic_vector(1 downto 0);
    .SAXIACPARVALID(M_AXI_ARVALID),
    .SAXIACPAWADDR(M_AXI_AWADDR),
    .SAXIACPAWBURST(M_AXI_AWBURST), // in std_logic_vector(1 downto 0);
    .SAXIACPAWCACHE(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIACPAWID(3'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIACPAWLEN(M_AXI_AWLEN), // in std_logic_vector(3 downto 0);
    .SAXIACPAWLOCK(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIACPAWPROT(3'b0), // in std_logic_vector(2 downto 0);
    .SAXIACPAWQOS(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIACPAWREADY(M_AXI_AWREADY),
    .SAXIACPAWSIZE(M_AXI_AWSIZE), // in std_logic_vector(1 downto 0);
    .SAXIACPAWVALID(M_AXI_AWVALID),
    .SAXIACPBID(), 	 // out std_logic_vector(5 downto 0);
    .SAXIACPBREADY(M_AXI_BREADY),
    .SAXIACPBRESP(M_AXI_BRESP),
    .SAXIACPBVALID(M_AXI_BVALID),
    .SAXIACPRDATA(M_AXI_RDATA),
    .SAXIACPRID(), 	 // out std_logic_vector(5 downto 0);
    .SAXIACPRLAST(M_AXI_RLAST),  // out std_ulogic;
    .SAXIACPRREADY(M_AXI_RREADY),
    .SAXIACPRRESP(M_AXI_RRESP),
    .SAXIACPRVALID(M_AXI_RVALID),
    .SAXIACPWDATA(M_AXI_WDATA),
    .SAXIACPWID(3'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIACPWLAST(M_AXI_WLAST), // in std_ulogic;
    .SAXIACPWREADY(M_AXI_WREADY),
    .SAXIACPWSTRB(M_AXI_WSTRB),
    .SAXIACPWVALID(M_AXI_WVALID),
    
    .SAXIHP0RDISSUECAP1EN(1'b0), 		// in std_ulogic;
    .SAXIHP0WRISSUECAP1EN(1'b0), 		// in std_ulogic;
    .SAXIHP0RACOUNT(),  // out std_logic_vector(2 downto 0);
    .SAXIHP0RCOUNT(),  // out std_logic_vector(7 downto 0);
    .SAXIHP0WACOUNT(),  // out std_logic_vector(5 downto 0);
    .SAXIHP0WCOUNT(),  // out std_logic_vector(7 downto 0);
    
    .SAXIHP1ARESETN(),  // out std_ulogic;
    .SAXIHP1ARREADY(),  // out std_ulogic;
    .SAXIHP1AWREADY(),  // out std_ulogic;
    .SAXIHP1BID(), 	 // out std_logic_vector(5 downto 0);
    .SAXIHP1BRESP(),  // out std_logic_vector(1 downto 0);
    .SAXIHP1BVALID(),  // out std_ulogic;
    .SAXIHP1RACOUNT(),  // out std_logic_vector(2 downto 0);
    .SAXIHP1RCOUNT(),  // out std_logic_vector(7 downto 0);
    .SAXIHP1RDATA(),  // out std_logic_vector(63 downto 0);
    .SAXIHP1RID(), 	 // out std_logic_vector(5 downto 0);
    .SAXIHP1RLAST(),  // out std_ulogic;
    .SAXIHP1RRESP(),  // out std_logic_vector(1 downto 0);
    .SAXIHP1RVALID(),  // out std_ulogic;
    .SAXIHP1WACOUNT(),  // out std_logic_vector(5 downto 0);
    .SAXIHP1WCOUNT(),  // out std_logic_vector(7 downto 0);
    .SAXIHP1WREADY(),  // out std_ulogic;
    .SAXIHP2ARESETN(),  // out std_ulogic;
    .SAXIHP2ARREADY(),  // out std_ulogic;
    .SAXIHP2AWREADY(),  // out std_ulogic;
    .SAXIHP2BID(), 	 // out std_logic_vector(5 downto 0);
    .SAXIHP2BRESP(),  // out std_logic_vector(1 downto 0);
    .SAXIHP2BVALID(),  // out std_ulogic;
    .SAXIHP2RACOUNT(),  // out std_logic_vector(2 downto 0);
    .SAXIHP2RCOUNT(),  // out std_logic_vector(7 downto 0);
    .SAXIHP2RDATA(),  // out std_logic_vector(63 downto 0);
    .SAXIHP2RID(), 	 // out std_logic_vector(5 downto 0);
    .SAXIHP2RLAST(),  // out std_ulogic;
    .SAXIHP2RRESP(),  // out std_logic_vector(1 downto 0);
    .SAXIHP2RVALID(),  // out std_ulogic;
    .SAXIHP2WACOUNT(),  // out std_logic_vector(5 downto 0);
    .SAXIHP2WCOUNT(),  // out std_logic_vector(7 downto 0);
    .SAXIHP2WREADY(),  // out std_ulogic;
    .SAXIHP3ARESETN(),  // out std_ulogic;
    .SAXIHP3ARREADY(),  // out std_ulogic;
    .SAXIHP3AWREADY(),  // out std_ulogic;
    .SAXIHP3BID(), 	 // out std_logic_vector(5 downto 0);
    .SAXIHP3BRESP(),  // out std_logic_vector(1 downto 0);
    .SAXIHP3BVALID(),  // out std_ulogic;
    .SAXIHP3RACOUNT(),  // out std_logic_vector(2 downto 0);
    .SAXIHP3RCOUNT(),  // out std_logic_vector(7 downto 0);
    .SAXIHP3RDATA(),  // out std_logic_vector(63 downto 0);
    .SAXIHP3RID(), 	 // out std_logic_vector(5 downto 0);
    .SAXIHP3RLAST(),  // out std_ulogic;
    .SAXIHP3RRESP(),  // out std_logic_vector(1 downto 0);
    .SAXIHP3RVALID(),  // out std_ulogic;
    .SAXIHP3WACOUNT(),  // out std_logic_vector(5 downto 0);
    .SAXIHP3WCOUNT(),  // out std_logic_vector(7 downto 0);
    .SAXIHP3WREADY(),  // out std_ulogic;
    .DDRA(DDR_Addr), 	// inout std_logic_vector(14 downto 0);
    .DDRBA(DDR_BankAddr), // inout std_logic_vector(2 downto 0);
    .DDRCASB(DDR_CAS_n), 	// inout std_ulogic;
    .DDRCKE(DDR_CKE), 	// inout std_ulogic;
    .DDRCKN(DDR_Clk_n), 	// inout std_ulogic;
    .DDRCKP(DDR_Clk), 	// inout std_ulogic;
    .DDRCSB(DDR_CS_n), 	// inout std_ulogic;
    .DDRDM(DDR_DM), 	// inout std_logic_vector(3 downto 0);
    .DDRDQ(DDR_DQ), 	// inout std_logic_vector(31 downto 0);
    .DDRDQSN(DDR_DQS_n), 	// inout std_logic_vector(3 downto 0);
    .DDRDQSP(DDR_DQS), 	// inout std_logic_vector(3 downto 0);
    .DDRDRSTB(DDR_DRSTB), 	// inout std_ulogic;
    .DDRODT(DDR_ODT), 	// inout std_ulogic;
    .DDRRASB(DDR_RAS_n), 	// inout std_ulogic;
    .DDRVRN(DDR_VRN), 	// inout std_ulogic;
    .DDRVRP(DDR_VRP), 	// inout std_ulogic;
    .DDRWEB(DDR_WEB), 	// inout std_ulogic;
    .MIO(MIO), 	// inout std_logic_vector(53 downto 0);
    .PSCLK(PS_CLK), 	// inout std_ulogic;
    .PSPORB(PS_PORB), 	// inout std_ulogic;
    .PSSRSTB(PS_SRSTB), 	// inout std_ulogic;
    .DDRARB(4'b0),	// in std_logic_vector(3 downto 0);
    .DMA0ACLK(1'b0), 		// in std_ulogic;
    .DMA0DAREADY(1'b0), 		// in std_ulogic;
    .DMA0DRLAST(1'b0), 		// in std_ulogic;
    .DMA0DRTYPE(2'b0),	// in std_logic_vector(1 downto 0);
    .DMA0DRVALID(1'b0), 		// in std_ulogic;
    .DMA1ACLK(1'b0), 		// in std_ulogic;
    .DMA1DAREADY(1'b0), 		// in std_ulogic;
    .DMA1DRLAST(1'b0), 		// in std_ulogic;
    .DMA1DRTYPE(2'b0),	// in std_logic_vector(1 downto 0);
    .DMA1DRVALID(1'b0), 		// in std_ulogic;
    .DMA2ACLK(1'b0), 		// in std_ulogic;
    .DMA2DAREADY(1'b0), 		// in std_ulogic;
    .DMA2DRLAST(1'b0), 		// in std_ulogic;
    .DMA2DRTYPE(2'b0),	// in std_logic_vector(1 downto 0);
    .DMA2DRVALID(1'b0), 		// in std_ulogic;
    .DMA3ACLK(1'b0), 		// in std_ulogic;
    .DMA3DAREADY(1'b0), 		// in std_ulogic;
    .DMA3DRLAST(1'b0), 		// in std_ulogic;
    .DMA3DRTYPE(2'b0),	// in std_logic_vector(1 downto 0);
    .DMA3DRVALID(1'b0), 		// in std_ulogic;
    .EMIOCAN0PHYRX(1'b0), 		// in std_ulogic;
    .EMIOCAN1PHYRX(1'b0), 		// in std_ulogic;
    .EMIOENET0EXTINTIN(1'b0), 		// in std_ulogic;
    .EMIOENET0GMIICOL(1'b0), 		// in std_ulogic;
    .EMIOENET0GMIICRS(1'b0), 		// in std_ulogic;
    .EMIOENET0GMIIRXCLK(1'b0), 		// in std_ulogic;
    .EMIOENET0GMIIRXD(8'b0),	// in std_logic_vector(7 downto 0);
    .EMIOENET0GMIIRXDV(1'b0), 		// in std_ulogic;
    .EMIOENET0GMIIRXER(1'b0), 		// in std_ulogic;
    .EMIOENET0GMIITXCLK(1'b0), 		// in std_ulogic;
    .EMIOENET0MDIOI(1'b0), 		// in std_ulogic;
    .EMIOENET1EXTINTIN(1'b0), 		// in std_ulogic;
    .EMIOENET1GMIICOL(1'b0), 		// in std_ulogic;
    .EMIOENET1GMIICRS(1'b0), 		// in std_ulogic;
    .EMIOENET1GMIIRXCLK(1'b0), 		// in std_ulogic;
    .EMIOENET1GMIIRXD(8'b0),	// in std_logic_vector(7 downto 0);
    .EMIOENET1GMIIRXDV(1'b0), 		// in std_ulogic;
    .EMIOENET1GMIIRXER(1'b0), 		// in std_ulogic;
    .EMIOENET1GMIITXCLK(1'b0), 		// in std_ulogic;
    .EMIOENET1MDIOI(1'b0), 		// in std_ulogic;
    .EMIOGPIOI(64'b0), 	// in std_logic_vector(63 downto 0);
    .EMIOI2C0SCLI(1'b0), 	// in std_ulogic;
    .EMIOI2C0SDAI(1'b0), 	// in std_ulogic;
    .EMIOI2C1SCLI(1'b0), 	// in std_ulogic;
    .EMIOI2C1SDAI(1'b0), 	// in std_ulogic;
    .EMIOPJTAGTCK(1'b0), 		// in std_ulogic;
    .EMIOPJTAGTDI(1'b0), 		// in std_ulogic;
    .EMIOPJTAGTMS(1'b0), 		// in std_ulogic;
    .EMIOSDIO0CDN(1'b0), 		// in std_ulogic;
    .EMIOSDIO0CLKFB(1'b0), 		// in std_ulogic;
    .EMIOSDIO0CMDI(1'b0), 		// in std_ulogic;
    .EMIOSDIO0DATAI(4'b0),	// in std_logic_vector(3 downto 0);
    .EMIOSDIO0WP(1'b0), 		// in std_ulogic;
    .EMIOSDIO1CDN(1'b0), 		// in std_ulogic;
    .EMIOSDIO1CLKFB(1'b0), 		// in std_ulogic;
    .EMIOSDIO1CMDI(1'b0), 		// in std_ulogic;
    .EMIOSDIO1DATAI(4'b0),	// in std_logic_vector(3 downto 0);
    .EMIOSDIO1WP(1'b0), 		// in std_ulogic;
    .EMIOSPI0MI(1'b0), 		// in std_ulogic;
    .EMIOSPI0SCLKI(1'b0), 		// in std_ulogic;
    .EMIOSPI0SI(1'b0), 		// in std_ulogic;
    .EMIOSPI0SSIN(1'b0), 		// in std_ulogic;
    .EMIOSPI1MI(1'b0), 		// in std_ulogic;
    .EMIOSPI1SCLKI(1'b0), 		// in std_ulogic;
    .EMIOSPI1SI(1'b0), 		// in std_ulogic;
    .EMIOSPI1SSIN(1'b0), 		// in std_ulogic;
    .EMIOSRAMINTIN(1'b0), 		// in std_ulogic;
    .EMIOTRACECLK(1'b0), 		// in std_ulogic;
    .EMIOTTC0CLKI(3'b0),	// in std_logic_vector(2 downto 0);
    .EMIOTTC1CLKI(3'b0),	// in std_logic_vector(2 downto 0);
    .EMIOUART0CTSN(1'b0), 		// in std_ulogic;
    .EMIOUART0DCDN(1'b0), 		// in std_ulogic;
    .EMIOUART0DSRN(1'b0), 		// in std_ulogic;
    .EMIOUART0RIN(1'b0), 		// in std_ulogic;
    .EMIOUART0RX(1'b0), 		// in std_ulogic;
    .EMIOUART1CTSN(1'b0), 		// in std_ulogic;
    .EMIOUART1DCDN(1'b0), 		// in std_ulogic;
    .EMIOUART1DSRN(1'b0), 		// in std_ulogic;
    .EMIOUART1RIN(1'b0), 		// in std_ulogic;
    .EMIOUART1RX(1'b0), 		// in std_ulogic;
    .EMIOUSB0VBUSPWRFAULT(1'b0), 		// in std_ulogic;
    .EMIOUSB1VBUSPWRFAULT(1'b0), 		// in std_ulogic;
    .EMIOWDTCLKI(1'b0), 		// in std_ulogic;
    .EVENTEVENTI(1'b0), 		// in std_ulogic;
    .FCLKCLKTRIGN(4'b0),	// in std_logic_vector(3 downto 0);
    .FPGAIDLEN(1'b0), 		// in std_ulogic;
    .FTMDTRACEINATID(4'b0),	// in std_logic_vector(3 downto 0);
    .FTMDTRACEINCLOCK(1'b0), 		// in std_ulogic;
    .FTMDTRACEINDATA(32'b0),	// in std_logic_vector(31 downto 0);
    .FTMDTRACEINVALID(1'b0), 		// in std_ulogic;
    .FTMTF2PDEBUG(32'b0),	// in std_logic_vector(31 downto 0);
    .FTMTF2PTRIG(4'b0),	// in std_logic_vector(3 downto 0);
    .FTMTP2FTRIGACK(4'b0),	// in std_logic_vector(3 downto 0);
    .IRQF2P({19'b0,CONFIG_IRQ}),	// in std_logic_vector(19 downto 0);
    .MAXIGP1ACLK(1'b0), 	// in std_ulogic;
    .MAXIGP1ARREADY(1'b0), // in std_ulogic;
    .MAXIGP1AWREADY(1'b0), // in std_ulogic;
    .MAXIGP1BID(12'b0), 	// in std_logic_vector(11 downto 0);
    .MAXIGP1BRESP(2'b0), // in std_logic_vector(1 downto 0);
    .MAXIGP1BVALID(1'b0), // in std_ulogic;
    .MAXIGP1RDATA(32'b0), // in std_logic_vector(31 downto 0);
    .MAXIGP1RID(12'b0), 	// in std_logic_vector(11 downto 0);
    .MAXIGP1RLAST(1'b0), // in std_ulogic;
    .MAXIGP1RRESP(2'b0), // in std_logic_vector(1 downto 0);
    .MAXIGP1RVALID(1'b0), // in std_ulogic;
    .MAXIGP1WREADY(1'b0), // in std_ulogic;
    .SAXIGP0ACLK(1'b0), 		// in std_ulogic;
    .SAXIGP0ARADDR(32'b0),	// in std_logic_vector(31 downto 0);
    .SAXIGP0ARBURST(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP0ARCACHE(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP0ARID(6'b0),	// in std_logic_vector(5 downto 0);
    .SAXIGP0ARLEN(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP0ARLOCK(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP0ARPROT(3'b0),	// in std_logic_vector(2 downto 0);
    .SAXIGP0ARQOS(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP0ARSIZE(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP0ARVALID(1'b0), 		// in std_ulogic;
    .SAXIGP0AWADDR(32'b0),	// in std_logic_vector(31 downto 0);
    .SAXIGP0AWBURST(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP0AWCACHE(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP0AWID(6'b0),	// in std_logic_vector(5 downto 0);
    .SAXIGP0AWLEN(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP0AWLOCK(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP0AWPROT(3'b0),	// in std_logic_vector(2 downto 0);
    .SAXIGP0AWQOS(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP0AWSIZE(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP0AWVALID(1'b0), 		// in std_ulogic;
    .SAXIGP0BREADY(1'b0), 		// in std_ulogic;
    .SAXIGP0RREADY(1'b0), 		// in std_ulogic;
    .SAXIGP0WDATA(32'b0),	// in std_logic_vector(31 downto 0);
    .SAXIGP0WID(6'b0),	// in std_logic_vector(5 downto 0);
    .SAXIGP0WLAST(1'b0), 		// in std_ulogic;
    .SAXIGP0WSTRB(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP0WVALID(1'b0), 		// in std_ulogic;
    .SAXIGP1ACLK(1'b0), 		// in std_ulogic;
    .SAXIGP1ARADDR(32'b0),	// in std_logic_vector(31 downto 0);
    .SAXIGP1ARBURST(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP1ARCACHE(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP1ARID(6'b0),	// in std_logic_vector(5 downto 0);
    .SAXIGP1ARLEN(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP1ARLOCK(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP1ARPROT(3'b0),	// in std_logic_vector(2 downto 0);
    .SAXIGP1ARQOS(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP1ARSIZE(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP1ARVALID(1'b0), 		// in std_ulogic;
    .SAXIGP1AWADDR(32'b0),	// in std_logic_vector(31 downto 0);
    .SAXIGP1AWBURST(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP1AWCACHE(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP1AWID(6'b0),	// in std_logic_vector(5 downto 0);
    .SAXIGP1AWLEN(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP1AWLOCK(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP1AWPROT(3'b0),	// in std_logic_vector(2 downto 0);
    .SAXIGP1AWQOS(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP1AWSIZE(2'b0),	// in std_logic_vector(1 downto 0);
    .SAXIGP1AWVALID(1'b0), 		// in std_ulogic;
    .SAXIGP1BREADY(1'b0), 		// in std_ulogic;
    .SAXIGP1RREADY(1'b0), 		// in std_ulogic;
    .SAXIGP1WDATA(32'b0),	// in std_logic_vector(31 downto 0);
    .SAXIGP1WID(6'b0),	// in std_logic_vector(5 downto 0);
    .SAXIGP1WLAST(1'b0), 		// in std_ulogic;
    .SAXIGP1WSTRB(4'b0),	// in std_logic_vector(3 downto 0);
    .SAXIGP1WVALID(1'b0), 		// in std_ulogic;
    .SAXIHP1ACLK(1'b0), 	// in std_ulogic;
    .SAXIHP1ARADDR(32'b0), // in std_logic_vector(31 downto 0);
    .SAXIHP1ARBURST(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP1ARCACHE(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP1ARID(6'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIHP1ARLEN(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP1ARLOCK(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP1ARPROT(3'b0), // in std_logic_vector(2 downto 0);
    .SAXIHP1ARQOS(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP1ARSIZE(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP1ARVALID(1'b0), // in std_ulogic;
    .SAXIHP1AWADDR(32'b0), // in std_logic_vector(31 downto 0);
    .SAXIHP1AWBURST(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP1AWCACHE(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP1AWID(6'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIHP1AWLEN(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP1AWLOCK(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP1AWPROT(3'b0), // in std_logic_vector(2 downto 0);
    .SAXIHP1AWQOS(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP1AWSIZE(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP1AWVALID(1'b0), // in std_ulogic;
    .SAXIHP1BREADY(1'b0), // in std_ulogic;
    .SAXIHP1RDISSUECAP1EN(1'b0), 		// in std_ulogic;
    .SAXIHP1RREADY(1'b0), // in std_ulogic;
    .SAXIHP1WDATA(64'b0), // in std_logic_vector(63 downto 0);
    .SAXIHP1WID(6'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIHP1WLAST(1'b0), // in std_ulogic;
    .SAXIHP1WRISSUECAP1EN(1'b0), 		// in std_ulogic;
    .SAXIHP1WSTRB(8'b0), // in std_logic_vector(7 downto 0);
    .SAXIHP1WVALID(1'b0), // in std_ulogic;
    .SAXIHP2ACLK(1'b0), 	// in std_ulogic;
    .SAXIHP2ARADDR(32'b0), // in std_logic_vector(31 downto 0);
    .SAXIHP2ARBURST(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP2ARCACHE(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP2ARID(6'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIHP2ARLEN(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP2ARLOCK(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP2ARPROT(3'b0), // in std_logic_vector(2 downto 0);
    .SAXIHP2ARQOS(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP2ARSIZE(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP2ARVALID(1'b0), // in std_ulogic;
    .SAXIHP2AWADDR(32'b0), // in std_logic_vector(31 downto 0);
    .SAXIHP2AWBURST(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP2AWCACHE(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP2AWID(6'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIHP2AWLEN(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP2AWLOCK(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP2AWPROT(3'b0), // in std_logic_vector(2 downto 0);
    .SAXIHP2AWQOS(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP2AWSIZE(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP2AWVALID(1'b0), // in std_ulogic;
    .SAXIHP2BREADY(1'b0), // in std_ulogic;
    .SAXIHP2RDISSUECAP1EN(1'b0), 		// in std_ulogic;
    .SAXIHP2RREADY(1'b0), // in std_ulogic;
    .SAXIHP2WDATA(64'b0), // in std_logic_vector(63 downto 0);
    .SAXIHP2WID(6'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIHP2WLAST(1'b0), // in std_ulogic;
    .SAXIHP2WRISSUECAP1EN(1'b0), 		// in std_ulogic;
    .SAXIHP2WSTRB(8'b0), // in std_logic_vector(7 downto 0);
    .SAXIHP2WVALID(1'b0), // in std_ulogic;
    .SAXIHP3ACLK(1'b0), 	// in std_ulogic;
    .SAXIHP3ARADDR(32'b0), // in std_logic_vector(31 downto 0);
    .SAXIHP3ARBURST(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP3ARCACHE(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP3ARID(6'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIHP3ARLEN(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP3ARLOCK(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP3ARPROT(3'b0), // in std_logic_vector(2 downto 0);
    .SAXIHP3ARQOS(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP3ARSIZE(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP3ARVALID(1'b0), // in std_ulogic;
    .SAXIHP3AWADDR(32'b0), // in std_logic_vector(31 downto 0);
    .SAXIHP3AWBURST(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP3AWCACHE(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP3AWID(6'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIHP3AWLEN(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP3AWLOCK(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP3AWPROT(3'b0), // in std_logic_vector(2 downto 0);
    .SAXIHP3AWQOS(4'b0), // in std_logic_vector(3 downto 0);
    .SAXIHP3AWSIZE(2'b0), // in std_logic_vector(1 downto 0);
    .SAXIHP3AWVALID(1'b0), // in std_ulogic;
    .SAXIHP3BREADY(1'b0), // in std_ulogic;
    .SAXIHP3RDISSUECAP1EN(1'b0), 		// in std_ulogic;
    .SAXIHP3RREADY(1'b0), // in std_ulogic;
    .SAXIHP3WDATA(64'b0), // in std_logic_vector(63 downto 0);
    .SAXIHP3WID(6'b0), 	// in std_logic_vector(5 downto 0);
    .SAXIHP3WLAST(1'b0), // in std_ulogic;
    .SAXIHP3WRISSUECAP1EN(1'b0), 		// in std_ulogic;
    .SAXIHP3WSTRB(8'b0), // in std_logic_vector(7 downto 0);
    .SAXIHP3WVALID(1'b0)	// in std_ulogic;
  );
endmodule
