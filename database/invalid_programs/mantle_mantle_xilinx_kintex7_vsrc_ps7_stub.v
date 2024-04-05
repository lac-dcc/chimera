//module ps7_stub(
//
//    // Non-Axi PS7 signals
//    inout [53:0] MIO,
//    inout PS_SRSTB,
//    inout PS_CLK,
//    inout PS_PORB,
//    inout DDR_Clk,
//    inout DDR_Clk_n,
//    inout DDR_CKE,
//    inout DDR_CS_n,
//    inout DDR_RAS_n,
//    inout DDR_CAS_n,
//    output DDR_WEB,
//    inout [2:0] DDR_BankAddr,
//    inout [14:0] DDR_Addr,
//    inout DDR_ODT,
//    inout DDR_DRSTB,
//    inout [31:0] DDR_DQ,
//    inout [3:0] DDR_DM,
//    inout [3:0] DDR_DQS,
//    inout [3:0] DDR_DQS_n,
//    inout DDR_VRN,
//    inout DDR_VRP,
//    output CLK
//)


    wire [3:0] FCLKCLK;
    wire [3:0] FCLKRESETN;

    assign CLK = FCLKCLK[0];
    assign RST_n = FCLKRESETN[0];
/////////////////////////////////////
// Slave -> Master GP0
/////////////////////////////////////
    wire S2M_GP0_AXI_ACLK;

    // Read interface
    wire S2M_GP0_AXI_ARVALID;
    wire S2M_GP0_AXI_ARREADY;
    wire [31:0] S2M_GP0_AXI_ARADDR;
    wire [11:0] S2M_GP0_AXI_ARID;

    wire S2M_GP0_AXI_RVALID;
    wire S2M_GP0_AXI_RREADY;
    wire S2M_GP0_AXI_RLAST;
    wire [31:0] S2M_GP0_AXI_RDATA;
    wire [11:0] S2M_GP0_AXI_RID;

    wire [1:0] S2M_GP0_AXI_RRESP;


    //write interface
    wire S2M_GP0_AXI_AWVALID;
    wire S2M_GP0_AXI_AWREADY;
    wire [31:0] S2M_GP0_AXI_AWADDR;
    wire [11:0] S2M_GP0_AXI_AWID;

    wire S2M_GP0_AXI_WVALID;
    wire S2M_GP0_AXI_WREADY;
    wire [31:0] S2M_GP0_AXI_WDATA;
    wire [3:0] S2M_GP0_AXI_WSTRB;

    wire S2M_GP0_AXI_BVALID;
    wire S2M_GP0_AXI_BREADY;
    wire [1:0] S2M_GP0_AXI_BRESP;
    wire [11:0] S2M_GP0_AXI_BID;

/////////////////////////////////////
// Slave -> Master GP1
/////////////////////////////////////
    wire S2M_GP1_AXI_ACLK;

    // Read interface
    wire S2M_GP1_AXI_ARVALID;
    wire S2M_GP1_AXI_ARREADY;
    wire [31:0] S2M_GP1_AXI_ARADDR;
    wire [11:0] S2M_GP1_AXI_ARID;

    wire S2M_GP1_AXI_RVALID;
    wire S2M_GP1_AXI_RREADY;
    wire S2M_GP1_AXI_RLAST;
    wire [31:0] S2M_GP1_AXI_RDATA;
    wire [11:0] S2M_GP1_AXI_RID;

    wire [1:0] S2M_GP1_AXI_RRESP;

    //write interface
    wire S2M_GP1_AXI_AWVALID;
    wire S2M_GP1_AXI_AWREADY;
    wire [31:0] S2M_GP1_AXI_AWADDR;
    wire [11:0] S2M_GP1_AXI_AWID;

    wire S2M_GP1_AXI_WVALID;
    wire S2M_GP1_AXI_WREADY;
    wire [31:0] S2M_GP1_AXI_WDATA;
    wire [3:0] S2M_GP1_AXI_WSTRB;

    wire S2M_GP1_AXI_BVALID;
    wire S2M_GP1_AXI_BREADY;
    wire [1:0] S2M_GP1_AXI_BRESP;
    wire [11:0] S2M_GP1_AXI_BID;

    
/////////////////////////////////////
// Master -> Slave interface GP0
/////////////////////////////////////
    wire M2S_GP0_AXI_ACLK;
    
    //Read M2S_GP0_AXI_transation
    
    wire M2S_GP0_AXI_ARVALID;
    wire M2S_GP0_AXI_ARREADY;
    wire [31:0] M2S_GP0_AXI_ARADDR;
    wire [1:0] M2S_GP0_AXI_ARBURST;
    wire [3:0] M2S_GP0_AXI_ARLEN;
    wire [1:0] M2S_GP0_AXI_ARSIZE;
    //
    wire M2S_GP0_AXI_RVALID;
    wire M2S_GP0_AXI_RREADY;
    wire M2S_GP0_AXI_RLAST;
    wire [31:0] M2S_GP0_AXI_RDATA;
    //
    wire [1:0] M2S_GP0_AXI_RRESP;
   
    // Write M2S_GP0_AXI_Transaction
    wire M2S_GP0_AXI_AWVALID;
    wire M2S_GP0_AXI_AWREADY;
    wire [31:0] M2S_GP0_AXI_AWADDR;
    wire [1:0] M2S_GP0_AXI_AWBURST;
    wire [3:0] M2S_GP0_AXI_AWLEN;
    wire [1:0] M2S_GP0_AXI_AWSIZE;
    //
    wire M2S_GP0_AXI_WVALID;
    wire M2S_GP0_AXI_WREADY;
    wire M2S_GP0_AXI_WLAST;
    wire [31:0] M2S_GP0_AXI_WDATA;
    wire [3:0] M2S_GP0_AXI_WSTRB;
    //
    wire M2S_GP0_AXI_BVALID;
    wire M2S_GP0_AXI_BREADY;
    wire [1:0] M2S_GP0_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface GP1
/////////////////////////////////////
    wire M2S_GP1_AXI_ACLK;
    
    //Read M2S_GP1_AXI_transation
    
    wire M2S_GP1_AXI_ARVALID;
    wire M2S_GP1_AXI_ARREADY;
    wire [31:0] M2S_GP1_AXI_ARADDR;
    wire [1:0] M2S_GP1_AXI_ARBURST;
    wire [3:0] M2S_GP1_AXI_ARLEN;
    wire [1:0] M2S_GP1_AXI_ARSIZE;
    //
    wire M2S_GP1_AXI_RVALID;
    wire M2S_GP1_AXI_RREADY;
    wire M2S_GP1_AXI_RLAST;
    wire [31:0] M2S_GP1_AXI_RDATA;
    //
    wire [1:0] M2S_GP1_AXI_RRESP;
   
    // Write M2S_GP1_AXI_Transaction
    wire M2S_GP1_AXI_AWVALID;
    wire M2S_GP1_AXI_AWREADY;
    wire [31:0] M2S_GP1_AXI_AWADDR;
    wire [1:0] M2S_GP1_AXI_AWBURST;
    wire [3:0] M2S_GP1_AXI_AWLEN;
    wire [1:0] M2S_GP1_AXI_AWSIZE;
    //
    wire M2S_GP1_AXI_WVALID;
    wire M2S_GP1_AXI_WREADY;
    wire M2S_GP1_AXI_WLAST;
    wire [31:0] M2S_GP1_AXI_WDATA;
    wire [3:0] M2S_GP1_AXI_WSTRB;
    //
    wire M2S_GP1_AXI_BVALID;
    wire M2S_GP1_AXI_BREADY;
    wire [1:0] M2S_GP1_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface HP0
/////////////////////////////////////
    wire M2S_HP0_AXI_ACLK;
    
    //Read M2S_HP0_AXI_transation
    
    wire M2S_HP0_AXI_ARVALID;
    wire M2S_HP0_AXI_ARREADY;
    wire [31:0] M2S_HP0_AXI_ARADDR;
    wire [1:0] M2S_HP0_AXI_ARBURST;
    wire [3:0] M2S_HP0_AXI_ARLEN;
    wire [1:0] M2S_HP0_AXI_ARSIZE;
    //
    wire M2S_HP0_AXI_RVALID;
    wire M2S_HP0_AXI_RREADY;
    wire M2S_HP0_AXI_RLAST;
    wire [63:0] M2S_HP0_AXI_RDATA;
    //
    wire [1:0] M2S_HP0_AXI_RRESP;
   
    // Write M2S_HP0_AXI_Transaction
    wire M2S_HP0_AXI_AWVALID;
    wire M2S_HP0_AXI_AWREADY;
    wire [31:0] M2S_HP0_AXI_AWADDR;
    wire [1:0] M2S_HP0_AXI_AWBURST;
    wire [3:0] M2S_HP0_AXI_AWLEN;
    wire [1:0] M2S_HP0_AXI_AWSIZE;
    //
    wire M2S_HP0_AXI_WVALID;
    wire M2S_HP0_AXI_WREADY;
    wire M2S_HP0_AXI_WLAST;
    wire [63:0] M2S_HP0_AXI_WDATA;
    wire [7:0] M2S_HP0_AXI_WSTRB;
    //
    wire M2S_HP0_AXI_BVALID;
    wire M2S_HP0_AXI_BREADY;
    wire [1:0] M2S_HP0_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface HP1
/////////////////////////////////////
    wire M2S_HP1_AXI_ACLK;
    
    //Read M2S_HP1_AXI_transation
    
    wire M2S_HP1_AXI_ARVALID;
    wire M2S_HP1_AXI_ARREADY;
    wire [31:0] M2S_HP1_AXI_ARADDR;
    wire [1:0] M2S_HP1_AXI_ARBURST;
    wire [3:0] M2S_HP1_AXI_ARLEN;
    wire [1:0] M2S_HP1_AXI_ARSIZE;
    //
    wire M2S_HP1_AXI_RVALID;
    wire M2S_HP1_AXI_RREADY;
    wire M2S_HP1_AXI_RLAST;
    wire [63:0] M2S_HP1_AXI_RDATA;
    //
    wire [1:0] M2S_HP1_AXI_RRESP;
   
    // Write M2S_HP1_AXI_Transaction
    wire M2S_HP1_AXI_AWVALID;
    wire M2S_HP1_AXI_AWREADY;
    wire [31:0] M2S_HP1_AXI_AWADDR;
    wire [1:0] M2S_HP1_AXI_AWBURST;
    wire [3:0] M2S_HP1_AXI_AWLEN;
    wire [1:0] M2S_HP1_AXI_AWSIZE;
    //
    wire M2S_HP1_AXI_WVALID;
    wire M2S_HP1_AXI_WREADY;
    wire M2S_HP1_AXI_WLAST;
    wire [63:0] M2S_HP1_AXI_WDATA;
    wire [7:0] M2S_HP1_AXI_WSTRB;
    //
    wire M2S_HP1_AXI_BVALID;
    wire M2S_HP1_AXI_BREADY;
    wire [1:0] M2S_HP1_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface HP2
/////////////////////////////////////
    wire M2S_HP2_AXI_ACLK;
    
    //Read M2S_HP2_AXI_transation
    
    wire M2S_HP2_AXI_ARVALID;
    wire M2S_HP2_AXI_ARREADY;
    wire [31:0] M2S_HP2_AXI_ARADDR;
    wire [1:0] M2S_HP2_AXI_ARBURST;
    wire [3:0] M2S_HP2_AXI_ARLEN;
    wire [1:0] M2S_HP2_AXI_ARSIZE;
    //
    wire M2S_HP2_AXI_RVALID;
    wire M2S_HP2_AXI_RREADY;
    wire M2S_HP2_AXI_RLAST;
    wire [63:0] M2S_HP2_AXI_RDATA;
    //
    wire [1:0] M2S_HP2_AXI_RRESP;
   
    // Write M2S_HP2_AXI_Transaction
    wire M2S_HP2_AXI_AWVALID;
    wire M2S_HP2_AXI_AWREADY;
    wire [31:0] M2S_HP2_AXI_AWADDR;
    wire [1:0] M2S_HP2_AXI_AWBURST;
    wire [3:0] M2S_HP2_AXI_AWLEN;
    wire [1:0] M2S_HP2_AXI_AWSIZE;
    //
    wire M2S_HP2_AXI_WVALID;
    wire M2S_HP2_AXI_WREADY;
    wire M2S_HP2_AXI_WLAST;
    wire [63:0] M2S_HP2_AXI_WDATA;
    wire [7:0] M2S_HP2_AXI_WSTRB;
    //
    wire M2S_HP2_AXI_BVALID;
    wire M2S_HP2_AXI_BREADY;
    wire [1:0] M2S_HP2_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface HP3
/////////////////////////////////////
    wire M2S_HP3_AXI_ACLK;
    
    //Read M2S_HP3_AXI_transation
    
    wire M2S_HP3_AXI_ARVALID;
    wire M2S_HP3_AXI_ARREADY;
    wire [31:0] M2S_HP3_AXI_ARADDR;
    wire [1:0] M2S_HP3_AXI_ARBURST;
    wire [3:0] M2S_HP3_AXI_ARLEN;
    wire [1:0] M2S_HP3_AXI_ARSIZE;
    //
    wire M2S_HP3_AXI_RVALID;
    wire M2S_HP3_AXI_RREADY;
    wire M2S_HP3_AXI_RLAST;
    wire [63:0] M2S_HP3_AXI_RDATA;
    //
    wire [1:0] M2S_HP3_AXI_RRESP;
   
    // Write M2S_HP3_AXI_Transaction
    wire M2S_HP3_AXI_AWVALID;
    wire M2S_HP3_AXI_AWREADY;
    wire [31:0] M2S_HP3_AXI_AWADDR;
    wire [1:0] M2S_HP3_AXI_AWBURST;
    wire [3:0] M2S_HP3_AXI_AWLEN;
    wire [1:0] M2S_HP3_AXI_AWSIZE;
    //
    wire M2S_HP3_AXI_WVALID;
    wire M2S_HP3_AXI_WREADY;
    wire M2S_HP3_AXI_WLAST;
    wire [63:0] M2S_HP3_AXI_WDATA;
    wire [7:0] M2S_HP3_AXI_WSTRB;
    //
    wire M2S_HP3_AXI_BVALID;
    wire M2S_HP3_AXI_BREADY;
    wire [1:0] M2S_HP3_AXI_BRESP;

/////////////////////////////////////
// Master -> Slave interface ACP
/////////////////////////////////////
    wire M2S_ACP_AXI_ACLK;
    
    //Read M2S_ACP_AXI_transation
    
    wire M2S_ACP_AXI_ARVALID;
    wire M2S_ACP_AXI_ARREADY;
    wire [31:0] M2S_ACP_AXI_ARADDR;
    wire [1:0] M2S_ACP_AXI_ARBURST;
    wire [3:0] M2S_ACP_AXI_ARLEN;
    wire [1:0] M2S_ACP_AXI_ARSIZE;
    //
    wire M2S_ACP_AXI_RVALID;
    wire M2S_ACP_AXI_RREADY;
    wire M2S_ACP_AXI_RLAST;
    wire [63:0] M2S_ACP_AXI_RDATA;
    //
    wire [1:0] M2S_ACP_AXI_RRESP;
   
    // Write M2S_ACP_AXI_Transaction
    wire M2S_ACP_AXI_AWVALID;
    wire M2S_ACP_AXI_AWREADY;
    wire [31:0] M2S_ACP_AXI_AWADDR;
    wire [1:0] M2S_ACP_AXI_AWBURST;
    wire [3:0] M2S_ACP_AXI_AWLEN;
    wire [1:0] M2S_ACP_AXI_AWSIZE;
    //
    wire M2S_ACP_AXI_WVALID;
    wire M2S_ACP_AXI_WREADY;
    wire M2S_ACP_AXI_WLAST;
    wire [63:0] M2S_ACP_AXI_WDATA;
    wire [7:0] M2S_ACP_AXI_WSTRB;
    //
    wire M2S_ACP_AXI_BVALID;
    wire M2S_ACP_AXI_BREADY;
    wire [1:0] M2S_ACP_AXI_BRESP;

    ps7_wrap ps7_wrap_inst(
        .MIO(MIO),
        .PS_SRSTB(PS_SRSTB),
        .PS_CLK(PS_CLK),
        .PS_PORB(PS_PORB),
        .DDR_Clk(DDR_Clk),
        .DDR_Clk_n(DDR_Clk_n),
        .DDR_CKE(DDR_CKE),
        .DDR_CS_n(DDR_CS_n),
        .DDR_RAS_n(DDR_RAS_n),
        .DDR_CAS_n(DDR_CAS_n),
        .DDR_WEB(DDR_WEB),
        .DDR_BankAddr(DDR_BankAddr),
        .DDR_Addr(DDR_Addr),
        .DDR_ODT(DDR_ODT),
        .DDR_DRSTB(DDR_DRSTB),
        .DDR_DQ(DDR_DQ),
        .DDR_DM(DDR_DM),
        .DDR_DQS(DDR_DQS),
        .DDR_DQS_n(DDR_DQS_n),
        .DDR_VRN(DDR_VRN),
        .DDR_VRP(DDR_VRP),

        .FCLKCLK(FCLKCLK[3:0]),
        .FCLKRESETN(FCLKRESETN[3:0]),

    /////////////////////////////////////
    // Slave -> Master GP0
    /////////////////////////////////////
        .S2M_GP0_AXI_ACLK(S2M_GP0_AXI_ACLK),

        // Read interface
        .S2M_GP0_AXI_ARVALID(S2M_GP0_AXI_ARVALID),
        .S2M_GP0_AXI_ARREADY(S2M_GP0_AXI_ARREADY),
        .S2M_GP0_AXI_ARADDR(S2M_GP0_AXI_ARADDR[31:0]),
        .S2M_GP0_AXI_ARID(S2M_GP0_AXI_ARID[11:0]),

        .S2M_GP0_AXI_RVALID(S2M_GP0_AXI_RVALID),
        .S2M_GP0_AXI_RREADY(S2M_GP0_AXI_RREADY),
        .S2M_GP0_AXI_RLAST(S2M_GP0_AXI_RLAST),
        .S2M_GP0_AXI_RDATA(S2M_GP0_AXI_RDATA[31:0]),
        .S2M_GP0_AXI_RID(S2M_GP0_AXI_RID[11:0]),

        .S2M_GP0_AXI_RRESP(S2M_GP0_AXI_RRESP[1:0]),


        //write interface
        .S2M_GP0_AXI_AWVALID(S2M_GP0_AXI_AWVALID),
        .S2M_GP0_AXI_AWREADY(S2M_GP0_AXI_AWREADY),
        .S2M_GP0_AXI_AWADDR(S2M_GP0_AXI_AWADDR[31:0]),
        .S2M_GP0_AXI_AWID(S2M_GP0_AXI_AWID[11:0]),

        .S2M_GP0_AXI_WVALID(S2M_GP0_AXI_WVALID),
        .S2M_GP0_AXI_WREADY(S2M_GP0_AXI_WREADY),
        .S2M_GP0_AXI_WDATA(S2M_GP0_AXI_WDATA[31:0]),
        .S2M_GP0_AXI_WSTRB(S2M_GP0_AXI_WSTRB[3:0]),

        .S2M_GP0_AXI_BVALID(S2M_GP0_AXI_BVALID),
        .S2M_GP0_AXI_BREADY(S2M_GP0_AXI_BREADY),
        .S2M_GP0_AXI_BRESP(S2M_GP0_AXI_BRESP[1:0]),
        .S2M_GP0_AXI_BID(S2M_GP0_AXI_BID[11:0]),

    /////////////////////////////////////
    // Slave -> Master GP1
    /////////////////////////////////////
        .S2M_GP1_AXI_ACLK(S2M_GP1_AXI_ACLK),

        // Read interface
        .S2M_GP1_AXI_ARVALID(S2M_GP1_AXI_ARVALID),
        .S2M_GP1_AXI_ARREADY(S2M_GP1_AXI_ARREADY),
        .S2M_GP1_AXI_ARADDR(S2M_GP1_AXI_ARADDR[31:0]),
        .S2M_GP1_AXI_ARID(S2M_GP1_AXI_ARID[11:0]),

        .S2M_GP1_AXI_RVALID(S2M_GP1_AXI_RVALID),
        .S2M_GP1_AXI_RREADY(S2M_GP1_AXI_RREADY),
        .S2M_GP1_AXI_RLAST(S2M_GP1_AXI_RLAST),
        .S2M_GP1_AXI_RDATA(S2M_GP1_AXI_RDATA[31:0]),
        .S2M_GP1_AXI_RID(S2M_GP1_AXI_RID[11:0]),

        .S2M_GP1_AXI_RRESP(S2M_GP1_AXI_RRESP[1:0]),

        //write interface
        .S2M_GP1_AXI_AWVALID(S2M_GP1_AXI_AWVALID),
        .S2M_GP1_AXI_AWREADY(S2M_GP1_AXI_AWREADY),
        .S2M_GP1_AXI_AWADDR(S2M_GP1_AXI_AWADDR[31:0]),
        .S2M_GP1_AXI_AWID(S2M_GP1_AXI_AWID[11:0]),

        .S2M_GP1_AXI_WVALID(S2M_GP1_AXI_WVALID),
        .S2M_GP1_AXI_WREADY(S2M_GP1_AXI_WREADY),
        .S2M_GP1_AXI_WDATA(S2M_GP1_AXI_WDATA[31:0]),
        .S2M_GP1_AXI_WSTRB(S2M_GP1_AXI_WSTRB[3:0]),

        .S2M_GP1_AXI_BVALID(S2M_GP1_AXI_BVALID),
        .S2M_GP1_AXI_BREADY(S2M_GP1_AXI_BREADY),
        .S2M_GP1_AXI_BRESP(S2M_GP1_AXI_BRESP[1:0]),
        .S2M_GP1_AXI_BID(S2M_GP1_AXI_BID[11:0]),

        
    /////////////////////////////////////
    // Master -> Slave interface GP0
    /////////////////////////////////////
        .M2S_GP0_AXI_ACLK(M2S_GP0_AXI_ACLK),
        
        //Read M2S_GP0_AXI_transation
        
        .M2S_GP0_AXI_ARVALID(M2S_GP0_AXI_ARVALID),
        .M2S_GP0_AXI_ARREADY(M2S_GP0_AXI_ARREADY),
        .M2S_GP0_AXI_ARADDR(M2S_GP0_AXI_ARADDR[31:0]),
        .M2S_GP0_AXI_ARBURST(M2S_GP0_AXI_ARBURST[1:0]),
        .M2S_GP0_AXI_ARLEN(M2S_GP0_AXI_ARLEN[3:0]),
        .M2S_GP0_AXI_ARSIZE(M2S_GP0_AXI_ARSIZE[1:0]),
        //
        .M2S_GP0_AXI_RVALID(M2S_GP0_AXI_RVALID),
        .M2S_GP0_AXI_RREADY(M2S_GP0_AXI_RREADY),
        .M2S_GP0_AXI_RLAST(M2S_GP0_AXI_RLAST),
        .M2S_GP0_AXI_RDATA(M2S_GP0_AXI_RDATA[31:0]),
        //
        .M2S_GP0_AXI_RRESP(M2S_GP0_AXI_RRESP[1:0]),
       
        // Write M2S_GP0_AXI_Transaction
        .M2S_GP0_AXI_AWVALID(M2S_GP0_AXI_AWVALID),
        .M2S_GP0_AXI_AWREADY(M2S_GP0_AXI_AWREADY),
        .M2S_GP0_AXI_AWADDR(M2S_GP0_AXI_AWADDR[31:0]),
        .M2S_GP0_AXI_AWBURST(M2S_GP0_AXI_AWBURST[1:0]),
        .M2S_GP0_AXI_AWLEN(M2S_GP0_AXI_AWLEN[3:0]),
        .M2S_GP0_AXI_AWSIZE(M2S_GP0_AXI_AWSIZE[1:0]),
        //
        .M2S_GP0_AXI_WVALID(M2S_GP0_AXI_WVALID),
        .M2S_GP0_AXI_WREADY(M2S_GP0_AXI_WREADY),
        .M2S_GP0_AXI_WLAST(M2S_GP0_AXI_WLAST),
        .M2S_GP0_AXI_WDATA(M2S_GP0_AXI_WDATA[31:0]),
        .M2S_GP0_AXI_WSTRB(M2S_GP0_AXI_WSTRB[3:0]),
        //
        .M2S_GP0_AXI_BVALID(M2S_GP0_AXI_BVALID),
        .M2S_GP0_AXI_BREADY(M2S_GP0_AXI_BREADY),
        .M2S_GP0_AXI_BRESP(M2S_GP0_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface GP1
    /////////////////////////////////////
        .M2S_GP1_AXI_ACLK(M2S_GP1_AXI_ACLK),
        
        //Read M2S_GP1_AXI_transation
        
        .M2S_GP1_AXI_ARVALID(M2S_GP1_AXI_ARVALID),
        .M2S_GP1_AXI_ARREADY(M2S_GP1_AXI_ARREADY),
        .M2S_GP1_AXI_ARADDR(M2S_GP1_AXI_ARADDR[31:0]),
        .M2S_GP1_AXI_ARBURST(M2S_GP1_AXI_ARBURST[1:0]),
        .M2S_GP1_AXI_ARLEN(M2S_GP1_AXI_ARLEN[3:0]),
        .M2S_GP1_AXI_ARSIZE(M2S_GP1_AXI_ARSIZE[1:0]),
        //
        .M2S_GP1_AXI_RVALID(M2S_GP1_AXI_RVALID),
        .M2S_GP1_AXI_RREADY(M2S_GP1_AXI_RREADY),
        .M2S_GP1_AXI_RLAST(M2S_GP1_AXI_RLAST),
        .M2S_GP1_AXI_RDATA(M2S_GP1_AXI_RDATA[31:0]),
        //
        .M2S_GP1_AXI_RRESP(M2S_GP1_AXI_RRESP[1:0]),
       
        // Write M2S_GP1_AXI_Transaction
        .M2S_GP1_AXI_AWVALID(M2S_GP1_AXI_AWVALID),
        .M2S_GP1_AXI_AWREADY(M2S_GP1_AXI_AWREADY),
        .M2S_GP1_AXI_AWADDR(M2S_GP1_AXI_AWADDR[31:0]),
        .M2S_GP1_AXI_AWBURST(M2S_GP1_AXI_AWBURST[1:0]),
        .M2S_GP1_AXI_AWLEN(M2S_GP1_AXI_AWLEN[3:0]),
        .M2S_GP1_AXI_AWSIZE(M2S_GP1_AXI_AWSIZE[1:0]),
        //
        .M2S_GP1_AXI_WVALID(M2S_GP1_AXI_WVALID),
        .M2S_GP1_AXI_WREADY(M2S_GP1_AXI_WREADY),
        .M2S_GP1_AXI_WLAST(M2S_GP1_AXI_WLAST),
        .M2S_GP1_AXI_WDATA(M2S_GP1_AXI_WDATA[31:0]),
        .M2S_GP1_AXI_WSTRB(M2S_GP1_AXI_WSTRB[3:0]),
        //
        .M2S_GP1_AXI_BVALID(M2S_GP1_AXI_BVALID),
        .M2S_GP1_AXI_BREADY(M2S_GP1_AXI_BREADY),
        .M2S_GP1_AXI_BRESP(M2S_GP1_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface HP0
    /////////////////////////////////////
        .M2S_HP0_AXI_ACLK(M2S_HP0_AXI_ACLK),
        
        //Read M2S_HP0_AXI_transation
        
        .M2S_HP0_AXI_ARVALID(M2S_HP0_AXI_ARVALID),
        .M2S_HP0_AXI_ARREADY(M2S_HP0_AXI_ARREADY),
        .M2S_HP0_AXI_ARADDR(M2S_HP0_AXI_ARADDR[31:0]),
        .M2S_HP0_AXI_ARBURST(M2S_HP0_AXI_ARBURST[1:0]),
        .M2S_HP0_AXI_ARLEN(M2S_HP0_AXI_ARLEN[3:0]),
        .M2S_HP0_AXI_ARSIZE(M2S_HP0_AXI_ARSIZE[1:0]),
        //
        .M2S_HP0_AXI_RVALID(M2S_HP0_AXI_RVALID),
        .M2S_HP0_AXI_RREADY(M2S_HP0_AXI_RREADY),
        .M2S_HP0_AXI_RLAST(M2S_HP0_AXI_RLAST),
        .M2S_HP0_AXI_RDATA(M2S_HP0_AXI_RDATA[63:0]),
        //
        .M2S_HP0_AXI_RRESP(M2S_HP0_AXI_RRESP[1:0]),
       
        // Write M2S_HP0_AXI_Transaction
        .M2S_HP0_AXI_AWVALID(M2S_HP0_AXI_AWVALID),
        .M2S_HP0_AXI_AWREADY(M2S_HP0_AXI_AWREADY),
        .M2S_HP0_AXI_AWADDR(M2S_HP0_AXI_AWADDR[31:0]),
        .M2S_HP0_AXI_AWBURST(M2S_HP0_AXI_AWBURST[1:0]),
        .M2S_HP0_AXI_AWLEN(M2S_HP0_AXI_AWLEN[3:0]),
        .M2S_HP0_AXI_AWSIZE(M2S_HP0_AXI_AWSIZE[1:0]),
        //
        .M2S_HP0_AXI_WVALID(M2S_HP0_AXI_WVALID),
        .M2S_HP0_AXI_WREADY(M2S_HP0_AXI_WREADY),
        .M2S_HP0_AXI_WLAST(M2S_HP0_AXI_WLAST),
        .M2S_HP0_AXI_WDATA(M2S_HP0_AXI_WDATA[63:0]),
        .M2S_HP0_AXI_WSTRB(M2S_HP0_AXI_WSTRB[7:0]),
        //
        .M2S_HP0_AXI_BVALID(M2S_HP0_AXI_BVALID),
        .M2S_HP0_AXI_BREADY(M2S_HP0_AXI_BREADY),
        .M2S_HP0_AXI_BRESP(M2S_HP0_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface HP1
    /////////////////////////////////////
        .M2S_HP1_AXI_ACLK(M2S_HP1_AXI_ACLK),
        
        //Read M2S_HP1_AXI_transation
        
        .M2S_HP1_AXI_ARVALID(M2S_HP1_AXI_ARVALID),
        .M2S_HP1_AXI_ARREADY(M2S_HP1_AXI_ARREADY),
        .M2S_HP1_AXI_ARADDR(M2S_HP1_AXI_ARADDR[31:0]),
        .M2S_HP1_AXI_ARBURST(M2S_HP1_AXI_ARBURST[1:0]),
        .M2S_HP1_AXI_ARLEN(M2S_HP1_AXI_ARLEN[3:0]),
        .M2S_HP1_AXI_ARSIZE(M2S_HP1_AXI_ARSIZE[1:0]),
        //
        .M2S_HP1_AXI_RVALID(M2S_HP1_AXI_RVALID),
        .M2S_HP1_AXI_RREADY(M2S_HP1_AXI_RREADY),
        .M2S_HP1_AXI_RLAST(M2S_HP1_AXI_RLAST),
        .M2S_HP1_AXI_RDATA(M2S_HP1_AXI_RDATA[63:0]),
        //
        .M2S_HP1_AXI_RRESP(M2S_HP1_AXI_RRESP[1:0]),
       
        // Write M2S_HP1_AXI_Transaction
        .M2S_HP1_AXI_AWVALID(M2S_HP1_AXI_AWVALID),
        .M2S_HP1_AXI_AWREADY(M2S_HP1_AXI_AWREADY),
        .M2S_HP1_AXI_AWADDR(M2S_HP1_AXI_AWADDR[31:0]),
        .M2S_HP1_AXI_AWBURST(M2S_HP1_AXI_AWBURST[1:0]),
        .M2S_HP1_AXI_AWLEN(M2S_HP1_AXI_AWLEN[3:0]),
        .M2S_HP1_AXI_AWSIZE(M2S_HP1_AXI_AWSIZE[1:0]),
        //
        .M2S_HP1_AXI_WVALID(M2S_HP1_AXI_WVALID),
        .M2S_HP1_AXI_WREADY(M2S_HP1_AXI_WREADY),
        .M2S_HP1_AXI_WLAST(M2S_HP1_AXI_WLAST),
        .M2S_HP1_AXI_WDATA(M2S_HP1_AXI_WDATA[63:0]),
        .M2S_HP1_AXI_WSTRB(M2S_HP1_AXI_WSTRB[7:0]),
        //
        .M2S_HP1_AXI_BVALID(M2S_HP1_AXI_BVALID),
        .M2S_HP1_AXI_BREADY(M2S_HP1_AXI_BREADY),
        .M2S_HP1_AXI_BRESP(M2S_HP1_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface HP2
    /////////////////////////////////////
        .M2S_HP2_AXI_ACLK(M2S_HP2_AXI_ACLK),
        
        //Read M2S_HP2_AXI_transation
        
        .M2S_HP2_AXI_ARVALID(M2S_HP2_AXI_ARVALID),
        .M2S_HP2_AXI_ARREADY(M2S_HP2_AXI_ARREADY),
        .M2S_HP2_AXI_ARADDR(M2S_HP2_AXI_ARADDR[31:0]),
        .M2S_HP2_AXI_ARBURST(M2S_HP2_AXI_ARBURST[1:0]),
        .M2S_HP2_AXI_ARLEN(M2S_HP2_AXI_ARLEN[3:0]),
        .M2S_HP2_AXI_ARSIZE(M2S_HP2_AXI_ARSIZE[1:0]),
        //
        .M2S_HP2_AXI_RVALID(M2S_HP2_AXI_RVALID),
        .M2S_HP2_AXI_RREADY(M2S_HP2_AXI_RREADY),
        .M2S_HP2_AXI_RLAST(M2S_HP2_AXI_RLAST),
        .M2S_HP2_AXI_RDATA(M2S_HP2_AXI_RDATA[63:0]),
        //
        .M2S_HP2_AXI_RRESP(M2S_HP2_AXI_RRESP[1:0]),
       
        // Write M2S_HP2_AXI_Transaction
        .M2S_HP2_AXI_AWVALID(M2S_HP2_AXI_AWVALID),
        .M2S_HP2_AXI_AWREADY(M2S_HP2_AXI_AWREADY),
        .M2S_HP2_AXI_AWADDR(M2S_HP2_AXI_AWADDR[31:0]),
        .M2S_HP2_AXI_AWBURST(M2S_HP2_AXI_AWBURST[1:0]),
        .M2S_HP2_AXI_AWLEN(M2S_HP2_AXI_AWLEN[3:0]),
        .M2S_HP2_AXI_AWSIZE(M2S_HP2_AXI_AWSIZE[1:0]),
        //
        .M2S_HP2_AXI_WVALID(M2S_HP2_AXI_WVALID),
        .M2S_HP2_AXI_WREADY(M2S_HP2_AXI_WREADY),
        .M2S_HP2_AXI_WLAST(M2S_HP2_AXI_WLAST),
        .M2S_HP2_AXI_WDATA(M2S_HP2_AXI_WDATA[63:0]),
        .M2S_HP2_AXI_WSTRB(M2S_HP2_AXI_WSTRB[7:0]),
        //
        .M2S_HP2_AXI_BVALID(M2S_HP2_AXI_BVALID),
        .M2S_HP2_AXI_BREADY(M2S_HP2_AXI_BREADY),
        .M2S_HP2_AXI_BRESP(M2S_HP2_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface HP3
    /////////////////////////////////////
        .M2S_HP3_AXI_ACLK(M2S_HP3_AXI_ACLK),
        
        //Read M2S_HP3_AXI_transation
        
        .M2S_HP3_AXI_ARVALID(M2S_HP3_AXI_ARVALID),
        .M2S_HP3_AXI_ARREADY(M2S_HP3_AXI_ARREADY),
        .M2S_HP3_AXI_ARADDR(M2S_HP3_AXI_ARADDR[31:0]),
        .M2S_HP3_AXI_ARBURST(M2S_HP3_AXI_ARBURST[1:0]),
        .M2S_HP3_AXI_ARLEN(M2S_HP3_AXI_ARLEN[3:0]),
        .M2S_HP3_AXI_ARSIZE(M2S_HP3_AXI_ARSIZE[1:0]),
        //
        .M2S_HP3_AXI_RVALID(M2S_HP3_AXI_RVALID),
        .M2S_HP3_AXI_RREADY(M2S_HP3_AXI_RREADY),
        .M2S_HP3_AXI_RLAST(M2S_HP3_AXI_RLAST),
        .M2S_HP3_AXI_RDATA(M2S_HP3_AXI_RDATA[63:0]),
        //
        .M2S_HP3_AXI_RRESP(M2S_HP3_AXI_RRESP[1:0]),
       
        // Write M2S_HP3_AXI_Transaction
        .M2S_HP3_AXI_AWVALID(M2S_HP3_AXI_AWVALID),
        .M2S_HP3_AXI_AWREADY(M2S_HP3_AXI_AWREADY),
        .M2S_HP3_AXI_AWADDR(M2S_HP3_AXI_AWADDR[31:0]),
        .M2S_HP3_AXI_AWBURST(M2S_HP3_AXI_AWBURST[1:0]),
        .M2S_HP3_AXI_AWLEN(M2S_HP3_AXI_AWLEN[3:0]),
        .M2S_HP3_AXI_AWSIZE(M2S_HP3_AXI_AWSIZE[1:0]),
        //
        .M2S_HP3_AXI_WVALID(M2S_HP3_AXI_WVALID),
        .M2S_HP3_AXI_WREADY(M2S_HP3_AXI_WREADY),
        .M2S_HP3_AXI_WLAST(M2S_HP3_AXI_WLAST),
        .M2S_HP3_AXI_WDATA(M2S_HP3_AXI_WDATA[63:0]),
        .M2S_HP3_AXI_WSTRB(M2S_HP3_AXI_WSTRB[7:0]),
        //
        .M2S_HP3_AXI_BVALID(M2S_HP3_AXI_BVALID),
        .M2S_HP3_AXI_BREADY(M2S_HP3_AXI_BREADY),
        .M2S_HP3_AXI_BRESP(M2S_HP3_AXI_BRESP[1:0]),

    /////////////////////////////////////
    // Master -> Slave interface ACP
    /////////////////////////////////////
        .M2S_ACP_AXI_ACLK(M2S_ACP_AXI_ACLK),
        
        //Read M2S_ACP_AXI_transation
        
        .M2S_ACP_AXI_ARVALID(M2S_ACP_AXI_ARVALID),
        .M2S_ACP_AXI_ARREADY(M2S_ACP_AXI_ARREADY),
        .M2S_ACP_AXI_ARADDR(M2S_ACP_AXI_ARADDR[31:0]),
        .M2S_ACP_AXI_ARBURST(M2S_ACP_AXI_ARBURST[1:0]),
        .M2S_ACP_AXI_ARLEN(M2S_ACP_AXI_ARLEN[3:0]),
        .M2S_ACP_AXI_ARSIZE(M2S_ACP_AXI_ARSIZE[1:0]),
        //
        .M2S_ACP_AXI_RVALID(M2S_ACP_AXI_RVALID),
        .M2S_ACP_AXI_RREADY(M2S_ACP_AXI_RREADY),
        .M2S_ACP_AXI_RLAST(M2S_ACP_AXI_RLAST),
        .M2S_ACP_AXI_RDATA(M2S_ACP_AXI_RDATA[63:0]),
        //
        .M2S_ACP_AXI_RRESP(M2S_ACP_AXI_RRESP[1:0]),
       
        // Write M2S_ACP_AXI_Transaction
        .M2S_ACP_AXI_AWVALID(M2S_ACP_AXI_AWVALID),
        .M2S_ACP_AXI_AWREADY(M2S_ACP_AXI_AWREADY),
        .M2S_ACP_AXI_AWADDR(M2S_ACP_AXI_AWADDR[31:0]),
        .M2S_ACP_AXI_AWBURST(M2S_ACP_AXI_AWBURST[1:0]),
        .M2S_ACP_AXI_AWLEN(M2S_ACP_AXI_AWLEN[3:0]),
        .M2S_ACP_AXI_AWSIZE(M2S_ACP_AXI_AWSIZE[1:0]),
        //
        .M2S_ACP_AXI_WVALID(M2S_ACP_AXI_WVALID),
        .M2S_ACP_AXI_WREADY(M2S_ACP_AXI_WREADY),
        .M2S_ACP_AXI_WLAST(M2S_ACP_AXI_WLAST),
        .M2S_ACP_AXI_WDATA(M2S_ACP_AXI_WDATA[63:0]),
        .M2S_ACP_AXI_WSTRB(M2S_ACP_AXI_WSTRB[7:0]),
        //
        .M2S_ACP_AXI_BVALID(M2S_ACP_AXI_BVALID),
        .M2S_ACP_AXI_BREADY(M2S_ACP_AXI_BREADY),
        .M2S_ACP_AXI_BRESP(M2S_ACP_AXI_BRESP[1:0])
    ); // ps7_inst

    /////////////////////////////////////////
// instantiate stubs
///////////////////////////////////////


    // Slave GP0
    // Being used by MMIO_slave
    axi_slave_stub axi_slave_GP0_stub(    
        .S2M_AXI_ACLK(S2M_GP0_AXI_ACLK),
        // Read interface
        .S2M_AXI_ARVALID(S2M_GP0_AXI_ARVALID),
        .S2M_AXI_ARREADY(S2M_GP0_AXI_ARREADY),
        .S2M_AXI_ARADDR(S2M_GP0_AXI_ARADDR[31:0]),
        .S2M_AXI_ARID(S2M_GP0_AXI_ARID[11:0]),

        .S2M_AXI_RVALID(S2M_GP0_AXI_RVALID),
        .S2M_AXI_RREADY(S2M_GP0_AXI_RREADY),
        .S2M_AXI_RLAST(S2M_GP0_AXI_RLAST),
        .S2M_AXI_RDATA(S2M_GP0_AXI_RDATA[31:0]),
        .S2M_AXI_RID(S2M_GP0_AXI_RID[11:0]),

        .S2M_AXI_RRESP(S2M_GP0_AXI_RRESP[1:0]),

        //write interface
        .S2M_AXI_AWVALID(S2M_GP0_AXI_AWVALID),
        .S2M_AXI_AWREADY(S2M_GP0_AXI_AWREADY),
        .S2M_AXI_AWADDR(S2M_GP0_AXI_AWADDR[31:0]),
        .S2M_AXI_AWID(S2M_GP0_AXI_AWID[11:0]),

        .S2M_AXI_WVALID(S2M_GP0_AXI_WVALID),
        .S2M_AXI_WREADY(S2M_GP0_AXI_WREADY),
        .S2M_AXI_WDATA(S2M_GP0_AXI_WDATA[31:0]),
        .S2M_AXI_WSTRB(S2M_GP0_AXI_WSTRB[3:0]),

        .S2M_AXI_BVALID(S2M_GP0_AXI_BVALID),
        .S2M_AXI_BREADY(S2M_GP0_AXI_BREADY),
        .S2M_AXI_BRESP(S2M_GP0_AXI_BRESP[1:0]),
        .S2M_AXI_BID(S2M_GP0_AXI_BID[11:0])
    );

    // Slave GP1
    axi_slave_stub axi_slave_GP1_stub(    
        .S2M_AXI_ACLK(S2M_GP1_AXI_ACLK),
        // Read interface
        .S2M_AXI_ARVALID(S2M_GP1_AXI_ARVALID),
        .S2M_AXI_ARREADY(S2M_GP1_AXI_ARREADY),
        .S2M_AXI_ARADDR(S2M_GP1_AXI_ARADDR[31:0]),
        .S2M_AXI_ARID(S2M_GP1_AXI_ARID[11:0]),

        .S2M_AXI_RVALID(S2M_GP1_AXI_RVALID),
        .S2M_AXI_RREADY(S2M_GP1_AXI_RREADY),
        .S2M_AXI_RLAST(S2M_GP1_AXI_RLAST),
        .S2M_AXI_RDATA(S2M_GP1_AXI_RDATA[31:0]),
        .S2M_AXI_RID(S2M_GP1_AXI_RID[11:0]),

        .S2M_AXI_RRESP(S2M_GP1_AXI_RRESP[1:0]),

        //write interface
        .S2M_AXI_AWVALID(S2M_GP1_AXI_AWVALID),
        .S2M_AXI_AWREADY(S2M_GP1_AXI_AWREADY),
        .S2M_AXI_AWADDR(S2M_GP1_AXI_AWADDR[31:0]),
        .S2M_AXI_AWID(S2M_GP1_AXI_AWID[11:0]),

        .S2M_AXI_WVALID(S2M_GP1_AXI_WVALID),
        .S2M_AXI_WREADY(S2M_GP1_AXI_WREADY),
        .S2M_AXI_WDATA(S2M_GP1_AXI_WDATA[31:0]),
        .S2M_AXI_WSTRB(S2M_GP1_AXI_WSTRB[3:0]),

        .S2M_AXI_BVALID(S2M_GP1_AXI_BVALID),
        .S2M_AXI_BREADY(S2M_GP1_AXI_BREADY),
        .S2M_AXI_BRESP(S2M_GP1_AXI_BRESP[1:0]),
        .S2M_AXI_BID(S2M_GP1_AXI_BID[11:0])
    );



    // Master GP0
    axi_master32_stub axi_master_GP0_stub (
        .M2S_AXI_ACLK(M2S_GP0_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_GP0_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_GP0_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_GP0_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_GP0_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_GP0_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_GP0_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_GP0_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_GP0_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_GP0_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_GP0_AXI_RDATA[31:0]),
        //
        .M2S_AXI_RRESP(M2S_GP0_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_GP0_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_GP0_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_GP0_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_GP0_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_GP0_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_GP0_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_GP0_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_GP0_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_GP0_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_GP0_AXI_WDATA[31:0]),
        .M2S_AXI_WSTRB(M2S_GP0_AXI_WSTRB[3:0]),
        //
        .M2S_AXI_BVALID(M2S_GP0_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_GP0_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_GP0_AXI_BRESP[1:0])
    );

    // Master GP1
    axi_master32_stub axi_master_GP1_stub (
        .M2S_AXI_ACLK(M2S_GP1_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_GP1_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_GP1_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_GP1_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_GP1_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_GP1_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_GP1_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_GP1_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_GP1_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_GP1_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_GP1_AXI_RDATA[31:0]),
        //
        .M2S_AXI_RRESP(M2S_GP1_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_GP1_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_GP1_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_GP1_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_GP1_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_GP1_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_GP1_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_GP1_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_GP1_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_GP1_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_GP1_AXI_WDATA[31:0]),
        .M2S_AXI_WSTRB(M2S_GP1_AXI_WSTRB[3:0]),
        //
        .M2S_AXI_BVALID(M2S_GP1_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_GP1_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_GP1_AXI_BRESP[1:0])
    );

    // Master HP0
    
    axi_master_stub axi_master_HP0_stub (
        .M2S_AXI_ACLK(M2S_HP0_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_HP0_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_HP0_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_HP0_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_HP0_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_HP0_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_HP0_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_HP0_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_HP0_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_HP0_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_HP0_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_HP0_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_HP0_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_HP0_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_HP0_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_HP0_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_HP0_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_HP0_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_HP0_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_HP0_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_HP0_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_HP0_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_HP0_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_HP0_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_HP0_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_HP0_AXI_BRESP[1:0])
    );

    // Master HP1
    axi_master_stub axi_master_HP1_stub (
        .M2S_AXI_ACLK(M2S_HP1_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_HP1_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_HP1_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_HP1_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_HP1_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_HP1_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_HP1_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_HP1_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_HP1_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_HP1_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_HP1_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_HP1_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_HP1_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_HP1_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_HP1_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_HP1_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_HP1_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_HP1_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_HP1_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_HP1_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_HP1_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_HP1_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_HP1_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_HP1_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_HP1_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_HP1_AXI_BRESP[1:0])
    );

    // Master HP2
    axi_master_stub axi_master_HP2_stub (
        .M2S_AXI_ACLK(M2S_HP2_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_HP2_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_HP2_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_HP2_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_HP2_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_HP2_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_HP2_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_HP2_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_HP2_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_HP2_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_HP2_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_HP2_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_HP2_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_HP2_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_HP2_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_HP2_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_HP2_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_HP2_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_HP2_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_HP2_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_HP2_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_HP2_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_HP2_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_HP2_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_HP2_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_HP2_AXI_BRESP[1:0])
    );

    // Master HP3
     axi_master_stub axi_master_HP3_stub (
        .M2S_AXI_ACLK(M2S_HP3_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_HP3_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_HP3_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_HP3_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_HP3_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_HP3_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_HP3_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_HP3_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_HP3_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_HP3_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_HP3_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_HP3_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_HP3_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_HP3_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_HP3_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_HP3_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_HP3_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_HP3_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_HP3_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_HP3_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_HP3_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_HP3_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_HP3_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_HP3_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_HP3_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_HP3_AXI_BRESP[1:0])
    );


    // Master ACP
    // Being used by camera (write) and vga (read)
    axi_master_stub axi_master_ACP_stub (
        .M2S_AXI_ACLK(M2S_ACP_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_ACP_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_ACP_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_ACP_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_ACP_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_ACP_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_ACP_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_ACP_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_ACP_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_ACP_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_ACP_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_ACP_AXI_RRESP[1:0]),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_ACP_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_ACP_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_ACP_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_ACP_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_ACP_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_ACP_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_ACP_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_ACP_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_ACP_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_ACP_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_ACP_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_ACP_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_ACP_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_ACP_AXI_BRESP[1:0])
    );


//endmodule
