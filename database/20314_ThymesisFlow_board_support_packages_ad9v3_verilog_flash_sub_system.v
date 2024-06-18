// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
`timescale 1ps / 1ps
// -------------------------------------------------------------------
//
// Title    : flash_sub_system.v
// Function : This file combines Xilinx Ultrascale+ IP cores and Micron FLASH memory into a sub-system to which
//            the CFG implementation registers can attach. The details are specific to the board identified above.
//            Other development or application boards may use a different approach to downloading an FPGA configuration
//            file from the host and triggering it to be loaded into the FPGA.
//
// -------------------------------------------------------------------
// Modification History :
//                               |Version    |     |Author   |Description of change
//                               |-----------|     |-------- |---------------------
  `define FLASH_SUB_SYS_VERSION   07_Dec_2017   //            Initial creation         
// -------------------------------------------------------------------


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module flash_sub_system (

    // -----------------------------------
    // Miscellaneous Ports
    // -----------------------------------
    input          axi_clk                // This is the INTernal FPGA and AXI4-Lite interface clock
  , input          spi_clk                // Drive from a 200 MHz clock derived from the OpenCAPI link. The quad SPI core divides
                                          //   this down to half the frequency, allowing SPI to run at 100 MHz post configuration.
                                          //   During initial configuration, the FPGA uses the FLASH clock supplied by the 9V3 board
                                          //   (EMCCLK_B, 100 MHz, pin AJ28) but switches over to the internal clock supplied to
                                          //   the quad SPI core on .ext_spi_clk immediately after initial configuration is over.
                                          //   The quad SPI core divides this in half and drives it to the STARTUPE3 core on .USRCCLKO
                                          //   See ug570-ultrascale-configuration.pdf and ug470_7Series_Config.pdf page 92 for more details.
  , output         spi_clk_div_2          // Make half freq spi_clk available for wrapping back in as 'icap_clk' if desired
  , input          icap_clk               // This is a 100 MHz (max freq) clock into the ICAP block 
  , input          reset_n                // (active low) Hardware reset

    // ------------------------------------------------------------
    // Interface to CFG registers, which act as an AXI4-Lite Master
    // ------------------------------------------------------------
  , input    [1:0] cfg_axi_devsel         // Select which AXI4-Lite slave is the target of the command
  , input   [13:0] cfg_axi_addr           // Read or write address to selected target (set upper unused bits to 0)
  , input          cfg_axi_wren           // Set to 1 to write a location, held stable through operation until done=1
  , input   [31:0] cfg_axi_wdata          // Contains write data (valid while wren=1)
  , input          cfg_axi_rden           // Set to 1 to read  a location, held stable through operation until done=1
  , output  [31:0] axi_cfg_rdata          // Contains read data (valid when rden=1 and done=1)
  , output         axi_cfg_done           // AXI logic pulses to 1 for 1 cycle when write is complete, or when rdata contains valid results
  , output   [1:0] axi_cfg_bresp          // Write response from selected AXI4-Lite device
  , output   [1:0] axi_cfg_rresp          // Read  response from selected AXI4-Lite device
  , output   [7:0] axi_cfg_status         // Device Specific status information
  , input          data_expand_enable     // When 1, expand/collapse 4 bytes of data into four, 1 byte AXI operations
  , input          data_expand_dir        // When 0, expand bytes [3:0] in order 0,1,2,3 . When 1, expand in order 3,2,1,0 .  

  , inout          FPGA_FLASH_CE2_L       //         Interface to SPI flash
  , inout          FPGA_FLASH_DQ4         //         Interface to SPI flash
  , inout          FPGA_FLASH_DQ5         //         Interface to SPI flash
  , inout          FPGA_FLASH_DQ6         //         Interface to SPI flash
  , inout          FPGA_FLASH_DQ7         //         Interface to SPI flash
);

// AXI4-Lite signals between Master and Slave(s)
wire  [13:0] s_axi_awaddr; 
wire         s_axi_awvalid;
reg          s_axi_awready; 
wire  [31:0] s_axi_wdata;
wire   [3:0] s_axi_wstrb; 
wire         s_axi_wvalid; 
reg          s_axi_wready;
reg    [1:0] s_axi_bresp;
reg          s_axi_bvalid; 
wire         s_axi_bready; 
wire  [13:0] s_axi_araddr; 
wire         s_axi_arvalid; 
reg          s_axi_arready;
reg   [31:0] s_axi_rdata; 
reg    [1:0] s_axi_rresp; 
reg          s_axi_rvalid;
wire         s_axi_rready;

// Internal signals
wire [4:0] unused;
wire       icap_interrupt;
wire       qspi_interrupt;
wire       preq;
wire       eos;

// External FPGA I/O to FLASH, as dictated by 9V3 card wiring in Alpha Data user manual
//wire EMCCLK_B;            // AJ28 (100 MHz drives SPI FLASH, redrive of REFCLK100M on ping AJ28)
// These wires only exist in simulation
`ifdef CFG_FLASH_SIM
  wire FPGA_FLASH_CE1_L;    // AE8  (9v3 signal name = FPGA_FLASH_CE1_L)
  wire FPGA_FLASH_DQ0;      // AB8  (9v3 signal name = FPGA_FLASH_DQ0)
  wire FPGA_FLASH_DQ1;      // AD8  (9v3 signal name = FPGA_FLASH_DQ1)
  wire FPGA_FLASH_DQ2;      // Y8   (9v3 signal name = FPGA_FLASH_DQ2)
  wire FPGA_FLASH_DQ3;      // AC8  (9v3 signal name = FPGA_FLASH_DQ3)
  wire FPGA_FLASH_CCLK;     // AB10 (9v3 signal name = CCLK)
`endif

// Combine signals into vectors
wire [7:0] spi_dq_i;   
wire [7:0] spi_dq_o;
wire [7:0] spi_dq_t;

// Quad SPI core to STARTUP clock
wire       spi_sck_o;
wire       spi_sck_t;

// Chip selects
wire [0:0] spi_ce1_o;
wire       spi_ce1_t;
wire       spi_ce2_o;
wire       spi_ce2_t;

// Assign status bits and other AXI4-Lite signals to config registers
assign axi_cfg_status[7:4]  = 4'b0;   
assign axi_cfg_status[3]    = qspi_interrupt;
assign axi_cfg_status[2]    = icap_interrupt;
assign axi_cfg_status[1]    = preq;
assign axi_cfg_status[0]    = eos;

//-- assign axi_cfg_bresp        = s_axi_bresp;
//-- assign axi_cfg_rresp        = s_axi_rresp;


// ---------------------------------------------------------------------------------
// Convert CFG registers to AXI4-Lite master interface
// ---------------------------------------------------------------------------------
cfg_reg_to_axi4lite CFG2AXI4L (
    .s_axi_aclk       ( spi_clk         ) // input 
  , .s_axi_aresetn    ( reset_n         ) // input 
    // Configuration register interface
  , .cfg_axi_addr     ( cfg_axi_addr    ) // input   [15:0]
  , .cfg_axi_wren     ( cfg_axi_wren    ) // input 
  , .cfg_axi_wdata    ( cfg_axi_wdata   ) // input   [31:0]
  , .cfg_axi_rden     ( cfg_axi_rden    ) // input          
  , .axi_cfg_rdata    ( axi_cfg_rdata   ) // output  [31:0] 
  , .axi_cfg_done     ( axi_cfg_done    ) // output        
  , .axi_cfg_bresp    ( axi_cfg_bresp   ) // output   [1:0]
  , .axi_cfg_rresp    ( axi_cfg_rresp   ) // output   [1:0] 
//, .axi_cfg_status   ( axi_cfg_status  ) // output   [9:0]  (Pass directly from slaves to config regs)
  , .data_expand_enable ( data_expand_enable ) // input   
  , .data_expand_dir    ( data_expand_dir    ) // input

    // AXI4-Lite interface  (refer to "AMBA AXI and ACE Protocol Specification" from ARM)
  , .s_axi_awaddr     ( s_axi_awaddr    ) // output  [13:0]
  , .s_axi_awvalid    ( s_axi_awvalid   ) // output
  , .s_axi_awready    ( s_axi_awready   ) // input
  , .s_axi_wdata      ( s_axi_wdata     ) // output  [31:0]
  , .s_axi_wstrb      ( s_axi_wstrb     ) // output   [3:0]
  , .s_axi_wvalid     ( s_axi_wvalid    ) // output
  , .s_axi_wready     ( s_axi_wready    ) // input       
  , .s_axi_bresp      ( s_axi_bresp     ) // input    [1:0]
  , .s_axi_bvalid     ( s_axi_bvalid    ) // input
  , .s_axi_bready     ( s_axi_bready    ) // output
  , .s_axi_araddr     ( s_axi_araddr    ) // output  [13:0]
  , .s_axi_arvalid    ( s_axi_arvalid   ) // output
  , .s_axi_arready    ( s_axi_arready   ) // input  
  , .s_axi_rdata      ( s_axi_rdata     ) // input   [31:0]
  , .s_axi_rresp      ( s_axi_rresp     ) // input    [1:0]
  , .s_axi_rvalid     ( s_axi_rvalid    ) // input  
  , .s_axi_rready     ( s_axi_rready    ) // output   
);


// ---------------------------------------------------------------------------------
// Match one master to two slaves
// ---------------------------------------------------------------------------------
// . Most Master -> Slave signals are common, i.e. all Slaves "dot" on the same source
// . Condition AWVALID to each Slave by a unique device select value
// . Signals from Slaves to Master go through MUX based on device select
// . Use 'g' for Gated version of signals dependent on device select value
// . Create N-dimensional arrays (one per Slave) for the signals that are gated
//    (this allows consistency in the naming whether the signal is a bit or a vector)

//re [15:0] g_axi_awaddr  [1:0];    // broadcast
wire        g_axi_awvalid [1:0];    // gated
wire        g_axi_awready [1:0];    // muxed
//re [31:0] g_axi_wdata   [1:0];    // broadcast
//re  [3:0] g_axi_wstrb   [1:0];    // broadcast
wire        g_axi_wvalid  [1:0];    // gated
wire        g_axi_wready  [1:0];    // muxed
wire  [1:0] g_axi_bresp   [1:0];    // muxed
wire        g_axi_bvalid  [1:0];    // muxed
//re        g_axi_bready  [1:0];    // broadcast
//re [15:0] g_axi_araddr  [1:0];    // broadcast
wire        g_axi_arvalid [1:0];    // gated
wire        g_axi_arready [1:0];    // muxed
wire [31:0] g_axi_rdata   [1:0];    // muxed
wire  [1:0] g_axi_rresp   [1:0];    // muxed
wire        g_axi_rvalid  [1:0];    // muxed
//re        g_axi_rready  [1:0];    // broadcast

assign g_axi_awvalid[0] = (cfg_axi_devsel == 2'b00) ? s_axi_awvalid : 1'b0;
assign g_axi_wvalid[0]  = (cfg_axi_devsel == 2'b00) ? s_axi_wvalid  : 1'b0;
assign g_axi_arvalid[0] = (cfg_axi_devsel == 2'b00) ? s_axi_arvalid : 1'b0;

assign g_axi_awvalid[1] = (cfg_axi_devsel == 2'b01) ? s_axi_awvalid : 1'b0;
assign g_axi_wvalid[1]  = (cfg_axi_devsel == 2'b01) ? s_axi_wvalid  : 1'b0;
assign g_axi_arvalid[1] = (cfg_axi_devsel == 2'b01) ? s_axi_arvalid : 1'b0;

always @(*)  // Combinational
  case (cfg_axi_devsel)
    2'b00: begin
             s_axi_awready = g_axi_awready[0];
             s_axi_wready  = g_axi_wready[0];
             s_axi_bresp   = {2{g_axi_bresp[0]}};
             s_axi_bvalid  = g_axi_bvalid[0];
             s_axi_arready = g_axi_arready[0];
             s_axi_rdata   = g_axi_rdata[0];
             s_axi_rresp   = {2{g_axi_rresp[0]}};
             s_axi_rvalid  = g_axi_rvalid[0];
           end
    2'b01: begin
             s_axi_awready = g_axi_awready[1];
             s_axi_wready  = g_axi_wready[1];
             s_axi_bresp   = {2{g_axi_bresp[1]}};
             s_axi_bvalid  = g_axi_bvalid[1];
             s_axi_arready = g_axi_arready[1];
             s_axi_rdata   = g_axi_rdata[1];
             s_axi_rresp   = {2{g_axi_rresp[1]}};
             s_axi_rvalid  = g_axi_rvalid[1];
           end
    default: begin
             s_axi_awready = 1'b0;
             s_axi_wready  = 1'b0;
             s_axi_bresp   = 2'b11;   // DECode ERRor
             s_axi_bvalid  = 1'b0;
             s_axi_arready = 1'b0;
             s_axi_rdata   = 32'h0000_0000;
             s_axi_rresp   = 2'b00;
             s_axi_rvalid  = 1'b0;
           end
  endcase

// ---------------------------------------------------------------------------------
// Xilinx IP: AXI HWICAP (Internal reconfiguration controller, pg134-axi-hwicap.pdf)
// (Per configuration register definition, this is devsel=2'b01 )
// ---------------------------------------------------------------------------------
// You must compile the wrapper file axi_hwicap_0.v when simulating
// the core, axi_hwicap_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.
axi_hwicap_0 ICAP (
    .icap_clk       ( icap_clk           ) // input (max freq = 100 MHz, pg134-axi-hwicap.pdf)
  , .eos_in         ( eos                ) // input
  , .s_axi_aclk     ( spi_clk            ) // input
  , .s_axi_aresetn  ( reset_n            ) // input (active low)
  , .s_axi_awaddr   ( s_axi_awaddr[8:0]  ) // input [8:0]
  , .s_axi_awvalid  ( g_axi_awvalid[1]   ) // input 
  , .s_axi_awready  ( g_axi_awready[1]   ) // output 
  , .s_axi_wdata    ( s_axi_wdata        ) // input 
  , .s_axi_wstrb    ( s_axi_wstrb        ) // input [3:0]
  , .s_axi_wvalid   ( g_axi_wvalid[1]    ) // input
  , .s_axi_wready   ( g_axi_wready[1]    ) // output
  , .s_axi_bresp    ( g_axi_bresp[1]     ) // output [1:0]
  , .s_axi_bvalid   ( g_axi_bvalid[1]    ) // output
  , .s_axi_bready   ( s_axi_bready       ) // input
  , .s_axi_araddr   ( s_axi_araddr[8:0]  ) // input [8:0]
  , .s_axi_arvalid  ( g_axi_arvalid[1]   ) // input
  , .s_axi_arready  ( g_axi_arready[1]   ) // output 
  , .s_axi_rdata    ( g_axi_rdata[1]     ) // output [31:0]
  , .s_axi_rresp    ( g_axi_rresp[1]     ) // output [1:0]
  , .s_axi_rvalid   ( g_axi_rvalid[1]    ) // output
  , .s_axi_rready   ( s_axi_rready       ) // input
  , .ip2intc_irpt   ( icap_interrupt     ) // output
);

   
// ------------------------------------------------------------------
// Xilinx IP: axi_qu s_axi_rresp  ad_spi (FLASH controller, pg153-axi-quad-spi.pdf)
// (Per configuration register definition, this is devsel=2'b00 )
// ------------------------------------------------------------------
// Xilinx IP note: You must compile the wrapper file axi_quad_spi_0.v when simulating
// the core, axi_quad_spi_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.
axi_quad_spi_0 QSPI (
    .ext_spi_clk    ( spi_clk            ) // input 
  , .s_axi_aclk     ( spi_clk            ) // input 
  , .s_axi_aresetn  ( reset_n            ) // input (active low)
     // AXI_LITE
  , .s_axi_awaddr   ( s_axi_awaddr[6:0]  ) // input [6:0]
  , .s_axi_awvalid  ( g_axi_awvalid[0]   ) // input 
  , .s_axi_awready  ( g_axi_awready[0]   ) // output
  , .s_axi_wdata    ( s_axi_wdata        ) // input 
  , .s_axi_wstrb    ( s_axi_wstrb        ) // input [3:0]
  , .s_axi_wvalid   ( g_axi_wvalid[0]    ) // input
  , .s_axi_wready   ( g_axi_wready[0]    ) // output
  , .s_axi_bresp    ( g_axi_bresp[0]     ) // output [1:0]
  , .s_axi_bvalid   ( g_axi_bvalid[0]    ) // output
  , .s_axi_bready   ( s_axi_bready       ) // input
  , .s_axi_araddr   ( s_axi_araddr[6:0]  ) // input [6:0]
  , .s_axi_arvalid  ( g_axi_arvalid[0]   ) // input 
  , .s_axi_arready  ( g_axi_arready[0]   ) // output
  , .s_axi_rdata    ( g_axi_rdata[0]     ) // output [31:0]
  , .s_axi_rresp    ( g_axi_rresp[0]     ) // output [1:0]
  , .s_axi_rvalid   ( g_axi_rvalid[0]    ) // output 
  , .s_axi_rready   ( s_axi_rready       ) // input
     // SPI_0_TO_STARTUP (Route to dedicated Configuration pins on FPGA)
  , .io0_i          ( spi_dq_i[0]        )  // input 
  , .io0_o          ( spi_dq_o[0]        )  // output 
  , .io0_t          ( spi_dq_t[0]        )  // output 
  , .io1_i          ( spi_dq_i[1]        )  // input 
  , .io1_o          ( spi_dq_o[1]        )  // output 
  , .io1_t          ( spi_dq_t[1]        )  // output 
  , .io2_i          ( spi_dq_i[2]        )  // input 
  , .io2_o          ( spi_dq_o[2]        )  // output 
  , .io2_t          ( spi_dq_t[2]        )  // output 
  , .io3_i          ( spi_dq_i[3]        )  // input
  , .io3_o          ( spi_dq_o[3]        )  // output 
  , .io3_t          ( spi_dq_t[3]        )  // output 
  , .sck_i          ( spi_sck_o          )  // input  (wrap output clock back as input, not used in master mode of Dual Quad SPI anyway)
  , .sck_o          ( spi_sck_o          )  // output 
  , .sck_t          ( spi_sck_t          )  // output 
  , .ss_i           ( 1'b0               )  // input  (unused by core) 
  , .ss_o           ( spi_ce1_o          )  // output [0:0]  (single bit vector)
  , .ss_t           ( spi_ce1_t          )  // output 
     // SPI_1 (Route to User I/O pins, so need to be constrainted to only be used for configuration)
  , .io0_1_i        ( spi_dq_i[4]        )  // input 
  , .io0_1_o        ( spi_dq_o[4]        )  // output 
  , .io0_1_t        ( spi_dq_t[4]        )  // output 
  , .io1_1_i        ( spi_dq_i[5]        )  // input 
  , .io1_1_o        ( spi_dq_o[5]        )  // output 
  , .io1_1_t        ( spi_dq_t[5]        )  // output 
  , .io2_1_i        ( spi_dq_i[6]        )  // input 
  , .io2_1_o        ( spi_dq_o[6]        )  // output 
  , .io2_1_t        ( spi_dq_t[6]        )  // output 
  , .io3_1_i        ( spi_dq_i[7]        )  // input 
  , .io3_1_o        ( spi_dq_o[7]        )  // output 
  , .io3_1_t        ( spi_dq_t[7]        )  // output 
  , .ss_1_i         ( 1'b0               )  // input  (unused by core)
  , .ss_1_o         ( spi_ce2_o          )  // output 
  , .ss_1_t         ( spi_ce2_t          )  // output 
     // Misc
  , .ip2intc_irpt   ( qspi_interrupt     )  // output
);
assign spi_clk_div_2 = spi_sck_o;           // Pass clock going to STARTUP upwards so it can be used as ICAP clock

// In synthesis and implementation (when CFG_FLASH_SIM is NOT defined, thus ifndef vs ifdef), use the real
// STARTUPE3 block to interface to the 1st FLASH device.
`ifndef CFG_FLASH_SIM

STARTUPE3 #(
   .PROG_USR      ( "FALSE" ),  // Activate program event security feature. Requires encrypted bitstreams.
   .SIM_CCLK_FREQ ( 10.0    )   // (100 MHz) Set the Configuration Clock Frequency (ns) for simulation
   )
   STARTUP (
     .CFGCLK    ( unused[0]     ) // 1-bit output: Configuration main clock output 
                                  //  (active during configuration and during Master modes w/persist set)
   , .CFGMCLK   ( unused[1]     ) // 1-bit output: Configuration internal oscillator clock output (internally FPGA generated config clk)
   , .DI        ( spi_dq_i[3:0] ) // 4-bit output: Allow receiving on the D input pin
   , .EOS       ( eos           ) // 1-bit output: Active-High output signal indicating the End Of Startup
   , .PREQ      ( preq          ) // 1-bit output: PROGRAM request to fabric output (when 0, indicates programming is underway)
   , .DO        ( spi_dq_o[3:0] ) // 4-bit input: Allows control of the D pin output
   , .DTS       ( spi_dq_t[3:0] ) // 4-bit input: Allows tristate of the D pin
   , .FCSBO     ( spi_ce1_o     ) // 1-bit input: Controls the FCS_B pin for flash access
   , .FCSBTS    ( spi_ce1_t     ) // 1-bit input: Tristate the FCS_B pin
   , .GSR       ( 1'b0          ) // 1-bit input: Global Set/Reset input (0 = disable)
   , .GTS       ( 1'b0          ) // 1-bit input: Global 3-state   input (0 = disable)
   , .KEYCLEARB ( 1'b1          ) // 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM) (1 = disable)
   , .PACK      ( 1'b0          ) // 1-bit input: PROGRAM acknowledge input (0 = always acknowledge PROGRAM_B or PROGRAM cmd)
   , .USRCCLKO  ( spi_sck_o     ) // 1-bit input: User CCLK input (quad SPI core supplies SPI config clock)
   , .USRCCLKTS ( spi_sck_t     ) // 1-bit input: User CCLK 3-state enable input (0 = drive (not tristate) FPGA CCLK pin)
   , .USRDONEO  ( 1'b1          ) // 1-bit input: User DONE pin output control (Alway set DONE = 1 to let Start-Up seqr proceed)
   , .USRDONETS ( 1'b0          )  // 1-bit input: User DONE 3-state enable output (0 = always drive (not tristate) FPGA DONE pin)
);
`endif

// In simulation (CFG_FLASH_SIM is defined, thus ifdef), remove the STARTUP block since a Xilinx change request (CR-952768) 
// indicates this block won't simulate correctly. Instead use IOBUFs to connect the Quad SPI signals directly to 
// the 1st FLASH just like the 2nd FLASH is connected.
//
// "The Startup model is not supposed to be used as a replacment for the entire configuration block. All this represents
// is the STARTUP so all you will see are the Global signals on it. Now the way the silicon works is that there are no
// physical connections for this that the customer connects up. In order to mimic this behavior we have decided to use the
// global signals. This CR as it is filed is not a bug, this is not what this block is designed for."
`ifdef CFG_FLASH_SIM

// When tri-state control = 0, drive to FLASH. When = 1, set to tri-state (Z). 

IOBUF IOBUF_CCLK (
    .O  ( unused[2]       )  // 1-bit output: Buffer output
  , .I  ( spi_sck_o       )  // 1-bit input: Buffer input
  , .IO ( FPGA_FLASH_CCLK )  // 1-bit inout: Buffer inout (connect directly to top-level port)
  , .T  ( spi_sck_t       )  // 1-bit input: 3-state enable input (0=drive, 1=tri-state)
);

  IOBUF IOBUF_DQ3 (
      .O  ( spi_dq_i[3]    )  // 1-bit output: Buffer output
    , .I  ( spi_dq_o[3]    )  // 1-bit input: Buffer input
    , .IO ( FPGA_FLASH_DQ3 )  // 1-bit inout: Buffer inout (connect directly to top-level port)
    , .T  ( spi_dq_t[3]    )  // 1-bit input: 3-state enable input (0=drive, 1=tri-state)
  );

// Drive to Z when TS=1 (tristate is active)
//assign FPGA_FLASH_DQ3 = (spi_dq_t[3] == 1'b0) ? spi_dq_o[3] : 1'bz;
//assign spi_dq_i[3] = FPGA_FLASH_DQ3;



IOBUF IOBUF_DQ2 (
    .O  ( spi_dq_i[2]    )  // 1-bit output: Buffer output
  , .I  ( spi_dq_o[2]    )  // 1-bit input: Buffer input
  , .IO ( FPGA_FLASH_DQ2 )  // 1-bit inout: Buffer inout (connect directly to top-level port)
  , .T  ( spi_dq_t[2]    )  // 1-bit input: 3-state enable input (0=drive, 1=tri-state)
);

IOBUF IOBUF_DQ1 (
    .O  ( spi_dq_i[1]    )  // 1-bit output: Buffer output
  , .I  ( spi_dq_o[1]    )  // 1-bit input: Buffer input
  , .IO ( FPGA_FLASH_DQ1 )  // 1-bit inout: Buffer inout (connect directly to top-level port)
  , .T  ( spi_dq_t[1]    )  // 1-bit input: 3-state enable input (0=drive, 1=tri-state)
);

IOBUF IOBUF_DQ0 (
    .O  ( spi_dq_i[0]    )  // 1-bit output: Buffer output
  , .I  ( spi_dq_o[0]    )  // 1-bit input: Buffer input
  , .IO ( FPGA_FLASH_DQ0 )  // 1-bit inout: Buffer inout (connect directly to top-level port)
  , .T  ( spi_dq_t[0]    )  // 1-bit input: 3-state enable input (0=drive, 1=tri-state)
);

IOBUF IOBUF_CE1 (
    .O  ( unused[3]        )  // 1-bit output: Buffer output
  , .I  ( spi_ce1_o        )  // 1-bit input: Buffer input
  , .IO ( FPGA_FLASH_CE1_L )  // 1-bit inout: Buffer inout (connect directly to top-level port)
  , .T  ( spi_ce1_o        )  // 1-bit input: 3-state enable input (0=drive, 1=tri-state)
);

`endif


// Second SPI interface
// Because the I/O that connects the SPI_0 is dedicated configuration only I/O (are not accessible via normal routing 
// and do not have visible I/O blocks) they are accessed via the STARTUPE3 block.  So Yes the SPI_0 is connected to 
// the STARTUPE3 block.  But because the pins dedicated to the 2nd SPI device of a dual quad SPI interface go specific 
// shared configuration / general purpose I/O.  The SPI_1 controller logic connects to specific regular I/O pins listed 
// below.  These pin are controlled by the configuration logic while the device is performing a configuration load, 
// then they become user I/O Bank 65.
// 
// So the SPI_0 device interface ports connect to the STARTUPE3 block, and the SP_1 device interface ports goes to 
// regular I/O but constrained to these specific pins below.
//
// AV30  IO_L2N_T0L_N3_FWE_FCS2_B_65
// AG30  IO_L22N_T3U_N7_DBC_AD0N_D05_65
// AF30  IO_L22P_T3U_N6_DBC_AD0P_D04_65
// AG28  IO_L21N_T3L_N5_AD8N_D07_65
// AF28  IO_L21P_T3L_N4_AD8P_D06_65
//
// See https://www.xilinx.com/support/documentation/user_guides/ug570-ultrascale-configuration.pdf table 2-5.

// When tri-state control = 0, drive to FLASH. When = 1, set to tri-state (Z). 

IOBUF IOBUF_DQ7 (
    .O  ( spi_dq_i[7]    )  // 1-bit output: Buffer output
  , .I  ( spi_dq_o[7]    )  // 1-bit input: Buffer input
  , .IO ( FPGA_FLASH_DQ7 )  // 1-bit inout: Buffer inout (connect directly to top-level port)
  , .T  ( spi_dq_t[7]    )  // 1-bit input: 3-state enable input (0=drive, 1=tri-state)
);

IOBUF IOBUF_DQ6 (
    .O  ( spi_dq_i[6]    )  // 1-bit output: Buffer output
  , .I  ( spi_dq_o[6]    )  // 1-bit input: Buffer input
  , .IO ( FPGA_FLASH_DQ6 )  // 1-bit inout: Buffer inout (connect directly to top-level port)
  , .T  ( spi_dq_t[6]    )  // 1-bit input: 3-state enable input (0=drive, 1=tri-state)
);

IOBUF IOBUF_DQ5 (
    .O  ( spi_dq_i[5]    )  // 1-bit output: Buffer output
  , .I  ( spi_dq_o[5]    )  // 1-bit input: Buffer input
  , .IO ( FPGA_FLASH_DQ5 )  // 1-bit inout: Buffer inout (connect directly to top-level port)
  , .T  ( spi_dq_t[5]    )  // 1-bit input: 3-state enable input (0=drive, 1=tri-state)
);

IOBUF IOBUF_DQ4 (
    .O  ( spi_dq_i[4]    )  // 1-bit output: Buffer output
  , .I  ( spi_dq_o[4]    )  // 1-bit input: Buffer input
  , .IO ( FPGA_FLASH_DQ4 )  // 1-bit inout: Buffer inout (connect directly to top-level port)
  , .T  ( spi_dq_t[4]    )  // 1-bit input: 3-state enable input (0=drive, 1=tri-state)
);

IOBUF IOBUF_CE2 (
    .O  ( unused[4]        )  // 1-bit output: Buffer output
  , .I  ( spi_ce2_o        )  // 1-bit input: Buffer input
  , .IO ( FPGA_FLASH_CE2_L )  // 1-bit inout: Buffer inout (connect directly to top-level port)
  , .T  ( spi_ce2_t        )  // 1-bit input: 3-state enable input (0=drive, 1=tri-state)
);


// Add pull ups per Fig 2-5 'Master SPI Dual Quad (x8) Configuration Interface Example) in ug570-ultrascale-configuration.pdf 
// These wires only exist in simulation
`ifdef CFG_FLASH_SIM
  pullup(FPGA_FLASH_DQ3); 
  pullup(FPGA_FLASH_DQ2); 
  pullup(FPGA_FLASH_CE1_L); 
`endif
pullup(FPGA_FLASH_DQ7); 
pullup(FPGA_FLASH_DQ6); 
pullup(FPGA_FLASH_CE2_L); 


// When used in a simulation model, include the FLASH devices. When doing Vivado implementation, remove them.
`ifdef CFG_FLASH_SIM
  // --------------------------------------------------------------------------------------------
  // Micron FLASH memory 1 (Quad SPI interface, Micron MT25QU256ABA8E12-1SIT ~= N25Q256A11E1240x)
  // --------------------------------------------------------------------------------------------

  N25Qxxx FLASH_1(
      .S         ( FPGA_FLASH_CE1_L ) // input  chip select (active low)
    , .C_        ( FPGA_FLASH_CCLK  ) // input  clock (cmds captured on rising edge, data output on falling edge) 
    , .RESET_DQ3 ( FPGA_FLASH_DQ3   ) // inout  input RESET, inout DQ3
    , .DQ0       ( FPGA_FLASH_DQ0   ) // inout
    , .DQ1       ( FPGA_FLASH_DQ1   ) // inout
    , .Vcc       ( 32'h0000_0708    ) // input [31:0] DevParam.h sets 'VCC_1e8V', so expect > d1700 (h6A4) to operate so use 1.8 mV (h708)
    , .Vpp_W_DQ2 ( FPGA_FLASH_DQ2   ) // input  input Vpp_W, inout DQ2 (VPPH not implemented)
  );


  // --------------------------------------------------------------------------------------------
  // Micron FLASH memory 2 (Quad SPI interface, Micron MT25QU256ABA8E12-1SIT ~= N25Q256A11E1240x)
  // --------------------------------------------------------------------------------------------

  N25Qxxx FLASH_2(
      .S         ( FPGA_FLASH_CE2_L ) // input
    , .C_        ( FPGA_FLASH_CCLK  ) // input  clock (cmds captured on rising edge, data output on falling edge)
    , .RESET_DQ3 ( FPGA_FLASH_DQ7   ) // inout  input RESET, inout DQ3
    , .DQ0       ( FPGA_FLASH_DQ4   ) // inout
    , .DQ1       ( FPGA_FLASH_DQ5   ) // inout
    , .Vcc       ( 32'h0000_0708    ) // input [31:0] DevParam.h sets 'VCC_1e8V', so expect > d1700 (h6A4) to operate so use 1.8 mV (h708)
    , .Vpp_W_DQ2 ( FPGA_FLASH_DQ6   ) // input  input Vpp_W, inout DQ2 (VPPH not implemented)
  );
`endif


endmodule 
