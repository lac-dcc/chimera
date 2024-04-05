

module sata_phy # 
  (
    parameter  WRAPPER_SIM_GTRESET_SPEEDUP    =   "FALSE",   // Set to "true" to speed up sim reset
    parameter  SIM_VERSION                    =   "4.0",     
    parameter  EQ_MODE                        =   "DFE",     // Rx Equalization Mode - Set to DFE or LPM
    parameter  EXAMPLE_SIMULATION             =    0 
  )

  (
    TILE0_REFCLK_PAD_P_IN,                    // MGTCLKA,  clocks GTP_X0Y0-2 
    TILE0_REFCLK_PAD_N_IN,                    // MGTCLKA 
    GTXRESET_IN,                              // GTP initialization
    TILE0_PLLLKDET_OUT,                       // TX PLL LOCK

    TXP0_OUT,
    TXN0_OUT,
    RXP0_IN,
    RXN0_IN,
    DCMLOCKED_OUT,
    LINKUP,
    logic_clk,
    GEN,
    tx_data_in,
    tx_charisk_in, 
    rx_data_out,
    rx_charisk_out,
    logic_reset,
    OOB_reset_IN,
    RX_FSM_reset_IN,
		TX_FSM_reset_IN
  );

  input           TILE0_REFCLK_PAD_P_IN;      // GTP reference clock input
  input           TILE0_REFCLK_PAD_N_IN;      // GTP reference clock input
  input           GTXRESET_IN;                // Main GTP reset
  input           RXP0_IN;                    // Receiver input
  input           RXN0_IN;                    // Receiver input
  input  [31:0]   tx_data_in;
  input           tx_charisk_in;  
  input           OOB_reset_IN;
  input           RX_FSM_reset_IN;	
  input           TX_FSM_reset_IN;	
  
  output          DCMLOCKED_OUT;              // MMCM locked 
  output          TILE0_PLLLKDET_OUT;         // QPLL Lock Detect
  output          TXP0_OUT;
  output          TXN0_OUT;
  output          LINKUP;
  output          logic_clk;
  output [1:0]    GEN;
  output [31:0]   rx_data_out;
  output [3:0]    rx_charisk_out;
  output          logic_reset;

//***********************************Parameter Declarations********************

  parameter STABLE_CLOCK_PERIOD  = 6;              

  //Typical CDRLOCK Time is 50,000UI, as per DS183
  parameter RX_CDRLOCK_TIME      = (EXAMPLE_SIMULATION == 1) ? 1000 : 50000/3.0;

  parameter integer LPM_ADAPT_LOCK_TIMER = (EXAMPLE_SIMULATION == 1) ? 5 : (13*150)/3.0;

  parameter integer DFE_ADAPT_LOCK_TIMER = (13*150)/3.0;
     
  integer   WAIT_TIME_CDRLOCK    = RX_CDRLOCK_TIME / STABLE_CLOCK_PERIOD;      

//--------------------------  Wires ------------------------------
  wire  [31:0]   tx_data_in;      
  wire           tx_charisk_in; 
        
  wire           gt0_txresetdone_o;
  wire           gt0_rxresetdone_o;
  wire           gt0_gttxreset_i;
  wire           gt0_gtrxreset_i;
  wire           gt0_rxpmareset_i;
  wire           gt0_rxdfelpmreset_i;
  wire   [1:0]   gt0_txsysclksel_i;
  wire           gt0_txuserrdy_i;
  wire           gt0_rxuserrdy_i;
  wire           gt0_rxdfeagchold_i;
  wire           gt0_rxdfelfhold_i;
  wire           gt0_rxlpmlfhold_i;
  wire           gt0_rxlpmhfhold_i;
  wire   [7:0]   gt0_drpaddr_i;
  wire   [15:0]  gt0_drpdi_i;
  wire   [15:0]  gt0_drpdo_o;
  wire           gt0_drpen_i;
  wire           gt0_drpwe_i;
  wire           gt0_drprdy_o;
  wire   [6:0]   gt0_rxmonitorout_o;
  wire   [1:0]   gt0_rxmonitorsel_i;
  wire           gt0_qpllreset_i;
  wire           gt0_qpllrefclklost_i;
  wire           gt0_qplllock_i;
  wire           gt0_txusrclk_i;
  wire           gt0_txoutclk_o;
  wire   [3:0]   gt0_rxdisperr_o;
  wire   [3:0]   gt0_rxnotintable_o;
  wire   [1:0]   gt0_rxclkcorcnt_o;
  wire           gt0_rxcdrlock_o;
  wire           rxbyteisaligned;  
  wire           rxcomwakedet;
  wire           rxcominitdet;
  wire           txcominit;
  wire           txcomwake;
  wire           txcomfinish;
  wire           CLKFB_OUT;
  wire           CLKFB_IN;
  wire           tied_to_ground_i;
  wire           tied_to_vcc_i;
  wire           gt0_rxoutclk_i;
  wire           gtx_reset;
  wire           MMCM_LOCKED;
  wire           mmcm_clk_in;
  wire   [8:0]   gt0_drpaddr_int;
  wire   [15:0]  gt0_drpdi_int;
  wire   [15:0]  gt0_drpdo_int;
  wire           gt0_drpen_int;
  wire           gt0_drpwe_int;
  wire           gt0_drprdy_int;
  
  wire           gt0_adapt_done;

  
  
  wire   [3:0]   rxcharisk;
  wire           txcomtype, txcomstart;
  wire           sync_det_out, align_det_out;
  wire           tx_charisk;
  wire           txelecidle,rxelecidle; 
  wire   [31:0]  txdata, rxdata, rxdataout; // TX/RX data
  wire   [3:0]   CurrentState_out;
  wire   [4:0]   state_out;
  wire           rx_sof_det_out, rx_eof_det_out;
  wire           linkup;
  wire           usrclk, logic_clk; //GTX user clocks
  wire           system_reset;
  wire           speed_neg_rst;
  wire           rst_0;
  wire           rst_debounce;
  wire           q3_clk0_refclk_i;
  wire           q3_clk0_refclk_bufg;
  wire           CLK_OUT_150, CLK_OUT_75, CLK_OUT_37;
  wire           clk_out_bufgmux1;
  wire           gtx_rx_reset;
  wire           gt0_recclk_stable_i;
  wire           gt0_rx_fsm_reset_done_out;
  wire           gt0_tx_fsm_reset_done_out;
  wire           rxreset;
          
  reg            rst_1;  
  reg            rst_2;
  reg            rst_3;
  reg            GTPRESET_IN_1;
  reg            GTPRESET_IN_2;
	
  reg            OOB_reset_IN_1;	
  reg            OOB_reset_IN_2;
  reg            OOB_reset_1;  
  reg            OOB_reset_2;
  reg            OOB_reset_3;
	wire           OOB_reset;

  reg            RX_FSM_reset_IN_1;	
  reg            RX_FSM_reset_IN_2;
  reg            RX_FSM_reset_1;  
  reg            RX_FSM_reset_2;
  reg            RX_FSM_reset_3;
	wire           RX_FSM_reset;
	
  reg            TX_FSM_reset_IN_1;	
  reg            TX_FSM_reset_IN_2;
  reg            TX_FSM_reset_1;  
  reg            TX_FSM_reset_2;
  reg            TX_FSM_reset_3;
	wire           TX_FSM_reset;
	
	
  
  integer        rx_cdrlock_counter= 0;
  reg            rx_cdrlocked;
  
  assign  tied_to_ground_i          = 1'b0;  
  assign  tied_to_vcc_i             = 1'b1;  
  
  assign  logic_clk                 = gt0_txusrclk_i;
  assign  system_reset              = rst_debounce;
  assign  gtx_reset                 = rst_debounce || speed_neg_rst;
  assign  LINKUP                    = linkup;
  assign  DCMLOCKED_OUT             = MMCM_LOCKED; 
  assign  TILE0_PLLLKDET_OUT        = gt0_qplllock_i;         
  assign  rx_data_out               = rxdataout;  
  assign  logic_reset               = gtx_reset;
  assign  rst_0                     = GTPRESET_IN_2;  
  assign  gt0_rxpmareset_i          = tied_to_ground_i;
  assign  gt0_rxdfelpmreset_i       = tied_to_ground_i;
  assign  gt0_txsysclksel_i         = 2'b11;
  assign  CLKFB_IN                  = CLKFB_OUT;
  assign  gt0_txusrclk_i            = usrclk;
  

  always @(posedge q3_clk0_refclk_bufg)
  begin
   GTPRESET_IN_1 <= GTXRESET_IN;
   GTPRESET_IN_2 <= GTPRESET_IN_1;
  end
	
  assign  rst_0                     = GTPRESET_IN_2;  
	
  always @(posedge q3_clk0_refclk_bufg)
  begin
   rst_1 <= rst_0;
   rst_2 <= rst_1;
   rst_3 <= rst_2;
  end
	
	assign  rst_debounce              = (rst_1 & rst_2 & rst_3);

  BUFG txoutclk_bufg0_o
  (
    .I  (gt0_txoutclk_o),
    .O  (mmcm_clk_in)
  );

  
  IBUFDS_GTE2 #
  (
    .CLKRCV_TRST  (1),
    .CLKCM_CFG    (1),
    .CLKSWING_CFG (2'b11)
  )
  ibufds_instQ3_CLK1
  (
    .O      (q3_clk0_refclk_i),
    .ODIV2  (),
    .CEB    (tied_to_ground_i),
    .I      (TILE0_REFCLK_PAD_P_IN),
    .IB     (TILE0_REFCLK_PAD_N_IN)
  );  
 
  BUFG q3_clk0_refclk_i_bufg
  (
    .I  (q3_clk0_refclk_i),
    .O  (q3_clk0_refclk_bufg)
  );

  MMCM_usrclk TX_RX_usrclk
  (
    .CLK_IN1    (mmcm_clk_in),
    .CLKFB_IN   (CLKFB_IN),   
    .CLK_OUT1   (CLK_OUT_150),   
    .CLK_OUT2   (CLK_OUT_75),
    .CLK_OUT3   (CLK_OUT_37),    
    .CLKFB_OUT  (CLKFB_OUT), 
    .RESET      (MMCM_RESET),
    .LOCKED     (MMCM_LOCKED)
  );  

  BUFGMUX usrclk_bufgmux_1 
  (
    .O  (clk_out_bufgmux1),
    .I0 (CLK_OUT_37),
    .I1 (CLK_OUT_75),
    .S  (GEN[0])
  );
  
  BUFGMUX usrclk_bufgmux_2 
  (
    .O  (usrclk),
    .I0 (clk_out_bufgmux1),
    .I1 (CLK_OUT_150),
    .S  (GEN[1])
  );

  always @(posedge q3_clk0_refclk_bufg)
  begin
   OOB_reset_IN_1 <= OOB_reset_IN;
   OOB_reset_IN_2 <= OOB_reset_IN_1;
  end
	

  always @(posedge q3_clk0_refclk_bufg)
  begin
   OOB_reset_1 <= OOB_reset_IN_2;
   OOB_reset_2 <= OOB_reset_1;
   OOB_reset_3 <= OOB_reset_2;
  end
	
	assign  OOB_reset              = (OOB_reset_1 & OOB_reset_2 & OOB_reset_3);

	
	
  OOB_control OOB_control_i 
  (
    .clk                (logic_clk),
    .reset              (gtx_reset || OOB_reset), //(gtx_reset),
    .link_reset         (1'b0),
    .rx_locked          (gt0_qplllock_i),
    .tx_datain          (tx_data_in),       // User datain port
    .tx_chariskin       (tx_charisk_in),
    .tx_dataout         (txdata),           // outgoing GTP data
    .tx_charisk_out     (tx_charisk),          
    .rx_charisk         (rxcharisk),                             
    .rx_datain          (rxdata),           // incoming GTP data 
    .rx_dataout         (rxdataout),        // User dataout port
    .rx_charisk_out	    (rx_charisk_out),   // User charisk port 
    .linkup             (linkup),
    .gen                (GEN),
    .rxreset            (rxreset),
    .txcominit          (txcominit),
    .txcomwake          (txcomwake),
    .cominitdet         (rxcominitdet), 
    .comwakedet         (rxcomwakedet),
    .rxelecidle         (rxelecidle),
    .txelecidle         (txelecidle),
    .rxbyteisaligned    (rxbyteisaligned), 
    .CurrentState_out   (CurrentState_out),
    .align_det_out      (align_det_out),
    .sync_det_out       (sync_det_out),
    .rx_sof_det_out     (rx_sof_det_out),
    .rx_eof_det_out     (rx_eof_det_out),
    .gt0_rxresetdone_i  (gt0_rx_fsm_reset_done_out),
    .gt0_txresetdone_i  (gt0_tx_fsm_reset_done_out),
    .gtx_rx_reset_out   (oob_gtrx_reset_out)
  );

  speed_neg_control snc(
    .clk                (mmcm_clk_in),
    .reset              (system_reset),
    .mgt_reset          (speed_neg_rst),
    .linkup             (linkup),
    .daddr              (gt0_drpaddr_i),                       
    .den                (gt0_drpen_i),
    .di                 (gt0_drpdi_i),   
    .do                 (gt0_drpdo_o),     
    .drdy               (gt0_drprdy_o),
    .dwe                (gt0_drpwe_i),
    .gtx_lock           (gt0_qplllock_i),
    .state_out          (state_out), 
    .gen_value          (GEN),
    .gt0_txresetdone_i  (gt0_tx_fsm_reset_done_out),
    .gt0_rxresetdone_i  (gt0_rx_fsm_reset_done_out)
  );


  GTX #
  (
    .WRAPPER_SIM_GTRESET_SPEEDUP    (WRAPPER_SIM_GTRESET_SPEEDUP)
  )
  GTX_i
  (

    //_____________________________________________________________________
    //_____________________________________________________________________
    //GT0  (X1Y15)

    .GT0_DRPADDR_IN           ({1'b0,gt0_drpaddr_i}),
    .GT0_DRPCLK_IN            (mmcm_clk_in),
    .GT0_DRPDI_IN             (gt0_drpdi_i),
    .GT0_DRPDO_OUT            (gt0_drpdo_o),
    .GT0_DRPEN_IN             (gt0_drpen_i),
    .GT0_DRPRDY_OUT           (gt0_drprdy_o),
    .GT0_DRPWE_IN             (gt0_drpwe_i),
    .GT0_TXSYSCLKSEL_IN       (gt0_txsysclksel_i),
    .GT0_RXVALID_OUT          (),
    .GT0_RXUSERRDY_IN         (gt0_rxuserrdy_i),
    .GT0_EYESCANDATAERROR_OUT (gt0_eyescandataerror_o),
    .GT0_RXCDRHOLD_IN         (1'b0),
    .GT0_RXCDRLOCK_OUT        (gt0_rxcdrlock_o),
    .GT0_RXCLKCORCNT_OUT      (gt0_rxclkcorcnt_o),
    .GT0_RXUSRCLK_IN          (gt0_txusrclk_i),
    .GT0_RXUSRCLK2_IN         (gt0_txusrclk_i),
    .GT0_RXDATA_OUT           (rxdata),
    .GT0_RXDISPERR_OUT        (gt0_rxdisperr_o),
    .GT0_RXNOTINTABLE_OUT     (gt0_rxnotintable_o),
    .GT0_GTXRXP_IN            (RXP0_IN),
    .GT0_GTXRXN_IN            (RXN0_IN),
    .GT0_RXDFEAGCHOLD_IN      (gt0_rxdfeagchold_i),
    .GT0_RXDFELPMRESET_IN     (gt0_rxdfelpmreset_i),
    .GT0_RXMONITOROUT_OUT     (gt0_rxmonitorout_o),
    .GT0_RXMONITORSEL_IN      (gt0_rxmonitorsel_i),
    .GT0_RXOUTCLK_OUT         (gt0_rxoutclk_i),
    .GT0_GTRXRESET_IN         (gt0_gtrxreset_i),
    .GT0_RXPMARESET_IN        (gt0_rxpmareset_i),
    .GT0_RXCOMWAKEDET_OUT     (rxcomwakedet),
    .GT0_RXCOMINITDET_OUT     (rxcominitdet),
    .GT0_RXELECIDLE_OUT       (rxelecidle),
    .GT0_RXBYTEISALIGNED_OUT  (rxbyteisaligned),
    .GT0_RXCHARISK_OUT        (rxcharisk),
    .GT0_RXRESETDONE_OUT      (gt0_rxresetdone_o),
    .GT0_GTTXRESET_IN         (gt0_gttxreset_i),
    .GT0_TXUSERRDY_IN         (gt0_txuserrdy_i),
    .GT0_TXUSRCLK_IN          (gt0_txusrclk_i),
    .GT0_TXUSRCLK2_IN         (gt0_txusrclk_i),
    .GT0_TXELECIDLE_IN        (txelecidle),
    .GT0_TXDATA_IN            (txdata),
    .GT0_GTXTXN_OUT           (TXN0_OUT),
    .GT0_GTXTXP_OUT           (TXP0_OUT),
    .GT0_TXOUTCLK_OUT         (gt0_txoutclk_o),
    .GT0_TXOUTCLKFABRIC_OUT   (gt0_txoutclkfabric_o),
    .GT0_TXOUTCLKPCS_OUT      (gt0_txoutclkpcs_o),
    .GT0_TXCHARISK_IN         (tx_charisk),
    .GT0_TXRESETDONE_OUT      (gt0_txresetdone_o),
    .GT0_TXCOMFINISH_OUT      (txcomfinish),
    .GT0_TXCOMINIT_IN         (txcominit),
    .GT0_TXCOMWAKE_IN         (txcomwake),
    .GT0_GTREFCLK0_COMMON_IN  (q3_clk0_refclk_i),
    .GT0_QPLLLOCK_OUT         (gt0_qplllock_i),
    .GT0_QPLLLOCKDETCLK_IN    (mmcm_clk_in),
    .GT0_QPLLREFCLKLOST_OUT   (gt0_qpllrefclklost_i),
    .GT0_QPLLRESET_IN         (gt0_qpllreset_i)
  );
  
  always @(posedge q3_clk0_refclk_bufg)
  begin
   TX_FSM_reset_IN_1 <= TX_FSM_reset_IN;
   TX_FSM_reset_IN_2 <= TX_FSM_reset_IN_1;
  end
	

  always @(posedge q3_clk0_refclk_bufg)
  begin
   TX_FSM_reset_1 <= TX_FSM_reset_IN_2;
   TX_FSM_reset_2 <= TX_FSM_reset_1;
   TX_FSM_reset_3 <= TX_FSM_reset_2;
  end
	
	assign  TX_FSM_reset              = (TX_FSM_reset_1 & TX_FSM_reset_2 & TX_FSM_reset_3);


  TX_STARTUP_FSM #
  (
    .GT_TYPE                  ("GTX"),                  
    .STABLE_CLOCK_PERIOD      (STABLE_CLOCK_PERIOD),    
    .RETRY_COUNTER_BITWIDTH   (8),  
    .TX_QPLL_USED             ("TRUE"),                 
    .RX_QPLL_USED             ("TRUE"),                 
    .PHASE_ALIGNMENT_MANUAL   ("FALSE")                 
   ) 
  gt0_txresetfsm_i      
  ( 
    .STABLE_CLOCK             (q3_clk0_refclk_bufg),
    .TXUSERCLK                (gt0_txusrclk_i),
    .SOFT_RESET               (gtx_reset || TX_FSM_reset),
    .QPLLREFCLKLOST           (gt0_qpllrefclklost_i),
    .CPLLREFCLKLOST           (tied_to_ground_i),
    .QPLLLOCK                 (gt0_qplllock_i),
    .CPLLLOCK                 (tied_to_vcc_i),
    .TXRESETDONE              (gt0_txresetdone_o),
    .MMCM_LOCK                (MMCM_LOCKED),
    .GTTXRESET                (gt0_gttxreset_i),
    .MMCM_RESET               (MMCM_RESET),
    .QPLL_RESET               (gt0_qpllreset_i),
    .CPLL_RESET               (),
    .TX_FSM_RESET_DONE        (gt0_tx_fsm_reset_done_out),
    .TXUSERRDY                (gt0_txuserrdy_i),
    .RUN_PHALIGNMENT          (),
    .RESET_PHALIGNMENT        (),
    .PHALIGNMENT_DONE         (tied_to_vcc_i),
    .RETRY_COUNTER            ()
  );
  
  always @(posedge q3_clk0_refclk_bufg)
  begin
   RX_FSM_reset_IN_1 <= RX_FSM_reset_IN;
   RX_FSM_reset_IN_2 <= RX_FSM_reset_IN_1;
  end
	

  always @(posedge q3_clk0_refclk_bufg)
  begin
   RX_FSM_reset_1 <= RX_FSM_reset_IN_2;
   RX_FSM_reset_2 <= RX_FSM_reset_1;
   RX_FSM_reset_3 <= RX_FSM_reset_2;
  end
	
	assign  RX_FSM_reset              = (RX_FSM_reset_1 & RX_FSM_reset_2 & RX_FSM_reset_3);

  

  RX_STARTUP_FSM  #
  (
    .EXAMPLE_SIMULATION       (EXAMPLE_SIMULATION),
    .GT_TYPE                  ("GTX"),                
    .EQ_MODE                  (EQ_MODE),              
    .STABLE_CLOCK_PERIOD      (STABLE_CLOCK_PERIOD),  
    .RETRY_COUNTER_BITWIDTH   (8), 
    .TX_QPLL_USED             ("TRUE"),               
    .RX_QPLL_USED             ("TRUE"),               
    .PHASE_ALIGNMENT_MANUAL   ("FALSE")               
   )     
  gt0_rxresetfsm_i
   ( 
    .STABLE_CLOCK             (q3_clk0_refclk_bufg),
    .RXUSERCLK                (gt0_txusrclk_i),
    .SOFT_RESET               (gtx_reset || RX_FSM_reset || oob_gtrx_reset_out),//|| rxreset || gtx_rx_reset
    .QPLLREFCLKLOST           (gt0_qpllrefclklost_i),
    .CPLLREFCLKLOST           (tied_to_ground_i),
    .QPLLLOCK                 (gt0_qplllock_i),
    .CPLLLOCK                 (),
    .RXRESETDONE              (gt0_rxresetdone_o),
    .MMCM_LOCK                (MMCM_LOCKED),
    .RECCLK_STABLE            (gt0_rxcdrlock_o),//gt0_recclk_stable_i
    .RECCLK_MONITOR_RESTART   (tied_to_ground_i),
    .DATA_VALID               (1'b1), //Need to edit
    .TXUSERRDY                (gt0_txuserrdy_i),
    .GTRXRESET                (gt0_gtrxreset_i),
    .MMCM_RESET               (),
    .QPLL_RESET               (),
    .CPLL_RESET               (),
    .RX_FSM_RESET_DONE        (gt0_rx_fsm_reset_done_out),
    .RXUSERRDY                (gt0_rxuserrdy_i),
    .RUN_PHALIGNMENT          (),
    .RESET_PHALIGNMENT        (),
    .PHALIGNMENT_DONE         (tied_to_vcc_i),
    .RXDFELFHOLD              (gt0_rxdfelfhold_i),
    .RXLPMLFHOLD              (gt0_rxlpmlfhold_i),
    .RXLPMHFHOLD              (gt0_rxlpmhfhold_i),
    .RXDFEAGCHOLD             (),
    .RETRY_COUNTER            ()
  );
  
/*generate
if (EQ_MODE=="DFE") 
GTX_ADAPT_TOP_DFE  #
          (
           .AGC_TIMER       (DFE_ADAPT_LOCK_TIMER)
           )     
gt0_adapt_dfe_i
          ( 
	         .EN(1'b1),
           .CTLE3_COMP_EN(1'b1),
           .GTRXRESET(gt0_gtrxreset_i), //reset going to the GT, coming from either chipscope or TB
           .RXPMARESET(gt0_rxpmareset_i),//tied to ground, going to GT
           .RXDFELPMRESET(gt0_rxdfelpmreset_i),//tied to groun, going to GT
           .DCLK(mmcm_clk_in),
           .DO(gt0_drpdo_int),
           .DRDY(gt0_drprdy_int),
           .DADDR(gt0_drpaddr_int),
           .DI(gt0_drpdi_int),
           .DEN(gt0_drpen_int),
           .DWE(gt0_drpwe_int),
           .RXMONITOR(gt0_rxmonitorout_o),
           .RXMONITORSEL(gt0_rxmonitorsel_i),
           .AGCHOLD(gt0_rxdfeagchold_i),
           .KLHOLD(),
           .KHHOLD(),
           .DONE(gt0_adapt_done),
           .DEBUG()
           );
else if (EQ_MODE=="LPM")
GTX_ADAPT_TOP_LPM  #
          (
           .TIMER       (LPM_ADAPT_LOCK_TIMER)
           )     
gt0_adapt_lpm_i
          ( 
	         .EN(1'b1),
           .GTRXRESET(gt0_gtrxreset_i), //reset going to the GT, coming from either chipscope or TB
           .RXPMARESET(gt0_rxpmareset_i),//tied to ground, going to GT
           .RXDFELPMRESET(gt0_rxdfelpmreset_i),//tied to groun, going to GT
           .DCLK(mmcm_clk_in),
           .DO(gt0_drpdo_int),
           .DRDY(gt0_drprdy_int),
           .DADDR(gt0_drpaddr_int),
           .DI(gt0_drpdi_int),
           .DEN(gt0_drpen_int),
           .DWE(gt0_drpwe_int),
           .KLHOLD(),
           .KHHOLD(),
           .DONE(gt0_adapt_done),
           .DEBUG()
           );
endgenerate

   assign gt0_drpaddr_i  = gt0_drpaddr_int;
   assign gt0_drpdi_i    = gt0_drpdi_int;
   assign gt0_drpen_i    = gt0_drpen_int;
   assign gt0_drpwe_i    = gt0_drpwe_int;

   assign gt0_drpdo_int  = gt0_drpdo_o;
   assign gt0_drprdy_int = gt0_drprdy_o;


  always @(posedge SYSCLK_IN)
  begin
        if(gt0_gtrxreset_i)
        begin
          rx_cdrlocked       <=     1'b0;
          rx_cdrlock_counter <=     0;      
        end                
        else if (rx_cdrlock_counter == WAIT_TIME_CDRLOCK) 
        begin
          rx_cdrlocked       <=     1'b1;
          rx_cdrlock_counter <=     rx_cdrlock_counter;
        end
        else
          rx_cdrlock_counter <=     rx_cdrlock_counter + 1;
  end 

assign  gt0_recclk_stable_i                  =  rx_cdrlocked;  */
  
  
  

endmodule