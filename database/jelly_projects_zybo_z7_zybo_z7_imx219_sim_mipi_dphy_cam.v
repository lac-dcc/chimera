`timescale 1ns/1ps


module mipi_dphy_cam
#( 
   // DPHY Function Mode
   // Valid values are MASTER (TX) and SLAVE (RX)
   parameter C_DPHY_MODE = "SLAVE", 
   // DPHY Data Lanes
   // Valid values are from 1 to 4	   
   parameter C_DPHY_LANES = 2, 
   // DPHY Line Rate in Mbps
   // Valid values are from 80 to 1500 in the order of 1 Mbps
   // No real values are allowed in Line Rate	   
   parameter C_HS_LINE_RATE = 912, 
   // T_LPX protocol timing parameter in ns
   // Default : 50 ns
   // Valid values are from 50 to 100 	   
   parameter C_LPX_PERIOD = 50,
   // Stable clock period in ns
   parameter C_STABLE_CLK_PERIOD = 5.000,
   // Escape mode clock period in ns
   // Valid range is from 50 to 100 ns (10 MHz to 20 MHz)
   // Usually equals to T_LPX timing parameter	   
   parameter C_ESC_CLK_PERIOD = 50.000,
   // T_INIT Timing parameter for Initialization
   // Valid range is from 500 us to 1 ms
   // MASTER (TX) is configured for 1 ms
   // SLAVE (RX) is configured for 500 us
   parameter C_INIT = 100000, 
   // T_WAKEUP timing parameter
   // Valid value is 1 ms for MASTER (TX) and SLAVE (RX)  
   parameter C_WAKEUP = 1000000,  
   // HS [T/R]X Timeout in bytes
   // Valid range is from 1000 to 65541	   
   parameter C_HS_TIMEOUT = 65541,
   // Escape mode timeout in ns
   // TX DPHY use this param as Escape Mode Silence Timeout for LPDT
   // RX DPHY use this param as Escape Mode Timeout for LPDT
   // 32 Bytes x T_LPX(50) x 16  = 25600
   parameter C_ESC_TIMEOUT = 25600,
   // Synchronizer flip-flop stages and arrived using device 
   // characterization metrics
   // Valid range is from 3 to 7	   
   parameter MTBF_SYNC_STAGES = 3,
   parameter C_EN_TIMEOUT_REGS = 0,
   parameter DPHY_PRESET = "None",
   parameter SUPPORT_LEVEL = 1,
   // AXI-Lite Register Interface Enable	   
   parameter C_EN_REG_IF = 0,
   // Additional debug registers	   
   parameter C_EN_DEBUG_REGS = 0,
   // Simulation control
   parameter C_EXAMPLE_SIMULATION = "false",
   // TXPLL input clock frequency in ns
   parameter C_TXPLL_CLKIN_PERIOD = 8.0,
   // byteclkhs clock period derived from line rate  
   parameter C_DIV4_CLK_PERIOD = 8.772,     
   // Calibration Mode for IDELAY in Slave mode of IP
   parameter C_CAL_MODE = "FIXED",
   // IDELAY Tap value when calibration mode is Fixed
   parameter C_IDLY_TAP = 0
   )
   (
       input                core_clk,
       input                core_rst,
       output               rxbyteclkhs,
       output               system_rst_out,
       output               init_done,

       //Clock lane PPI RX interface 
       output               cl_rxclkactivehs,
       output               cl_stopstate,
       input                cl_enable,
       output               cl_rxulpsclknot,
       output               cl_ulpsactivenot,

       //Data lane - 0 PPI RX high speed signals
       output   [7:0]       dl0_rxdatahs,
       output               dl0_rxvalidhs,
       output               dl0_rxactivehs,
       output               dl0_rxsynchs,

       //Data lane - 0 RX control siganls
       input                dl0_forcerxmode,
       output               dl0_stopstate,
       input                dl0_enable,
       output               dl0_ulpsactivenot,

       //Data lane - 0 RX escape mode signals
       output               dl0_rxclkesc,
       output               dl0_rxlpdtesc,
       output               dl0_rxulpsesc,
       output   [3:0]       dl0_rxtriggeresc,
       output   [7:0]       dl0_rxdataesc,
       output               dl0_rxvalidesc,

       //Data lane - 0 RX error signals
       output               dl0_errsoths,
       output               dl0_errsotsynchs,
       output               dl0_erresc,
       output               dl0_errsyncesc,
       output               dl0_errcontrol,

       //Data lane - 1 PPI RX high speed signals
       output   [7:0]       dl1_rxdatahs,
       output               dl1_rxvalidhs,
       output               dl1_rxactivehs,
       output               dl1_rxsynchs,

       //Data lane - 1 RX control siganls
       input                dl1_forcerxmode,
       output               dl1_stopstate,
       input                dl1_enable,
       output               dl1_ulpsactivenot,

       //Data lane - 1 RX escape mode signals
       output               dl1_rxclkesc,
       output               dl1_rxlpdtesc,
       output               dl1_rxulpsesc,
       output   [3:0]       dl1_rxtriggeresc,
       output   [7:0]       dl1_rxdataesc,
       output               dl1_rxvalidesc,

       //Data lane - 1 RX error signals
       output               dl1_errsoths,
       output               dl1_errsotsynchs,
       output               dl1_erresc,
       output               dl1_errsyncesc,
       output               dl1_errcontrol,
       //IO I/F signals for SLAVE(RX)
       input                clk_hs_rxp,
       input                clk_hs_rxn,
       input    [C_DPHY_LANES -1:0] data_hs_rxp,
       input    [C_DPHY_LANES -1:0] data_hs_rxn,
       input                clk_lp_rxp,
       input                clk_lp_rxn,
       input    [C_DPHY_LANES -1:0] data_lp_rxp,
       input    [C_DPHY_LANES -1:0] data_lp_rxn
   );
	
	parameter  RATE_HS = 8.768;
	
	
	reg		reset = 1;
	initial #100 reset = 0;
	
	reg		busy = 1;
	initial #1000 busy = 1;
	
	
	reg		hs_clk = 1;
	always #(RATE_HS/2.0) begin
		if ( busy ) begin
			hs_clk = ~hs_clk;
		end
	end
	
	reg		[15:0]	reg_data0 = 0;
	reg		[15:0]	reg_data1 = 0;
	always @(posedge hs_clk) begin
		reg_data0 <= reg_data0 + 1;
		reg_data1 <= reg_data1 - 1;
		
		if ( reg_data0 >= 1234 ) begin
			reg_data0 <= 0;
			reg_data1 <= 0;
		end
	end
	
	
	
	assign rxbyteclkhs      = hs_clk;
	assign system_rst_out   = reset;
	assign init_done        = ~reset;
	
	assign cl_rxclkactivehs  = 0;
	assign cl_stopstate      = 0;
	assign cl_rxulpsclknot   = 0;
	assign cl_ulpsactivenot  = 0;
	
	assign dl0_rxdatahs      = reg_data0;
	assign dl0_rxvalidhs     = 1;
	assign dl0_rxactivehs    = 1;
	assign dl0_rxsynchs      = (reg_data0 == 0);
	
	assign dl0_stopstate     = 0;
	assign dl0_ulpsactivenot = 0;
	
	assign dl0_rxclkesc      = 0;
	assign dl0_rxlpdtesc     = 0;
	assign dl0_rxulpsesc     = 0;
	assign dl0_rxtriggeresc  = 0;
	assign dl0_rxdataesc     = 0;
	assign dl0_rxvalidesc    = 0;
	
	assign dl0_errsoths      = 0;
	assign dl0_errsotsynchs  = 0;
	assign dl0_erresc        = 0;
	assign dl0_errsyncesc    = 0;
	assign dl0_errcontrol    = 0;
	
	assign dl1_rxdatahs      = reg_data1;
	assign dl1_rxvalidhs     = 1;
	assign dl1_rxactivehs    = 1;
	assign dl1_rxsynchs      = (reg_data1 == 0);
	
	assign dl1_stopstate     = 0;
	assign dl1_ulpsactivenot = 0;
	
	assign dl1_rxclkesc = 0;
	assign dl1_rxlpdtesc = 0;
	assign dl1_rxulpsesc = 0;
	assign dl1_rxtriggeresc = 0;
	assign dl1_rxdataesc = 0;
	assign dl1_rxvalidesc = 0;

	assign dl1_errsoths = 0;
	assign dl1_errsotsynchs = 0;
	assign dl1_erresc       = 0;
	assign dl1_errsyncesc  = 0;
	assign dl1_errcontrol  = 0;
	
	
	
endmodule

