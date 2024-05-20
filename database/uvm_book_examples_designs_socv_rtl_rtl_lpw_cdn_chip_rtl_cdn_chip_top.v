// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : cdn_chip_top.v
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



module chip(
             //inputs
              ttc_ext_clk,
              pin_reset_i,
              hclk,

      	     scan_mode,       // Remove once the tap is in place 

             // AHB UVC inputs 
             cpu_biu_hsel,
             cpu_biu_haddr,
             cpu_biu_htrans,
             cpu_biu_hwrite,
             cpu_biu_hsize,
             cpu_biu_hburst,
             cpu_biu_hprot,
             cpu_biu_hwdata,
             cpu_biu_hlock,


             ahb_uvc_slave_hrdata, 
             ahb_uvc_slave_hready,
             ahb_uvc_slave_hresp, 

             // input from OCP interface
             ao_sdata_i,                // input from OCP i/f
             ao_sresp_i,                // input from OCP i/f
             ao_sresplast_i,            // input from OCP i/f

             ao_scmdaccept_i,           // input from OCP i/f
             ao_sdataaccept_i,           // input from OCP i/f


             // mipi ports
             ci_clk,                    //IMAGE PROCESSOR CLK TO PROCESS PIXEL DATA
             ci_clk_rst_n,              //ACTIVE LOW RESET FOR PIXEL CLOCK
             
             hs_rx_clk,                 //HIGH SPEED DDR CLOCK FOR CSI CONTROLLER
             txclkesc,                  //ESCAPE MODE LOW POWER CLOCK FOR CSI CONTROLLER
             rxddr_rst_n,               //ACTIVE LOW RESET FOR RECEIVER DDR CLOCK FOR CSI CONTROLLER
             txescclk_rst_n,            //ACTIVE LOW RESET FOR ESCAPE MODE LOW POWER CLOCK FOR CSI CONTROLLER
             
             txbyteclkhs,               //BYTE CLOCK GENERATED FROM DDR INPHASE CLOCK FOR CSI CONTROLLER
             rxbyteclkhs,               //BYTE CLOCK GENERATED FROM DDR(HS_RX_CLK) CLOCK FOR CSI CONTROLLER
             tx_byte_rst_n,             //RESET SIGNAL FOR TXBYTECLKHS(GENERATED FROM INPHASE CLOCK) CLOCK DOMAIN FOR CSI CONTROLLER
             rx_byte_rst_n,             //RESET SIGNAL FOR RXBYTECLKHS(GENERATED FROM HS_RX_CLK) CLOCK DOMAIN FOR CSI CONTROLLER
             
             rxclkesc_0,                //ESCAPE MODE EX-OR CLOCK GENERATED FROM LOW POWER DP AND DN LINES FOR CSI CONTROLLER DATA LANE0
             rxescclk_rst_0_n,          //RESET SIGNAL FOR RXCLKESC(EX-OR CLOCK) CLOCK DOMAIN FOR CSI CONTROLLER DATA LANE0
             
             txddr_q_rst_n,             //RESET SIGNAL FOR QUADRATURE CLOCK DOMAIN FOR CSI CONTROLLER
             txddr_i_rst_n,             //RESET SIGNAL FOR INPHASE CLOCK DOMAIN FOR CSI CONTROLLER
             
             
             sda_in,                    //I2C SERIAL DATA IN SIGNAL
             
             
             lp_rx_cp_clk,         //LOW POWER DIFFERENTIAL Cp LINE FROM THE TRANSCEIVER FOR CSI CONTROLLER
             lp_rx_cn_clk,         //LOW POWER DIFFERENTIAL Cn LINE FROM THE TRANSCEIVER FOR CSI CONTROLLER
             
             lp_rx_dp_0,           //LOW POWER DIFFERENTIAL Dp LINE FOR CSI CONTROLLER DATA LANE0
             lp_rx_dn_0,           //LOW POWER DIFFERENTIAL Dn LINE FOR CSI CONTROLLER DATA LANE0
             hs_rx_0,              //HIGH SPEED Dp LINE FOR CSI CONTROLLER DATA LANE0
             

             //MACB ports
             //inputs
              macb_mdio_in,    
              macb0_col,        
              macb0_crs,       
              macb0_tx_clk,   
              macb0_rxd,     
              macb0_rx_er,  
              macb0_rx_clk,
              macb0_rx_dv,    
              
                                   
              macb1_col,        
              macb1_crs,       
              macb1_tx_clk,   
              macb1_rxd,     
              macb1_rx_er,  
              macb1_rx_clk,
              macb1_rx_dv,    
              
              
              macb2_col,        
              macb2_crs,       
              macb2_tx_clk,   
              macb2_rxd,     
              macb2_rx_er,  
              macb2_rx_clk,
              macb2_rx_dv,    
              
              
              macb3_col,        
              macb3_crs,       
              macb3_tx_clk,   
              macb3_rxd,     
              macb3_rx_er,  
              macb3_rx_clk,
              macb3_rx_dv,    

             // AHB UVC outputs
             cpu_biu_hrdata,
             cpu_biu_hready,
             cpu_biu_hresp,

             ahb_uvc_slave_hsel,     // AHB2APB select
             ahb_uvc_slave_haddr,    // Address bus
             ahb_uvc_slave_htrans,   // Transfer type
             ahb_uvc_slave_hsize,    // AHB Access type - byte, half-word, word
             ahb_uvc_slave_hwdata,   // Write data
             ahb_uvc_slave_hwrite,   // Write signal/
             ahb_uvc_slave_hready_in,// Indicates that last master has finished bus access
             ahb_uvc_slave_hburst,     // Burst type
             ahb_uvc_slave_hprot,      // Protection control
             ahb_uvc_slave_hmaster,    // Master select
             ahb_uvc_slave_hmastlock,  // Locked transfer

             // OCP interface outputs
             ao_mcmd_o,             // OCP output
             ao_maddr_o,             // OCP output
             ao_matomic_length_o,             // OCP output
             ao_mburst_precise_o,             // OCP output
             ao_mburst_single_req_o,             // OCP output
             ao_mburstlength_o,             // OCP output
             ao_mburst_seq_o,             // OCP output
             ao_mtag_id_o,             // OCP output
             ao_mdata_tag_id_o,             // OCP output
             ao_mdata_o,             // OCP output
             ao_mdatalast_o,             // OCP output
             ao_mdatavalid_o,             // OCP output
             ao_mdataaccept_o,             // OCP output
             ao_mrespaccept_o,             // OCP output


             // mipi outputs
             intr,                      //ACTIVE HIGH INTERRUPT SIGNAL
             
             
             fs,                        //FRAME START SIGNAL. PULSES FOR ONE CAPTURE CLOCK AT THE BEGINNING OF EVERY FRAME
             fe,                        //FRAME END SIGNAL. PULSES FOR ONE CAPTURE CLOCK AT THE END OF EVERY FRAME
             ls,                        //LINE START SIGNAL. PULSES FOR ONE CAPTURE CLOCK AT THE BEGINNING OF EVERY LINE
             le,                        //LINE END SIGNAL. PULSES FOR ONE CAPTURE CLOCK AT THE END OF EVERY LINE
             data_valid,                //VALID SIGNAL TO DENOTE THAT THE PIXEL DATA IS VALID
             data,                      //DATA LINES USED TO TRANSMIT 8, 9, 10 OR 12 BITS OF DATA AT A TIME.
             ch_n,                      //INDICATES THE ACTIVE VIRTUAL CHANNEL NUMBER
             fmt_typ,                   //INDICATES THE PIXEL FORMAT's DATA TYPE
             
             
             hs_rx_cntrl_clk,      //HIGH SPEED RECEIVER CONTROL SIGNAL FROM CSI CONTROLLER FOR CLOCK LANE
             lp_rx_cntrl_clk,      //LOW POWER RECEIVER CONTROL SIGNAL FROM CSI CONTROLLER FOR CLOCK LANE
             
             //OUTPUT DPHY TRANCEIVER SIGNALS FROM CSI CONTROLLER1 DATA LANE0
             hs_rx_cntrl_0,        //HIGH SPEED RECEIVER CONTROL SIGNAL FROM CSI CONTROLLER FOR DATA LANE0
             lp_rx_cntrl_0,        //LOW POWER RECEIVER CONTROL SIGNAL FROM CSI CONTROLLER FOR DATA LANE0
             
             
             scl_out,              //I2C SERIAL CLOCK OUTPUT SIGNAL
             sda_out,               //I2C SERIAL DATA OUTPUT SIGNAL


             //MACB outputs
              macb_mdc,            
              macb_mdio_out,       
              macb_mdio_en,        

              macb0_tx_er,       
              macb0_txd,        
              macb0_tx_en,     

              macb1_tx_er,       
              macb1_txd,        
              macb1_tx_en,     

              macb2_tx_er,       
              macb2_txd,        
              macb2_tx_en,     

              macb3_tx_er,       
              macb3_txd,        
              macb3_tx_en,     
            
             // uart inputs
              ua_ncts,
              ua_rxd,
              ua_ncts1,
              ua_rxd1,
             // spi inputs
              n_ss_in,
              mi,
              si,
              sclk_in,

             // uart o/p
	      ua_nrts,
	      ua_txd,
	      ua_nrts1,
	      ua_txd1,
             // spi
             so,
             sclk_out,
             mo,
             n_ss_out,
             n_so_en,
             n_mo_en,
             n_sclk_en,
             n_ss_en,
             // gpio inputs
            gpio_pin_in,
            //outputs from gpio
              n_gpio_pin_oe,
              gpio_pin_out,
             // clk control
             core06v,
             core08v,
             core10v,
             core12v
 

             );

//---------------------------------------------------------------------------//
parameter GPIO_WIDTH    = 16; // GPIO width
parameter P_SIZE        = 4;       // number of peripheral select lines
//---------------------------------------------------------------------------//
parameter OCP_DATA_WIDTH = 128; //OCP DATA
parameter OCP_ADDR_WIDTH = 28;  //OCP ADDR



input [3:1]  ttc_ext_clk;
input 	     pin_reset_i;
input 	     hclk;



// Temporary scan_mode port
input	     scan_mode;

// AHB UVC ports
input         cpu_biu_hsel;
input  [31:0] cpu_biu_haddr;
input  [1:0]  cpu_biu_htrans;
input         cpu_biu_hwrite;
input  [2:0]  cpu_biu_hsize;
input  [2:0]  cpu_biu_hburst;
input  [3:0]  cpu_biu_hprot;
input  [31:0] cpu_biu_hwdata;
input         cpu_biu_hlock;

output  [31:0] cpu_biu_hrdata;
output         cpu_biu_hready;
output   [1:0] cpu_biu_hresp;


output        ahb_uvc_slave_hsel;     // AHB2APB select
output [31:0] ahb_uvc_slave_haddr;    // Address bus
output [1:0]  ahb_uvc_slave_htrans;   // Transfer type
output [2:0]  ahb_uvc_slave_hsize;    // AHB Access type - byte, half-word, word
output [31:0] ahb_uvc_slave_hwdata;   // Write data
output        ahb_uvc_slave_hwrite;   // Write signal/
output        ahb_uvc_slave_hready_in;// Indicates that last master has finished bus access
output [2:0]  ahb_uvc_slave_hburst;     // Burst type
output [3:0]  ahb_uvc_slave_hprot;      // Protection control
output [3:0]  ahb_uvc_slave_hmaster;    // Master select
output        ahb_uvc_slave_hmastlock;  // Locked transfer

input [31:0] ahb_uvc_slave_hrdata; 
input        ahb_uvc_slave_hready;
input [1:0]  ahb_uvc_slave_hresp; 


//APB ports

// uart inputs
input 	     ua_ncts,ua_rxd;
input 	     ua_ncts1,ua_rxd1;
// uart outputs
output 	     ua_nrts,ua_txd;
output 	     ua_nrts1,ua_txd1;

//spi
input        n_ss_in;      // select input to slave(spi)
input        mi;           // data input to master(spi)
input        si;           // data input to slave(spi)
input        sclk_in;      // clock input to slave(spi)
// output from spi
output    so;                    // data output from slave
output    mo;                    // data output from master
output    sclk_out;              // clock output from master
output [P_SIZE-1:0] n_ss_out;    // peripheral select lines from master
output    n_so_en;               // out enable for slave data
output    n_mo_en;               // out enable for master data
output    n_sclk_en;             // out enable for master clock
output    n_ss_en;               // out enable for master peripheral lines


// core clk control
output core06v;
output core08v;
output core10v;
output core12v;

// OCP ports

input                  ao_scmdaccept_i;
input                  ao_sdataaccept_i;
input [OCP_DATA_WIDTH-1:0]  ao_sdata_i; //128 bit
input [1:0]            ao_sresp_i; //NULL, DVA, FAIL, ERR
input                  ao_sresplast_i;


output [2:0]           ao_mcmd_o; //idle. write,read,readex...
output [OCP_ADDR_WIDTH-1:0] ao_maddr_o; //28 bit
output  [4:0]          ao_matomic_length_o;
output                 ao_mburst_precise_o;
output                 ao_mburst_single_req_o;
output [4:0]           ao_mburstlength_o; 
output [2:0]           ao_mburst_seq_o;//INCR,DFLT1,WRAP,DFLT2,XOR,STRM,UNKN,BLK
output [OCP_DATA_WIDTH-1:0] ao_mdata_o; //128 bit write data on OCP I/F
output                 ao_mdatalast_o;
output                 ao_mdatavalid_o;
output                 ao_mdataaccept_o;
output                 ao_mrespaccept_o;
output [2:0]           ao_mtag_id_o;
output [2:0]           ao_mdata_tag_id_o;





// MIPI ports

input                                        ci_clk;
input                                        ci_clk_rst_n;

input                                        txclkesc;
input                                        txescclk_rst_n;
input                                        txddr_q_rst_n;
input                                        txddr_i_rst_n;
input                                        rxddr_rst_n;
input                                        tx_byte_rst_n;
input                                        rx_byte_rst_n;
input                                        rxbyteclkhs;
input                                        txbyteclkhs;
input                                        rxescclk_rst_0_n;
input                                        rxclkesc_0;
  
input                                        lp_rx_cp_clk;
input                                        lp_rx_cn_clk;
input                                        hs_rx_clk;
  
input                                        lp_rx_dp_0;
input                                        lp_rx_dn_0;
input                                        hs_rx_0;
  
input                                         sda_in;
  
  
output                                       scl_out;
output                                       sda_out;
  
output                                       hs_rx_cntrl_0;
output                                       lp_rx_cntrl_0;
  
  
output                                       hs_rx_cntrl_clk;
output                                       lp_rx_cntrl_clk;
  
output                                       intr;
  
output                                       fs;
output                                       fe;
output               ls;
output                le;
output                data_valid;
output [9:0]               data;
output [1:0]               ch_n;
output [4:0]               fmt_typ;

       
//MACB ports
input         macb0_col;            // collision detect signal from the PHY
input         macb0_crs;
input         macb0_tx_clk;         // transmit clock from the PHY
input   [3:0] macb0_rxd;            // receive data from the PHY
input         macb0_rx_er;          // receive error signal from the PHY
input         macb0_rx_clk;         // receive clock from the PHY
input         macb0_rx_dv;          // receive data valid signal from the PHY
input         macb_mdio_in;        // management data input 

output        macb0_tx_er;         
output [3:0]  macb0_txd;           
output        macb0_tx_en;         
output        macb_mdc;            
output        macb_mdio_out;       
output        macb_mdio_en;        


input         macb1_col;      
input         macb1_crs;     
input         macb1_tx_clk; 
input   [3:0] macb1_rxd;   
input         macb1_rx_er;
input         macb1_rx_clk;    
input         macb1_rx_dv;  

output        macb1_tx_er;         
output [3:0]  macb1_txd;           
output        macb1_tx_en;         

input         macb2_col;   
input         macb2_crs;  
input         macb2_tx_clk;    
input   [3:0] macb2_rxd; 
input         macb2_rx_er;   
input         macb2_rx_clk; 
input         macb2_rx_dv; 

output        macb2_tx_er;         
output [3:0]  macb2_txd;           
output        macb2_tx_en;         

input         macb3_col;  
input         macb3_crs; 
input         macb3_tx_clk;    
input   [3:0] macb3_rxd;       
input         macb3_rx_er;  
input         macb3_rx_clk;    
input         macb3_rx_dv; 

output        macb3_tx_er;         
output [3:0]  macb3_txd;           
output        macb3_tx_en;  

//inputs for GPIO
input [GPIO_WIDTH-1:0]  gpio_pin_in;             // input data from pin
//outputs from gpio
output [GPIO_WIDTH-1:0]     n_gpio_pin_oe;           // output enable signal to pin
output [GPIO_WIDTH-1:0]     gpio_pin_out;            // output signal to pin


wire        ua_rxd;       // UART receiver serial input pin
wire        ua_rxd1;       // UART receiver serial input pin
wire        ua_ncts;      // Clear-To-Send flow control
wire        ua_ncts1;      // Clear-To-Send flow control
wire        n_ss_in;      // select input to slave(spi)
wire        mi;           // data input to master(spi)
wire        si;           // data input to slave(spi)
wire        sclk_in;      // clock input to slave(spi)

//---------------------------------------------------------------------------//
//wire        hclk;      // AHB Clock - 240M
wire        n_hreset;  // AHB reset in 240MHz domain - Active low
wire        pclk;     // APB Clock - 240M
wire        n_preset;  // APB reset - Active low

wire		pin_reset_i;
wire [3:1] ttc_ext_clk;


// AHB interface
//AHB S0
wire   	    ahb2ocp_hsel;
wire [31:0] ahb2ocp_haddr;
wire [1:0]  ahb2ocp_htrans;
wire        ahb2ocp_hwrite;
wire        ahb2ocp_hready_in;
wire [2:0]  ahb2ocp_hsize;
wire [2:0]  ahb2ocp_hburst;
wire [3:0]  ahb2ocp_hprot;
wire [3:0]  ahb2ocp_hmaster;	
wire [31:0] ahb2ocp_hwdata;
wire        ahb2ocp_hmastlock;

wire [31:0] ahb2ocp_hrdata;
wire        ahb2ocp_hready;
wire  [1:0] ahb2ocp_hresp;


//AHB S1
wire        sram_subsystem_hsel;
wire [31:0] sram_subsystem_haddr;
wire [1:0]  sram_subsystem_htrans;
wire [2:0]  sram_subsystem_hsize;
wire        sram_subsystem_hwrite;
wire        sram_subsystem_hready_in;
wire [31:0] sram_subsystem_hwdata;
wire [2:0]  sram_subsystem_hburst;
wire [3:0]  sram_subsystem_hprot;
wire [3:0]  sram_subsystem_hmaster;
wire        sram_subsystem_hmastlock;

wire [31:0] sram_subsystem_hrdata;
wire        sram_subsystem_hready;
wire [1:0]  sram_subsystem_hresp;


//AHB S2
wire        mipi_hsel;
wire [31:0] mipi_haddr;
wire [1:0]  mipi_htrans;
wire [2:0]  mipi_hsize;
wire        mipi_hwrite;
wire        mipi_hready_in;
wire [2:0]  mipi_hburst;     // Burst type
wire [3:0]  mipi_hprot;      // Protection control
wire [3:0]  mipi_hmaster;    // Master select
wire [31:0] mipi_hwdata;    // Write Data
wire        mipi_hmastlock;  // Locked transfer
  
wire [31:0] mipi_hrdata;
wire        mipi_hready;
wire [1:0]  mipi_hresp;

//AHB S3
wire        ahb2apb1_hsel;     // AHB2APB select
wire [31:0] ahb2apb1_haddr;    // Address bus
wire [1:0]  ahb2apb1_htrans;   // Transfer type
wire [2:0]  ahb2apb1_hsize;    // AHB Access type - byte, half-word, word
wire [31:0] ahb2apb1_hwdata;   // Write data
wire        ahb2apb1_hwrite;   // Write signal/
wire        ahb2apb1_hready_in;// Indicates that last master has finished bus access
wire [2:0]  ahb2apb1_hburst;     // Burst type
wire [3:0]  ahb2apb1_hprot;      // Protection control
wire [3:0]  ahb2apb1_hmaster;    // Master select
wire        ahb2apb1_hmastlock;  // Locked transfer

wire [31:0] ahb2apb1_hrdata; 
wire        ahb2apb1_hready;
wire [1:0]  ahb2apb1_hresp; 

//AHB S4
wire        ahb_uvc_slave_hsel;     // AHB2APB select
wire [31:0] ahb_uvc_slave_haddr;    // Address bus
wire [1:0]  ahb_uvc_slave_htrans;   // Transfer type
wire [2:0]  ahb_uvc_slave_hsize;    // AHB Access type - byte, half-word, word
wire [31:0] ahb_uvc_slave_hwdata;   // Write data
wire        ahb_uvc_slave_hwrite;   // Write signal/
wire        ahb_uvc_slave_hready_in;// Indicates that last master has finished bus access
wire [2:0]  ahb_uvc_slave_hburst;     // Burst type
wire [3:0]  ahb_uvc_slave_hprot;      // Protection control
wire [3:0]  ahb_uvc_slave_hmaster;    // Master select
wire        ahb_uvc_slave_hmastlock;  // Locked transfer

wire [31:0] ahb_uvc_slave_hrdata; 
wire        ahb_uvc_slave_hready;
wire [1:0]  ahb_uvc_slave_hresp; 


//AHB S5
wire        ahb2apb0_hsel;     // AHB2APB select
wire [31:0] ahb2apb0_haddr;    // Address bus
wire [1:0]  ahb2apb0_htrans;   // Transfer type
wire [2:0]  ahb2apb0_hsize;    // AHB Access type - byte, half-word, word
wire [31:0] ahb2apb0_hwdata;   // Write data
wire        ahb2apb0_hwrite;   // Write signal/
wire        ahb2apb0_hready_in;// Indicates that last master has finished bus access
wire [2:0]  ahb2apb0_hburst;     // Burst type
wire [3:0]  ahb2apb0_hprot;      // Protection control
wire [3:0]  ahb2apb0_hmaster;    // Master select
wire        ahb2apb0_hmastlock;  // Locked transfer

wire [31:0] ahb2apb0_hrdata; 
wire        ahb2apb0_hready;
wire [1:0]  ahb2apb0_hresp; 


//AHB M0 
// wire        cpu_biu_hsel;
// wire [31:0] cpu_biu_haddr;
// wire [1:0]  cpu_biu_htrans;
// wire        cpu_biu_hwrite;
// wire [2:0]  cpu_biu_hsize;
// wire [2:0]  cpu_biu_hburst;
// wire [3:0]  cpu_biu_hprot;
// wire [31:0] cpu_biu_hwdata;
// wire        cpu_biu_hlock;
wire [31:0] cpu_biu_hrdata;
wire        cpu_biu_hready;
wire  [1:0] cpu_biu_hresp;

//AHB M1
wire [31:0] macb0_haddr;
wire [1:0]  macb0_htrans;
wire        macb0_hwrite;
wire [2:0]  macb0_hsize;
wire [2:0]  macb0_hburst;
wire [3:0]  macb0_hprot;
wire [31:0] macb0_hwdata;
wire        macb0_hlock;
wire [31:0] macb0_hrdata;
wire        macb0_hready;
wire  [1:0] macb0_hresp;

//AHB M2
wire   	   macb1_hsel;
wire [31:0] macb1_haddr;
wire [1:0]  macb1_htrans;
wire        macb1_hwrite;
wire [2:0]  macb1_hsize;
wire [2:0]  macb1_hburst;
wire [3:0]  macb1_hprot;
wire [31:0] macb1_hwdata;
wire        macb1_hlock;
wire [31:0] macb1_hrdata;
wire        macb1_hready;
wire  [1:0] macb1_hresp;

//AHB M3
wire   	   macb2_hsel;
wire [31:0] macb2_haddr;
wire [1:0]  macb2_htrans;
wire        macb2_hwrite;
wire [2:0]  macb2_hsize;
wire [2:0]  macb2_hburst;
wire [3:0]  macb2_hprot;
wire [31:0] macb2_hwdata;
wire        macb2_hlock;
wire [31:0] macb2_hrdata;
wire        macb2_hready;
wire  [1:0] macb2_hresp;

//AHB M4
wire   	   macb3_hsel;
wire [31:0] macb3_haddr;
wire [1:0]  macb3_htrans;
wire [2:0]  macb3_hsize;
wire [2:0]  macb3_hburst;
wire [3:0]  macb3_hprot;
wire [31:0] macb3_hwdata;
wire        macb3_hlock;
wire [31:0] macb3_hrdata;
wire        macb3_hready;
wire  [1:0] macb3_hresp;


//APB1 wires
wire		   apb1_pwrite;
wire		   apb1_penable;
wire [31:0]	apb1_pwdata;
wire [15:0]	apb1_paddr;
wire        psel_macb0;
wire        psel_macb1;
wire        psel_macb2;
wire        psel_macb3;
wire        pready_macb0;
wire        pready_macb1;
wire        pready_macb2;
wire        pready_macb3;
wire [31:0]	prdata_macb0;
wire [31:0]	prdata_macb1;
wire [31:0]	prdata_macb2;
wire [31:0]	prdata_macb3;


wire         macb0_col, macb1_col, macb2_col, macb3_col; 
wire         macb0_crs,macb1_crs, macb2_crs, macb3_crs;  
wire         macb0_tx_clk, macb1_tx_clk, macb2_tx_clk, macb3_tx_clk; 
wire   [3:0] macb0_rxd, macb1_rxd, macb2_rxd, macb3_rxd;   
wire         macb0_rx_er, macb1_rx_er, macb2_rx_er, macb3_rx_er;
wire         macb0_rx_clk, macb1_rx_clk, macb2_rx_clk, macb3_rx_clk; 
wire         macb0_rx_dv, macb1_rx_dv, macb2_rx_dv, macb3_rx_dv; 
wire         macb_mdio_in; 

wire        macb0_tx_er, macb1_tx_er, macb2_tx_er, macb3_tx_er;         
wire [3:0]  macb0_txd, macb1_txd, macb2_txd, macb3_txd;           
wire        macb0_tx_en, macb1_tx_en, macb2_tx_en, macb3_tx_en;         
wire        macb_mdc;            
wire        macb_mdio_out;       
wire        macb_mdio_en;        

wire        tx_clk0, rx_clk0, n_tx_clk0, tx_reset0, rx_reset0, tx_reset0_tmp, rx_reset0_tmp; 
wire        tx_clk1, rx_clk1, n_tx_clk1, tx_reset1, rx_reset1, tx_reset1_tmp, rx_reset1_tmp;
wire        tx_clk2, rx_clk2, n_tx_clk2, tx_reset2, rx_reset2, tx_reset2_tmp, rx_reset2_tmp;
wire        tx_clk3, rx_clk3, n_tx_clk3, tx_reset3, rx_reset3, tx_reset3_tmp, rx_reset3_tmp;

wire        macb0_int, macb1_int, macb2_int, macb3_int;
wire        csi_int;

wire        macb0_lp_local, macb0_lclk;
wire        macb1_lp_local, macb1_lclk;
wire        macb2_lp_local, macb2_lclk;
wire        macb3_lp_local, macb3_lclk;
wire  [2:0]           ao_mcmd_o; //idle. write,read,readex...
wire  [OCP_ADDR_WIDTH-1:0] ao_maddr_o; //28 bit
wire   [4:0]          ao_matomic_length_o;
wire                  ao_mburst_precise_o;
wire                  ao_mburst_single_req_o;
wire  [4:0]           ao_mburstlength_o; 
wire  [2:0]           ao_mburst_seq_o;//INCR,DFLT1,WRAP,DFLT2,XOR,STRM,UNKN,BLK
wire  [OCP_DATA_WIDTH-1:0] ao_mdata_o; //128 bit write data on OCP I/F
wire                  ao_mdatalast_o;
wire                  ao_mdatavalid_o;
wire                  ao_mdataaccept_o;
wire                  ao_mrespaccept_o;

wire  [2:0]           ao_mtag_id_o;
wire  [2:0]           ao_mdata_tag_id_o;

wire        so;                    // data output from slave
wire        mo;                    // data output from master
wire        sclk_out;              // clock output from master
wire [P_SIZE-1:0] n_ss_out;    // peripheral select lines from master
wire        n_so_en;               // out enable for slave data
wire        n_mo_en;               // out enable for master data
wire        n_sclk_en;             // out enable for master clock
wire        n_ss_en;               // out enable for master peripheral lines
wire [GPIO_WIDTH-1:0] n_gpio_pin_oe;    // output enable signal to pin
wire [GPIO_WIDTH-1:0] gpio_pin_out;     // output signal to pin
wire [GPIO_WIDTH-1:0]  gpio_pin_in;             // input data from pin

wire   pll_output;

wire  [2:0] tie_lo_bus3;       // to tie EMA of SRAM
wire 	   	tie_lo_1bit;
wire [1:0]  tie_lo_2bit;
wire [3:0]  tie_lo_4bit;
wire [31:0] tie_lo_32bit;
wire [15:0] tie_lo_16bit;
wire 	    	tie_hi_1bit;

// the following signals are to zeroise htrans from bus matrix if hsel is zero
wire [1:0] sram_subsystem_htrans_raw;
wire [1:0] ahb2apb0_htrans_raw;
wire [1:0] ahb2apb1_htrans_raw;
wire [1:0] ahb2ocp_htrans_raw;
wire [1:0] mipi_htrans_raw;
wire [1:0] ahb_uvc_slave_htrans_raw;


//---------------------------------------------------------------------------//
assign tie_lo_bus3 = 3'b000;
assign tie_lo_1bit =1'b0;
assign tie_lo_2bit =2'b0;
assign tie_lo_4bit =4'b0;
assign tie_lo_32bit=32'b0;
assign tie_hi_1bit =1'b1;
assign tie_lo_16bit= 16'b0;

assign n_preset = n_hreset;  // hreset and preset and the same

assign pclk = hclk;

assign n_hreset  = pin_reset_i;
assign tx_reset0 = pin_reset_i;
assign rx_reset0 = pin_reset_i;
assign tx_reset1 = pin_reset_i;
assign rx_reset1 = pin_reset_i;
assign tx_reset2 = pin_reset_i;
assign rx_reset2 = pin_reset_i;
assign tx_reset3 = pin_reset_i;
assign rx_reset3 = pin_reset_i;






//-----------AHB Busmatrix related signals----------------------------
assign sram_subsystem_htrans = sram_subsystem_hsel ? sram_subsystem_htrans_raw : 2'b0;
assign ahb2apb0_htrans = ahb2apb0_hsel ? ahb2apb0_htrans_raw : 2'b0;
assign ahb2apb1_htrans = ahb2apb1_hsel ? ahb2apb1_htrans_raw : 2'b0;
assign ahb2ocp_htrans = ahb2ocp_hsel ? ahb2ocp_htrans_raw : 2'b0;
assign mipi_htrans = mipi_hsel ? mipi_htrans_raw : 2'b0;
assign ahb_uvc_slave_htrans = ahb_uvc_slave_hsel ? ahb_uvc_slave_htrans_raw : 2'b0;



BusMatrix i_BusMatrix(
    .HCLK(hclk),                // AHB System Clock
    .HRESETn(n_hreset),         // AHB System Reset

    // System Address Remap control
    .REMAP(tie_lo_1bit),        // System REMAP signal

    // Input Port 0  // This is where AHB UVC gets connected
    .HSELS0(cpu_biu_hsel),       	// Slave Select
    .HADDRS0(cpu_biu_haddr),      	// Address bus
    .HTRANSS0(cpu_biu_htrans),     	// Transfer type 
    .HWRITES0(cpu_biu_hwrite),     	// Transfer direction
    .HSIZES0(cpu_biu_hsize),      	// Transfer size
    .HBURSTS0(cpu_biu_hburst),     	// Burst type
    .HPROTS0(cpu_biu_hprot),      	// Protection control
    .HMASTERS0(tie_lo_4bit),    	// Master select
    .HWDATAS0(cpu_biu_hwdata),     	// Write data
    .HMASTLOCKS0(cpu_biu_hlock),  	// Locked transfer
    .HREADYS0(cpu_biu_hready),     	// Transfer done

    // Input Port 1
    .HSELS1(tie_hi_1bit),      		// Slave Select
    .HADDRS1(macb0_haddr),     		// Address bus
    .HTRANSS1(macb0_htrans),    	// Transfer type 
    .HWRITES1(macb0_hwrite),    	// Transfer direction
    .HSIZES1(macb0_hsize),     		// Transfer size
    .HBURSTS1(macb0_hburst),    	// Burst type
    .HPROTS1(macb0_hprot),     		// Protection control
    .HMASTERS1(tie_lo_4bit),   		// Master select
    .HWDATAS1(macb0_hwdata),    	// Write data
    .HMASTLOCKS1(macb0_hlock), 		// Locked transfer
    .HREADYS1(macb0_hready),  	// Transfer done

    // Input Port 2
    .HSELS2(tie_hi_1bit),      		// Slave Select
    .HADDRS2(macb1_haddr),     		// Address bus
    .HTRANSS2(macb1_htrans),    	// Transfer type 
    .HWRITES2(macb1_hwrite),    	// Transfer direction
    .HSIZES2(macb1_hsize),     		// Transfer size
    .HBURSTS2(macb1_hburst),    	// Burst type
    .HPROTS2(macb1_hprot),     		// Protection control
    .HMASTERS2(tie_lo_4bit),   		// Master select
    .HWDATAS2(macb1_hwdata),    	// Write data
    .HMASTLOCKS2(macb1_hlock), 		// Locked transfer
    .HREADYS2(macb1_hready),  	// Transfer done

    // Input Port 3
    .HSELS3(tie_hi_1bit),      		// Slave Select
    .HADDRS3(macb2_haddr),     		// Address bus
    .HTRANSS3(macb2_htrans),    	// Transfer type 
    .HWRITES3(macb2_hwrite),    	// Transfer direction
    .HSIZES3(macb2_hsize),     		// Transfer size
    .HBURSTS3(macb2_hburst),    	// Burst type
    .HPROTS3(macb2_hprot),     		// Protection control
    .HMASTERS3(tie_lo_4bit),   		// Master select
    .HWDATAS3(macb2_hwdata),    	// Write data
    .HMASTLOCKS3(macb2_hlock), 		// Locked transfer
    .HREADYS3(macb2_hready),  	// Transfer done

    // Input Port 4
    .HSELS4(tie_hi_1bit),      		// Slave Select
    .HADDRS4(macb3_haddr),     		// Address bus
    .HTRANSS4(macb3_htrans),    	// Transfer type 
    .HWRITES4(macb3_hwrite),    	// Transfer direction
    .HSIZES4(macb3_hsize),     		// Transfer size
    .HBURSTS4(macb3_hburst),    	// Burst type
    .HPROTS4(macb3_hprot),     		// Protection control
    .HMASTERS4(tie_lo_4bit),   		// Master select
    .HWDATAS4(macb3_hwdata),    	// Write data
    .HMASTLOCKS4(macb3_hlock), 		// Locked transfer
    .HREADYS4(macb3_hready),  	// Transfer done

    .HRDATAM0(ahb2ocp_hrdata),  	// Read data bus
    .HREADYOUTM0(ahb2ocp_hready),   	// HREADY feedback
    .HRESPM0(ahb2ocp_hresp),    	// Transfer response

    .HRDATAM1(sram_subsystem_hrdata),  	// Read data bus
    .HREADYOUTM1(sram_subsystem_hready),   	// HREADY feedback
    .HRESPM1(sram_subsystem_hresp),    	// Transfer response
    
    .HRDATAM2(mipi_hrdata),  	// Read data bus
    .HREADYOUTM2(mipi_hready),   	// HREADY feedback
    .HRESPM2(mipi_hresp),    	// Transfer response
    
    .HRDATAM3   (ahb2apb0_hrdata),     	// Read data bus
    .HREADYOUTM3(ahb2apb0_hready),   	// HREADY feedback
    .HRESPM3    (ahb2apb0_hresp ),      	// Transfer response
    
    .HRDATAM4   (ahb_uvc_slave_hrdata),     	// Read data bus
    .HREADYOUTM4(ahb_uvc_slave_hready),   	// HREADY feedback
    .HRESPM4    (ahb_uvc_slave_hresp ),      	// Transfer response
    
    .HRDATAM6   (ahb2apb1_hrdata),     	// Read data bus
    .HREADYOUTM6(ahb2apb1_hready),   	// HREADY feedback
    .HRESPM6    (ahb2apb1_hresp ),      	// Transfer response

    
    // Scan test dummy signals; not connected until scan insertion 
    .SCANENABLE(scan_mode),   		// Scan Test Mode Enable
    .SCANINHCLK(hclk),   		// Scan Chain Input
    
    // Output Port 0   
    .HSELM0(ahb2ocp_hsel),       	// Slave Select
    .HADDRM0(ahb2ocp_haddr),      	// Address bus
    .HTRANSM0(ahb2ocp_htrans_raw),     	// Transfer type 
    .HWRITEM0(ahb2ocp_hwrite),     	// Transfer direction
    .HSIZEM0(ahb2ocp_hsize),      	// Transfer size
    .HBURSTM0(ahb2ocp_hburst),     // Burst type
    .HPROTM0(ahb2ocp_hprot),      // Protection control
    .HMASTERM0(ahb2ocp_hmaster),    // Master select
    .HWDATAM0(ahb2ocp_hwdata),     	// Write data
    .HMASTLOCKM0(ahb2ocp_hmastlock),  // Locked transfer
    .HREADYMUXM0(ahb2ocp_hready_in),  	// Transfer done
    
    
    // Output Port 1
    .HSELM1(sram_subsystem_hsel),       	// Slave Select
    .HADDRM1(sram_subsystem_haddr),      	// Address bus
    .HTRANSM1(sram_subsystem_htrans_raw),     	// Transfer type 
    .HWRITEM1(sram_subsystem_hwrite),     	// Transfer direction
    .HSIZEM1(sram_subsystem_hsize),      	// Transfer size
    .HBURSTM1(sram_subsystem_hburst),     // Burst type
    .HPROTM1(sram_subsystem_hprot),      // Protection control
    .HMASTERM1(sram_subsystem_hmaster),    // Master select
    .HWDATAM1(sram_subsystem_hwdata),     	// Write data
    .HMASTLOCKM1(sram_subsystem_hmastlock),  // Locked transfer
    .HREADYMUXM1(sram_subsystem_hready_in),  	// Transfer done
    
    // Output Port 2
    .HSELM2(mipi_hsel),       	// Slave Select
    .HADDRM2(mipi_haddr),      	// Address bus
    .HTRANSM2(mipi_htrans_raw),     	// Transfer type 
    .HWRITEM2(mipi_hwrite),     	// Transfer direction
    .HSIZEM2(mipi_hsize),      	// Transfer size
    .HBURSTM2(mipi_hburst),     // Burst type
    .HPROTM2(mipi_hprot),      // Protection control
    .HMASTERM2(mipi_hmaster),    // Master select
    .HWDATAM2(mipi_hwdata),     	// Write data
    .HMASTLOCKM2(mipi_hmastlock),  // Locked transfer
    .HREADYMUXM2(mipi_hready_in),  	// Transfer done
    
    
    // Output Port 3
    .HSELM6(ahb2apb1_hsel),       		// Slave Select
    .HADDRM6(ahb2apb1_haddr),      		// Address bus
    .HTRANSM6(ahb2apb1_htrans_raw),     		// Transfer type 
    .HWRITEM6(ahb2apb1_hwrite),     		// Transfer direction
    .HSIZEM6(ahb2apb1_hsize),      		// Transfer size
    .HBURSTM6(ahb2apb1_hburst),     // Burst type
    .HPROTM6(ahb2apb1_hprot),      // Protection control
    .HMASTERM6(ahb2apb1_hmaster),    // Master select
    .HWDATAM6(ahb2apb1_hwdata),     		// Write data
    .HMASTLOCKM6(ahb2apb1_hmastlock),  // Locked transfer
    .HREADYMUXM6(ahb2apb1_hready_in),  		// Transfer done
    
    // Output Port 4
    .HSELM4(ahb_uvc_slave_hsel),       		// Slave Select
    .HADDRM4(ahb_uvc_slave_haddr),      		// Address bus
    .HTRANSM4(ahb_uvc_slave_htrans_raw),     		// Transfer type 
    .HWRITEM4(ahb_uvc_slave_hwrite),     		// Transfer direction
    .HSIZEM4(ahb_uvc_slave_hsize),      		// Transfer size
    .HBURSTM4(ahb_uvc_slave_hburst),     // Burst type
    .HPROTM4(ahb_uvc_slave_hprot),      // Protection control
    .HMASTERM4(ahb_uvc_slave_hmaster),    // Master select
    .HWDATAM4(ahb_uvc_slave_hwdata),     		// Write data
    .HMASTLOCKM4(ahb_uvc_slave_hmastlock),  // Locked transfer
    .HREADYMUXM4(ahb_uvc_slave_hready_in),  		// Transfer done
    
    // Output Port 5
    .HSELM3(ahb2apb0_hsel),       		// Slave Select
    .HADDRM3(ahb2apb0_haddr),      		// Address bus
    .HTRANSM3(ahb2apb0_htrans_raw),     		// Transfer type 
    .HWRITEM3(ahb2apb0_hwrite),     		// Transfer direction
    .HSIZEM3(ahb2apb0_hsize),      		// Transfer size
    .HBURSTM3(ahb2apb0_hburst),     // Burst type
    .HPROTM3(ahb2apb0_hprot),      // Protection control
    .HMASTERM3(ahb2apb0_hmaster),    // Master select
    .HWDATAM3(ahb2apb0_hwdata),     		// Write data
    .HMASTLOCKM3(ahb2apb0_hmastlock),  // Locked transfer
    .HREADYMUXM3(ahb2apb0_hready_in),  		// Transfer done
    
    .HRDATAS0(cpu_biu_hrdata),     // Read data bus
    .HREADYOUTS0(cpu_biu_hready),  //    HREADY feedback
    .HRESPS0(cpu_biu_hresp),      // Transfer response
    
    .HRDATAS1   (macb0_hrdata),     // Read data bus
    .HREADYOUTS1(macb0_hready),     // HREADY feedback
    .HRESPS1    (macb0_hresp),     // Transfer response
    
    .HRDATAS2   (macb1_hrdata),     // Read data bus
    .HREADYOUTS2(macb1_hready),     // HREADY feedback
    .HRESPS2    (macb1_hresp),     // Transfer response
    
    .HRDATAS3   (macb2_hrdata),     // Read data bus
    .HREADYOUTS3(macb2_hready),     // HREADY feedback
    .HRESPS3    (macb2_hresp),     // Transfer response
    
    .HRDATAS4   (macb3_hrdata),     // Read data bus
    .HREADYOUTS4(macb3_hready),     // HREADY feedback
    .HRESPS4    (macb3_hresp),     // Transfer response
    
    // Scan test dummy signals; not connected until scan insertion 
    .SCANOUTHCLK()  // Scan Chain Output
);






sram_subsystem i_sram_subsystem(

         //inputs
          .hclk(hclk),         // AHB Clock
          .n_hreset(n_hreset),      // AHB reset - Active low
         // AHB interface
         .hsel(sram_subsystem_hsel),         // AHB2APB select
         .haddr(sram_subsystem_haddr),        // Address bus
         .htrans(sram_subsystem_htrans),       // Transfer type
         .hsize(sram_subsystem_hsize),        // AHB Access type - byte, half-word, word
         .hwrite(sram_subsystem_hwrite),       // Write signal
         .hwdata(sram_subsystem_hwdata),       // Write data
         .hready_in(sram_subsystem_hready_in),    // Combined hready across all slaves
         .hburst(sram_subsystem_hburst),        // hburst signal
         .hprot(sram_subsystem_hprot),         // hprot signal
         .hmaster(sram_subsystem_hmaster),       // hmaster signal
         .hmastlock(sram_subsystem_hmastlock),     // master lock signal
    
         // Scan inputs
         .scan_mode(scan_mode),    // test mode
         .clk_SRPG_macb0_en(clk_SRPG_macb0_en),
         .clk_SRPG_macb1_en(clk_SRPG_macb1_en),
         .clk_SRPG_macb2_en(clk_SRPG_macb2_en),
         .clk_SRPG_macb3_en(clk_SRPG_macb3_en),

         // Outputs
         // AHB inter.face
    	 .hrdata(sram_subsystem_hrdata),       // Read data provided from target slave
    	 .hready(sram_subsystem_hready),       // Ready for new bus cycle from target slave
    	 .hresp(sram_subsystem_hresp)         // Response from the bridge
);


apb_subsystem_0  i_apb_subsystem(
    // AHB interface
    .hclk(hclk),
    .n_hreset(n_hreset),
    .hsel(ahb2apb0_hsel),
    .haddr(ahb2apb0_haddr),
    .htrans(ahb2apb0_htrans),
    .hsize(ahb2apb0_hsize),
    .hwrite(ahb2apb0_hwrite),
    .hwdata(ahb2apb0_hwdata),
    .hready_in(ahb2apb0_hready_in),
    .hburst(ahb2apb0_hburst),
    .hprot(ahb2apb0_hprot),
    .hmaster(ahb2apb0_hmaster),
    .hmastlock(ahb2apb0_hmastlock),
    .hrdata(ahb2apb0_hrdata),
    .hready(ahb2apb0_hready),
    .hresp(ahb2apb0_hresp),
    
    // APB system interface
    .pclk(pclk),
    .n_preset(n_preset),
    
    //SPI ports
    .n_ss_in(n_ss_in),
    .mi(mi),
    .si(si),
    .sclk_in(sclk_in),
    .so(so),
    .mo(mo),
    .sclk_out(sclk_out),
    .n_ss_out(n_ss_out),
    .n_so_en(n_so_en),
    .n_mo_en(n_mo_en),
    .n_sclk_en(n_sclk_en),
    .n_ss_en(n_ss_en),
    
    //UART0 ports
    .ua_rxd(ua_rxd),
    .ua_ncts(ua_ncts),
    .ua_txd(ua_txd),
    .ua_nrts(ua_nrts),
    
    //UART1 ports
    .ua_rxd1(ua_rxd1),
    .ua_ncts1(ua_ncts1),
    .ua_txd1(ua_txd1),
    .ua_nrts1(ua_nrts1),
    
    //GPIO ports
    .gpio_pin_in(gpio_pin_in),
    .n_gpio_pin_oe(n_gpio_pin_oe),
    .gpio_pin_out(gpio_pin_out),
    
    
    // SMC ports
    .smc_hclk(smc_hclk),
    .smc_n_hclk(smc_n_hclk),
    .smc_haddr(smc_haddr),
    .smc_htrans(smc_htrans),
    .smc_hsel(smc_hsel),
    .smc_hwrite(smc_hwrite),
    .smc_hsize(smc_hsize),
    .smc_hwdata(smc_hwdata),
    .smc_hready_in(smc_hready_in),
    .smc_hburst(smc_hburst),
    .smc_hprot(smc_hprot),
    .smc_hmaster(smc_hmaster),
    .smc_hmastlock(smc_hmastlock),
    .smc_hrdata(smc_hrdata), 
    .smc_hready(smc_hready),
    .smc_hresp(smc_hresp),
    .smc_n_ext_oe(smc_n_ext_oe),
    .smc_data(smc_data),
    .smc_addr(smc_addr),
    .smc_n_be(smc_n_be),
    .smc_n_cs(smc_n_cs), 
    .smc_n_we(smc_n_we),
    .smc_n_wr(smc_n_wr),
    .smc_n_rd(smc_n_rd),
    .data_smc(data_smc),
    
    // PMC ports
    .clk_SRPG_macb0_en(clk_SRPG_macb0_en),
    .clk_SRPG_macb1_en(clk_SRPG_macb1_en),
    .clk_SRPG_macb2_en(clk_SRPG_macb2_en),
    .clk_SRPG_macb3_en(clk_SRPG_macb3_en),
    .core06v(core06v),
    .core08v(core08v),
    .core10v(core10v),
    .core12v(core12v),
    .macb3_wakeup(macb3_wakeup),
    .macb2_wakeup(macb2_wakeup),
    .macb1_wakeup(macb1_wakeup),
    .macb0_wakeup(macb0_wakeup),
    
    
    // Peripheral interrupts
    .pcm_irq(pcm_irq),
    .ttc_irq(ttc_irq),
    .gpio_irq(gpio_irq),
    .uart0_irq(uart0_irq),
    .uart1_irq(uart1_irq),
    .spi_irq(spi_irq),
    .DMA_irq(dma_irq),
    .macb0_int(macb0_int),
    .macb1_int(macb1_int),
    .macb2_int(macb2_int),
    .macb3_int(macb3_int),
    
    // Scan ports
    .scan_en(tie_lo_1bit),
    .scan_in_1(tie_lo_1bit),
    .scan_in_2(tie_lo_1bit),
    .scan_mode(scan_mode),
    .scan_out_1(),
    .scan_out_2()
);

//apb_subsystem_0  i_apb_subsystem(
//    // Inputs
//    // system signals
//    .hclk(hclk),         	// AHB Clock
//    .n_hreset(n_hreset),      	// AHB reset - Active low
//    .pclk(pclk),         	// APB Clock
//    .n_preset(n_preset),      	// APB reset - Active low
//
//    .hsel(ahb2apb0_hsel),         // AHB2APB select
//    .haddr(ahb2apb0_haddr),    	// Address bus
//    .htrans(ahb2apb0_htrans),  	// Transfer type
//    .hsize(ahb2apb0_hsize),     	// AHB Access type - byte, half-word, word
//    .hwrite(ahb2apb0_hwrite),   	// Write signal
//    .hwdata(ahb2apb0_hwdata),  	// Write data
//    .hready_in(ahb2apb0_hready_in),    // Indicates that the last master has finished its bus access
//    .hburst(ahb2apb0_hburst),     // Burst type
//    .hprot(ahb2apb0_hprot),      // Protection control
//    .hmaster(ahb2apb0_hmaster),    // Master select
//    .hmastlock(ahb2apb0_hmastlock),  // Locked transfer
//
//    // AHB interface for SMC
//    .smc_hclk          (1'b0),
//    .smc_n_hclk        (1'b1),
//    .smc_haddr         (32'd0),
//    .smc_htrans        (2'b00),
//    .smc_hsel          (1'b0),
//    .smc_hwrite        (1'b0),
//    .smc_hsize         (3'd0),
//    .smc_hwdata        (32'd0),
//    .smc_hready_in     (1'b1),
//    .smc_hburst        (3'b000),
//    .smc_hprot         (4'b0000),
//    .smc_hmaster       (4'b0000),
//    .smc_hmastlock     (1'b0),
//
//    .macb0_int(macb0_int),
//    .macb1_int(macb1_int),
//    .macb2_int(macb2_int),
//    .macb3_int(macb3_int),
//    //.csi_int(csi_int),
//    .macb3_wakeup(macb3_wakeup),
//    .macb2_wakeup(macb2_wakeup),
//    .macb1_wakeup(macb1_wakeup),
//    .macb0_wakeup(macb0_wakeup),
//    //interrupt for DMA
//    .DMA_irq(1'b0),
//    // Interrupt from the USB
//    //.usb_irq(1'b0),	
//    // Scan inputs
//    .scan_en(tie_lo_1bit),      // Scan enable pin
//    .scan_in_1(tie_lo_1bit),    // Scan input for first chain
//    .scan_in_2(tie_lo_1bit),    // Scan input for second chain
//    .scan_mode(scan_mode),
//    //input for smc
//    .data_smc(32'b0),
//    //inputs for uart
//    .ua_rxd(ua_rxd),
//    .ua_rxd1(ua_rxd1),
//    .ua_ncts(ua_ncts),
//    .ua_ncts1(ua_ncts1),
//    //inputs for spi
//    .n_ss_in(n_ss_in),
//    .mi(mi),
//    .si(si),
//    .sclk_in(sclk_in),
//    //input for ttc
//    //.ttc_ext_clk(ttc_ext_clk),
//    //inputs for GPIO
//    .gpio_pin_in(gpio_pin_in),
//
//
//    //output from APB 
//    .hrdata(ahb2apb0_hrdata),       // Read data provided from target slave
//    .hready(ahb2apb0_hready),       // Ready for new bus cycle from target slave
//    .hresp(ahb2apb0_hresp),        // Response from the bridge
//
//    // AHB interface for SMC
//    .smc_hrdata(), 
//    .smc_hready(),
//    .smc_hresp(),
//
//    // Scan outputs
//    .scan_out_1(),   // Scan out for chain 1
//    .scan_out_2(),    // Scan out for chain 2
//    // Watchdog Reset output    
//    //.wd_rst(),
//    //outputs from apic
//     //.nfiq (), // Fiq interrupt output 
//     //.nirq (), // Irq interrupt output 
//    //outputs from smc
//    .smc_n_ext_oe(),
//    .smc_data(),
//    .smc_addr(),
//    .smc_n_be(),
//    .smc_n_cs(), 
//    .smc_n_we(),
//    .smc_n_wr(),
//    .smc_n_rd(),
//    //outputs from uart
//    .ua_txd(ua_txd),
//    .ua_txd1(ua_txd1),
//    .ua_nrts(ua_nrts),
//    .ua_nrts1(ua_nrts1),
//    // outputs from ttc
//    //.waveform(waveform),
//    //.n_waveform_oe(n_waveform_oe),
//    //outputs from gpio
//    .n_gpio_pin_oe(n_gpio_pin_oe),
//    .gpio_pin_out(gpio_pin_out),
//    // outputs from SPI
//    .so(so),
//    .mo(mo),
//    .sclk_out(sclk_out),
//    .n_ss_out(n_ss_out),
//    .n_so_en(n_so_en),
//    .n_mo_en(n_mo_en),
//    .n_sclk_en(n_sclk_en),
//    .n_ss_en(n_ss_en),
//    .clk_SRPG_macb0_en(clk_SRPG_macb0_en),
//    .clk_SRPG_macb1_en(clk_SRPG_macb1_en),
//    .clk_SRPG_macb2_en(clk_SRPG_macb2_en),
//    .clk_SRPG_macb3_en(clk_SRPG_macb3_en),
//    .core06v(core06v),
//    .core08v(core08v),
//    .core10v(core10v),
//    .core12v(core12v)
//
//);
//



apb_subsystem_1  i_apb_subsystem_1(
    // Inputs
    // system signals
    .hclk(hclk),         	// AHB Clock
    .n_hreset(n_hreset),      	// AHB reset - Active low
    .pclk(pclk),         	// APB Clock
    .n_preset(n_preset),      	// APB reset - Active low

    .hsel(ahb2apb1_hsel),         // AHB2APB select
    .haddr(ahb2apb1_haddr),    	// Address bus
    .htrans(ahb2apb1_htrans),  	// Transfer type
    .hsize(ahb2apb1_hsize),     	// AHB Access type - byte, half-word, word
    .hwrite(ahb2apb1_hwrite),   	// Write signal
    .hwdata(ahb2apb1_hwdata),  	// Write data
    .hready_in(ahb2apb1_hready_in),    // Indicates that the last master has finished its bus access
    .hburst(ahb2apb1_hburst),     // Burst type
    .hprot(ahb2apb1_hprot),      // Protection control
    .hmaster(ahb2apb1_hmaster),    // Master select
    .hmastlock(ahb2apb1_hmastlock),  // Locked transfer

    .prdata_mac0(prdata_macb0),
    .prdata_mac1(prdata_macb1),
    .prdata_mac2(prdata_macb2),
    .prdata_mac3(prdata_macb3),
    .pready_mac0(pready_macb0),
    .pready_mac1(pready_macb1),
    .pready_mac2(pready_macb2),
    .pready_mac3(pready_macb3),

    //.scan_en(tie_lo_1bit),      // Scan enable pin
    //.scan_in_1(tie_lo_1bit),    // Scan input for first chain
    //.scan_in_2(tie_lo_1bit),    // Scan input for second chain
    //.scan_mode(scan_mode),
    //.scan_out_1(),   // Scan out for chain 1
    //.scan_out_2(),    // Scan out for chain 2

    //output from APB 
    .hrdata(ahb2apb1_hrdata),       // Read data provided from target slave
    .hready(ahb2apb1_hready),       // Ready for new bus cycle from target slave
    .hresp(ahb2apb1_hresp),        // Response from the bridge

    .psel_mac0(psel_macb0),
    .psel_mac1(psel_macb1),
    .psel_mac2(psel_macb2),
    .psel_mac3(psel_macb3),
    .paddr(apb1_paddr),
    .pwrite(apb1_pwrite),
    .penable(apb1_penable),
    .pwdata(apb1_pwdata)

);



//--------------------------4 way Ethernet Switch----------------------------//
mac_veneer i_mac0_veneer (
   // PHY signals
   .col(macb0_col),
   .crs(macb0_crs),
   .tx_er(macb0_tx_er),
   .txd(macb0_txd),
   .tx_en(macb0_tx_en),
   .tx_clk(macb0_tx_clk),
   .rxd(macb0_rxd),
   .rx_er(macb0_rx_er),
   .rx_clk(macb0_rx_clk),
   .rx_dv(macb0_rx_dv),
   
   // MII signals
   .mdc(macb_mdc),
   .mdio_in(macb_mdio_in),
   .mdio_out(macb_mdio_out),
   .mdio_en(mdio_en),
   
   // APB interface signals
   .pclk(pclk & clk_SRPG_macb0_en),
   .n_preset(n_preset),
   .paddr(apb1_paddr),
   .prdata(prdata_macb0),
   .pwdata(apb1_pwdata),
   .pwrite(apb1_pwrite),
   .penable(apb1_penable),
   .psel(psel_macb0),
   .pready(pready_macb0),

   // AHB interface signals
   .hclk(hclk & clk_SRPG_macb0_en),             
   .n_hreset(n_hreset),
   .hready(macb0_hready),
   .hresp(macb0_hresp),
   .hrdata(macb0_hrdata),
   .hlock(macb0_hlock),
   .haddr(macb0_haddr),
   .htrans(macb0_htrans),
   .hwrite(macb0_hwrite),
   .hsize(macb0_hsize),
   .hburst(macb0_hburst),
   .hprot(macb0_hprot),
   .hwdata(macb0_hwdata),
   .intr(macb0_int),
   .macb_wakeup(macb0_wakeup)
); 

mac_veneer i_mac1_veneer (
   // PHY signals
   .col(macb1_col),
   .crs(macb1_crs),
   .tx_er(macb1_tx_er),
   .txd(macb1_txd),
   .tx_en(macb1_tx_en),
   .tx_clk(macb1_tx_clk),
   .rxd(macb1_rxd),
   .rx_er(macb1_rx_er),
   .rx_clk(macb1_rx_clk),
   .rx_dv(macb1_rx_dv),
   
   // MII signals
   .mdc(),
   .mdio_in(),
   .mdio_out(),
   .mdio_en(),
   
   // APB interface signals
   .pclk(pclk & clk_SRPG_macb1_en),
   .n_preset(n_preset),
   .paddr(apb1_paddr),
   .prdata(prdata_macb1),
   .pwdata(apb1_pwdata),
   .pwrite(apb1_pwrite),
   .penable(apb1_penable),
   .psel(psel_macb1),
   .pready(pready_macb1),

   // AHB interface signals
   .hclk(hclk & clk_SRPG_macb1_en),             
   .n_hreset(n_hreset),
   .hready(macb1_hready),
   .hresp(macb1_hresp),
   .hrdata(macb1_hrdata),
   .hlock(macb1_hlock),
   .haddr(macb1_haddr),
   .htrans(macb1_htrans),
   .hwrite(macb1_hwrite),
   .hsize(macb1_hsize),
   .hburst(macb1_hburst),
   .hprot(macb1_hprot),
   .hwdata(macb1_hwdata),
   .intr(macb1_int),
   .macb_wakeup(macb1_wakeup)
); 

mac_veneer i_mac2_veneer (
   // PHY signals
   .col(macb2_col),
   .crs(macb2_crs),
   .tx_er(macb2_tx_er),
   .txd(macb2_txd),
   .tx_en(macb2_tx_en),
   .tx_clk(macb2_tx_clk),
   .rxd(macb2_rxd),
   .rx_er(macb2_rx_er),
   .rx_clk(macb2_rx_clk),
   .rx_dv(macb2_rx_dv),
   
   // MII signals
   .mdc(),
   .mdio_in(),
   .mdio_out(),
   .mdio_en(),
   
   // APB interface signals
   .pclk(pclk & clk_SRPG_macb2_en),
   .n_preset(n_preset),
   .paddr(apb1_paddr),
   .prdata(prdata_macb2),
   .pwdata(apb1_pwdata),
   .pwrite(apb1_pwrite),
   .penable(apb1_penable),
   .psel(psel_macb2),
   .pready(pready_macb2),

   // AHB interface signals
   .hclk(hclk & clk_SRPG_macb2_en),             
   .n_hreset(n_hreset),
   .hready(macb2_hready),
   .hresp(macb2_hresp),
   .hrdata(macb2_hrdata),
   .hlock(macb2_hlock),
   .haddr(macb2_haddr),
   .htrans(macb2_htrans),
   .hwrite(macb2_hwrite),
   .hsize(macb2_hsize),
   .hburst(macb2_hburst),
   .hprot(macb2_hprot),
   .hwdata(macb2_hwdata),
   .intr(macb2_int),
   .macb_wakeup(macb2_wakeup)
); 

mac_veneer i_mac3_veneer (
   // PHY signals
   .col(macb3_col),
   .crs(macb3_crs),
   .tx_er(macb3_tx_er),
   .txd(macb3_txd),
   .tx_en(macb3_tx_en),
   .tx_clk(macb3_tx_clk),
   .rxd(macb3_rxd),
   .rx_er(macb3_rx_er),
   .rx_clk(macb3_rx_clk),
   .rx_dv(macb3_rx_dv),
   
   // MII signals
   .mdc(),
   .mdio_in(),
   .mdio_out(),
   .mdio_en(),
   
   // APB interface signals
   .pclk(pclk & clk_SRPG_macb3_en),
   .n_preset(n_preset),
   .paddr(apb1_paddr),
   .prdata(prdata_macb3),
   .pwdata(apb1_pwdata),
   .pwrite(apb1_pwrite),
   .penable(apb1_penable),
   .psel(psel_macb3),
   .pready(pready_macb3),

   // AHB interface signals
   .hclk(hclk & clk_SRPG_macb3_en),             
   .n_hreset(n_hreset),
   .hready(macb3_hready),
   .hresp(macb3_hresp),
   .hrdata(macb3_hrdata),
   .hlock(macb3_hlock),
   .haddr(macb3_haddr),
   .htrans(macb3_htrans),
   .hwrite(macb3_hwrite),
   .hsize(macb3_hsize),
   .hburst(macb3_hburst),
   .hprot(macb3_hprot),
   .hwdata(macb3_hwdata),
   .intr(macb3_int),
   .macb_wakeup(macb3_wakeup)
); 


////--------------------------4 way Ethernet Switch----------------------------//
//mac_veneer i_macb0_veneer (
//   // ethernet signals
//   .col(macb0_col),
//   .crs(macb0_crs),
//   .tx_er(macb0_tx_er),
//   .txd(macb0_txd),
//   .tx_en(macb0_tx_en),
//   .tx_clk(tx_clk0),
//   .rxd(macb0_rxd),
//   .rx_er(macb0_rx_er),
//   .rx_clk(rx_clk0),
//   .rx_dv(macb0_rx_dv),
//   .mdc(macb_mdc),
//   .mdio_in(macb_mdio_in),
//   .mdio_out(macb_mdio_out),
//   .mdio_en(mdio_en),
//   .loopback(),
//   .half_duplex(),
//   .bit_rate(),
//   .speed(),
//   .link(1'b0),
//   .eam(1'b0),
//   .tx_pause(1'b0),
//   .tx_pause_zero(1'b0),
//
//   // ethernet reset signals
//   .n_tx_reset(tx_reset0),
//   .n_rx_reset(rx_reset0),
//
//   // APB interface signals
//   .pclk(pclk & clk_SRPG_macb0_en),
//   .n_preset(n_preset),
//   .paddr(apb1_paddr[7:2]),
//   .prdata(prdata_macb0),
//   .pwdata(apb1_pwdata),
//   .pwrite(apb1_pwrite),
//   .penable(apb1_penable),
//   .psel(psel_macb0),
//   .perr(),
//
//   .hclk(hclk & clk_SRPG_macb0_en),             
//   .n_hreset(n_hreset),
//   .hgrant(tie_hi_1bit),
//   .hready(macb0_hready),
//   .hresp(macb0_hresp),
//   .hrdata(macb0_hrdata),
//   .hbusreq(),
//   .hlock(macb0_hlock),
//   .haddr(macb0_haddr),
//   .htrans(macb0_htrans),
//   .hwrite(macb0_hwrite),
//   .hsize(macb0_hsize),
//   .hburst(macb0_hburst),
//   .hprot(macb0_hprot),
//   .hwdata(macb0_hwdata),
//   .loop_back_local(macb0_lp_local),
//   .loop_clk(macb0_lclk),
//   .n_tx_clk(n_tx_clk0),
//   .ethernet_int(macb0_int),
//   .macb_wakeup(macb0_wakeup),
//   .wol()
//); 
//
//macb_clk_cntrl i_macb0_clk_cntrl(
//
//   .rx_clk_source(macb0_rx_clk),
//   .tx_clk_source(macb0_tx_clk),
//
//   .loop_back_local(macb0_lp_local),
//   .loop_clk(macb0_lclk),
//
//   .scan_test_mode(scan_mode),
//   .scan_clk(hclk),
//
//   .n_tx_clk_to_macb(n_tx_clk0),
//   .rx_clk_to_macb(rx_clk0),
//   .tx_clk_to_macb(tx_clk0)
//);
//
//mac_veneer i_macb1_veneer (
//   // ethernet signals
//   .col(macb1_col),
//   .crs(macb1_crs),
//   .tx_er(macb1_tx_er),
//   .txd(macb1_txd),
//   .tx_en(macb1_tx_en),
//   .tx_clk(tx_clk1),
//   .rxd(macb1_rxd),
//   .rx_er(macb1_rx_er),
//   .rx_clk(rx_clk1),
//   .rx_dv(macb1_rx_dv),
//   .mdc(),
//   .mdio_in(),
//   .mdio_out(),
//   .mdio_en(),
//   .loopback(),
//   .half_duplex(),
//   .bit_rate(),
//   .speed(),
//   .link(1'b0),
//   .eam(1'b0),
//   .tx_pause(1'b0),
//   .tx_pause_zero(1'b0),
//
//   // ethernet reset signals
//   .n_tx_reset(tx_reset1),
//   .n_rx_reset(rx_reset1),
//
//   // APB interface signals
//   .pclk(pclk & clk_SRPG_macb1_en),
//   .n_preset(n_preset),
//   .paddr(apb1_paddr[7:2]),
//   .prdata(prdata_macb1),
//   .pwdata(apb1_pwdata),
//   .pwrite(apb1_pwrite),
//   .penable(apb1_penable),
//   .psel(psel_macb1),
//   .perr(),
//
//   .hclk(hclk & clk_SRPG_macb1_en),             
//   .n_hreset(n_hreset),
//   .hgrant(tie_hi_1bit),
//   .hready(macb1_hready),
//   .hresp(macb1_hresp),
//   .hrdata(macb1_hrdata),
//   .hbusreq(),
//   .hlock(macb1_hlock),
//   .haddr(macb1_haddr),
//   .htrans(macb1_htrans),
//   .hwrite(macb1_hwrite),
//   .hsize(macb1_hsize),
//   .hburst(macb1_hburst),
//   .hprot(macb1_hprot),
//   .hwdata(macb1_hwdata),
//   .loop_back_local(macb1_lp_local),
//   .loop_clk(macb1_lclk),
//   .n_tx_clk(n_tx_clk1),
//   .ethernet_int(macb1_int),
//   .macb_wakeup(macb1_wakeup),
//   .wol()
//); 
//
//macb_clk_cntrl i_macb1_clk_cntrl(
//
//   .rx_clk_source(macb1_rx_clk),
//   .tx_clk_source(macb1_tx_clk),
//
//   .loop_back_local(macb1_lp_local),
//   .loop_clk(macb1_lclk),
//
//   .scan_test_mode(scan_mode),
//   .scan_clk(hclk),
//
//   .n_tx_clk_to_macb(n_tx_clk1),
//   .rx_clk_to_macb(rx_clk1),
//   .tx_clk_to_macb(tx_clk1)
//);
//
//mac_veneer i_macb2_veneer (
//   // ethernet signals
//   .col(macb2_col),
//   .crs(macb2_crs),
//   .tx_er(macb2_tx_er),
//   .txd(macb2_txd),
//   .tx_en(macb2_tx_en),
//   .tx_clk(tx_clk2),
//   .rxd(macb2_rxd),
//   .rx_er(macb2_rx_er),
//   .rx_clk(rx_clk2),
//   .rx_dv(macb2_rx_dv),
//   .mdc(),
//   .mdio_in(),
//   .mdio_out(),
//   .mdio_en(),
//   .loopback(),
//   .half_duplex(),
//   .bit_rate(),
//   .speed(),
//   .link(1'b0),
//   .eam(1'b0),
//   .tx_pause(1'b0),
//   .tx_pause_zero(1'b0),
//
//   // ethernet reset signals
//   .n_tx_reset(tx_reset2),
//   .n_rx_reset(rx_reset2),
//
//   // APB interface signals
//   .pclk(pclk & clk_SRPG_macb2_en),
//   .n_preset(n_preset),
//   .paddr(apb1_paddr[7:2]),
//   .prdata(prdata_macb2),
//   .pwdata(apb1_pwdata),
//   .pwrite(apb1_pwrite),
//   .penable(apb1_penable),
//   .psel(psel_macb2),
//   .perr(),
//
//   .hclk(hclk & clk_SRPG_macb2_en),             
//   .n_hreset(n_hreset),
//   .hgrant(tie_hi_1bit),
//   .hready(macb2_hready),
//   .hresp(macb2_hresp),
//   .hrdata(macb2_hrdata),
//   .hbusreq(),
//   .hlock(macb2_hlock),
//   .haddr(macb2_haddr),
//   .htrans(macb2_htrans),
//   .hwrite(macb2_hwrite),
//   .hsize(macb2_hsize),
//   .hburst(macb2_hburst),
//   .hprot(macb2_hprot),
//   .hwdata(macb2_hwdata),
//   .loop_back_local(macb2_lp_local),
//   .loop_clk(macb2_lclk),
//   .n_tx_clk(n_tx_clk2),
//   .ethernet_int(macb2_int),
//   .macb_wakeup(macb2_wakeup),
//   .wol()
//); 
//
//macb_clk_cntrl i_macb2_clk_cntrl(
//
//   .rx_clk_source(macb2_rx_clk),
//   .tx_clk_source(macb2_tx_clk),
//
//   .loop_back_local(macb2_lp_local),
//   .loop_clk(macb2_lclk),
//
//   .scan_test_mode(scan_mode),
//   .scan_clk(hclk),
//
//   .n_tx_clk_to_macb(n_tx_clk2),
//   .rx_clk_to_macb(rx_clk2),
//   .tx_clk_to_macb(tx_clk2)
//);
//
//
//mac_veneer i_macb3_veneer (
//   // ethernet signals
//   .col(macb3_col),
//   .crs(macb3_crs),
//   .tx_er(macb3_tx_er),
//   .txd(macb3_txd),
//   .tx_en(macb3_tx_en),
//   .tx_clk(tx_clk3),
//   .rxd(macb3_rxd),
//   .rx_er(macb3_rx_er),
//   .rx_clk(rx_clk3),
//   .rx_dv(macb3_rx_dv),
//   .mdc(),
//   .mdio_in(),
//   .mdio_out(),
//   .mdio_en(),
//   .loopback(),
//   .half_duplex(),
//   .bit_rate(),
//   .speed(),
//   .link(1'b0),
//   .eam(1'b0),
//   .tx_pause(1'b0),
//   .tx_pause_zero(1'b0),
//
//   // ethernet reset signals
//   .n_tx_reset(tx_reset3),
//   .n_rx_reset(rx_reset3),
//
//   // APB interface signals
//   .pclk(pclk & clk_SRPG_macb3_en),
//   .n_preset(n_preset),
//   .paddr(apb1_paddr[7:2]),
//   .prdata(prdata_macb3),
//   .pwdata(apb1_pwdata),
//   .pwrite(apb1_pwrite),
//   .penable(apb1_penable),
//   .psel(psel_macb3),
//   .perr(),
//
//   .hclk(hclk & clk_SRPG_macb3_en),             
//   .n_hreset(n_hreset),
//   .hgrant(tie_hi_1bit),
//   .hready(macb3_hready),
//   .hresp(macb3_hresp),
//   .hrdata(macb3_hrdata),
//   .hbusreq(),
//   .hlock(macb3_hlock),
//   .haddr(macb3_haddr),
//   .htrans(macb3_htrans),
//   .hwrite(macb3_hwrite),
//   .hsize(macb3_hsize),
//   .hburst(macb3_hburst),
//   .hprot(macb3_hprot),
//   .hwdata(macb3_hwdata),
//   .loop_back_local(macb3_lp_local),
//   .loop_clk(macb3_lclk),
//   .n_tx_clk(n_tx_clk3),
//   .ethernet_int(macb3_int),
//   .macb_wakeup(macb3_wakeup),
//   .wol()
//); 
//
//macb_clk_cntrl i_macb3_clk_cntrl(
//
//   .rx_clk_source(macb3_rx_clk),
//   .tx_clk_source(macb3_tx_clk),
//
//   .loop_back_local(macb3_lp_local),
//   .loop_clk(macb3_lclk),
//
//   .scan_test_mode(scan_mode),
//   .scan_clk(hclk),
//
//   .n_tx_clk_to_macb(n_tx_clk3),
//   .rx_clk_to_macb(rx_clk3),
//   .tx_clk_to_macb(tx_clk3)
//);
//


ahb2ocp i_ahb2ocp (


              .n_preset(n_hreset), 
              .pclk(hclk), 

// This is a APB interface provided to programm couple of registers withing OCP bridge. This is deactivated here and 
// registers will be loaded automatically at Reset
              .ao_psel_i(1'b0), 
              .ao_penable_i(1'b0), 
              .ao_pwrite_i(1'b0), 
              .ao_paddr_i(5'b0), 
              .ao_pwdata_i(32'b0),


              .hclk(hclk),
              .n_hreset(n_hreset),

              .ao_hsel_i(ahb2ocp_hsel),
	      .ao_haddr_i(ahb2ocp_haddr),
	      .ao_htrans_i(ahb2ocp_htrans),
	      .ao_hsize_i(ahb2ocp_hsize),
	      .ao_hburst_i(ahb2ocp_hburst),
	      .ao_hprot_i(ahb2ocp_hprot),
	      .ao_hwdata_i(ahb2ocp_hwdata),
	      .ao_hwrite_i(ahb2ocp_hwrite),
              .ao_hready_i(ahb2ocp_hready_in),

              .ao_sdata_i(ao_sdata_i),                // input from OCP i/f
              .ao_sresp_i(ao_sresp_i),                // input from OCP i/f
              .ao_sresplast_i(ao_sresplast_i),            // input from OCP i/f

              .ao_scmdaccept_i(ao_scmdaccept_i),           // input from OCP i/f
              .ao_sdataaccept_i(ao_sdataaccept_i),           // input from OCP i/f


              .ao_prdata_o(),           // Read data from APB i/f

	      .ao_hrdata_o(ahb2ocp_hrdata),
	      .ao_hready_o(ahb2ocp_hready),
	      .ao_hresp_o(ahb2ocp_hresp),

              .ao_mcmd_o(ao_mcmd_o),             // OCP output
              .ao_maddr_o(ao_maddr_o),             // OCP output
              .ao_matomic_length_o(ao_matomic_length_o),             // OCP output
              .ao_mburst_precise_o(ao_mburst_precise_o),             // OCP output
              .ao_mburst_single_req_o(ao_mburst_single_req_o),             // OCP output
              .ao_mburstlength_o(ao_mburstlength_o),             // OCP output
              .ao_mburst_seq_o(ao_mburst_seq_o),             // OCP output
              .ao_mtag_id_o(ao_mtag_id_o),             // OCP output
              .ao_mdata_tag_id_o(ao_mdata_tag_id_o),             // OCP output
              .ao_mdata_o(ao_mdata_o),             // OCP output
              .ao_mdatalast_o(ao_mdatalast_o),             // OCP output
              .ao_mdatavalid_o(ao_mdatavalid_o),             // OCP output
              .ao_mdataaccept_o(ao_mdataaccept_o),             // OCP output
              .ao_mrespaccept_o(ao_mrespaccept_o)             // OCP output
              );




// MIPI Instance
csi_rx_dphy_top i_csi_rx_dphy_top (
  //INPUT SIGNALS
  .hclk(hclk),                      //AHB CLOCK
  .hreset_n(n_hreset),                  //ACTIVE LOW RESET FOR AHB CLOCK
  
  .i2c_rst_n(n_hreset),

  .ci_clk(ci_clk),                    //IMAGE PROCESSOR CLK TO PROCESS PIXEL DATA
  .ci_clk_rst_n(ci_clk_rst_n),              //ACTIVE LOW RESET FOR PIXEL CLOCK
  
  .hs_rx_clk(hs_rx_clk),                 //HIGH SPEED DDR CLOCK FOR CSI CONTROLLER
  .txclkesc(txclkesc),                  //ESCAPE MODE LOW POWER CLOCK FOR CSI CONTROLLER
  .rxddr_rst_n(rxddr_rst_n),               //ACTIVE LOW RESET FOR RECEIVER DDR CLOCK FOR CSI CONTROLLER
  .txescclk_rst_n(txescclk_rst_n),            //ACTIVE LOW RESET FOR ESCAPE MODE LOW POWER CLOCK FOR CSI CONTROLLER
  
  .txbyteclkhs(txbyteclkhs),               //BYTE CLOCK GENERATED FROM DDR INPHASE CLOCK FOR CSI CONTROLLER
  .rxbyteclkhs(rxbyteclkhs),               //BYTE CLOCK GENERATED FROM DDR(HS_RX_CLK) CLOCK FOR CSI CONTROLLER
  .tx_byte_rst_n(tx_byte_rst_n),             //RESET SIGNAL FOR TXBYTECLKHS(GENERATED FROM INPHASE CLOCK) CLOCK DOMAIN FOR CSI CONTROLLER
  .rx_byte_rst_n(rx_byte_rst_n),             //RESET SIGNAL FOR RXBYTECLKHS(GENERATED FROM HS_RX_CLK) CLOCK DOMAIN FOR CSI CONTROLLER
  
  .rxclkesc_0(rxclkesc_0),                //ESCAPE MODE EX-OR CLOCK GENERATED FROM LOW POWER DP AND DN LINES FOR CSI CONTROLLER DATA LANE0
  .rxescclk_rst_0_n(rxescclk_rst_0_n),          //RESET SIGNAL FOR RXCLKESC(EX-OR CLOCK) CLOCK DOMAIN FOR CSI CONTROLLER DATA LANE0
  
  .txddr_q_rst_n(txddr_q_rst_n),             //RESET SIGNAL FOR QUADRATURE CLOCK DOMAIN FOR CSI CONTROLLER
  .txddr_i_rst_n(txddr_i_rst_n),             //RESET SIGNAL FOR INPHASE CLOCK DOMAIN FOR CSI CONTROLLER
  
  .haddr({24'h0,mipi_haddr[7:0]}),                     //INPUT HADDRESS
  .hsize(mipi_hsize),                     //INPUT HSIZE SIGNAL INDICATES THE SIZE OF THE TRANSFER
  .hburst(mipi_hburst),                    //INPUT HBURST SIGNAL INDICATES IF THE TRANSFER FORMS PART OF A BURST
  .htrans(mipi_htrans),                    //INPUT HTRANS SIGNAL INDICATES THE TYPE OF THE CURRENT TRANSFER
  .hwrite(mipi_hwrite),                    //INPUT HWRITE SIGNAL WHEN HIGH THIS SIGNAL INDICATES A WRITE TRANSFER AND WHEN LOW A READ TRANSFER
  .hwdata(mipi_hwdata),                    //INPUT HWDATA SIGNAL THE WRITE DATA BUS IS USED TO TRANSFER DATA FROM THE MASTER TO THE BUS SLAVES DURING WRITE OPERATIONS
  
  .sda_in(sda_in),                    //I2C SERIAL DATA IN SIGNAL
  
  
  .lp_rx_cp_clk(lp_rx_cp_clk),         //LOW POWER DIFFERENTIAL Cp LINE FROM THE TRANSCEIVER FOR CSI CONTROLLER
  .lp_rx_cn_clk(lp_rx_cn_clk),         //LOW POWER DIFFERENTIAL Cn LINE FROM THE TRANSCEIVER FOR CSI CONTROLLER
  
  .lp_rx_dp_0(lp_rx_dp_0),           //LOW POWER DIFFERENTIAL Dp LINE FOR CSI CONTROLLER DATA LANE0
  .lp_rx_dn_0(lp_rx_dn_0),           //LOW POWER DIFFERENTIAL Dn LINE FOR CSI CONTROLLER DATA LANE0
  .hs_rx_0(hs_rx_0),              //HIGH SPEED Dp LINE FOR CSI CONTROLLER DATA LANE0
  
  .hrdata(mipi_hrdata),                    //OUTPUT HRDATA SIGNAL THE READ DATA BUS IS USED TO TRANSFER DATA FROM BUS SLAVES TO THE BUS MASTER DURING READ OPERATIONS
  .hready(mipi_hready),                    //OUTPUT HREADY SIGNAL WHEN HIGH THE HREADY SIGNAL INDICATES THAT A TRANSFER HAS FINISHED ON THE BUS
  .hresp(mipi_hresp),                     //THE TRANSFER RESPONSE PROVIDES ADDITIONAL INFORMATION ON THE STATUS OF A TRANSFER.
  .intr(csi_int),                      //ACTIVE HIGH INTERRUPT SIGNAL
  
  
  .fs(fs),                        //FRAME START SIGNAL. PULSES FOR ONE CAPTURE CLOCK AT THE BEGINNING OF EVERY FRAME
  .fe(fe),                        //FRAME END SIGNAL. PULSES FOR ONE CAPTURE CLOCK AT THE END OF EVERY FRAME
  .ls(ls),                        //LINE START SIGNAL. PULSES FOR ONE CAPTURE CLOCK AT THE BEGINNING OF EVERY LINE
  .le(le),                        //LINE END SIGNAL. PULSES FOR ONE CAPTURE CLOCK AT THE END OF EVERY LINE
  .data_valid(data_valid),                //VALID SIGNAL TO DENOTE THAT THE PIXEL DATA IS VALID
  .data(data),                      //DATA LINES USED TO TRANSMIT 8, 9, 10 OR 12 BITS OF DATA AT A TIME.
  .ch_n(ch_n),                      //INDICATES THE ACTIVE VIRTUAL CHANNEL NUMBER
  .fmt_typ(fmt_typ),                   //INDICATES THE PIXEL FORMAT's DATA TYPE
  
  
  .hs_rx_cntrl_clk(hs_rx_cntrl_clk),      //HIGH SPEED RECEIVER CONTROL SIGNAL FROM CSI CONTROLLER FOR CLOCK LANE
  .lp_rx_cntrl_clk(lp_rx_cntrl_clk),      //LOW POWER RECEIVER CONTROL SIGNAL FROM CSI CONTROLLER FOR CLOCK LANE
  
  //OUTPUT DPHY TRANCEIVER SIGNALS FROM CSI CONTROLLER1 DATA LANE0
  .hs_rx_cntrl_0(hs_rx_cntrl_0),        //HIGH SPEED RECEIVER CONTROL SIGNAL FROM CSI CONTROLLER FOR DATA LANE0
  .lp_rx_cntrl_0(lp_rx_cntrl_0),        //LOW POWER RECEIVER CONTROL SIGNAL FROM CSI CONTROLLER FOR DATA LANE0
  
  .scl_out(scl_out),              //I2C SERIAL CLOCK OUTPUT SIGNAL
  .sda_out(sda_out)               //I2C SERIAL DATA OUTPUT SIGNAL


  
  );





endmodule
