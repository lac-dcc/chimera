// PCIe_Card.sv
// Author: Evan Custodio 2018
//
// <Fill in this description>

`timescale 1ns / 1ps

`define PCI_EXP_EP_OUI                           24'h000A35
`define PCI_EXP_EP_DSN_1                         {{8'h1},`PCI_EXP_EP_OUI}
`define PCI_EXP_EP_DSN_2                         32'h00000001

module PCIe_Card(
  output           pcie_mgt_txp,
  output           pcie_mgt_txn,
  input            pcie_mgt_rxp,
  input            pcie_mgt_rxn,
  
  input            sys_clk_p,
  input            sys_clk_n,
  input            sys_rst_n,
  
  output           clkreq_l,
  output reg [2:0] status_leds
  
);

  assign clkreq_l = 0;
  
  reg [24:0] cnt = 25'h17D7840;
  always @(posedge sys_clk) begin
	cnt <= cnt + 1;
	if (cnt >= 25'h17D7840) begin
		status_leds <= ~status_leds;
		cnt <= 0;
	end
  
	if (~sys_rst_n_c) begin
		status_leds <= 3'b111;
		cnt <= 0;
	end
  end

// Wire Declarations

  wire                    user_clk;
  wire                    user_reset;
  wire                    user_lnk_up;

  // Tx                   
  wire                    s_axis_tx_tready;
  wire [3:0]              s_axis_tx_tuser;
  wire [63:0]             s_axis_tx_tdata;
  wire [7:0]              s_axis_tx_tkeep;
  wire                    s_axis_tx_tlast;
  wire                    s_axis_tx_tvalid;

  // Rx                   
  wire [63:0]             m_axis_rx_tdata;
  wire [7:0]              m_axis_rx_tkeep;
  wire                    m_axis_rx_tlast;
  wire                    m_axis_rx_tvalid;
  wire                    m_axis_rx_tready;
  wire  [21:0]            m_axis_rx_tuser;

  wire                    tx_cfg_gnt;
  wire                    rx_np_ok;
  wire                    rx_np_req;
  wire                    cfg_turnoff_ok;
  wire                    cfg_trn_pending;
  wire                    cfg_pm_halt_aspm_l0s;
  wire                    cfg_pm_halt_aspm_l1;
  wire                    cfg_pm_force_state_en;
  wire   [1:0]            cfg_pm_force_state;
  wire                    cfg_pm_wake;
  wire  [63:0]            cfg_dsn;

  wire                    cfg_interrupt;
  wire                    cfg_interrupt_rdy;
  wire                    cfg_interrupt_assert;
  wire   [7:0]            cfg_interrupt_di;
  wire                    cfg_interrupt_stat;
  wire   [4:0]            cfg_pciecap_interrupt_msgnum;

  wire                    cfg_to_turnoff;
  wire   [7:0]            cfg_bus_number;
  wire   [4:0]            cfg_device_number;
  wire   [2:0]            cfg_function_number;

  wire  [31:0]            cfg_mgmt_di;
  wire   [3:0]            cfg_mgmt_byte_en;
  wire   [9:0]            cfg_mgmt_dwaddr;
  wire                    cfg_mgmt_wr_en;
  wire                    cfg_mgmt_rd_en;
  wire                    cfg_mgmt_wr_readonly;

  wire                    pl_directed_link_auton;
  wire [1:0]              pl_directed_link_change;
  wire                    pl_directed_link_speed;
  wire [1:0]              pl_directed_link_width;
  wire                    pl_upstream_prefer_deemph;

  wire                    sys_rst_n_c;
  wire                    sys_clk;
  
  wire [0:0]              rx_tlast;          
  wire [0:0]              rx_tvalid;           
  wire                    rx_tready;           
  wire [63:0]             rx_tdata;    
  wire [0:0]              tx_tlast;               
  wire [0:0]              tx_tvalid;           
  wire                    tx_tready;           
  wire [63:0]             tx_tdata;
  wire [7:0]              tx_tkeep;
  wire                    up_read;
  wire                    up_write; 
  wire [4:0]              up_txtag; 
  wire                    up_wait;
  wire [63:0]             up_address;
  wire [63:0]             up_writedata;
  wire [4:0]              up_rxtag;
  wire [63:0]             up_readdata;
  wire                    up_ack;
  wire [2:0]              up_err;
  wire                    down_read;
  wire                    down_write;
  wire [7:0]              down_bar;
  wire [11:0]             down_len;
  wire [4:0]              down_rxtag;
  wire [63:0]             down_address;
  wire [63:0]             down_writedata;
  wire [4:0]              down_compl_tag;
  wire [11:0]             down_compl_len;
  wire                    down_compl_ack;
  wire                    down_compl_err;
  wire [63:0]             down_readdata;
  
  
// Register Declaration
  reg                     user_reset_q;
  reg                     user_lnk_up_q;

 //-----------------------------I/O BUFFERS------------------------//
  IBUF   sys_reset_n_ibuf (.O(sys_rst_n_c), .I(sys_rst_n));
  IBUFDS_GTE2 refclk_ibuf (.O(sys_clk), .ODIV2(), .I(sys_clk_p), .CEB(1'b0), .IB(sys_clk_n));
  
  always @(posedge user_clk) begin
    user_reset_q  <= user_reset;
    user_lnk_up_q <= user_lnk_up;
  end

pcie_7x_0 pcie_7x_0_i
 (

  //----------------------------------------------------------------------------------------------------------------//
  // PCI Express (pci_exp) Interface                                                                                //
  //----------------------------------------------------------------------------------------------------------------//
  // Tx
  .pci_exp_txn                               ( pcie_mgt_txn ),
  .pci_exp_txp                               ( pcie_mgt_txp ),

  // Rx
  .pci_exp_rxn                               ( pcie_mgt_rxn ),
  .pci_exp_rxp                               ( pcie_mgt_rxp ),
  
  //----------------------------------------------------------------------------------------------------------------//
  // System  (SYS) Interface                                                                                        //
  //----------------------------------------------------------------------------------------------------------------//
  .sys_clk                                    ( sys_clk ),
  .sys_rst_n                                  ( sys_rst_n_c ),

  //----------------------------------------------------------------------------------------------------------------//
  // AXI-S Interface                                                                                                //
  //----------------------------------------------------------------------------------------------------------------//
  // Common
  .user_clk_out                              ( user_clk ),
  .user_reset_out                            ( user_reset ),
  .user_lnk_up                               ( user_lnk_up ),
  .user_app_rdy                              ( ),

  // TX
  .s_axis_tx_tready                          ( s_axis_tx_tready ),
  .s_axis_tx_tdata                           ( s_axis_tx_tdata ),
  .s_axis_tx_tkeep                           ( s_axis_tx_tkeep ),
  .s_axis_tx_tuser                           ( s_axis_tx_tuser ),
  .s_axis_tx_tlast                           ( s_axis_tx_tlast ),
  .s_axis_tx_tvalid                          ( s_axis_tx_tvalid ),

  // Rx
  .m_axis_rx_tdata                           ( m_axis_rx_tdata ),
  .m_axis_rx_tkeep                           ( m_axis_rx_tkeep ),
  .m_axis_rx_tlast                           ( m_axis_rx_tlast ),
  .m_axis_rx_tvalid                          ( m_axis_rx_tvalid ),
  .m_axis_rx_tready                          ( m_axis_rx_tready ),
  .m_axis_rx_tuser                           ( m_axis_rx_tuser ),

  .tx_cfg_gnt                                ( tx_cfg_gnt ),
  .rx_np_ok                                  ( rx_np_ok ),
  .rx_np_req                                 ( rx_np_req ),
  .cfg_trn_pending                           ( cfg_trn_pending ),
  .cfg_pm_halt_aspm_l0s                      ( cfg_pm_halt_aspm_l0s ),
  .cfg_pm_halt_aspm_l1                       ( cfg_pm_halt_aspm_l1 ),
  .cfg_pm_force_state_en                     ( cfg_pm_force_state_en ),
  .cfg_pm_force_state                        ( cfg_pm_force_state ),
  .cfg_dsn                                   ( cfg_dsn ),
  .cfg_turnoff_ok                            ( cfg_turnoff_ok ),
  .cfg_pm_wake                               ( cfg_pm_wake ),
  .cfg_pm_send_pme_to                        ( 1'b0 ),
  .cfg_ds_bus_number                         ( 8'b0 ),
  .cfg_ds_device_number                      ( 5'b0 ),
  .cfg_ds_function_number                    ( 3'b0 ),


  //----------------------------------------------------------------------------------------------------------------//
  // Configuration (CFG) Interface                                                                                  //
  //----------------------------------------------------------------------------------------------------------------//
  .cfg_device_number                         ( cfg_device_number ),
  .cfg_dcommand2                             ( ),
  .cfg_pmcsr_pme_status                      ( ),
  .cfg_status                                ( ),
  .cfg_to_turnoff                            ( cfg_to_turnoff ),
  .cfg_received_func_lvl_rst                 ( ),
  .cfg_dcommand                              ( ),
  .cfg_bus_number                            ( cfg_bus_number ),
  .cfg_function_number                       ( cfg_function_number ),
  .cfg_command                               ( ),
  .cfg_dstatus                               ( ),
  .cfg_lstatus                               ( ),
  .cfg_pcie_link_state                       ( ),
  .cfg_lcommand                              ( ),
  .cfg_pmcsr_pme_en                          ( ),
  .cfg_pmcsr_powerstate                      ( ),
  .tx_buf_av                                 ( ),
  .tx_err_drop                               ( ),
  .tx_cfg_req                                ( ),
  //------------------------------------------------//
  // RP Only                                        //
  //------------------------------------------------//
  .cfg_bridge_serr_en                        ( ),
  .cfg_slot_control_electromech_il_ctl_pulse ( ),
  .cfg_root_control_syserr_corr_err_en       ( ),
  .cfg_root_control_syserr_non_fatal_err_en  ( ),
  .cfg_root_control_syserr_fatal_err_en      ( ),
  .cfg_root_control_pme_int_en               ( ),
  .cfg_aer_rooterr_corr_err_reporting_en     ( ),
  .cfg_aer_rooterr_non_fatal_err_reporting_en( ),
  .cfg_aer_rooterr_fatal_err_reporting_en    ( ),
  .cfg_aer_rooterr_corr_err_received         ( ),
  .cfg_aer_rooterr_non_fatal_err_received    ( ),
  .cfg_aer_rooterr_fatal_err_received        ( ),

  //----------------------------------------------------------------------------------------------------------------//
  // VC interface                                                                                                   //
  //----------------------------------------------------------------------------------------------------------------//
  .cfg_vc_tcvc_map                           ( ),

  // Management Interface
  .cfg_mgmt_di                               ( cfg_mgmt_di ),
  .cfg_mgmt_byte_en                          ( cfg_mgmt_byte_en ),
  .cfg_mgmt_dwaddr                           ( cfg_mgmt_dwaddr ),
  .cfg_mgmt_wr_en                            ( cfg_mgmt_wr_en ),
  .cfg_mgmt_rd_en                            ( cfg_mgmt_rd_en ),
  .cfg_mgmt_wr_readonly                      ( cfg_mgmt_wr_readonly ),
  .cfg_mgmt_wr_rw1c_as_rw                    ( 1'b0 ),
  //------------------------------------------------//
  // EP and RP                                      //
  //------------------------------------------------//
  .cfg_mgmt_do                               ( ),
  .cfg_mgmt_rd_wr_done                       ( ),


  //------------------------------------------------//
  // EP Only                                        //
  //------------------------------------------------//
  .cfg_interrupt                             ( cfg_interrupt ),
  .cfg_interrupt_rdy                         ( cfg_interrupt_rdy ),
  .cfg_interrupt_assert                      ( cfg_interrupt_assert ),
  .cfg_interrupt_di                          ( cfg_interrupt_di ),
  .cfg_interrupt_do                          ( ),
  .cfg_interrupt_mmenable                    ( ),
  .cfg_interrupt_msienable                   ( ),
  .cfg_interrupt_msixenable                  ( ),
  .cfg_interrupt_msixfm                      ( ),
  .cfg_interrupt_stat                        ( cfg_interrupt_stat ),
  .cfg_pciecap_interrupt_msgnum              ( cfg_pciecap_interrupt_msgnum ),


  //----------------------------------------------------------------------------------------------------------------//
  // Physical Layer Control and Status (PL) Interface                                                               //
  //----------------------------------------------------------------------------------------------------------------//
  .pl_directed_link_change                   ( pl_directed_link_change ),
  .pl_directed_link_width                    ( pl_directed_link_width ),
  .pl_directed_link_speed                    ( pl_directed_link_speed ),
  .pl_directed_link_auton                    ( pl_directed_link_auton ),
  .pl_upstream_prefer_deemph                 ( pl_upstream_prefer_deemph ),

  .pl_sel_lnk_rate                           ( ),
  .pl_sel_lnk_width                          ( ),
  .pl_ltssm_state                            ( ),
  .pl_lane_reversal_mode                     ( ),

  .pl_phy_lnk_up                             ( ),
  .pl_tx_pm_state                            ( ),
  .pl_rx_pm_state                            ( ),

  .pl_link_upcfg_cap                         ( ),
  .pl_link_gen2_cap                          ( ),
  .pl_link_partner_gen2_supported            ( ),
  .pl_initial_link_width                     ( ),

  .pl_directed_change_done                   ( ),

  //------------------------------------------------//
  // EP Only                                        //
  //------------------------------------------------//
  .pl_received_hot_rst                       ( ),

  //------------------------------------------------//
  // RP Only                                        //
  //------------------------------------------------//
  .pl_transmit_hot_rst                       ( 1'b0 ),
  .pl_downstream_deemph_source               ( 1'b0 )



);

  //----------------------------------------------------------------------------------------------------------------//
  // PCIe Block EP Tieoffs - This project doesn't require potions of the interface                                  //
  //----------------------------------------------------------------------------------------------------------------//
  assign cfg_dsn = {`PCI_EXP_EP_DSN_2, `PCI_EXP_EP_DSN_1};  // Assign the input DSN
  assign tx_cfg_gnt                   = 1'b1;        // Always allow transmission of Config traffic within block
  assign rx_np_ok                     = 1'b1;        // Allow Reception of Non-posted Traffic
  assign rx_np_req                    = 1'b1;        // Always request Non-posted Traffic if available
  assign cfg_pm_wake                  = 1'b0;        // Never direct the core to send a PM_PME Message
  assign cfg_trn_pending              = 1'b0;        // Never set the transaction pending bit in the Device Status Register
  assign cfg_pm_halt_aspm_l0s         = 1'b0;        // Allow entry into L0s
  assign cfg_pm_halt_aspm_l1          = 1'b0;        // Allow entry into L1
  assign cfg_pm_force_state_en        = 1'b0;        // Do not qualify cfg_pm_force_state
  assign cfg_pm_force_state           = 2'b00;       // Do not move force core into specific PM state

  assign s_axis_tx_tuser[0]           = 1'b0;        // Unused for V6
  assign s_axis_tx_tuser[1]           = 1'b0;        // Error forward packet
  assign s_axis_tx_tuser[2]           = 1'b0;        // Stream packet
  assign s_axis_tx_tuser[3]           = 1'b0; 

  assign cfg_interrupt_stat           = 1'b0;        // Never set the Interrupt Status bit
  assign cfg_pciecap_interrupt_msgnum = 5'b00111;    // Zero out Interrupt Message Number
  assign cfg_interrupt_assert         = 1'b0;        // Always drive interrupt de-assert
  
  
 // assign cfg_interrupt                = 1'b0;        // Never drive interrupt by qualifying cfg_interrupt_assert
 // assign cfg_interrupt_di             = 8'b0;        // Do not set interrupt fields

  assign pl_directed_link_change      = 2'b00;       // Never initiate link change
  assign pl_directed_link_width       = 2'b00;       // Zero out directed link width
  assign pl_directed_link_speed       = 1'b0;        // Zero out directed link speed
  assign pl_directed_link_auton       = 1'b0;        // Zero out link autonomous input
  assign pl_upstream_prefer_deemph    = 1'b1;        // Zero out preferred de-emphasis of upstream port

  assign cfg_mgmt_di                  = 32'h0;       // Zero out CFG MGMT input data bus
  assign cfg_mgmt_byte_en             = 4'h0;        // Zero out CFG MGMT byte enables
  assign cfg_mgmt_dwaddr              = 10'h0;       // Zero out CFG MGMT 10-bit address port
  assign cfg_mgmt_wr_en               = 1'b0;        // Do not write CFG space
  assign cfg_mgmt_rd_en               = 1'b0;        // Do not read CFG space
  assign cfg_mgmt_wr_readonly         = 1'b0;        // Never treat RO bit as RW

  wire [15:0] cfg_completer_id      = { cfg_bus_number, cfg_device_number, cfg_function_number };
  assign cfg_turnoff_ok = cfg_to_turnoff;

TLP_Processor tlp (
	// connect to PCIe
	.pcie_clk         (user_clk),
	.pcie_rst         (user_reset),
	.pcie_busdev      (cfg_completer_id[15:3]),

	.rx_bar           (m_axis_rx_tuser[9:2]),        
	.rx_tlast         (m_axis_rx_tlast),          
	.rx_tvalid        (m_axis_rx_tvalid),           
	.rx_tready        (m_axis_rx_tready),           
	.rx_tdata         (m_axis_rx_tdata), 

	.tx_tlast         (s_axis_tx_tlast),           
	.tx_tvalid        (s_axis_tx_tvalid),           
	.tx_tready        (s_axis_tx_tready),           
	.tx_tdata         (s_axis_tx_tdata),
	.tx_tkeep         (s_axis_tx_tkeep),

	.up_address       (up_address),
	.up_read          (up_read),
	.up_write         (up_write),
	.up_txtag         (up_txtag),
	.up_writedata     (up_writedata),
	.up_readdata      (up_readdata),

	.up_rxtag         (up_rxtag),
	.up_ack           (up_ack),
	.up_err           (up_err),

	.down_read        (down_read),
	.down_write       (down_write),
	.down_bar         (down_bar),
	.down_len         (down_len),
	.down_rxtag       (down_rxtag),
	.down_address     (down_address),
	.down_writedata   (down_writedata),

	.down_compl_tag   (down_compl_tag),
	.down_compl_len   (down_compl_len),
	.down_compl_ack   (down_compl_ack),
	.down_compl_err   (down_compl_err),
	.down_readdata    (down_readdata)
);
	
	
Mem_Accessor memacc (
	.user_clk          (user_clk),
	.user_reset        (user_reset),
	.up_read           (up_read),
	.up_write          (up_write), 
	.up_txtag          (up_txtag), 
	.up_wait           (up_wait),
	.up_address        (up_address),
	.up_writedata      (up_writedata),
	.up_rxtag          (up_rxtag),
	.up_readdata       (up_readdata),
	.up_ack            (up_ack),
	.up_err            (up_err),
	.down_read         (down_read),
	.down_write        (down_write),
	.down_bar          (down_bar),
	.down_len          (down_len),
	.down_rxtag        (down_rxtag),
	.down_address      (down_address),
	.down_writedata    (down_writedata),
	.down_compl_tag    (down_compl_tag),
	.down_compl_len    (down_compl_len),
	.down_compl_ack    (down_compl_ack),
	.down_compl_err    (down_compl_err),
	.down_readdata     (down_readdata),
	.cfg_interrupt     (cfg_interrupt),
	.cfg_interrupt_rdy (cfg_interrupt_rdy),
	.cfg_interrupt_di  (cfg_interrupt_di)
);

endmodule
