// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : apb_subsystem_0.v
//Title       : 
//Created     : 1999
//Description : 
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

module apb_subsystem_0(
    // AHB interface
    hclk,
    n_hreset,
    hsel,
    haddr,
    htrans,
    hsize,
    hwrite,
    hwdata,
    hready_in,
    hburst,
    hprot,
    hmaster,
    hmastlock,
    hrdata,
    hready,
    hresp,
    
    // APB system interface
    pclk,
    n_preset,
    
    // SPI ports
    n_ss_in,
    mi,
    si,
    sclk_in,
    so,
    mo,
    sclk_out,
    n_ss_out,
    n_so_en,
    n_mo_en,
    n_sclk_en,
    n_ss_en,
    
    //UART0 ports
    ua_rxd,
    ua_ncts,
    ua_txd,
    ua_nrts,
    
    //UART1 ports
    ua_rxd1,
    ua_ncts1,
    ua_txd1,
    ua_nrts1,
    
    //GPIO ports
    gpio_pin_in,
    n_gpio_pin_oe,
    gpio_pin_out,
    

    //SMC ports
    smc_hclk,
    smc_n_hclk,
    smc_haddr,
    smc_htrans,
    smc_hsel,
    smc_hwrite,
    smc_hsize,
    smc_hwdata,
    smc_hready_in,
    smc_hburst,
    smc_hprot,
    smc_hmaster,
    smc_hmastlock,
    smc_hrdata, 
    smc_hready,
    smc_hresp,
    smc_n_ext_oe,
    smc_data,
    smc_addr,
    smc_n_be,
    smc_n_cs, 
    smc_n_we,
    smc_n_wr,
    smc_n_rd,
    data_smc,
    
    //PMC ports
    clk_SRPG_macb0_en,
    clk_SRPG_macb1_en,
    clk_SRPG_macb2_en,
    clk_SRPG_macb3_en,
    core06v,
    core08v,
    core10v,
    core12v,
    macb3_wakeup,
    macb2_wakeup,
    macb1_wakeup,
    macb0_wakeup,
    mte_smc_start,
    mte_uart_start,
    mte_smc_uart_start,  
    mte_pm_smc_to_default_start, 
    mte_pm_uart_to_default_start,
    mte_pm_smc_uart_to_default_start,
    
    
    // Peripheral inerrupts
    pcm_irq,
    ttc_irq,
    gpio_irq,
    uart0_irq,
    uart1_irq,
    spi_irq,
    DMA_irq,      
    macb0_int,
    macb1_int,
    macb2_int,
    macb3_int,
   
    // Scan ports
    scan_en,      // Scan enable pin
    scan_in_1,    // Scan input for first chain
    scan_in_2,    // Scan input for second chain
    scan_mode,
    scan_out_1,   // Scan out for chain 1
    scan_out_2    // Scan out for chain 2
);

parameter GPIO_WIDTH = 16;        // GPIO width
parameter P_SIZE =   8;              // number of peripheral select lines
parameter NO_OF_IRQS  = 17;      //No of irqs read by apic 

// AHB interface
input         hclk;     // AHB Clock
input         n_hreset;  // AHB reset - Active low
input         hsel;     // AHB2APB select
input [31:0]  haddr;    // Address bus
input [1:0]   htrans;   // Transfer type
input [2:0]   hsize;    // AHB Access type - byte, half-word, word
input [31:0]  hwdata;   // Write data
input         hwrite;   // Write signal/
input         hready_in;// Indicates that last master has finished bus access
input [2:0]   hburst;     // Burst type
input [3:0]   hprot;      // Protection control
input [3:0]   hmaster;    // Master select
input         hmastlock;  // Locked transfer
output [31:0] hrdata;       // Read data provided from target slave
output        hready;       // Ready for new bus cycle from target slave
output [1:0]  hresp;       // Response from the bridge
    
// APB system interface
input         pclk;     // APB Clock. 
input         n_preset;  // APB reset - Active low
   
// SPI ports
input     n_ss_in;      // select input to slave
input     mi;           // data input to master
input     si;           // data input to slave
input     sclk_in;      // clock input to slave
output    so;                    // data output from slave
output    mo;                    // data output from master
output    sclk_out;              // clock output from master
output [P_SIZE-1:0] n_ss_out;    // peripheral select lines from master
output    n_so_en;               // out enable for slave data
output    n_mo_en;               // out enable for master data
output    n_sclk_en;             // out enable for master clock
output    n_ss_en;               // out enable for master peripheral lines

//UART0 ports
input        ua_rxd;       // UART receiver serial input pin
input        ua_ncts;      // Clear-To-Send flow control
output       ua_txd;       	// UART transmitter serial output
output       ua_nrts;      	// Request-To-Send flow control

// UART1 ports   
input        ua_rxd1;      // UART receiver serial input pin
input        ua_ncts1;      // Clear-To-Send flow control
output       ua_txd1;       // UART transmitter serial output
output       ua_nrts1;      // Request-To-Send flow control

//GPIO ports
input [GPIO_WIDTH-1:0]      gpio_pin_in;             // input data from pin
output [GPIO_WIDTH-1:0]     n_gpio_pin_oe;           // output enable signal to pin
output [GPIO_WIDTH-1:0]     gpio_pin_out;            // output signal to pin
  
//SMC ports
input        smc_hclk;
input        smc_n_hclk;
input [31:0] smc_haddr;
input [1:0]  smc_htrans;
input        smc_hsel;
input        smc_hwrite;
input [2:0]  smc_hsize;
input [31:0] smc_hwdata;
input        smc_hready_in;
input [2:0]  smc_hburst;     // Burst type
input [3:0]  smc_hprot;      // Protection control
input [3:0]  smc_hmaster;    // Master select
input        smc_hmastlock;  // Locked transfer
input [31:0] data_smc;     // EMI(External memory) read data
output [31:0]    smc_hrdata;
output           smc_hready;
output [1:0]     smc_hresp;
output [15:0]    smc_addr;      // External Memory (EMI) address
output [3:0]     smc_n_be;      // EMI byte enables (Active LOW)
output           smc_n_cs;      // EMI Chip Selects (Active LOW)
output [3:0]     smc_n_we;      // EMI write strobes (Active LOW)
output           smc_n_wr;      // EMI write enable (Active LOW)
output           smc_n_rd;      // EMI read stobe (Active LOW)
output           smc_n_ext_oe;  // EMI write data output enable
output [31:0]    smc_data;      // EMI write data
       
//PMC ports
output clk_SRPG_macb0_en;
output clk_SRPG_macb1_en;
output clk_SRPG_macb2_en;
output clk_SRPG_macb3_en;
output core06v;
output core08v;
output core10v;
output core12v;
output mte_smc_start;
output mte_uart_start;
output mte_smc_uart_start;  
output mte_pm_smc_to_default_start; 
output mte_pm_uart_to_default_start;
output mte_pm_smc_uart_to_default_start;
input macb3_wakeup;
input macb2_wakeup;
input macb1_wakeup;
input macb0_wakeup;
    

// Peripheral interrupts
output pcm_irq;
output [2:0] ttc_irq;
output gpio_irq;
output uart0_irq;
output uart1_irq;
output spi_irq;
input        macb0_int;
input        macb1_int;
input        macb2_int;
input        macb3_int;
input        DMA_irq;
  
//Scan ports
input        scan_en;    // Scan enable pin
input        scan_in_1;  // Scan input for first chain
input        scan_in_2;  // Scan input for second chain
input        scan_mode;  // test mode pin
 output        scan_out_1;   // Scan out for chain 1
 output        scan_out_2;   // Scan out for chain 2  

//------------------------------------------------------------------------------
// if the ROM subsystem is NOT black boxed 
//------------------------------------------------------------------------------
`ifndef FV_KIT_BLACK_BOX_APB_SUBSYSTEM
   
   wire        hsel; 
   wire        pclk;
   wire        n_preset;
   wire [31:0] prdata_spi;
   wire [31:0] prdata_uart0;
   wire [31:0] prdata_gpio;
   wire [31:0] prdata_ttc;
   wire [31:0] prdata_smc;
   wire [31:0] prdata_pmc;
   wire [31:0] prdata_uart1;
   wire        pready_spi;
   wire        pready_uart0;
   wire        pready_uart1;
   wire        tie_hi_bit;
   wire  [31:0] hrdata; 
   wire         hready;
   wire         hready_in;
   wire  [1:0]  hresp;   
   wire  [31:0] pwdata;  
   wire         pwrite;
   wire  [31:0] paddr;  
   wire   psel_spi;
   wire   psel_uart0;
   wire   psel_gpio;
   wire   psel_ttc;
   wire   psel_smc;
   wire   psel07;
   wire   psel08;
   wire   psel09;
   wire   psel10;
   wire   psel11;
   wire   psel12;
   wire   psel_pmc;
   wire   psel_uart1;
   wire   penable;
   wire   [NO_OF_IRQS:0] int_source;     // System Interrupt Sources
   wire [1:0]             smc_hresp;     // AHB Response signal
   wire                   smc_valid;     // Ack valid address

  //External memory interface (EMI)
  wire [31:0]            smc_addr_int;  // External Memory (EMI) address
  wire [3:0]             smc_n_be;      // EMI byte enables (Active LOW)
  wire                   smc_n_cs;      // EMI Chip Selects (Active LOW)
  wire [3:0]             smc_n_we;      // EMI write strobes (Active LOW)
  wire                   smc_n_wr;      // EMI write enable (Active LOW)
  wire                   smc_n_rd;      // EMI read stobe (Active LOW)
 
  //AHB Memory Interface Control
  wire                   smc_hsel_int;
  wire                   smc_busy;      // smc busy
   

//scan signals

   wire                scan_in_1;        //scan input
   wire                scan_in_2;        //scan input
   wire                scan_en;         //scan enable
   wire                scan_out_1;       //scan output
   wire                scan_out_2;       //scan output
   wire                byte_sel;     // byte select from bridge 1=byte, 0=2byte
   wire                UART_int;     // UART module interrupt 
   wire                ua_uclken;    // Soft control of clock
   wire                UART_int1;     // UART module interrupt 
   wire                ua_uclken1;    // Soft control of clock
   wire  [3:1]         TTC_int;            //Interrupt from PCI 
  // inputs to SPI 
   wire    ext_clk;                // external clock
   wire    SPI_int;             // interrupt request
  // outputs from SPI
   wire    slave_out_clk;         // modified slave clock output
 // gpio generic inputs 
   wire  [GPIO_WIDTH-1:0]   n_gpio_bypass_oe;        // bypass mode enable 
   wire  [GPIO_WIDTH-1:0]   gpio_bypass_out;         // bypass mode output value 
   wire  [GPIO_WIDTH-1:0]   tri_state_enable;   // disables op enable -> z 
 // outputs 
   //amba outputs 
   // gpio generic outputs 
   wire       GPIO_int;                // gpio_interupt for input pin change 
   wire [GPIO_WIDTH-1:0]     gpio_bypass_in;          // bypass mode input data value  
                
   wire           cpu_debug;        // Inhibits watchdog counter 
   wire            ex_wdz_n;         // External Watchdog zero indication
   wire           rstn_non_srpg_smc; 
   wire           rstn_non_srpg_urt;
   wire           isolate_smc;
   wire           save_edge_smc;
   wire           restore_edge_smc;
   wire           save_edge_urt;
   wire           restore_edge_urt;
   wire           pwr1_on_smc;
   wire           pwr2_on_smc;
   wire           pwr1_on_urt;
   wire           pwr2_on_urt;
   // ETH0
   wire            rstn_non_srpg_macb0;
   wire            gate_clk_macb0;
   wire            isolate_macb0;
   wire            save_edge_macb0;
   wire            restore_edge_macb0;
   wire            pwr1_on_macb0;
   wire            pwr2_on_macb0;
   // ETH1
   wire            rstn_non_srpg_macb1;
   wire            gate_clk_macb1;
   wire            isolate_macb1;
   wire            save_edge_macb1;
   wire            restore_edge_macb1;
   wire            pwr1_on_macb1;
   wire            pwr2_on_macb1;
   // ETH2
   wire            rstn_non_srpg_macb2;
   wire            gate_clk_macb2;
   wire            isolate_macb2;
   wire            save_edge_macb2;
   wire            restore_edge_macb2;
   wire            pwr1_on_macb2;
   wire            pwr2_on_macb2;
   // ETH3
   wire            rstn_non_srpg_macb3;
   wire            gate_clk_macb3;
   wire            isolate_macb3;
   wire            save_edge_macb3;
   wire            restore_edge_macb3;
   wire            pwr1_on_macb3;
   wire            pwr2_on_macb3;


   wire           pclk_SRPG_smc;
   wire           pclk_SRPG_urt;
   wire           gate_clk_smc;
   wire           gate_clk_urt;
   wire  [31:0]   tie_lo_32bit; 
   wire  [1:0]	  tie_lo_2bit;
   wire  	  tie_lo_1bit;
   wire           pcm_macb_wakeup_int;
   wire           int_source_h;
   wire           isolate_mem;

assign pcm_irq = pcm_macb_wakeup_int;
assign ttc_irq[2] = TTC_int[3];
assign ttc_irq[1] = TTC_int[2];
assign ttc_irq[0] = TTC_int[1];
assign gpio_irq = GPIO_int;
assign uart0_irq = UART_int;
assign uart1_irq = UART_int1;
assign spi_irq = SPI_int;

assign n_mo_en   = 1'b0;
assign n_so_en   = 1'b1;
assign n_sclk_en = 1'b0;
assign n_ss_en   = 1'b0;

assign smc_hsel_int = smc_hsel;
  assign ext_clk  = 1'b0;
  assign int_source = {macb0_int,macb1_int, macb2_int, macb3_int,1'b0, pcm_macb_wakeup_int, 1'b0, 1'b0, 1'b0, 1'b0, TTC_int, GPIO_int, UART_int, UART_int1, SPI_int, DMA_irq};

  // interrupt even detect .
  // for sleep wake up -> any interrupt even and system not in hibernation (isolate_mem = 0)
  // for hibernate wake up -> gpio interrupt even and system in the hibernation (isolate_mem = 1)
  assign int_source_h =  ((|int_source) && (!isolate_mem)) || (isolate_mem && GPIO_int) ;

  assign byte_sel = 1'b1;
  assign tie_hi_bit = 1'b1;

  assign smc_addr = smc_addr_int[15:0];



  assign  n_gpio_bypass_oe = {GPIO_WIDTH{1'b0}};        // bypass mode enable 
  assign  gpio_bypass_out  = {GPIO_WIDTH{1'b0}};
  assign  tri_state_enable = {GPIO_WIDTH{1'b0}};
  assign  cpu_debug = 1'b0;
  assign  tie_lo_32bit = 32'b0;
  assign  tie_lo_2bit  = 2'b0;
  assign  tie_lo_1bit  = 1'b0;


ahb2apb #(
  32'h00800000, // Slave 0 Address Range
  32'h0080FFFF,

  32'h00810000, // Slave 1 Address Range
  32'h0081FFFF,

  32'h00820000, // Slave 2 Address Range 
  32'h0082FFFF,

  32'h00830000, // Slave 3 Address Range
  32'h0083FFFF,

  32'h00840000, // Slave 4 Address Range
  32'h0084FFFF,

  32'h00850000, // Slave 5 Address Range
  32'h0085FFFF,

  32'h00860000, // Slave 6 Address Range
  32'h0086FFFF,

  32'h00870000, // Slave 7 Address Range
  32'h0087FFFF,

  32'h00880000, // Slave 8 Address Range
  32'h0088FFFF
) i_ahb2apb (
     // AHB interface
    .hclk(hclk),         
    .hreset_n(n_hreset), 
    .hsel(hsel), 
    .haddr(haddr),        
    .htrans(htrans),       
    .hwrite(hwrite),       
    .hwdata(hwdata),       
    .hrdata(hrdata),   
    .hready(hready),   
    .hresp(hresp),     
    
     // APB interface
    .pclk(pclk),         
    .preset_n(n_preset),  
    .prdata0(prdata_spi),
    .prdata1(prdata_uart0), 
    .prdata2(prdata_gpio),  
    .prdata3(prdata_ttc),   
    .prdata4(32'h0),   
    .prdata5(prdata_smc),   
    .prdata6(prdata_pmc),    
    .prdata7(32'h0),   
    .prdata8(prdata_uart1),  
    .pready0(pready_spi),     
    .pready1(pready_uart0),   
    .pready2(tie_hi_bit),     
    .pready3(tie_hi_bit),     
    .pready4(tie_hi_bit),     
    .pready5(tie_hi_bit),     
    .pready6(tie_hi_bit),     
    .pready7(tie_hi_bit),     
    .pready8(pready_uart1),  
    .pwdata(pwdata),       
    .pwrite(pwrite),       
    .paddr(paddr),        
    .psel0(psel_spi),     
    .psel1(psel_uart0),   
    .psel2(psel_gpio),    
    .psel3(psel_ttc),     
    .psel4(),     
    .psel5(psel_smc),     
    .psel6(psel_pmc),    
    .psel7(psel_apic),   
    .psel8(psel_uart1),  
    .penable(penable)     
);

spi_top i_spi
(
  // Wishbone signals
  .wb_clk_i(pclk), 
  .wb_rst_i(~n_preset), 
  .wb_adr_i(paddr[4:0]), 
  .wb_dat_i(pwdata), 
  .wb_dat_o(prdata_spi), 
  .wb_sel_i(4'b1111),    // SPI register accesses are always 32-bit
  .wb_we_i(pwrite), 
  .wb_stb_i(psel_spi), 
  .wb_cyc_i(psel_spi), 
  .wb_ack_o(pready_spi), 
  .wb_err_o(), 
  .wb_int_o(SPI_int),

  // SPI signals
  .ss_pad_o(n_ss_out), 
  .sclk_pad_o(sclk_out), 
  .mosi_pad_o(mo), 
  .miso_pad_i(mi)
);

// Opencores UART instances
wire ua_nrts_int;
wire ua_nrts1_int;

assign ua_nrts = ua_nrts_int;
assign ua_nrts1 = ua_nrts1_int;

reg [3:0] uart0_sel_i;
reg [3:0] uart1_sel_i;
// UART registers are all 8-bit wide, and their addresses
// are on byte boundaries. So to access them on the
// Wishbone bus, the CPU must do byte accesses to these
// byte addresses. Word address accesses are not possible
// because the word addresses will be unaligned, and cause
// a fault.
// So, Uart accesses from the CPU will always be 8-bit size
// We only have to decide which byte of the 4-byte word the
// CPU is interested in.
`ifdef SYSTEM_BIG_ENDIAN
always @(paddr) begin
  case (paddr[1:0])
    2'b00 : uart0_sel_i = 4'b1000;
    2'b01 : uart0_sel_i = 4'b0100;
    2'b10 : uart0_sel_i = 4'b0010;
    2'b11 : uart0_sel_i = 4'b0001;
  endcase
end
always @(paddr) begin
  case (paddr[1:0])
    2'b00 : uart1_sel_i = 4'b1000;
    2'b01 : uart1_sel_i = 4'b0100;
    2'b10 : uart1_sel_i = 4'b0010;
    2'b11 : uart1_sel_i = 4'b0001;
  endcase
end
`else
always @(paddr) begin
  case (paddr[1:0])
    2'b00 : uart0_sel_i = 4'b0001;
    2'b01 : uart0_sel_i = 4'b0010;
    2'b10 : uart0_sel_i = 4'b0100;
    2'b11 : uart0_sel_i = 4'b1000;
  endcase
end
always @(paddr) begin
  case (paddr[1:0])
    2'b00 : uart1_sel_i = 4'b0001;
    2'b01 : uart1_sel_i = 4'b0010;
    2'b10 : uart1_sel_i = 4'b0100;
    2'b11 : uart1_sel_i = 4'b1000;
  endcase
end
`endif

uart_top i_oc_uart0 (
  .wb_clk_i(pclk),
  .wb_rst_i(~n_preset),
  .wb_adr_i(paddr[4:0]),
  .wb_dat_i(pwdata),
  .wb_dat_o(prdata_uart0),
  .wb_we_i(pwrite),
  .wb_stb_i(psel_uart0),
  .wb_cyc_i(psel_uart0),
  .wb_ack_o(pready_uart0),
  .wb_sel_i(uart0_sel_i),
  .int_o(UART_int),
  .stx_pad_o(ua_txd),
  .srx_pad_i(ua_rxd),
  .rts_pad_o(ua_nrts_int),
  .cts_pad_i(ua_ncts),
  .dtr_pad_o(),
  .dsr_pad_i(1'b0),
  .ri_pad_i(1'b0),
  .dcd_pad_i(1'b0)
);

uart_top i_oc_uart1 (
  .wb_clk_i(pclk),
  .wb_rst_i(~n_preset),
  .wb_adr_i(paddr[4:0]),
  .wb_dat_i(pwdata),
  .wb_dat_o(prdata_uart1),
  .wb_we_i(pwrite),
  .wb_stb_i(psel_uart1),
  .wb_cyc_i(psel_uart1),
  .wb_ack_o(pready_uart1),
  .wb_sel_i(uart1_sel_i),
  .int_o(UART_int1),
  .stx_pad_o(ua_txd1),
  .srx_pad_i(ua_rxd1),
  .rts_pad_o(ua_nrts1_int),
  .cts_pad_i(ua_ncts1),
  .dtr_pad_o(),
  .dsr_pad_i(1'b0),
  .ri_pad_i(1'b0),
  .dcd_pad_i(1'b0)
);

gpio_veneer i_gpio_veneer (
        //inputs

        . n_p_reset(n_preset),
        . pclk(pclk),
        . psel(psel_gpio),
        . penable(penable),
        . pwrite(pwrite),
        . paddr(paddr[5:0]),
        . pwdata(pwdata),
        . gpio_pin_in(gpio_pin_in),
        . scan_en(scan_en),
        . tri_state_enable(tri_state_enable),
        . scan_in(), //added by smarkov for dft

        //outputs
        . scan_out(), //added by smarkov for dft
        . prdata(prdata_gpio),
        . gpio_int(GPIO_int),
        . n_gpio_pin_oe(n_gpio_pin_oe),
        . gpio_pin_out(gpio_pin_out)
);


ttc_veneer i_ttc_veneer (

         //inputs
        . n_p_reset(n_preset),
        . pclk(pclk),
        . psel(psel_ttc),
        . penable(penable),
        . pwrite(pwrite),
        . pwdata(pwdata),
        . paddr(paddr[7:0]),
        . scan_in(),
        . scan_en(scan_en),

        //outputs
        . prdata(prdata_ttc),
        . interrupt(TTC_int[3:1]),
        . scan_out()
);


smc_veneer i_smc_veneer (
        //inputs
	//apb inputs
        . n_preset(n_preset),
        . pclk(pclk_SRPG_smc),
        . psel(psel_smc),
        . penable(penable),
        . pwrite(pwrite),
        . paddr(paddr[4:0]),
        . pwdata(pwdata),
        //ahb inputs
	. hclk(smc_hclk),
        . n_sys_reset(rstn_non_srpg_smc),
        . haddr(smc_haddr),
        . htrans(smc_htrans),
        . hsel(smc_hsel_int),
        . hwrite(smc_hwrite),
	. hsize(smc_hsize),
        . hwdata(smc_hwdata),
        . hready(smc_hready_in),
        . data_smc(data_smc),

         //test signal inputs

        . scan_in_1(),
        . scan_in_2(),
        . scan_in_3(),
        . scan_en(scan_en),

        //apb outputs
        . prdata(prdata_smc),

       //design output

        . smc_hrdata(smc_hrdata),
        . smc_hready(smc_hready),
        . smc_hresp(smc_hresp),
        . smc_valid(smc_valid),
        . smc_addr(smc_addr_int),
        . smc_data(smc_data),
        . smc_n_be(smc_n_be),
        . smc_n_cs(smc_n_cs),
        . smc_n_wr(smc_n_wr),
        . smc_n_we(smc_n_we),
        . smc_n_rd(smc_n_rd),
        . smc_n_ext_oe(smc_n_ext_oe),
        . smc_busy(smc_busy),

         //test signal output
        . scan_out_1(),
        . scan_out_2(),
        . scan_out_3()
);

power_ctrl_veneer i_power_ctrl_veneer (
    // -- Clocks & Reset
    	.pclk(pclk), 			//  : in  std_logic;
    	.nprst(n_preset), 		//  : in  std_logic;
    // -- APB programming interface
    	.paddr(paddr), 			//  : in  std_logic_vector(31 downto 0);
    	.psel(psel_pmc), 			//  : in  std_logic;
    	.penable(penable), 		//  : in  std_logic;
    	.pwrite(pwrite), 		//  : in  std_logic;
    	.pwdata(pwdata), 		//  : in  std_logic_vector(31 downto 0);
    	.prdata(prdata_pmc), 		//  : out std_logic_vector(31 downto 0);
        .macb3_wakeup(macb3_wakeup),
        .macb2_wakeup(macb2_wakeup),
        .macb1_wakeup(macb1_wakeup),
        .macb0_wakeup(macb0_wakeup),
    // -- Module control outputs
    	.scan_in(),			//  : in  std_logic;
    	.scan_en(scan_en),             	//  : in  std_logic;
    	.scan_mode(scan_mode),          //  : in  std_logic;
    	.scan_out(),            	//  : out std_logic;
        .int_source_h(int_source_h),
     	.rstn_non_srpg_smc(rstn_non_srpg_smc), 		//   : out std_logic;
    	.gate_clk_smc(gate_clk_smc), 	//  : out std_logic;
    	.isolate_smc(isolate_smc), 	//  : out std_logic;
    	.save_edge_smc(save_edge_smc), 	//  : out std_logic;
    	.restore_edge_smc(restore_edge_smc), 	//  : out std_logic;
    	.pwr1_on_smc(pwr1_on_smc), 	//  : out std_logic;
    	.pwr2_on_smc(pwr2_on_smc), 	//  : out std_logic
     	.rstn_non_srpg_urt(rstn_non_srpg_urt), 		//   : out std_logic;
    	.gate_clk_urt(gate_clk_urt), 	//  : out std_logic;
    	.isolate_urt(isolate_urt), 	//  : out std_logic;
    	.save_edge_urt(save_edge_urt), 	//  : out std_logic;
    	.restore_edge_urt(restore_edge_urt), 	//  : out std_logic;
    	.pwr1_on_urt(pwr1_on_urt), 	//  : out std_logic;
    	.pwr2_on_urt(pwr2_on_urt),  	//  : out std_logic
        // ETH0
        .rstn_non_srpg_macb0(rstn_non_srpg_macb0),
        .gate_clk_macb0(gate_clk_macb0),
        .isolate_macb0(isolate_macb0),
        .save_edge_macb0(save_edge_macb0),
        .restore_edge_macb0(restore_edge_macb0),
        .pwr1_on_macb0(pwr1_on_macb0),
        .pwr2_on_macb0(pwr2_on_macb0),
        // ETH1
        .rstn_non_srpg_macb1(rstn_non_srpg_macb1),
        .gate_clk_macb1(gate_clk_macb1),
        .isolate_macb1(isolate_macb1),
        .save_edge_macb1(save_edge_macb1),
        .restore_edge_macb1(restore_edge_macb1),
        .pwr1_on_macb1(pwr1_on_macb1),
        .pwr2_on_macb1(pwr2_on_macb1),
        // ETH2
        .rstn_non_srpg_macb2(rstn_non_srpg_macb2),
        .gate_clk_macb2(gate_clk_macb2),
        .isolate_macb2(isolate_macb2),
        .save_edge_macb2(save_edge_macb2),
        .restore_edge_macb2(restore_edge_macb2),
        .pwr1_on_macb2(pwr1_on_macb2),
        .pwr2_on_macb2(pwr2_on_macb2),
        // ETH3
        .rstn_non_srpg_macb3(rstn_non_srpg_macb3),
        .gate_clk_macb3(gate_clk_macb3),
        .isolate_macb3(isolate_macb3),
        .save_edge_macb3(save_edge_macb3),
        .restore_edge_macb3(restore_edge_macb3),
        .pwr1_on_macb3(pwr1_on_macb3),
        .pwr2_on_macb3(pwr2_on_macb3),
        .core06v(core06v),
        .core08v(core08v),
        .core10v(core10v),
        .core12v(core12v),
        .pcm_macb_wakeup_int(pcm_macb_wakeup_int),
        .isolate_mem(isolate_mem),
        .mte_smc_start(mte_smc_start),
        .mte_uart_start(mte_uart_start),
        .mte_smc_uart_start(mte_smc_uart_start),  
        .mte_pm_smc_to_default_start(mte_pm_smc_to_default_start), 
        .mte_pm_uart_to_default_start(mte_pm_uart_to_default_start),
        .mte_pm_smc_uart_to_default_start(mte_pm_smc_uart_to_default_start)
);

// Clock gating macro to shut off clocks to the SRPG flops in the SMC
//CKLNQD1 i_SMC_SRPG_clk_gate  (
//	.TE(scan_mode), 
//	.E(~gate_clk_smc), 
//	.CP(pclk), 
//	.Q(pclk_SRPG_smc)
//	);
// Replace gate with behavioural code //
wire 	smc_scan_gate;
reg 	smc_latched_enable;
assign smc_scan_gate = scan_mode ? 1'b1 : ~gate_clk_smc;

always @ (pclk or smc_scan_gate)
  	if (pclk == 1'b0) begin
  		smc_latched_enable <= smc_scan_gate;
  	end  	
	
assign pclk_SRPG_smc = smc_latched_enable ? pclk : 1'b0;


// Clock gating macro to shut off clocks to the SRPG flops in the URT
//CKLNQD1 i_URT_SRPG_clk_gate  (
//	.TE(scan_mode), 
//	.E(~gate_clk_urt), 
//	.CP(pclk), 
//	.Q(pclk_SRPG_urt)
//	);
// Replace gate with behavioural code //
wire 	urt_scan_gate;
reg 	urt_latched_enable;
assign urt_scan_gate = scan_mode ? 1'b1 : ~gate_clk_urt;

always @ (pclk or urt_scan_gate)
  	if (pclk == 1'b0) begin
  		urt_latched_enable <= urt_scan_gate;
  	end  	
	
assign pclk_SRPG_urt = urt_latched_enable ? pclk : 1'b0;

// ETH0
wire 	macb0_scan_gate;
reg 	macb0_latched_enable;
assign macb0_scan_gate = scan_mode ? 1'b1 : ~gate_clk_macb0;

always @ (pclk or macb0_scan_gate)
  	if (pclk == 1'b0) begin
  		macb0_latched_enable <= macb0_scan_gate;
  	end  	
	
assign clk_SRPG_macb0_en = macb0_latched_enable ? 1'b1 : 1'b0;

// ETH1
wire 	macb1_scan_gate;
reg 	macb1_latched_enable;
assign macb1_scan_gate = scan_mode ? 1'b1 : ~gate_clk_macb1;

always @ (pclk or macb1_scan_gate)
  	if (pclk == 1'b0) begin
  		macb1_latched_enable <= macb1_scan_gate;
  	end  	
	
assign clk_SRPG_macb1_en = macb1_latched_enable ? 1'b1 : 1'b0;

// ETH2
wire 	macb2_scan_gate;
reg 	macb2_latched_enable;
assign macb2_scan_gate = scan_mode ? 1'b1 : ~gate_clk_macb2;

always @ (pclk or macb2_scan_gate)
  	if (pclk == 1'b0) begin
  		macb2_latched_enable <= macb2_scan_gate;
  	end  	
	
assign clk_SRPG_macb2_en = macb2_latched_enable ? 1'b1 : 1'b0;

// ETH3
wire 	macb3_scan_gate;
reg 	macb3_latched_enable;
assign macb3_scan_gate = scan_mode ? 1'b1 : ~gate_clk_macb3;

always @ (pclk or macb3_scan_gate)
  	if (pclk == 1'b0) begin
  		macb3_latched_enable <= macb3_scan_gate;
  	end  	
	
assign clk_SRPG_macb3_en = macb3_latched_enable ? 1'b1 : 1'b0;



`else
//------------------------------------------------------------------------------
// if the APB subsystem is black boxed 
//------------------------------------------------------------------------------
// wire s ports
    // system signals
    wire         hclk;     // AHB Clock
    wire         n_hreset;  // AHB reset - Active low
    wire         pclk;     // APB Clock. 
    wire         n_preset;  // APB reset - Active low

    // AHB interface
    wire         ahb2apb0_hsel;     // AHB2APB select
    wire  [31:0] haddr;    // Address bus
    wire  [1:0]  htrans;   // Transfer type
    wire  [2:0]  hsize;    // AHB Access type - byte, half-word, word
    wire  [31:0] hwdata;   // Write data
    wire         hwrite;   // Write signal/
    wire         hready_in;// Indicates that last master has finished bus access
    wire [2:0]   hburst;     // Burst type
    wire [3:0]   hprot;      // Protection control
    wire [3:0]   hmaster;    // Master select
    wire         hmastlock;  // Locked transfer
  // Interrupts from the Enet MACs
    wire         macb0_int;
    wire         macb1_int;
    wire         macb2_int;
    wire         macb3_int;
  // Interrupt from the DMA
    wire         DMA_irq;
  // Scan wire s
    wire         scan_en;    // Scan enable pin
    wire         scan_in_1;  // Scan wire  for first chain
    wire         scan_in_2;  // Scan wire  for second chain
    wire         scan_mode;  // test mode pin
 
  //wire  for smc AHB interface
    wire         smc_hclk;
    wire         smc_n_hclk;
    wire  [31:0] smc_haddr;
    wire  [1:0]  smc_htrans;
    wire         smc_hsel;
    wire         smc_hwrite;
    wire  [2:0]  smc_hsize;
    wire  [31:0] smc_hwdata;
    wire         smc_hready_in;
    wire  [2:0]  smc_hburst;     // Burst type
    wire  [3:0]  smc_hprot;      // Protection control
    wire  [3:0]  smc_hmaster;    // Master select
    wire         smc_hmastlock;  // Locked transfer


    wire  [31:0] data_smc;     // EMI(External memory) read data
    
  //wire s for uart
    wire         ua_rxd;       // UART receiver serial wire  pin
    wire         ua_rxd1;      // UART receiver serial wire  pin
    wire         ua_ncts;      // Clear-To-Send flow control
    wire         ua_ncts1;      // Clear-To-Send flow control
   //wire s for spi
    wire         n_ss_in;      // select wire  to slave
    wire         mi;           // data wire  to master
    wire         si;           // data wire  to slave
    wire         sclk_in;      // clock wire  to slave
  //wire s for GPIO
   wire  [GPIO_WIDTH-1:0]  gpio_pin_in;             // wire  data from pin

  //reg    ports
  // Scan reg   s
   reg           scan_out_1;   // Scan out for chain 1
   reg           scan_out_2;   // Scan out for chain 2
  //AHB interface 
   reg    [31:0] hrdata;       // Read data provided from target slave
   reg           hready;       // Ready for new bus cycle from target slave
   reg    [1:0]  hresp;       // Response from the bridge

   // SMC reg    for AHB interface
   reg    [31:0]    smc_hrdata;
   reg              smc_hready;
   reg    [1:0]     smc_hresp;

  //reg   s from smc
   reg    [15:0]    smc_addr;      // External Memory (EMI) address
   reg    [3:0]     smc_n_be;      // EMI byte enables (Active LOW)
   reg    [7:0]     smc_n_cs;      // EMI Chip Selects (Active LOW)
   reg    [3:0]     smc_n_we;      // EMI write strobes (Active LOW)
   reg              smc_n_wr;      // EMI write enable (Active LOW)
   reg              smc_n_rd;      // EMI read stobe (Active LOW)
   reg              smc_n_ext_oe;  // EMI write data reg    enable
   reg    [31:0]    smc_data;      // EMI write data
  //reg   s from uart
   reg           ua_txd;       	// UART transmitter serial reg   
   reg           ua_txd1;       // UART transmitter serial reg   
   reg           ua_nrts;      	// Request-To-Send flow control
   reg           ua_nrts1;      // Request-To-Send flow control
   // reg   s from ttc
  // reg   s from SPI
   reg       so;                    // data reg    from slave
   reg       mo;                    // data reg    from master
   reg       sclk_out;              // clock reg    from master
   reg    [P_SIZE-1:0] n_ss_out;    // peripheral select lines from master
   reg       n_so_en;               // out enable for slave data
   reg       n_mo_en;               // out enable for master data
   reg       n_sclk_en;             // out enable for master clock
   reg       n_ss_en;               // out enable for master peripheral lines
  //reg   s from gpio
   reg    [GPIO_WIDTH-1:0]     n_gpio_pin_oe;           // reg    enable signal to pin
   reg    [GPIO_WIDTH-1:0]     gpio_pin_out;            // reg    signal to pin


`endif
//------------------------------------------------------------------------------
// black boxed defines 
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// APB and AHB interface formal verification monitors
//------------------------------------------------------------------------------
`ifdef ABV_ON
apb_assert i_apb_assert (

        // APB signals
  	.n_preset(n_preset),
   	.pclk(pclk),
	.penable(penable),
	.paddr(paddr),
	.pwrite(pwrite),
	.pwdata(pwdata),

	.psel00(psel_spi),
	.psel01(psel_uart0),
	.psel02(psel_gpio),
	.psel03(psel_ttc),
	.psel04(1'b0),
	.psel05(psel_smc),
	.psel06(1'b0),
	.psel07(1'b0),
	.psel08(1'b0),
	.psel09(1'b0),
	.psel10(1'b0),
	.psel11(1'b0),
	.psel12(1'b0),
	.psel13(psel_pmc),
	.psel14(psel_apic),
	.psel15(psel_uart1),

        .prdata00(prdata_spi),
        .prdata01(prdata_uart0), // Read Data from peripheral UART 
        .prdata02(prdata_gpio), // Read Data from peripheral GPIO
        .prdata03(prdata_ttc), // Read Data from peripheral TTC
        .prdata04(32'b0), // 
        .prdata05(prdata_smc), // Read Data from peripheral SMC
        .prdata13(prdata_pmc), // Read Data from peripheral Power Control Block
   	.prdata14(32'b0), // 
        .prdata15(prdata_uart1),


        // AHB signals
        .hclk(hclk),         // ahb system clock
        .n_hreset(n_hreset), // ahb system reset

        // ahb2apb signals
        .hresp(hresp),
        .hready(hready),
        .hrdata(hrdata),
        .hwdata(hwdata),
        .hprot(hprot),
        .hburst(hburst),
        .hsize(hsize),
        .hwrite(hwrite),
        .htrans(htrans),
        .haddr(haddr),
        .ahb2apb_hsel(ahb2apb0_hsel));



//------------------------------------------------------------------------------
// AHB interface formal verification monitor
//------------------------------------------------------------------------------
defparam i_ahbSlaveMonitor.DBUS_WIDTH = 32;
defparam i_ahbMasterMonitor.DBUS_WIDTH = 32;


// AHB2APB Bridge

    ahb_liteslave_monitor i_ahbSlaveMonitor (
        .hclk_i(hclk),
        .hresetn_i(n_hreset),
        .hresp(hresp),
        .hready(hready),
        .hready_global_i(hready),
        .hrdata(hrdata),
        .hwdata_i(hwdata),
        .hburst_i(hburst),
        .hsize_i(hsize),
        .hwrite_i(hwrite),
        .htrans_i(htrans),
        .haddr_i(haddr),
        .hsel_i(ahb2apb0_hsel)
    );


  ahb_litemaster_monitor i_ahbMasterMonitor (
          .hclk_i(hclk),
          .hresetn_i(n_hreset),
          .hresp_i(hresp),
          .hready_i(hready),
          .hrdata_i(hrdata),
          .hlock(1'b0),
          .hwdata(hwdata),
          .hprot(hprot),
          .hburst(hburst),
          .hsize(hsize),
          .hwrite(hwrite),
          .htrans(htrans),
          .haddr(haddr)
          );







`endif




`ifdef IFV_LP_ABV_ON
// power control
wire isolate;

// testbench mirror signals
wire L1_ctrl_access;
wire L1_status_access;

wire [31:0] L1_status_reg;
wire [31:0] L1_ctrl_reg;

//wire rstn_non_srpg_urt;
//wire isolate_urt;
//wire retain_urt;
//wire gate_clk_urt;
//wire pwr1_on_urt;


// smc signals
wire [31:0] smc_prdata;
wire lp_clk_smc;
                    

// uart isolation register
  wire [15:0] ua_prdata;
  wire ua_int;
  assign ua_prdata          =  i_uart1_veneer.prdata;
  assign ua_int             =  i_uart1_veneer.ua_int;


assign lp_clk_smc          = i_smc_veneer.pclk;
assign smc_prdata          = i_smc_veneer.prdata;
lp_chk_smc u_lp_chk_smc (
    .clk (hclk),
    .rst (n_hreset),
    .iso_smc (isolate_smc),
    .gate_clk (gate_clk_smc),
    .lp_clk (pclk_SRPG_smc),

    // srpg outputs
    .smc_hrdata (smc_hrdata),
    .smc_hready (smc_hready),
    .smc_hresp  (smc_hresp),
    .smc_valid (smc_valid),
    .smc_addr_int (smc_addr_int),
    .smc_data (smc_data),
    .smc_n_be (smc_n_be),
    .smc_n_cs  (smc_n_cs),
    .smc_n_wr (smc_n_wr),
    .smc_n_we (smc_n_we),
    .smc_n_rd (smc_n_rd),
    .smc_n_ext_oe (smc_n_ext_oe)
   );

// lp retention/isolation assertions
lp_chk_uart u_lp_chk_urt (

  .clk         (hclk),
  .rst         (n_hreset),
  .iso_urt     (isolate_urt),
  .gate_clk    (gate_clk_urt),
  .lp_clk      (pclk_SRPG_urt),
  //ports
  .prdata (ua_prdata),
  .ua_int (ua_int),
  .ua_txd (ua_txd1),
  .ua_nrts (ua_nrts1)
 );

`endif  //IFV_LP_ABV_ON




endmodule
