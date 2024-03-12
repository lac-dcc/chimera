module ps7_wrap(

    // Non-Axi PS7 signals
    inout [53:0] MIO,
    inout PS_SRSTB,
    inout PS_CLK,
    inout PS_PORB,
    inout DDR_Clk,
    inout DDR_Clk_n,
    inout DDR_CKE,
    inout DDR_CS_n,
    inout DDR_RAS_n,
    inout DDR_CAS_n,
    output DDR_WEB,
    inout [2:0] DDR_BankAddr,
    inout [14:0] DDR_Addr,
    inout DDR_ODT,
    inout DDR_DRSTB,
    inout [31:0] DDR_DQ,
    inout [3:0] DDR_DM,
    inout [3:0] DDR_DQS,
    inout [3:0] DDR_DQS_n,
    inout DDR_VRN,
    inout DDR_VRP,

    output [3:0] FCLKCLK,
    output [3:0] FCLKRESETN,


/////////////////////////////////////
// Slave -> Master GP0
/////////////////////////////////////
    input S2M_GP0_AXI_ACLK,

    // Read interface
    output S2M_GP0_AXI_ARVALID,
    input S2M_GP0_AXI_ARREADY,
    output [31:0] S2M_GP0_AXI_ARADDR,
    output [11:0] S2M_GP0_AXI_ARID,

    input S2M_GP0_AXI_RVALID,
    output S2M_GP0_AXI_RREADY,
    input S2M_GP0_AXI_RLAST,
    input [31:0] S2M_GP0_AXI_RDATA,
    input [11:0] S2M_GP0_AXI_RID,

    input [1:0] S2M_GP0_AXI_RRESP,


    //write interface
    output S2M_GP0_AXI_AWVALID,
    input S2M_GP0_AXI_AWREADY,
    output [31:0] S2M_GP0_AXI_AWADDR,
    output [11:0] S2M_GP0_AXI_AWID,

    output S2M_GP0_AXI_WVALID,
    input S2M_GP0_AXI_WREADY,
    output [31:0] S2M_GP0_AXI_WDATA,
    output [3:0] S2M_GP0_AXI_WSTRB,

    input S2M_GP0_AXI_BVALID,
    output S2M_GP0_AXI_BREADY,
    input [1:0] S2M_GP0_AXI_BRESP,
    input [11:0] S2M_GP0_AXI_BID,

/////////////////////////////////////
// Slave -> Master GP1
/////////////////////////////////////
    input S2M_GP1_AXI_ACLK,

    // Read interface
    output S2M_GP1_AXI_ARVALID,
    input S2M_GP1_AXI_ARREADY,
    output [31:0] S2M_GP1_AXI_ARADDR,
    output [11:0] S2M_GP1_AXI_ARID,

    input S2M_GP1_AXI_RVALID,
    output S2M_GP1_AXI_RREADY,
    input S2M_GP1_AXI_RLAST,
    input [31:0] S2M_GP1_AXI_RDATA,
    input [11:0] S2M_GP1_AXI_RID,

    input [1:0] S2M_GP1_AXI_RRESP,

    //write interface
    output S2M_GP1_AXI_AWVALID,
    input S2M_GP1_AXI_AWREADY,
    output [31:0] S2M_GP1_AXI_AWADDR,
    output [11:0] S2M_GP1_AXI_AWID,

    output S2M_GP1_AXI_WVALID,
    input S2M_GP1_AXI_WREADY,
    output [31:0] S2M_GP1_AXI_WDATA,
    output [3:0] S2M_GP1_AXI_WSTRB,

    input S2M_GP1_AXI_BVALID,
    output S2M_GP1_AXI_BREADY,
    input [1:0] S2M_GP1_AXI_BRESP,
    input [11:0] S2M_GP1_AXI_BID,

    
/////////////////////////////////////
// Master -> Slave interface GP0
/////////////////////////////////////
    input M2S_GP0_AXI_ACLK ,
    
    //Read M2S_GP0_AXI_transation
    
    input M2S_GP0_AXI_ARVALID,
    output M2S_GP0_AXI_ARREADY,
    input [31:0] M2S_GP0_AXI_ARADDR,
    input [1:0] M2S_GP0_AXI_ARBURST,
    input [3:0] M2S_GP0_AXI_ARLEN,
    input [1:0] M2S_GP0_AXI_ARSIZE,
    //
    output M2S_GP0_AXI_RVALID,
    input M2S_GP0_AXI_RREADY,
    output M2S_GP0_AXI_RLAST,
    output [31:0] M2S_GP0_AXI_RDATA,
    //
    output [1:0] M2S_GP0_AXI_RRESP,
   
    // Write M2S_GP0_AXI_Transaction
    input M2S_GP0_AXI_AWVALID,
    output M2S_GP0_AXI_AWREADY,
    input [31:0] M2S_GP0_AXI_AWADDR,
    input [1:0] M2S_GP0_AXI_AWBURST,
    input [3:0] M2S_GP0_AXI_AWLEN,
    input [1:0] M2S_GP0_AXI_AWSIZE,
    //
    input M2S_GP0_AXI_WVALID,
    output M2S_GP0_AXI_WREADY,
    input M2S_GP0_AXI_WLAST,
    input [31:0] M2S_GP0_AXI_WDATA,
    input [3:0] M2S_GP0_AXI_WSTRB,
    //
    output M2S_GP0_AXI_BVALID,
    input M2S_GP0_AXI_BREADY,
    output [1:0] M2S_GP0_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface GP1
/////////////////////////////////////
    input M2S_GP1_AXI_ACLK ,
    
    //Read M2S_GP1_AXI_transation
    
    input M2S_GP1_AXI_ARVALID,
    output M2S_GP1_AXI_ARREADY,
    input [31:0] M2S_GP1_AXI_ARADDR,
    input [1:0] M2S_GP1_AXI_ARBURST,
    input [3:0] M2S_GP1_AXI_ARLEN,
    input [1:0] M2S_GP1_AXI_ARSIZE,
    //
    output M2S_GP1_AXI_RVALID,
    input M2S_GP1_AXI_RREADY,
    output M2S_GP1_AXI_RLAST,
    output [31:0] M2S_GP1_AXI_RDATA,
    //
    output [1:0] M2S_GP1_AXI_RRESP,
   
    // Write M2S_GP1_AXI_Transaction
    input M2S_GP1_AXI_AWVALID,
    output M2S_GP1_AXI_AWREADY,
    input [31:0] M2S_GP1_AXI_AWADDR,
    input [1:0] M2S_GP1_AXI_AWBURST,
    input [3:0] M2S_GP1_AXI_AWLEN,
    input [1:0] M2S_GP1_AXI_AWSIZE,
    //
    input M2S_GP1_AXI_WVALID,
    output M2S_GP1_AXI_WREADY,
    input M2S_GP1_AXI_WLAST,
    input [31:0] M2S_GP1_AXI_WDATA,
    input [3:0] M2S_GP1_AXI_WSTRB,
    //
    output M2S_GP1_AXI_BVALID,
    input M2S_GP1_AXI_BREADY,
    output [1:0] M2S_GP1_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface HP0
/////////////////////////////////////
    input M2S_HP0_AXI_ACLK ,
    
    //Read M2S_HP0_AXI_transation
    
    input M2S_HP0_AXI_ARVALID,
    output M2S_HP0_AXI_ARREADY,
    input [31:0] M2S_HP0_AXI_ARADDR,
    input [1:0] M2S_HP0_AXI_ARBURST,
    input [3:0] M2S_HP0_AXI_ARLEN,
    input [1:0] M2S_HP0_AXI_ARSIZE,
    //
    output M2S_HP0_AXI_RVALID,
    input M2S_HP0_AXI_RREADY,
    output M2S_HP0_AXI_RLAST,
    output [63:0] M2S_HP0_AXI_RDATA,
    //
    output [1:0] M2S_HP0_AXI_RRESP,
   
    // Write M2S_HP0_AXI_Transaction
    input M2S_HP0_AXI_AWVALID,
    output M2S_HP0_AXI_AWREADY,
    input [31:0] M2S_HP0_AXI_AWADDR,
    input [1:0] M2S_HP0_AXI_AWBURST,
    input [3:0] M2S_HP0_AXI_AWLEN,
    input [1:0] M2S_HP0_AXI_AWSIZE,
    //
    input M2S_HP0_AXI_WVALID,
    output M2S_HP0_AXI_WREADY,
    input M2S_HP0_AXI_WLAST,
    input [63:0] M2S_HP0_AXI_WDATA,
    input [7:0] M2S_HP0_AXI_WSTRB,
    //
    output M2S_HP0_AXI_BVALID,
    input M2S_HP0_AXI_BREADY,
    output [1:0] M2S_HP0_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface HP1
/////////////////////////////////////
    input M2S_HP1_AXI_ACLK ,
    
    //Read M2S_HP1_AXI_transation
    
    input M2S_HP1_AXI_ARVALID,
    output M2S_HP1_AXI_ARREADY,
    input [31:0] M2S_HP1_AXI_ARADDR,
    input [1:0] M2S_HP1_AXI_ARBURST,
    input [3:0] M2S_HP1_AXI_ARLEN,
    input [1:0] M2S_HP1_AXI_ARSIZE,
    //
    output M2S_HP1_AXI_RVALID,
    input M2S_HP1_AXI_RREADY,
    output M2S_HP1_AXI_RLAST,
    output [63:0] M2S_HP1_AXI_RDATA,
    //
    output [1:0] M2S_HP1_AXI_RRESP,
   
    // Write M2S_HP1_AXI_Transaction
    input M2S_HP1_AXI_AWVALID,
    output M2S_HP1_AXI_AWREADY,
    input [31:0] M2S_HP1_AXI_AWADDR,
    input [1:0] M2S_HP1_AXI_AWBURST,
    input [3:0] M2S_HP1_AXI_AWLEN,
    input [1:0] M2S_HP1_AXI_AWSIZE,
    //
    input M2S_HP1_AXI_WVALID,
    output M2S_HP1_AXI_WREADY,
    input M2S_HP1_AXI_WLAST,
    input [63:0] M2S_HP1_AXI_WDATA,
    input [7:0] M2S_HP1_AXI_WSTRB,
    //
    output M2S_HP1_AXI_BVALID,
    input M2S_HP1_AXI_BREADY,
    output [1:0] M2S_HP1_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface HP2
/////////////////////////////////////
    input M2S_HP2_AXI_ACLK ,
    
    //Read M2S_HP2_AXI_transation
    
    input M2S_HP2_AXI_ARVALID,
    output M2S_HP2_AXI_ARREADY,
    input [31:0] M2S_HP2_AXI_ARADDR,
    input [1:0] M2S_HP2_AXI_ARBURST,
    input [3:0] M2S_HP2_AXI_ARLEN,
    input [1:0] M2S_HP2_AXI_ARSIZE,
    //
    output M2S_HP2_AXI_RVALID,
    input M2S_HP2_AXI_RREADY,
    output M2S_HP2_AXI_RLAST,
    output [63:0] M2S_HP2_AXI_RDATA,
    //
    output [1:0] M2S_HP2_AXI_RRESP,
   
    // Write M2S_HP2_AXI_Transaction
    input M2S_HP2_AXI_AWVALID,
    output M2S_HP2_AXI_AWREADY,
    input [31:0] M2S_HP2_AXI_AWADDR,
    input [1:0] M2S_HP2_AXI_AWBURST,
    input [3:0] M2S_HP2_AXI_AWLEN,
    input [1:0] M2S_HP2_AXI_AWSIZE,
    //
    input M2S_HP2_AXI_WVALID,
    output M2S_HP2_AXI_WREADY,
    input M2S_HP2_AXI_WLAST,
    input [63:0] M2S_HP2_AXI_WDATA,
    input [7:0] M2S_HP2_AXI_WSTRB,
    //
    output M2S_HP2_AXI_BVALID,
    input M2S_HP2_AXI_BREADY,
    output [1:0] M2S_HP2_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface HP3
/////////////////////////////////////
    input M2S_HP3_AXI_ACLK ,
    
    //Read M2S_HP3_AXI_transation
    
    input M2S_HP3_AXI_ARVALID,
    output M2S_HP3_AXI_ARREADY,
    input [31:0] M2S_HP3_AXI_ARADDR,
    input [1:0] M2S_HP3_AXI_ARBURST,
    input [3:0] M2S_HP3_AXI_ARLEN,
    input [1:0] M2S_HP3_AXI_ARSIZE,
    //
    output M2S_HP3_AXI_RVALID,
    input M2S_HP3_AXI_RREADY,
    output M2S_HP3_AXI_RLAST,
    output [63:0] M2S_HP3_AXI_RDATA,
    //
    output [1:0] M2S_HP3_AXI_RRESP,
   
    // Write M2S_HP3_AXI_Transaction
    input M2S_HP3_AXI_AWVALID,
    output M2S_HP3_AXI_AWREADY,
    input [31:0] M2S_HP3_AXI_AWADDR,
    input [1:0] M2S_HP3_AXI_AWBURST,
    input [3:0] M2S_HP3_AXI_AWLEN,
    input [1:0] M2S_HP3_AXI_AWSIZE,
    //
    input M2S_HP3_AXI_WVALID,
    output M2S_HP3_AXI_WREADY,
    input M2S_HP3_AXI_WLAST,
    input [63:0] M2S_HP3_AXI_WDATA,
    input [7:0] M2S_HP3_AXI_WSTRB,
    //
    output M2S_HP3_AXI_BVALID,
    input M2S_HP3_AXI_BREADY,
    output [1:0] M2S_HP3_AXI_BRESP,

/////////////////////////////////////
// Master -> Slave interface ACP
/////////////////////////////////////
    input M2S_ACP_AXI_ACLK ,
    
    //Read M2S_ACP_AXI_transation
    
    input M2S_ACP_AXI_ARVALID,
    output M2S_ACP_AXI_ARREADY,
    input [31:0] M2S_ACP_AXI_ARADDR,
    input [1:0] M2S_ACP_AXI_ARBURST,
    input [3:0] M2S_ACP_AXI_ARLEN,
    input [1:0] M2S_ACP_AXI_ARSIZE,
    //
    output M2S_ACP_AXI_RVALID,
    input M2S_ACP_AXI_RREADY,
    output M2S_ACP_AXI_RLAST,
    output [63:0] M2S_ACP_AXI_RDATA,
    //
    output [1:0] M2S_ACP_AXI_RRESP,
   
    // Write M2S_ACP_AXI_Transaction
    input M2S_ACP_AXI_AWVALID,
    output M2S_ACP_AXI_AWREADY,
    input [31:0] M2S_ACP_AXI_AWADDR,
    input [1:0] M2S_ACP_AXI_AWBURST,
    input [3:0] M2S_ACP_AXI_AWLEN,
    input [1:0] M2S_ACP_AXI_AWSIZE,
    //
    input M2S_ACP_AXI_WVALID,
    output M2S_ACP_AXI_WREADY,
    input M2S_ACP_AXI_WLAST,
    input [63:0] M2S_ACP_AXI_WDATA,
    input [7:0] M2S_ACP_AXI_WSTRB,
    //
    output M2S_ACP_AXI_BVALID,
    input M2S_ACP_AXI_BREADY,
    output [1:0] M2S_ACP_AXI_BRESP
);

/////////////////////////////////////////





    PS7 ps7_0(
        .DMA0DATYPE(),   // out std_logic_vector(1 downto 0);
        .DMA0DAVALID(),   // out std_ulogic;
        .DMA0DRREADY(),   // out std_ulogic;
        .DMA0RSTN(),   // out std_ulogic;
        .DMA1DATYPE(),   // out std_logic_vector(1 downto 0);
        .DMA1DAVALID(),   // out std_ulogic;
        .DMA1DRREADY(),   // out std_ulogic;
        .DMA1RSTN(),   // out std_ulogic;
        .DMA2DATYPE(),   // out std_logic_vector(1 downto 0);
        .DMA2DAVALID(),   // out std_ulogic;
        .DMA2DRREADY(),   // out std_ulogic;
        .DMA2RSTN(),   // out std_ulogic;
        .DMA3DATYPE(),   // out std_logic_vector(1 downto 0);
        .DMA3DAVALID(),   // out std_ulogic;
        .DMA3DRREADY(),   // out std_ulogic;
        .DMA3RSTN(),   // out std_ulogic;
        .EMIOCAN0PHYTX(),   // out std_ulogic;
        .EMIOCAN1PHYTX(),   // out std_ulogic;
        .EMIOENET0GMIITXD(),   // out std_logic_vector(7 downto 0);
        .EMIOENET0GMIITXEN(),   // out std_ulogic;
        .EMIOENET0GMIITXER(),   // out std_ulogic;
        .EMIOENET0MDIOMDC(),   // out std_ulogic;
        .EMIOENET0MDIOO(),   // out std_ulogic;
        .EMIOENET0MDIOTN(),   // out std_ulogic;
        .EMIOENET0PTPDELAYREQRX(),   // out std_ulogic;
        .EMIOENET0PTPDELAYREQTX(),   // out std_ulogic;
        .EMIOENET0PTPPDELAYREQRX(),   // out std_ulogic;
        .EMIOENET0PTPPDELAYREQTX(),   // out std_ulogic;
        .EMIOENET0PTPPDELAYRESPRX(),   // out std_ulogic;
        .EMIOENET0PTPPDELAYRESPTX(),   // out std_ulogic;
        .EMIOENET0PTPSYNCFRAMERX(),   // out std_ulogic;
        .EMIOENET0PTPSYNCFRAMETX(),   // out std_ulogic;
        .EMIOENET0SOFRX(),   // out std_ulogic;
        .EMIOENET0SOFTX(),   // out std_ulogic;
        .EMIOENET1GMIITXD(),   // out std_logic_vector(7 downto 0);
        .EMIOENET1GMIITXEN(),   // out std_ulogic;
        .EMIOENET1GMIITXER(),   // out std_ulogic;
        .EMIOENET1MDIOMDC(),   // out std_ulogic;
        .EMIOENET1MDIOO(),   // out std_ulogic;
        .EMIOENET1MDIOTN(),   // out std_ulogic;
        .EMIOENET1PTPDELAYREQRX(),   // out std_ulogic;
        .EMIOENET1PTPDELAYREQTX(),   // out std_ulogic;
        .EMIOENET1PTPPDELAYREQRX(),   // out std_ulogic;
        .EMIOENET1PTPPDELAYREQTX(),   // out std_ulogic;
        .EMIOENET1PTPPDELAYRESPRX(),   // out std_ulogic;
        .EMIOENET1PTPPDELAYRESPTX(),   // out std_ulogic;
        .EMIOENET1PTPSYNCFRAMERX(),   // out std_ulogic;
        .EMIOENET1PTPSYNCFRAMETX(),   // out std_ulogic;
        .EMIOENET1SOFRX(),   // out std_ulogic;
        .EMIOENET1SOFTX(),   // out std_ulogic;
        .EMIOGPIOO(),    // out std_logic_vector(63 downto 0);
        .EMIOGPIOTN(),  // out std_logic_vector(63 downto 0);
        .EMIOI2C0SCLO(),    // out std_ulogic;
        .EMIOI2C0SCLTN(),  // out std_ulogic;
        .EMIOI2C0SDAO(),    // out std_ulogic;
        .EMIOI2C0SDATN(),  // out std_ulogic;
        .EMIOI2C1SCLO(),    // out std_ulogic;
        .EMIOI2C1SCLTN(),  // out std_ulogic;
        .EMIOI2C1SDAO(),    // out std_ulogic;
        .EMIOI2C1SDATN(),  // out std_ulogic;
        .EMIOPJTAGTDO(),   // out std_ulogic;
        .EMIOPJTAGTDTN(),   // out std_ulogic;
        .EMIOSDIO0BUSPOW(),   // out std_ulogic;
        .EMIOSDIO0BUSVOLT(),   // out std_logic_vector(2 downto 0);
        .EMIOSDIO0CLK(),   // out std_ulogic;
        .EMIOSDIO0CMDO(),   // out std_ulogic;
        .EMIOSDIO0CMDTN(),   // out std_ulogic;
        .EMIOSDIO0DATAO(),   // out std_logic_vector(3 downto 0);
        .EMIOSDIO0DATATN(),   // out std_logic_vector(3 downto 0);
        .EMIOSDIO0LED(),   // out std_ulogic;
        .EMIOSDIO1BUSPOW(),   // out std_ulogic;
        .EMIOSDIO1BUSVOLT(),   // out std_logic_vector(2 downto 0);
        .EMIOSDIO1CLK(),   // out std_ulogic;
        .EMIOSDIO1CMDO(),   // out std_ulogic;
        .EMIOSDIO1CMDTN(),   // out std_ulogic;
        .EMIOSDIO1DATAO(),   // out std_logic_vector(3 downto 0);
        .EMIOSDIO1DATATN(),   // out std_logic_vector(3 downto 0);
        .EMIOSDIO1LED(),   // out std_ulogic;
        .EMIOSPI0MO(),   // out std_ulogic;
        .EMIOSPI0MOTN(),   // out std_ulogic;
        .EMIOSPI0SCLKO(),   // out std_ulogic;
        .EMIOSPI0SCLKTN(),   // out std_ulogic;
        .EMIOSPI0SO(),   // out std_ulogic;
        .EMIOSPI0SSNTN(),   // out std_ulogic;
        .EMIOSPI0SSON(),   // out std_logic_vector(2 downto 0);
        .EMIOSPI0STN(),   // out std_ulogic;
        .EMIOSPI1MO(),   // out std_ulogic;
        .EMIOSPI1MOTN(),   // out std_ulogic;
        .EMIOSPI1SCLKO(),   // out std_ulogic;
        .EMIOSPI1SCLKTN(),   // out std_ulogic;
        .EMIOSPI1SO(),   // out std_ulogic;
        .EMIOSPI1SSNTN(),   // out std_ulogic;
        .EMIOSPI1SSON(),   // out std_logic_vector(2 downto 0);
        .EMIOSPI1STN(),   // out std_ulogic;
        .EMIOTRACECTL(),   // out std_ulogic;
        .EMIOTRACEDATA(),   // out std_logic_vector(31 downto 0);
        .EMIOTTC0WAVEO(),   // out std_logic_vector(2 downto 0);
        .EMIOTTC1WAVEO(),   // out std_logic_vector(2 downto 0);
        .EMIOUART0DTRN(),   // out std_ulogic;
        .EMIOUART0RTSN(),   // out std_ulogic;
        .EMIOUART0TX(),   // out std_ulogic;
        .EMIOUART1DTRN(),   // out std_ulogic;
        .EMIOUART1RTSN(),   // out std_ulogic;
        .EMIOUART1TX(),   // out std_ulogic;
        .EMIOUSB0PORTINDCTL(),   // out std_logic_vector(1 downto 0);
        .EMIOUSB0VBUSPWRSELECT(),   // out std_ulogic;
        .EMIOUSB1PORTINDCTL(),   // out std_logic_vector(1 downto 0);
        .EMIOUSB1VBUSPWRSELECT(),   // out std_ulogic;
        .EMIOWDTRSTO(),   // out std_ulogic;
        .EVENTEVENTO(),   // out std_ulogic;
        .EVENTSTANDBYWFE(),   // out std_logic_vector(1 downto 0);
        .EVENTSTANDBYWFI(),   // out std_logic_vector(1 downto 0);
        .FCLKCLK(FCLKCLK),    // out std_logic_vector(3 downto 0);
        .FCLKRESETN(FCLKRESETN),   // out std_logic_vector(3 downto 0);
        .FTMTF2PTRIGACK(),   // out std_logic_vector(3 downto 0);
        .FTMTP2FDEBUG(),   // out std_logic_vector(31 downto 0);
        .FTMTP2FTRIG(),   // out std_logic_vector(3 downto 0);
        .IRQP2F(),   // out std_logic_vector(28 downto 0);
        
        .DDRA(DDR_Addr),   // inout std_logic_vector(14 downto 0);
        .DDRBA(DDR_BankAddr), // inout std_logic_vector(2 downto 0);
        .DDRCASB(DDR_CAS_n),   // inout std_ulogic;
        .DDRCKE(DDR_CKE),   // inout std_ulogic;
        .DDRCKN(DDR_Clk_n),   // inout std_ulogic;
        .DDRCKP(DDR_Clk),   // inout std_ulogic;
        .DDRCSB(DDR_CS_n),   // inout std_ulogic;
        .DDRDM(DDR_DM),   // inout std_logic_vector(3 downto 0);
        .DDRDQ(DDR_DQ),   // inout std_logic_vector(31 downto 0);
        .DDRDQSN(DDR_DQS_n),   // inout std_logic_vector(3 downto 0);
        .DDRDQSP(DDR_DQS),   // inout std_logic_vector(3 downto 0);
        .DDRDRSTB(DDR_DRSTB),   // inout std_ulogic;
        .DDRODT(DDR_ODT),   // inout std_ulogic;
        .DDRRASB(DDR_RAS_n),   // inout std_ulogic;
        .DDRVRN(DDR_VRN),   // inout std_ulogic;
        .DDRVRP(DDR_VRP),   // inout std_ulogic;
        .DDRWEB(DDR_WEB),   // inout std_ulogic;
        .MIO(MIO),   // inout std_logic_vector(53 downto 0);
        .PSCLK(PS_CLK),   // inout std_ulogic;
        .PSPORB(PS_PORB),   // inout std_ulogic;
        .PSSRSTB(PS_SRSTB),   // inout std_ulogic;
        .DDRARB(4'b0),  // in std_logic_vector(3 downto 0);
        .DMA0ACLK(1'b0),     // in std_ulogic;
        .DMA0DAREADY(1'b0),     // in std_ulogic;
        .DMA0DRLAST(1'b0),     // in std_ulogic;
        .DMA0DRTYPE(2'b0),  // in std_logic_vector(1 downto 0);
        .DMA0DRVALID(1'b0),     // in std_ulogic;
        .DMA1ACLK(1'b0),     // in std_ulogic;
        .DMA1DAREADY(1'b0),     // in std_ulogic;
        .DMA1DRLAST(1'b0),     // in std_ulogic;
        .DMA1DRTYPE(2'b0),  // in std_logic_vector(1 downto 0);
        .DMA1DRVALID(1'b0),     // in std_ulogic;
        .DMA2ACLK(1'b0),     // in std_ulogic;
        .DMA2DAREADY(1'b0),     // in std_ulogic;
        .DMA2DRLAST(1'b0),     // in std_ulogic;
        .DMA2DRTYPE(2'b0),  // in std_logic_vector(1 downto 0);
        .DMA2DRVALID(1'b0),     // in std_ulogic;
        .DMA3ACLK(1'b0),     // in std_ulogic;
        .DMA3DAREADY(1'b0),     // in std_ulogic;
        .DMA3DRLAST(1'b0),     // in std_ulogic;
        .DMA3DRTYPE(2'b0),  // in std_logic_vector(1 downto 0);
        .DMA3DRVALID(1'b0),     // in std_ulogic;
        .EMIOCAN0PHYRX(1'b0),     // in std_ulogic;
        .EMIOCAN1PHYRX(1'b0),     // in std_ulogic;
        .EMIOENET0EXTINTIN(1'b0),     // in std_ulogic;
        .EMIOENET0GMIICOL(1'b0),     // in std_ulogic;
        .EMIOENET0GMIICRS(1'b0),     // in std_ulogic;
        .EMIOENET0GMIIRXCLK(1'b0),     // in std_ulogic;
        .EMIOENET0GMIIRXD(8'b0),  // in std_logic_vector(7 downto 0);
        .EMIOENET0GMIIRXDV(1'b0),     // in std_ulogic;
        .EMIOENET0GMIIRXER(1'b0),     // in std_ulogic;
        .EMIOENET0GMIITXCLK(1'b0),     // in std_ulogic;
        .EMIOENET0MDIOI(1'b0),     // in std_ulogic;
        .EMIOENET1EXTINTIN(1'b0),     // in std_ulogic;
        .EMIOENET1GMIICOL(1'b0),     // in std_ulogic;
        .EMIOENET1GMIICRS(1'b0),     // in std_ulogic;
        .EMIOENET1GMIIRXCLK(1'b0),     // in std_ulogic;
        .EMIOENET1GMIIRXD(8'b0),  // in std_logic_vector(7 downto 0);
        .EMIOENET1GMIIRXDV(1'b0),     // in std_ulogic;
        .EMIOENET1GMIIRXER(1'b0),     // in std_ulogic;
        .EMIOENET1GMIITXCLK(1'b0),     // in std_ulogic;
        .EMIOENET1MDIOI(1'b0),     // in std_ulogic;
        .EMIOGPIOI(64'b0),   // in std_logic_vector(63 downto 0);
        .EMIOI2C0SCLI(1'b0),   // in std_ulogic;
        .EMIOI2C0SDAI(1'b0),   // in std_ulogic;
        .EMIOI2C1SCLI(1'b0),   // in std_ulogic;
        .EMIOI2C1SDAI(1'b0),   // in std_ulogic;
        .EMIOPJTAGTCK(1'b0),     // in std_ulogic;
        .EMIOPJTAGTDI(1'b0),     // in std_ulogic;
        .EMIOPJTAGTMS(1'b0),     // in std_ulogic;
        .EMIOSDIO0CDN(1'b0),     // in std_ulogic;
        .EMIOSDIO0CLKFB(1'b0),     // in std_ulogic;
        .EMIOSDIO0CMDI(1'b0),     // in std_ulogic;
        .EMIOSDIO0DATAI(4'b0),  // in std_logic_vector(3 downto 0);
        .EMIOSDIO0WP(1'b0),     // in std_ulogic;
        .EMIOSDIO1CDN(1'b0),     // in std_ulogic;
        .EMIOSDIO1CLKFB(1'b0),     // in std_ulogic;
        .EMIOSDIO1CMDI(1'b0),     // in std_ulogic;
        .EMIOSDIO1DATAI(4'b0),  // in std_logic_vector(3 downto 0);
        .EMIOSDIO1WP(1'b0),     // in std_ulogic;
        .EMIOSPI0MI(1'b0),     // in std_ulogic;
        .EMIOSPI0SCLKI(1'b0),     // in std_ulogic;
        .EMIOSPI0SI(1'b0),     // in std_ulogic;
        .EMIOSPI0SSIN(1'b0),     // in std_ulogic;
        .EMIOSPI1MI(1'b0),     // in std_ulogic;
        .EMIOSPI1SCLKI(1'b0),     // in std_ulogic;
        .EMIOSPI1SI(1'b0),     // in std_ulogic;
        .EMIOSPI1SSIN(1'b0),     // in std_ulogic;
        .EMIOSRAMINTIN(1'b0),     // in std_ulogic;
        .EMIOTRACECLK(1'b0),     // in std_ulogic;
        .EMIOTTC0CLKI(3'b0),  // in std_logic_vector(2 downto 0);
        .EMIOTTC1CLKI(3'b0),  // in std_logic_vector(2 downto 0);
        .EMIOUART0CTSN(1'b0),     // in std_ulogic;
        .EMIOUART0DCDN(1'b0),     // in std_ulogic;
        .EMIOUART0DSRN(1'b0),     // in std_ulogic;
        .EMIOUART0RIN(1'b0),     // in std_ulogic;
        .EMIOUART0RX(1'b0),     // in std_ulogic;
        .EMIOUART1CTSN(1'b0),     // in std_ulogic;
        .EMIOUART1DCDN(1'b0),     // in std_ulogic;
        .EMIOUART1DSRN(1'b0),     // in std_ulogic;
        .EMIOUART1RIN(1'b0),     // in std_ulogic;
        .EMIOUART1RX(1'b0),     // in std_ulogic;
        .EMIOUSB0VBUSPWRFAULT(1'b0),     // in std_ulogic;
        .EMIOUSB1VBUSPWRFAULT(1'b0),     // in std_ulogic;
        .EMIOWDTCLKI(1'b0),     // in std_ulogic;
        .EVENTEVENTI(1'b0),     // in std_ulogic;
        .FCLKCLKTRIGN(4'b0),  // in std_logic_vector(3 downto 0);
        .FPGAIDLEN(1'b0),     // in std_ulogic;
        .FTMDTRACEINATID(4'b0),  // in std_logic_vector(3 downto 0);
        .FTMDTRACEINCLOCK(1'b0),     // in std_ulogic;
        .FTMDTRACEINDATA(32'b0),  // in std_logic_vector(31 downto 0);
        .FTMDTRACEINVALID(1'b0),     // in std_ulogic;
        .FTMTF2PDEBUG(32'b0),  // in std_logic_vector(31 downto 0);
        .FTMTF2PTRIG(4'b0),  // in std_logic_vector(3 downto 0);
        .FTMTP2FTRIGACK(4'b0),  // in std_logic_vector(3 downto 0);
        .IRQF2P(20'h0),  // in std_logic_vector(19 downto 0);
        
        .MAXIGP0ACLK(S2M_GP0_AXI_ACLK),  // in std_ulogic;
        .MAXIGP0ARADDR(S2M_GP0_AXI_ARADDR), // out std_logic_vector(31 downto 0);
        .MAXIGP0ARBURST(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0ARCACHE(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0ARESETN(),  // out std_ulogic;
        .MAXIGP0ARID(S2M_GP0_AXI_ARID),   // out std_logic_vector(11 downto 0);
        .MAXIGP0ARLEN(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0ARLOCK(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0ARPROT(),  // out std_logic_vector(2 downto 0);
        .MAXIGP0ARQOS(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0ARREADY(S2M_GP0_AXI_ARREADY),// in std_ulogic;
        .MAXIGP0ARSIZE(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0ARVALID(S2M_GP0_AXI_ARVALID), // out std_ulogic;
        .MAXIGP0AWADDR(S2M_GP0_AXI_AWADDR), // out std_logic_vector(31 downto 0);
        .MAXIGP0AWBURST(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0AWCACHE(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0AWID(S2M_GP0_AXI_AWID),   // out std_logic_vector(11 downto 0);
        .MAXIGP0AWLEN(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0AWLOCK(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0AWPROT(),  // out std_logic_vector(2 downto 0);
        .MAXIGP0AWQOS(),  // out std_logic_vector(3 downto 0);
        .MAXIGP0AWREADY(S2M_GP0_AXI_AWREADY),// in std_ulogic;
        .MAXIGP0AWSIZE(),  // out std_logic_vector(1 downto 0);
        .MAXIGP0AWVALID(S2M_GP0_AXI_AWVALID), // out std_ulogic;
        .MAXIGP0BID(S2M_GP0_AXI_BID),  // in std_logic_vector(11 downto 0);
        .MAXIGP0BREADY(S2M_GP0_AXI_BREADY), // out std_ulogic;
        .MAXIGP0BRESP(S2M_GP0_AXI_BRESP),// in std_logic_vector(1 downto 0);
        .MAXIGP0BVALID(S2M_GP0_AXI_BVALID),// in std_ulogic;
        .MAXIGP0RDATA(S2M_GP0_AXI_RDATA),// in std_logic_vector(31 downto 0);
        .MAXIGP0RID(S2M_GP0_AXI_RID),  // in std_logic_vector(11 downto 0);
        .MAXIGP0RLAST(S2M_GP0_AXI_RLAST),// in std_ulogic;
        .MAXIGP0RREADY(S2M_GP0_AXI_RREADY), // out std_ulogic;
        .MAXIGP0RRESP(S2M_GP0_AXI_RRESP),// in std_logic_vector(1 downto 0);    
        .MAXIGP0RVALID(S2M_GP0_AXI_RVALID),// in std_ulogic;
        .MAXIGP0WDATA(S2M_GP0_AXI_WDATA), // out std_logic_vector(31 downto 0);
        .MAXIGP0WID(),    // out std_logic_vector(11 downto 0);
        .MAXIGP0WLAST(),  // out std_ulogic;
        .MAXIGP0WREADY(S2M_GP0_AXI_WREADY),// in std_ulogic;
        .MAXIGP0WSTRB(S2M_GP0_AXI_WSTRB), // out std_logic_vector(3 downto 0);
        .MAXIGP0WVALID(S2M_GP0_AXI_WVALID), // out std_ulogic;

        .MAXIGP1ACLK(S2M_GP1_AXI_ACLK),  // in std_ulogic;
        .MAXIGP1ARADDR(S2M_GP1_AXI_ARADDR), // out std_logic_vector(31 downto 0);
        .MAXIGP1ARBURST(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1ARCACHE(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1ARESETN(),  // out std_ulogic;
        .MAXIGP1ARID(S2M_GP1_AXI_ARID),   // out std_logic_vector(11 downto 0);
        .MAXIGP1ARLEN(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1ARLOCK(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1ARPROT(),  // out std_logic_vector(2 downto 0);
        .MAXIGP1ARQOS(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1ARREADY(S2M_GP1_AXI_ARREADY),// in std_ulogic;
        .MAXIGP1ARSIZE(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1ARVALID(S2M_GP1_AXI_ARVALID), // out std_ulogic;
        .MAXIGP1AWADDR(S2M_GP1_AXI_AWADDR), // out std_logic_vector(31 downto 0);
        .MAXIGP1AWBURST(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1AWCACHE(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1AWID(S2M_GP1_AXI_AWID),   // out std_logic_vector(11 downto 0);
        .MAXIGP1AWLEN(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1AWLOCK(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1AWPROT(),  // out std_logic_vector(2 downto 0);
        .MAXIGP1AWQOS(),  // out std_logic_vector(3 downto 0);
        .MAXIGP1AWREADY(S2M_GP1_AXI_AWREADY),// in std_ulogic;
        .MAXIGP1AWSIZE(),  // out std_logic_vector(1 downto 0);
        .MAXIGP1AWVALID(S2M_GP1_AXI_AWVALID), // out std_ulogic;
        .MAXIGP1BID(S2M_GP1_AXI_BID),  // in std_logic_vector(11 downto 0);
        .MAXIGP1BREADY(S2M_GP1_AXI_BREADY), // out std_ulogic;
        .MAXIGP1BRESP(S2M_GP1_AXI_BRESP),// in std_logic_vector(1 downto 0);
        .MAXIGP1BVALID(S2M_GP1_AXI_BVALID),// in std_ulogic;
        .MAXIGP1RDATA(S2M_GP1_AXI_RDATA),// in std_logic_vector(31 downto 0);
        .MAXIGP1RID(S2M_GP1_AXI_RID),  // in std_logic_vector(11 downto 0);
        .MAXIGP1RLAST(S2M_GP1_AXI_RLAST),// in std_ulogic;
        .MAXIGP1RREADY(S2M_GP1_AXI_RREADY), // out std_ulogic;
        .MAXIGP1RRESP(S2M_GP1_AXI_RRESP),// in std_logic_vector(1 downto 0);    
        .MAXIGP1RVALID(S2M_GP1_AXI_RVALID),// in std_ulogic;
        .MAXIGP1WDATA(S2M_GP1_AXI_WDATA), // out std_logic_vector(31 downto 0);
        .MAXIGP1WID(),    // out std_logic_vector(11 downto 0);
        .MAXIGP1WLAST(),  // out std_ulogic;
        .MAXIGP1WREADY(S2M_GP1_AXI_WREADY),// in std_ulogic;
        .MAXIGP1WSTRB(S2M_GP1_AXI_WSTRB), // out std_logic_vector(3 downto 0);
        .MAXIGP1WVALID(S2M_GP1_AXI_WVALID), // out std_ulogic;
        
        .SAXIGP0ACLK(M2S_GP0_AXI_ACLK),     // in std_ulogic;
        .SAXIGP0ARADDR(M2S_GP0_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIGP0ARBURST(M2S_GP0_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIGP0ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP0ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP0ARLEN(M2S_GP0_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIGP0ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIGP0ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIGP0ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP0ARSIZE(M2S_GP0_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIGP0ARVALID(M2S_GP0_AXI_ARVALID),     // in std_ulogic;
        .SAXIGP0AWADDR(M2S_GP0_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIGP0AWBURST(M2S_GP0_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIGP0AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP0AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP0AWLEN(M2S_GP0_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIGP0AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIGP0AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIGP0AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP0AWSIZE(M2S_GP0_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIGP0AWVALID(M2S_GP0_AXI_AWVALID),     // in std_ulogic;
        .SAXIGP0BREADY(M2S_GP0_AXI_BREADY),     // in std_ulogic;
        .SAXIGP0RREADY(M2S_GP0_AXI_RREADY),     // in std_ulogic;
        .SAXIGP0WDATA(M2S_GP0_AXI_WDATA),  // in std_logic_vector(31 downto 0);
        .SAXIGP0WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP0WLAST(M2S_GP0_AXI_WLAST),     // in std_ulogic;
        .SAXIGP0WSTRB(M2S_GP0_AXI_WSTRB),  // in std_logic_vector(3 downto 0);
        .SAXIGP0WVALID(M2S_GP0_AXI_WVALID),     // in std_ulogic;
        .SAXIGP0ARESETN(),   // out std_ulogic;
        .SAXIGP0ARREADY(M2S_GP0_AXI_ARREADY),   // out std_ulogic;
        .SAXIGP0AWREADY(M2S_GP0_AXI_AWREADY),   // out std_ulogic;
        .SAXIGP0BID(),   // out std_logic_vector(5 downto 0);
        .SAXIGP0BRESP(M2S_GP0_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIGP0BVALID(M2S_GP0_AXI_BVALID),   // out std_ulogic;
        .SAXIGP0RDATA(M2S_GP0_AXI_RDATA),   // out std_logic_vector(31 downto 0);
        .SAXIGP0RID(),   // out std_logic_vector(5 downto 0);
        .SAXIGP0RLAST(M2S_GP0_AXI_RLAST),   // out std_ulogic;
        .SAXIGP0RRESP(M2S_GP0_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIGP0RVALID(M2S_GP0_AXI_RVALID),   // out std_ulogic;
        .SAXIGP0WREADY(M2S_GP0_AXI_WREADY),   // out std_ulogic;
        
        .SAXIGP1ACLK(M2S_GP1_AXI_ACLK),     // in std_ulogic;
        .SAXIGP1ARADDR(M2S_GP1_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIGP1ARBURST(M2S_GP1_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIGP1ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP1ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP1ARLEN(M2S_GP1_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIGP1ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIGP1ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIGP1ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP1ARSIZE(M2S_GP1_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIGP1ARVALID(M2S_GP1_AXI_ARVALID),     // in std_ulogic;
        .SAXIGP1AWADDR(M2S_GP1_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIGP1AWBURST(M2S_GP1_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIGP1AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP1AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP1AWLEN(M2S_GP1_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIGP1AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIGP1AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIGP1AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIGP1AWSIZE(M2S_GP1_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIGP1AWVALID(M2S_GP1_AXI_AWVALID),     // in std_ulogic;
        .SAXIGP1BREADY(M2S_GP1_AXI_BREADY),     // in std_ulogic;
        .SAXIGP1RREADY(M2S_GP1_AXI_RREADY),     // in std_ulogic;
        .SAXIGP1WDATA(M2S_GP1_AXI_WDATA),  // in std_logic_vector(31 downto 0);
        .SAXIGP1WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIGP1WLAST(M2S_GP1_AXI_WLAST),     // in std_ulogic;
        .SAXIGP1WSTRB(M2S_GP1_AXI_WSTRB),  // in std_logic_vector(3 downto 0);
        .SAXIGP1WVALID(M2S_GP1_AXI_WVALID),     // in std_ulogic;
        .SAXIGP1ARESETN(),   // out std_ulogic;
        .SAXIGP1ARREADY(M2S_GP1_AXI_ARREADY),   // out std_ulogic;
        .SAXIGP1AWREADY(M2S_GP1_AXI_AWREADY),   // out std_ulogic;
        .SAXIGP1BID(),   // out std_logic_vector(5 downto 0);
        .SAXIGP1BRESP(M2S_GP1_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIGP1BVALID(M2S_GP1_AXI_BVALID),   // out std_ulogic;
        .SAXIGP1RDATA(M2S_GP1_AXI_RDATA),   // out std_logic_vector(31 downto 0);
        .SAXIGP1RID(),   // out std_logic_vector(5 downto 0);
        .SAXIGP1RLAST(M2S_GP1_AXI_RLAST),   // out std_ulogic;
        .SAXIGP1RRESP(M2S_GP1_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIGP1RVALID(M2S_GP1_AXI_RVALID),   // out std_ulogic;
        .SAXIGP1WREADY(M2S_GP1_AXI_WREADY),   // out std_ulogic;
 

        .SAXIHP0ACLK(M2S_HP0_AXI_ACLK),     // in std_ulogic;
        .SAXIHP0ARADDR(M2S_HP0_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP0ARBURST(M2S_HP0_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP0ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP0ARESETN(),   // out std_ulogic;
        .SAXIHP0ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP0ARLEN(M2S_HP0_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP0ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP0ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP0ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP0ARREADY(M2S_HP0_AXI_ARREADY),   // out std_ulogic;
        .SAXIHP0ARSIZE(M2S_HP0_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP0ARVALID(M2S_HP0_AXI_ARVALID),     // in std_ulogic;
        .SAXIHP0AWADDR(M2S_HP0_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP0AWBURST(M2S_HP0_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP0AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP0AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP0AWLEN(M2S_HP0_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP0AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP0AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP0AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP0AWREADY(M2S_HP0_AXI_AWREADY),   // out std_ulogic;
        .SAXIHP0AWSIZE(M2S_HP0_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP0AWVALID(M2S_HP0_AXI_AWVALID),     // in std_ulogic;
        .SAXIHP0BID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP0BREADY(M2S_HP0_AXI_BREADY),     // in std_ulogic;
        .SAXIHP0BRESP(M2S_HP0_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP0BVALID(M2S_HP0_AXI_BVALID),   // out std_ulogic;
        .SAXIHP0RDATA(M2S_HP0_AXI_RDATA),   // out std_logic_vector(63 downto 0);
        .SAXIHP0RID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP0RLAST(M2S_HP0_AXI_RLAST),   // out std_ulogic;
        .SAXIHP0RREADY(M2S_HP0_AXI_RREADY),     // in std_ulogic;
        .SAXIHP0RRESP(M2S_HP0_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP0RVALID(M2S_HP0_AXI_RVALID),   // out std_ulogic;
        .SAXIHP0WDATA(M2S_HP0_AXI_WDATA),  // in std_logic_vector(63 downto 0);
        .SAXIHP0WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP0WLAST(M2S_HP0_AXI_WLAST),     // in std_ulogic;
        .SAXIHP0WREADY(M2S_HP0_AXI_WREADY),   // out std_ulogic;
        .SAXIHP0WSTRB(M2S_HP0_AXI_WSTRB),  // in std_logic_vector(7 downto 0);
        .SAXIHP0WVALID(M2S_HP0_AXI_WVALID),     // in std_ulogic;
        .SAXIHP0RDISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP0WRISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP0RACOUNT(),  // out std_logic_vector(2 downto 0);
        .SAXIHP0RCOUNT(),  // out std_logic_vector(7 downto 0);
        .SAXIHP0WACOUNT(),  // out std_logic_vector(5 downto 0);
        .SAXIHP0WCOUNT(),  // out std_logic_vector(7 downto 0);

        .SAXIHP1ACLK(M2S_HP1_AXI_ACLK),     // in std_ulogic;
        .SAXIHP1ARADDR(M2S_HP1_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP1ARBURST(M2S_HP1_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP1ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP1ARESETN(),   // out std_ulogic;
        .SAXIHP1ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP1ARLEN(M2S_HP1_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP1ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP1ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP1ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP1ARREADY(M2S_HP1_AXI_ARREADY),   // out std_ulogic;
        .SAXIHP1ARSIZE(M2S_HP1_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP1ARVALID(M2S_HP1_AXI_ARVALID),     // in std_ulogic;
        .SAXIHP1AWADDR(M2S_HP1_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP1AWBURST(M2S_HP1_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP1AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP1AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP1AWLEN(M2S_HP1_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP1AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP1AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP1AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP1AWREADY(M2S_HP1_AXI_AWREADY),   // out std_ulogic;
        .SAXIHP1AWSIZE(M2S_HP1_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP1AWVALID(M2S_HP1_AXI_AWVALID),     // in std_ulogic;
        .SAXIHP1BID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP1BREADY(M2S_HP1_AXI_BREADY),     // in std_ulogic;
        .SAXIHP1BRESP(M2S_HP1_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP1BVALID(M2S_HP1_AXI_BVALID),   // out std_ulogic;
        .SAXIHP1RDATA(M2S_HP1_AXI_RDATA),   // out std_logic_vector(63 downto 0);
        .SAXIHP1RID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP1RLAST(M2S_HP1_AXI_RLAST),   // out std_ulogic;
        .SAXIHP1RREADY(M2S_HP1_AXI_RREADY),     // in std_ulogic;
        .SAXIHP1RRESP(M2S_HP1_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP1RVALID(M2S_HP1_AXI_RVALID),   // out std_ulogic;
        .SAXIHP1WDATA(M2S_HP1_AXI_WDATA),  // in std_logic_vector(63 downto 0);
        .SAXIHP1WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP1WLAST(M2S_HP1_AXI_WLAST),     // in std_ulogic;
        .SAXIHP1WREADY(M2S_HP1_AXI_WREADY),   // out std_ulogic;
        .SAXIHP1WSTRB(M2S_HP1_AXI_WSTRB),  // in std_logic_vector(7 downto 0);
        .SAXIHP1WVALID(M2S_HP1_AXI_WVALID),     // in std_ulogic;
        .SAXIHP1RDISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP1WRISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP1RACOUNT(),  // out std_logic_vector(2 downto 0);
        .SAXIHP1RCOUNT(),  // out std_logic_vector(7 downto 0);
        .SAXIHP1WACOUNT(),  // out std_logic_vector(5 downto 0);
        .SAXIHP1WCOUNT(),  // out std_logic_vector(7 downto 0);

        .SAXIHP2ACLK(M2S_HP2_AXI_ACLK),     // in std_ulogic;
        .SAXIHP2ARADDR(M2S_HP2_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP2ARBURST(M2S_HP2_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP2ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP2ARESETN(),   // out std_ulogic;
        .SAXIHP2ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP2ARLEN(M2S_HP2_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP2ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP2ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP2ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP2ARREADY(M2S_HP2_AXI_ARREADY),   // out std_ulogic;
        .SAXIHP2ARSIZE(M2S_HP2_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP2ARVALID(M2S_HP2_AXI_ARVALID),     // in std_ulogic;
        .SAXIHP2AWADDR(M2S_HP2_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP2AWBURST(M2S_HP2_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP2AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP2AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP2AWLEN(M2S_HP2_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP2AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP2AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP2AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP2AWREADY(M2S_HP2_AXI_AWREADY),   // out std_ulogic;
        .SAXIHP2AWSIZE(M2S_HP2_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP2AWVALID(M2S_HP2_AXI_AWVALID),     // in std_ulogic;
        .SAXIHP2BID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP2BREADY(M2S_HP2_AXI_BREADY),     // in std_ulogic;
        .SAXIHP2BRESP(M2S_HP2_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP2BVALID(M2S_HP2_AXI_BVALID),   // out std_ulogic;
        .SAXIHP2RDATA(M2S_HP2_AXI_RDATA),   // out std_logic_vector(63 downto 0);
        .SAXIHP2RID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP2RLAST(M2S_HP2_AXI_RLAST),   // out std_ulogic;
        .SAXIHP2RREADY(M2S_HP2_AXI_RREADY),     // in std_ulogic;
        .SAXIHP2RRESP(M2S_HP2_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP2RVALID(M2S_HP2_AXI_RVALID),   // out std_ulogic;
        .SAXIHP2WDATA(M2S_HP2_AXI_WDATA),  // in std_logic_vector(63 downto 0);
        .SAXIHP2WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP2WLAST(M2S_HP2_AXI_WLAST),     // in std_ulogic;
        .SAXIHP2WREADY(M2S_HP2_AXI_WREADY),   // out std_ulogic;
        .SAXIHP2WSTRB(M2S_HP2_AXI_WSTRB),  // in std_logic_vector(7 downto 0);
        .SAXIHP2WVALID(M2S_HP2_AXI_WVALID),     // in std_ulogic;
        .SAXIHP2RDISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP2WRISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP2RACOUNT(),  // out std_logic_vector(2 downto 0);
        .SAXIHP2RCOUNT(),  // out std_logic_vector(7 downto 0);
        .SAXIHP2WACOUNT(),  // out std_logic_vector(5 downto 0);
        .SAXIHP2WCOUNT(),  // out std_logic_vector(7 downto 0);


        .SAXIHP3ACLK(M2S_HP3_AXI_ACLK),     // in std_ulogic;
        .SAXIHP3ARADDR(M2S_HP3_AXI_ARADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP3ARBURST(M2S_HP3_AXI_ARBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP3ARCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP3ARESETN(),   // out std_ulogic;
        .SAXIHP3ARID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP3ARLEN(M2S_HP3_AXI_ARLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP3ARLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP3ARPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP3ARQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP3ARREADY(M2S_HP3_AXI_ARREADY),   // out std_ulogic;
        .SAXIHP3ARSIZE(M2S_HP3_AXI_ARSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP3ARVALID(M2S_HP3_AXI_ARVALID),     // in std_ulogic;
        .SAXIHP3AWADDR(M2S_HP3_AXI_AWADDR),  // in std_logic_vector(31 downto 0);
        .SAXIHP3AWBURST(M2S_HP3_AXI_AWBURST),  // in std_logic_vector(1 downto 0);
        .SAXIHP3AWCACHE(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP3AWID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP3AWLEN(M2S_HP3_AXI_AWLEN),  // in std_logic_vector(3 downto 0);
        .SAXIHP3AWLOCK(2'b0),  // in std_logic_vector(1 downto 0);
        .SAXIHP3AWPROT(3'b0),  // in std_logic_vector(2 downto 0);
        .SAXIHP3AWQOS(4'b0),  // in std_logic_vector(3 downto 0);
        .SAXIHP3AWREADY(M2S_HP3_AXI_AWREADY),   // out std_ulogic;
        .SAXIHP3AWSIZE(M2S_HP3_AXI_AWSIZE),  // in std_logic_vector(1 downto 0);
        .SAXIHP3AWVALID(M2S_HP3_AXI_AWVALID),     // in std_ulogic;
        .SAXIHP3BID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP3BREADY(M2S_HP3_AXI_BREADY),     // in std_ulogic;
        .SAXIHP3BRESP(M2S_HP3_AXI_BRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP3BVALID(M2S_HP3_AXI_BVALID),   // out std_ulogic;
        .SAXIHP3RDATA(M2S_HP3_AXI_RDATA),   // out std_logic_vector(63 downto 0);
        .SAXIHP3RID(),   // out std_logic_vector(2 downto 0);
        .SAXIHP3RLAST(M2S_HP3_AXI_RLAST),   // out std_ulogic;
        .SAXIHP3RREADY(M2S_HP3_AXI_RREADY),     // in std_ulogic;
        .SAXIHP3RRESP(M2S_HP3_AXI_RRESP),   // out std_logic_vector(1 downto 0);
        .SAXIHP3RVALID(M2S_HP3_AXI_RVALID),   // out std_ulogic;
        .SAXIHP3WDATA(M2S_HP3_AXI_WDATA),  // in std_logic_vector(63 downto 0);
        .SAXIHP3WID(6'b0),  // in std_logic_vector(5 downto 0);
        .SAXIHP3WLAST(M2S_HP3_AXI_WLAST),     // in std_ulogic;
        .SAXIHP3WREADY(M2S_HP3_AXI_WREADY),   // out std_ulogic;
        .SAXIHP3WSTRB(M2S_HP3_AXI_WSTRB),  // in std_logic_vector(7 downto 0);
        .SAXIHP3WVALID(M2S_HP3_AXI_WVALID),     // in std_ulogic;
        .SAXIHP3RDISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP3WRISSUECAP1EN(1'b0),     // in std_ulogic;
        .SAXIHP3RACOUNT(),  // out std_logic_vector(2 downto 0);
        .SAXIHP3RCOUNT(),  // out std_logic_vector(7 downto 0);
        .SAXIHP3WACOUNT(),  // out std_logic_vector(5 downto 0);
        .SAXIHP3WCOUNT(),  // out std_logic_vector(7 downto 0);


        .SAXIACPARUSER(5'b0),  // in std_logic_vector(4 downto 0);
        .SAXIACPAWUSER(5'b0),  // in std_logic_vector(4 downto 0);
        .SAXIACPACLK(M2S_ACP_AXI_ACLK),   // in std_ulogic;
        .SAXIACPARADDR(M2S_ACP_AXI_ARADDR),
        .SAXIACPARBURST(M2S_ACP_AXI_ARBURST), // in std_logic_vector(1 downto 0);
        .SAXIACPARCACHE(4'b0), // in std_logic_vector(3 downto 0);
        .SAXIACPARESETN(),  // out std_ulogic;
        .SAXIACPARID(3'b0),   // in std_logic_vector(2 downto 0);
        .SAXIACPARLEN(M2S_ACP_AXI_ARLEN), // in std_logic_vector(3 downto 0);
        .SAXIACPARLOCK(2'b0), // in std_logic_vector(1 downto 0);
        .SAXIACPARPROT(3'b0), // in std_logic_vector(2 downto 0);
        .SAXIACPARQOS(4'b0), // in std_logic_vector(3 downto 0);
        .SAXIACPARREADY(M2S_ACP_AXI_ARREADY),
        .SAXIACPARSIZE(M2S_ACP_AXI_ARSIZE), // in std_logic_vector(1 downto 0);
        .SAXIACPARVALID(M2S_ACP_AXI_ARVALID),
        .SAXIACPAWADDR(M2S_ACP_AXI_AWADDR),
        .SAXIACPAWBURST(M2S_ACP_AXI_AWBURST), // in std_logic_vector(1 downto 0);
        .SAXIACPAWCACHE(4'b0), // in std_logic_vector(3 downto 0);
        .SAXIACPAWID(3'b0),   // in std_logic_vector(2 downto 0);
        .SAXIACPAWLEN(M2S_ACP_AXI_AWLEN), // in std_logic_vector(3 downto 0);
        .SAXIACPAWLOCK(2'b0), // in std_logic_vector(1 downto 0);
        .SAXIACPAWPROT(3'b0), // in std_logic_vector(2 downto 0);
        .SAXIACPAWQOS(4'b0), // in std_logic_vector(3 downto 0);
        .SAXIACPAWREADY(M2S_ACP_AXI_AWREADY),
        .SAXIACPAWSIZE(M2S_ACP_AXI_AWSIZE), // in std_logic_vector(1 downto 0);
        .SAXIACPAWVALID(M2S_ACP_AXI_AWVALID),
        .SAXIACPBID(),    // out std_logic_vector(5 downto 0);
        .SAXIACPBREADY(M2S_ACP_AXI_BREADY),
        .SAXIACPBRESP(M2S_ACP_AXI_BRESP),
        .SAXIACPBVALID(M2S_ACP_AXI_BVALID),
        .SAXIACPRDATA(M2S_ACP_AXI_RDATA),
        .SAXIACPRID(),    // out std_logic_vector(5 downto 0);
        .SAXIACPRLAST(M2S_ACP_AXI_RLAST),  // out std_ulogic;
        .SAXIACPRREADY(M2S_ACP_AXI_RREADY),
        .SAXIACPRRESP(M2S_ACP_AXI_RRESP),
        .SAXIACPRVALID(M2S_ACP_AXI_RVALID),
        .SAXIACPWDATA(M2S_ACP_AXI_WDATA),
        .SAXIACPWID(3'b0),   // in std_logic_vector(2 downto 0);
        .SAXIACPWLAST(M2S_ACP_AXI_WLAST), // in std_ulogic;
        .SAXIACPWREADY(M2S_ACP_AXI_WREADY),
        .SAXIACPWSTRB(M2S_ACP_AXI_WSTRB),
        .SAXIACPWVALID(M2S_ACP_AXI_WVALID)
    );


endmodule : ps7_wrap
