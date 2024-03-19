module eth_top #(
	parameter PL_LINK_CAP_MAX_LINK_WIDTH = 2,
	parameter C_DATA_WIDTH               = 64,
	parameter GEN_LATENCY                = 1024

)(
	input  wire                clk100,
	input  wire                clk200,
	input  wire                sys_rst,
	output wire [7:0]          debug,

	input  wire                SFP_CLK_P,
	input  wire                SFP_CLK_N,
	output wire                SFP_REC_CLK_P,
	output wire                SFP_REC_CLK_N,

	inout  wire                I2C_FPGA_SCL,
	inout  wire                I2C_FPGA_SDA,

	input  wire                SFP_CLK_ALARM_B,
	// Ether Port 0
	input  wire                ETH0_TX_P,
	input  wire                ETH0_TX_N,
	output wire                ETH0_RX_P,
	output wire                ETH0_RX_N,

	input  wire                ETH0_TX_FAULT,
	input  wire                ETH0_RX_LOS,
	output wire                ETH0_TX_DISABLE,
	// Ether Port 0
	input  wire                ETH1_TX_P,
	input  wire                ETH1_TX_N,
	output wire                ETH1_RX_P,
	output wire                ETH1_RX_N,

	input  wire                ETH1_TX_FAULT,
	input  wire                ETH1_RX_LOS,
	output wire                ETH1_TX_DISABLE 
);

/*
 * Ethernet Clock Domain : Clocking
 */
wire clk156;
assign db_clk = clk156;
sfp_refclk_init sfp_refclk_init0 (
	.CLK               (clk100),
	.RST               (sys_rst),
	.SFP_REC_CLK_P     (SFP_REC_CLK_P), //: out std_logic;
	.SFP_REC_CLK_N     (SFP_REC_CLK_N), //: out std_logic;
	.SFP_CLK_ALARM_B   (SFP_CLK_ALARM_B), //: in std_logic;
	.I2C_FPGA_SCL      (I2C_FPGA_SCL), //: inout std_logic;
	.I2C_FPGA_SDA      (I2C_FPGA_SDA)  //: inout std_logic
);

/*
 *  Ethernet Clock Domain : Reset
 */
reg [13:0] cold_counter = 0; 
reg        eth_rst;
always @(posedge clk156) 
	if (cold_counter != 14'h3fff) begin
		cold_counter <= cold_counter + 14'd1;
		eth_rst      <= 1'b1;
	end else
		eth_rst <= 1'b0;


///*
// * Ethernet MAC and PCS/PMA Configuration
// */
//
//wire [535:0] pcs_pma_configuration_vector;
//pcs_pma_conf pcs_pma_conf0(
//	.pcs_pma_configuration_vector(pcs_pma_configuration_vector)
//);

//wire [79:0] mac_tx_configuration_vector;
//wire [79:0] mac_rx_configuration_vector;
//eth_mac_conf eth_mac_conf0(
//	.mac_tx_configuration_vector(mac_tx_configuration_vector),
//	.mac_rx_configuration_vector(mac_rx_configuration_vector)
//);
//

/*
 * Eth MAC
 */
wire txusrclk, txusrclk2;
wire gttxreset, gtrxreset;
wire txuserrdy;
wire areset_coreclk;
wire reset_counter_done;
wire qplllock, qplloutclk, qplloutrefclk;
wire mdc , mdio_out, mdio_in;
wire [63:0] xgmii0_txd, xgmii0_rxd, xgmii0_rxd2;
wire [7:0]  xgmii0_txc, xgmii0_rxc, xgmii0_rxc2;

wire         xdrp_gnt;
wire         xdrp_req;
wire         xdrp_den_o;                                   
wire         xdrp_dwe_o;
wire [15:0]  xdrp_daddr_o;                   
wire [15:0]  xdrp_di_o; 
wire         xdrp_drdy_o;                
wire [15:0]  xdrp_drpdo_o;
wire         xdrp_den_i;                                   
wire         xdrp_dwe_i;
wire [15:0]  xdrp_daddr_i;                   
wire [15:0]  xdrp_di_i; 
wire         xdrp_drdy_i;                
wire [15:0]  xdrp_drpdo_i;


assign xdrp_gnt     = xdrp_req;
assign xdrp_den_i   = xdrp_den_o;
assign xdrp_dwe_i   = xdrp_dwe_o;
assign xdrp_daddr_i = xdrp_daddr_o;                   
assign xdrp_di_i    = xdrp_di_o;
assign xdrp_drdy_i  = xdrp_drdy_o;
assign xdrp_drpdo_i = xdrp_drpdo_o;

ten_gig_eth_pcs_pma_0 u_ten_gig_eth_pcs_pma_0 (
  .refclk_p              (SFP_CLK_P),  // input wire refclk_p
  .refclk_n              (SFP_CLK_N),  // input wire refclk_n
  .reset                 (eth_rst),    // input wire reset
  .resetdone_out         (),           // output wire resetdone_out
  .coreclk_out           (clk156),     // output wire coreclk_out
  .rxrecclk_out          (),           // output wire rxrecclk_out
  .dclk                  (clk100),     // input wire dclk
  .txp                   (ETH0_RX_P),  // output wire txp
  .txn                   (ETH0_RX_N),  // output wire txn
  .rxp                   (ETH0_TX_P),  // input wire rxp
  .rxn                   (ETH0_TX_N),  // input wire rxn
  .sim_speedup_control   (1'b0),       // input wire sim_speedup_control
  .txusrclk_out          (txusrclk),   // output wire txusrclk_out
  .txusrclk2_out         (txusrclk2),  // output wire txusrclk2_out
  .areset_datapathclk_out(areset_coreclk),  // output wire areset_datapathclk_out
  .gttxreset_out         (gttxreset),  // output wire gttxreset_out
  .gtrxreset_out         (gtrxreset),  // output wire gtrxreset_out
  .txuserrdy_out         (txuserrdy),  // output wire txuserrdy_out
  .reset_counter_done_out(reset_counter_done),  // output wire reset_counter_done_out
  .qplllock_out          (qplllock),      // output wire qplllock_out
  .qplloutclk_out        (qplloutclk),    // output wire qplloutclk_out
  .qplloutrefclk_out     (qplloutrefclk), // output wire qplloutrefclk_out
  .xgmii_txd             (xgmii0_txd),    // input wire [31 : 0] xgmii_txd
  .xgmii_txc             (xgmii0_txc),    // input wire [3 : 0] xgmii_txc
  .xgmii_rxd             (xgmii0_rxd),    // output wire [31 : 0] xgmii_rxd
  .xgmii_rxc             (xgmii0_rxc),    // output wire [3 : 0] xgmii_rxc
  .mdc                   (mdc),                                        // input wire mdc
  .mdio_in               (mdio_out),                                // input wire mdio_in
  .mdio_out              (mdio_in),                              // output wire mdio_out
  .mdio_tri              (),                              // output wire mdio_tri
  .prtad                 (5'd0),                                    // input wire [4 : 0] prtad
  //.configuration_vector  (pcs_pma_configuration_vector),      // input wire [535 : 0] configuration_vector
  //.status_vector         (),                // output wire [447 : 0] status_vector
  .core_status           (),                        // output wire [7 : 0] core_status
  .signal_detect         (!ETH0_RX_LOS),                    // input wire signal_detect
  .tx_fault              (ETH0_TX_FAULT),                              // input wire tx_fault
  .drp_req               (xdrp_req    ),                                // output wire drp_req
  .drp_gnt               (xdrp_gnt    ),                                // input wire drp_gnt
  .drp_den_o             (xdrp_den_o  ),                            // output wire drp_den_o
  .drp_dwe_o             (xdrp_dwe_o  ),                            // output wire drp_dwe_o
  .drp_daddr_o           (xdrp_daddr_o),                        // output wire [15 : 0] drp_daddr_o
  .drp_di_o              (xdrp_di_o   ),                              // output wire [15 : 0] drp_di_o
  .drp_drdy_o            (xdrp_drdy_o ),                          // output wire drp_drdy_o
  .drp_drpdo_o           (xdrp_drpdo_o),                        // output wire [15 : 0] drp_drpdo_o
  .drp_den_i             (xdrp_den_i  ),                            // input wire drp_den_i
  .drp_dwe_i             (xdrp_dwe_i  ),                            // input wire drp_dwe_i
  .drp_daddr_i           (xdrp_daddr_i),                        // input wire [15 : 0] drp_daddr_i
  .drp_di_i              (xdrp_di_i   ),                              // input wire [15 : 0] drp_di_i
  .drp_drdy_i            (xdrp_drdy_i ),                          // input wire drp_drdy_i
  .drp_drpdo_i           (xdrp_drpdo_i),                        // input wire [15 : 0] drp_drpdo_i
  .tx_disable            (ETH0_TX_DISABLE),                          // output wire tx_disable
  .pma_pmd_type          (3'b101)                      // input wire [2 : 0] pma_pmd_type
);

wire  mdc1, mdio1_in, mdio1_out;
wire [63:0] xgmii1_txd, xgmii1_rxd, xgmii1_rxd2;
wire [7:0]  xgmii1_txc, xgmii1_rxc, xgmii1_rxc2;

wire         ydrp_gnt;
wire         ydrp_req;
wire         ydrp_den_o;                                   
wire         ydrp_dwe_o;
wire [15:0]  ydrp_daddr_o;                   
wire [15:0]  ydrp_di_o; 
wire         ydrp_drdy_o;                
wire [15:0]  ydrp_drpdo_o;
wire         ydrp_den_i;                                   
wire         ydrp_dwe_i;
wire [15:0]  ydrp_daddr_i;                   
wire [15:0]  ydrp_di_i; 
wire         ydrp_drdy_i;                
wire [15:0]  ydrp_drpdo_i;

assign ydrp_gnt     = ydrp_req;
assign ydrp_den_i   = ydrp_den_o;
assign ydrp_dwe_i   = ydrp_dwe_o;
assign ydrp_daddr_i = ydrp_daddr_o;                   
assign ydrp_di_i    = ydrp_di_o;
assign ydrp_drdy_i  = ydrp_drdy_o;
assign ydrp_drpdo_i = ydrp_drpdo_o;

ten_gig_eth_pcs_pma_1 u_ten_gig_eth_pcs_pma_1 (
  .rxrecclk_out         (),                  // output wire rxrecclk_out
  .coreclk              (clk156),            // input wire coreclk
  .dclk                 (clk100),            // input wire dclk
  .txusrclk             (txusrclk),          // input wire txusrclk
  .txusrclk2            (txusrclk2),         // input wire txusrclk2
  .areset               (eth_rst),           // input wire areset
  .txoutclk             (),                  // output wire txoutclk
  .areset_coreclk       (areset_coreclk),    // input wire areset_coreclk
  .gttxreset            (gttxreset),         // input wire gttxreset
  .gtrxreset            (gtrxreset),         // input wire gtrxreset
  .txuserrdy            (txuserrdy),         // input wire txuserrdy
  .qplllock             (qplllock),          // input wire qplllock
  .qplloutclk           (qplloutclk),        // input wire qplloutclk
  .qplloutrefclk        (qplloutrefclk),     // input wire qplloutrefclk
  .reset_counter_done   (reset_counter_done),// input wire reset_counter_done
  .txp                  (ETH1_RX_P),         // output wire txp
  .txn                  (ETH1_RX_N),         // output wire txn
  .rxp                  (ETH1_TX_P),         // input wire rxp
  .rxn                  (ETH1_TX_N),         // input wire rxn
  .sim_speedup_control  (1'b0),    // input wire sim_speedup_control
  .xgmii_txd            (xgmii1_txd),                        // input wire [31 : 0] xgmii_txd
  .xgmii_txc            (xgmii1_txc),                        // input wire [3 : 0] xgmii_txc
  .xgmii_rxd            (xgmii1_rxd),                        // output wire [31 : 0] xgmii_rxd
  .xgmii_rxc            (xgmii1_rxc),                        // output wire [3 : 0] xgmii_rxc
  .mdc                  (mdc1),                                  // input wire mdc
  .mdio_in              (mdio1_in),                          // input wire mdio_in
  .mdio_out             (mdio1_out),                        // output wire mdio_out
  .mdio_tri             (),                        // output wire mdio_tri
  .prtad                (5'd1),                              // input wire [4 : 0] prtad
  //.configuration_vector (pcs_pma_configuration_vector),  // input wire [535 : 0] configuration_vector
  //.status_vector        (),                // output wire [447 : 0] status_vector
  .core_status          (),                    // output wire [7 : 0] core_status
  .tx_resetdone         (),                  // output wire tx_resetdone
  .rx_resetdone         (),                  // output wire rx_resetdone
  .signal_detect        (!ETH1_RX_LOS),                // input wire signal_detect
  .tx_fault             (ETH1_TX_FAULT),                          // input wire tx_fault
  .drp_req              (ydrp_req    ),                            // output wire drp_req
  .drp_gnt              (ydrp_gnt    ),                            // input wire drp_gnt
  .drp_den_o            (ydrp_den_o  ),                        // output wire drp_den_o
  .drp_dwe_o            (ydrp_dwe_o  ),                        // output wire drp_dwe_o
  .drp_daddr_o          (ydrp_daddr_o),                    // output wire [15 : 0] drp_daddr_o
  .drp_di_o             (ydrp_di_o   ),                          // output wire [15 : 0] drp_di_o
  .drp_drdy_o           (ydrp_drdy_o ),                      // output wire drp_drdy_o
  .drp_drpdo_o          (ydrp_drpdo_o),                    // output wire [15 : 0] drp_drpdo_o
  .drp_den_i            (ydrp_den_i  ),                        // input wire drp_den_i
  .drp_dwe_i            (ydrp_dwe_i  ),                        // input wire drp_dwe_i
  .drp_daddr_i          (ydrp_daddr_i),                    // input wire [15 : 0] drp_daddr_i
  .drp_di_i             (ydrp_di_i   ),                          // input wire [15 : 0] drp_di_i
  .drp_drdy_i           (ydrp_drdy_i ),                      // input wire drp_drdy_i
  .drp_drpdo_i          (ydrp_drpdo_i),                    // input wire [15 : 0] drp_drpdo_i
  .tx_disable           (ETH1_TX_DISABLE),                      // output wire tx_disable
  .pma_pmd_type         (3'b101)                  // input wire [2 : 0] pma_pmd_type
);

xgmiisync xgmiisync_0 (
	.sys_rst(eth_rst),
	.xgmii_rx_clk(clk156),
	.xgmii_rxd_i(xgmii0_rxd),
	.xgmii_rxc_i(xgmii0_rxc),
	.xgmii_rxd_o(xgmii0_rxd2),
	.xgmii_rxc_o(xgmii0_rxc2)
);

xgmiisync xgmiisync_1 (
	.sys_rst(eth_rst),
	.xgmii_rx_clk(clk156),
	.xgmii_rxd_i(xgmii1_rxd),
	.xgmii_rxc_i(xgmii1_rxc),
	.xgmii_rxd_o(xgmii1_rxd2),
	.xgmii_rxc_o(xgmii1_rxc2)
);

assign xgmii0_txd = xgmii1_rxd2;
assign xgmii0_txc = xgmii1_rxc2;
assign xgmii1_txd = xgmii0_rxd2;
assign xgmii1_txd = xgmii0_rxd2;

///*
// * AXI interface (Master : encap ---> MAC)
// */
//
//wire        m_axis_tx0_tvalid;
//wire        m_axis_tx0_tready;
//wire [63:0] m_axis_tx0_tdata;
//wire [ 7:0] m_axis_tx0_tkeep;
//wire        m_axis_tx0_tlast;
//wire        m_axis_tx0_tuser;
//
//wire        m_axis_tx1_tvalid;
//wire        m_axis_tx1_tready;
//wire [63:0] m_axis_tx1_tdata;
//wire [ 7:0] m_axis_tx1_tkeep;
//wire        m_axis_tx1_tlast;
//wire        m_axis_tx1_tuser;
///*
// * AXI interface (Slave : MAC ---> encap)
// */
//wire        s_axis_rx0_tvalid;
//wire [63:0] s_axis_rx0_tdata;
//wire [ 7:0] s_axis_rx0_tkeep;
//wire        s_axis_rx0_tlast;
//wire        s_axis_rx0_tuser;
//
//wire        s_axis_rx1_tvalid;
//wire [63:0] s_axis_rx1_tdata;
//wire [ 7:0] s_axis_rx1_tkeep;
//wire        s_axis_rx1_tlast;
//wire        s_axis_rx1_tuser;
//
//wire [ 7:0] eth_debug;
//
//
//
///*
// * Ethernet MAC
// */
//wire txusrclk, txusrclk2;
//wire gttxreset, gtrxreset;
//wire txuserrdy;
//wire areset_coreclk;
//wire reset_counter_done;
//wire qplllock, qplloutclk, qplloutrefclk;
//wire [447:0] pcs_pma_status_vector;
//wire [1:0] mac_status_vector;
//wire [7:0] pcspma_status;
//wire rx_statistics_valid, tx_statistics_valid;
//
//axi_10g_ethernet_0 u_axi_10g_ethernet_0 (
//	.coreclk_out                   (clk156),
//	.refclk_n                      (SFP_CLK_N),
//	.refclk_p                      (SFP_CLK_P),
//	.dclk                          (clk100),
//	.reset                         (eth_rst),
//	.rx_statistics_vector          (),
//	.rxn                           (ETH0_TX_N),
//	.rxp                           (ETH0_TX_P),
//	.s_axis_pause_tdata            (16'b0),
//	.s_axis_pause_tvalid           (1'b0),
//	.signal_detect                 (!ETH0_RX_LOS),
//	.tx_disable                    (ETH0_TX_DISABLE),
//	.tx_fault                      (ETH0_TX_FAULT),
//	.tx_ifg_delay                  (8'd0),
//	.tx_statistics_vector          (),
//	.txn                           (ETH0_RX_N),
//	.txp                           (ETH0_RX_P),
//
//	.rxrecclk_out                  (),
//	.resetdone_out                 (),
//
//	// eth tx
//	.s_axis_tx_tready              (m_axis_tx0_tready),
//	.s_axis_tx_tdata               (m_axis_tx0_tdata),
//	.s_axis_tx_tkeep               (m_axis_tx0_tkeep),
//	.s_axis_tx_tlast               (m_axis_tx0_tlast),
//	.s_axis_tx_tvalid              (m_axis_tx0_tvalid),
//	.s_axis_tx_tuser               (m_axis_tx0_tuser),
//	
//	// eth rx
//	.m_axis_rx_tdata               (s_axis_rx0_tdata),
//	.m_axis_rx_tkeep               (s_axis_rx0_tkeep),
//	.m_axis_rx_tlast               (s_axis_rx0_tlast),
//	.m_axis_rx_tuser               (s_axis_rx0_tuser),
//	.m_axis_rx_tvalid              (s_axis_rx0_tvalid),
//
//	.sim_speedup_control           (1'b0),
//	.rx_axis_aresetn               (!eth_rst),
//	.tx_axis_aresetn               (!eth_rst),
//
//	.tx_statistics_valid           (tx_statistics_valid),         
//	.rx_statistics_valid           (rx_statistics_valid),
//	.pcspma_status                 (pcspma_status),                
//	.mac_tx_configuration_vector   (mac_tx_configuration_vector),  
//	.mac_rx_configuration_vector   (mac_rx_configuration_vector),  
//	.mac_status_vector             (mac_status_vector),            
//	.pcs_pma_configuration_vector  (pcs_pma_configuration_vector), 
//	.pcs_pma_status_vector         (pcs_pma_status_vector),        
//	.areset_datapathclk_out        (areset_coreclk),        
//	.txusrclk_out                  (txusrclk),                  
//	.txusrclk2_out                 (txusrclk2),                 
//	.gttxreset_out                 (gttxreset),
//	.gtrxreset_out                 (gtrxreset),
//	.txuserrdy_out                 (txuserrdy), 
//	.reset_counter_done_out        (reset_counter_done),
//	.qplllock_out                  (qplllock     ),       
//	.qplloutclk_out                (qplloutclk   ),     
//	.qplloutrefclk_out             (qplloutrefclk)  
//);
//
//
//axi_10g_ethernet_nonshared u_axi_10g_ethernet_1 (
//	.tx_axis_aresetn              (!eth_rst),      
//	.rx_axis_aresetn              (!eth_rst),      
//	.tx_ifg_delay                 (8'd0),          
//	.dclk                         (clk100),        
//	.txp                          (ETH1_RX_P),     
//	.txn                          (ETH1_RX_N),     
//	.rxp                          (ETH1_TX_P),     
//	.rxn                          (ETH1_TX_N),     
//	.signal_detect                (!ETH1_RX_LOS),  
//	.tx_fault                     (ETH1_TX_FAULT), 
//	.tx_disable                   (ETH1_TX_DISABLE),   
//	.pcspma_status                (),               
//	.sim_speedup_control          (1'b0),           
//	.rxrecclk_out                 (),               
//	.areset_coreclk               (areset_coreclk), 
//	.txusrclk                     (txusrclk),       
//	.txusrclk2                    (txusrclk2),      
//	.txoutclk                     (),       
//	.txuserrdy                    (txuserrdy),      
//	.tx_resetdone                 (),          
//	.rx_resetdone                 (),          
//	.coreclk                      (clk156),    
//	.areset                       (eth_rst),        
//	.gttxreset                    (gttxreset),      
//	.gtrxreset                    (gtrxreset),      
//	.qplllock                     (qplllock),       
//	.qplloutclk                   (qplloutclk),     
//	.qplloutrefclk                (qplloutrefclk),  
//	.reset_counter_done           (reset_counter_done),  
//
//	.mac_tx_configuration_vector  (mac_tx_configuration_vector),
//	.mac_rx_configuration_vector  (mac_rx_configuration_vector),
//	.mac_status_vector            (),                     
//	.pcs_pma_configuration_vector (pcs_pma_configuration_vector),
//	.pcs_pma_status_vector        (),    
//	// AXI Stream Interface
//	.s_axis_tx_tdata              (m_axis_tx1_tdata),  
//	.s_axis_tx_tkeep              (m_axis_tx1_tkeep),  
//	.s_axis_tx_tlast              (m_axis_tx1_tlast),  
//	.s_axis_tx_tready             (m_axis_tx1_tready), 
//	.s_axis_tx_tuser              (m_axis_tx1_tuser),  
//	.s_axis_tx_tvalid             (m_axis_tx1_tvalid), 
//	.s_axis_pause_tdata           (16'd0),             
//	.s_axis_pause_tvalid          (1'd0),              
//	.m_axis_rx_tdata              (s_axis_rx1_tdata),  
//	.m_axis_rx_tkeep              (s_axis_rx1_tkeep),  
//	.m_axis_rx_tlast              (s_axis_rx1_tlast),  
//	.m_axis_rx_tuser              (s_axis_rx1_tuser),  
//	.m_axis_rx_tvalid             (s_axis_rx1_tvalid), 
//	.tx_statistics_valid          (),  
//	.tx_statistics_vector         (),  
//	.rx_statistics_valid          (),  
//	.rx_statistics_vector         ()   
//);
//


//localparam IDLE  = 2'b00,
//           INIT  = 2'b01,
//           VALID = 2'b10;
//	   
//reg [ 1:0] state;
//reg [31:0] wait_cnt;
//
//always @ (posedge clk156)
//	if (eth_rst) begin
//		state    <= IDLE;
//		wait_cnt <= 0;
//	end else begin
//		case (state) 
//			IDLE : state <= INIT;
//			INIT : begin 
//				if (wait_cnt == GEN_LATENCY-1)
//					state <= VALID;
//				else
//					wait_cnt <= wait_cnt + 1;
//			end
//			VALID : ;
//			default : state <= IDLE;
//		endcase
//	end
//
//
//wire wr_en = state == INIT || state == VALID;
//wire rd_en = state == VALID && m_axis_tx1_tready;
//
//wire        f_axis_tx0_tvalid;
//wire        f_axis_tx0_tready;
//wire [63:0] f_axis_tx0_tdata;
//wire [ 7:0] f_axis_tx0_tkeep;
//wire        f_axis_tx0_tlast;
//wire        f_axis_tx0_tuser;
//
//wire        f_axis_tx1_tvalid;
//wire        f_axis_tx1_tready;
//wire [63:0] f_axis_tx1_tdata;
//wire [ 7:0] f_axis_tx1_tkeep;
//wire        f_axis_tx1_tlast;
//wire        f_axis_tx1_tuser;
//
//wire [74:0] fifo_in_data0 = {s_axis_rx0_tvalid, s_axis_rx0_tdata, 
//                            s_axis_rx0_tkeep, s_axis_rx0_tlast};
//wire [74:0] fifo_out_data0;
//
//sfifo_75_131k u_sfifo_0 (
//  .clk     (clk156),      // input wire clk
//  .rst     (eth_rst),      // input wire rst
//  .din     (fifo_in_data0),      // input wire [74 : 0] din
//  .wr_en   (wr_en),  // input wire wr_en
//  .rd_en   (rd_en),  // input wire rd_en
//  .dout    (fifo_out_data0),    // output wire [74 : 0] dout
//  .full    (full),    // output wire full
//  .empty   (empty)  // output wire empty
//);
//
//assign {f_axis_tx1_tvalid,  f_axis_tx1_tdata, f_axis_tx1_tkeep, 
//        f_axis_tx1_tlast} = fifo_out_data0;
//
//
//
//wire [74:0] fifo_in_data1 = {s_axis_rx1_tvalid, s_axis_rx1_tdata, 
//                            s_axis_rx1_tkeep, s_axis_rx1_tlast};
//wire [74:0] fifo_out_data1;
//
//sfifo_75_131k u_sfifo_1 (
//  .clk     (clk156),      // input wire clk
//  .rst     (eth_rst),      // input wire rst
//  .din     (fifo_in_data1),      // input wire [74 : 0] din
//  .wr_en   (wr_en),  // input wire wr_en
//  .rd_en   (rd_en),  // input wire rd_en
//  .dout    (fifo_out_data1),    // output wire [74 : 0] dout
//  .full    (),    // output wire full
//  .empty   ()  // output wire empty
//);
//
//assign {f_axis_tx0_tvalid,  f_axis_tx0_tdata, f_axis_tx0_tkeep, 
//        f_axis_tx0_tlast} = fifo_out_data1;
//
/////*
//// * Loopback FIFO
//// */
//axis_data_fifo_1 u_axis_data_fifo1 (
//  .s_axis_aresetn      (!eth_rst),          // input wire s_axis_aresetn
//  .s_axis_aclk         (clk156),            // input wire s_axis_aclk
//  .s_axis_tvalid       (f_axis_tx1_tvalid), // input wire s_axis_tvalid
//  .s_axis_tready       (),                 // output wire s_axis_tready
//  .s_axis_tdata        (f_axis_tx1_tdata),  // input wire [63 : 0] s_axis_tdata
//  .s_axis_tkeep        (f_axis_tx1_tkeep),  // input wire [7 : 0] s_axis_tkeep
//  .s_axis_tlast        (f_axis_tx1_tlast),  // input wire s_axis_tlast
//  .s_axis_tuser        (1'b0),              // input wire [0 : 0] s_axis_tuser
//  .m_axis_tvalid       (m_axis_tx1_tvalid), // output wire m_axis_tvalid
//  .m_axis_tready       (m_axis_tx1_tready), // input wire m_axis_tready
//  .m_axis_tdata        (m_axis_tx1_tdata),  // output wire [63 : 0] m_axis_tdata
//  .m_axis_tkeep        (m_axis_tx1_tkeep),  // output wire [7 : 0] m_axis_tkeep
//  .m_axis_tlast        (m_axis_tx1_tlast),  // output wire m_axis_tlast
//  .m_axis_tuser        (m_axis_tx1_tuser),  // output wire [0 : 0] m_axis_tuser
//  .axis_data_count     (), 
//  .axis_wr_data_count  (), 
//  .axis_rd_data_count  ()  
//);
//
//axis_data_fifo_1 u_axis_data_fifo0 (
//  .s_axis_aresetn      (!eth_rst),          // input wire s_axis_aresetn
//  .s_axis_aclk         (clk156),            // input wire s_axis_aclk
//  .s_axis_tvalid       (f_axis_tx0_tvalid), // input wire s_axis_tvalid
//  .s_axis_tready       (),                // output wire s_axis_tready
//  .s_axis_tdata        (f_axis_tx0_tdata),  // input wire [63 : 0] s_axis_tdata
//  .s_axis_tkeep        (f_axis_tx0_tkeep),  // input wire [7 : 0] s_axis_tkeep
//  .s_axis_tlast        (f_axis_tx0_tlast),  // input wire s_axis_tlast
//  .s_axis_tuser        (1'b0),             // input wire [0 : 0] s_axis_tuser
//  .m_axis_tvalid       (m_axis_tx0_tvalid), // output wire m_axis_tvalid
//  .m_axis_tready       (m_axis_tx0_tready), // input wire m_axis_tready
//  .m_axis_tdata        (m_axis_tx0_tdata),  // output wire [63 : 0] m_axis_tdata
//  .m_axis_tkeep        (m_axis_tx0_tkeep),  // output wire [7 : 0] m_axis_tkeep
//  .m_axis_tlast        (m_axis_tx0_tlast),  // output wire m_axis_tlast
//  .m_axis_tuser        (m_axis_tx0_tuser),  // output wire [0 : 0] m_axis_tuser
//  .axis_data_count     (), 
//  .axis_wr_data_count  (), 
//  .axis_rd_data_count  ()  
//);
//
reg [31:0] led_cnt;
always @ (posedge clk156)
	if (eth_rst)
		led_cnt <= 32'd0;
	else 
		led_cnt <= led_cnt + 32'd1;

assign debug = led_cnt[31:24];
//assign debug = {eth_debug, led_cnt[30:24]};
//assign debug = eth_debug;
//
//
//
///*
// *  SRAM 
// *
// */
//wire sram_clk;
//wire rst_clk;
//wire init_calib_complete;
//
//wire         app_wr_cmd0 ;
//wire         app_wr_cmd1 ;
//wire [18:0]  app_wr_addr0;
//wire [18:0]  app_wr_addr1;
//wire         app_rd_cmd0 ;
//wire         app_rd_cmd1 ;
//wire [18:0]  app_rd_addr0 ;
//wire [18:0]  app_rd_addr1 ;
//wire [143:0] app_wr_data0 ;
//wire [143:0] app_wr_data1 ;
//wire [15:0]  app_wr_bw_n0 ;
//wire [15:0]  app_wr_bw_n1 ;
//
//wire         app_rd_valid0;
//wire         app_rd_valid1;
//wire [143:0] app_rd_data0;
//wire [143:0] app_rd_data1;
//
//
//
//
//sram_mig u_sram_mig (
//  // Memory interface ports
//  .qdriip_cq_p                     (qdriip_cq_p),  // input       [0:0]     qdriip_cq_p
//  .qdriip_cq_n                     (qdriip_cq_n),  // input       [0:0]     qdriip_cq_n
//  .qdriip_q                        (qdriip_q),  // input       [35:0]      qdriip_q
//  .qdriip_k_p                      (qdriip_k_p),  // inout wire [0:0]     qdriip_k_p
//  .qdriip_k_n                      (qdriip_k_n),  // inout wire [0:0]     qdriip_k_n
//  .qdriip_d                        (qdriip_d),  // output wire [35:0]      qdriip_d
//  .qdriip_sa                       (qdriip_sa),  // output wire [18:0]      qdriip_sa
//  .qdriip_w_n                      (qdriip_w_n),  // output wire                       qdriip_w_n
//  .qdriip_r_n                      (qdriip_r_n),  // output wire                       qdriip_r_n
//  .qdriip_bw_n                     (qdriip_bw_n),  // output wire [3:0]        qdriip_bw_n
//  .qdriip_dll_off_n                (qdriip_dll_off_n),  // output wire                       qdriip_dll_off_n
//  .init_calib_complete              (init_calib_complete),  // output                                       init_calib_complete
//  // Application interface ports
//  .app_wr_cmd0                     (app_wr_cmd0),  // input                             app_wr_cmd0
//  .app_wr_cmd1                     (1'b0),  // input                             app_wr_cmd1
//  .app_wr_addr0                    (app_wr_addr0), // input  [18:0]           app_wr_addr0
//  .app_wr_addr1                    (19'd0), // input  [18:0]           app_wr_addr1
//  .app_rd_cmd0                     (app_rd_cmd0),  // input                             app_rd_cmd0
//  .app_rd_cmd1                     (1'b0),  // input                             app_rd_cmd1
//  .app_rd_addr0                    (app_rd_addr0), // input  [18:0]           app_rd_addr0
//  .app_rd_addr1                    (19'd0), // input  [18:0]           app_rd_addr1
//  .app_wr_data0                    (app_wr_data0), // input  [143:0] app_wr_data0
//  .app_wr_data1                    (144'd0), // input  [143:0] app_wr_data1
//  .app_wr_bw_n0                    (app_wr_bw_n0), // input  [15:0]   app_wr_bw_n0
//  .app_wr_bw_n1                    (16'd0), // input  [15:0]   app_wr_bw_n1
//  .app_rd_valid0                   (app_rd_valid0),// output wire                       app_rd_valid0
//  .app_rd_valid1                   (app_rd_valid1),// output wire                       app_rd_valid1
//  .app_rd_data0                    (app_rd_data0), // output wire [143:0] app_rd_data0
//  .app_rd_data1                    (app_rd_data1), // output wire [143:0] app_rd_data1
//  .clk                             (sram_clk),     // output wire                       clk
//  .rst_clk                         (rst_clk),      // output wire                       rst_clk
//  // System Clock Ports
//  .sys_clk_i                       (clk200),  // input                                        sys_clk_i
//  .sys_rst                         (sys_rst)  // input sys_rst
//);
//
//
//localparam SRAM_IDLE  = 2'b00,
//           SRAM_WRITE = 2'b01,
//           SRAM_READ  = 2'b10,
//           SRAM_WAIT  = 2'b11;
//
//reg [ 1:0] state_sram;
//reg [31:0] cnt;
//reg [18:0] addr;
//reg [15:0] waitcnt;
//
//assign app_wr_cmd0  = state_sram == SRAM_WRITE;
//assign app_wr_data0 = (state_sram == SRAM_WRITE) ? {cnt, cnt, cnt, cnt, 16'habcd} : 0;
//assign app_wr_addr0 = (state_sram == SRAM_WRITE) ? cnt[18:0] : 0;
//assign app_wr_bw_n0 = 0;// (state_sram == SRAM_WRITE) ? 16'hffff : 0;
//
//assign app_rd_cmd0  = state_sram == SRAM_READ;
//assign app_rd_addr0 = (state_sram == SRAM_READ) ? addr : 0;
//
//always  @ (posedge sram_clk) begin
//	if (rst_clk) begin
//		state_sram <= 0;
//		cnt        <= 0;
//		addr       <= 0;
//		waitcnt    <= 0;
//	end else begin
//		cnt <= cnt + 1;
//		case (state_sram)
//			SRAM_IDLE : if (init_calib_complete) state_sram <= 1;
//			SRAM_WRITE: begin
//				state_sram <= 2;
//				addr <= cnt[18:0];
//			end
//			SRAM_READ : state_sram <= 1;
//			SRAM_WAIT : begin
//				if (waitcnt == 16'hffff) begin
//					state_sram <= 1;
//					waitcnt <= 0;
//				end else 
//					waitcnt <= waitcnt + 1;
//			end
//			default : state_sram <= 0;
//		endcase
//	end
//end
//
//ila_0 your_instance_name (
//	.clk(sram_clk), // input wire clk
//	.probe0({
//	app_wr_cmd0,
//	app_wr_addr0,
//	app_wr_data0[71:0],
//	app_wr_bw_n0,
//	app_rd_cmd0,
//	app_rd_addr0,
//	app_rd_data0[71:0],
//	app_rd_valid0}
//	) // input wire [255:0] probe0
//);
//



endmodule

