// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : apb_subsystem_1.v
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

module apb_subsystem_1(
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

    // APB interface
    pclk,       
    n_preset,  
    paddr,
    pwrite,
    penable,
    pwdata, 
    
    // MAC0 APB ports
    prdata_mac0,
    psel_mac0,
    pready_mac0,
    
    // MAC1 APB ports
    prdata_mac1,
    psel_mac1,
    pready_mac1,
    
    // MAC2 APB ports
    prdata_mac2,
    psel_mac2,
    pready_mac2,
    
    // MAC3 APB ports
    prdata_mac3,
    psel_mac3,
    pready_mac3
);

// AHB interface
input         hclk;     
input         n_hreset; 
input         hsel;     
input [31:0]  haddr;    
input [1:0]   htrans;   
input [2:0]   hsize;    
input [31:0]  hwdata;   
input         hwrite;   
input         hready_in;
input [2:0]   hburst;   
input [3:0]   hprot;    
input [3:0]   hmaster;  
input         hmastlock;
output [31:0] hrdata;
output        hready;
output [1:0]  hresp; 

// APB interface
input         pclk;     
input         n_preset; 
output [31:0] paddr;
output   	    pwrite;
output   	    penable;
output [31:0] pwdata;

// MAC0 APB ports
input [31:0] prdata_mac0;
output	     psel_mac0;
input        pready_mac0;

// MAC1 APB ports
input [31:0] prdata_mac1;
output	     psel_mac1;
input        pready_mac1;

// MAC2 APB ports
input [31:0] prdata_mac2;
output	     psel_mac2;
input        pready_mac2;

// MAC3 APB ports
input [31:0] prdata_mac3;
output	     psel_mac3;
input        pready_mac3;

wire  [31:0] prdata_alut;

assign tie_hi_bit = 1'b1;

ahb2apb #(
  32'h00A00000, // Slave 0 Address Range
  32'h00A0FFFF,

  32'h00A10000, // Slave 1 Address Range
  32'h00A1FFFF,

  32'h00A20000, // Slave 2 Address Range 
  32'h00A2FFFF,

  32'h00A30000, // Slave 3 Address Range
  32'h00A3FFFF,

  32'h00A40000, // Slave 4 Address Range
  32'h00A4FFFF
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
    .prdata0(prdata_alut),
    .prdata1(prdata_mac0), 
    .prdata2(prdata_mac1),  
    .prdata3(prdata_mac2),   
    .prdata4(prdata_mac3),   
    .prdata5(32'h0),   
    .prdata6(32'h0),    
    .prdata7(32'h0),   
    .prdata8(32'h0),  
    .pready0(tie_hi_bit),     
    .pready1(pready_mac0),   
    .pready2(pready_mac1),     
    .pready3(pready_mac2),     
    .pready4(pready_mac3),     
    .pready5(tie_hi_bit),     
    .pready6(tie_hi_bit),     
    .pready7(tie_hi_bit),     
    .pready8(tie_hi_bit),  
    .pwdata(pwdata),       
    .pwrite(pwrite),       
    .paddr(paddr),        
    .psel0(psel_alut),     
    .psel1(psel_mac0),   
    .psel2(psel_mac1),    
    .psel3(psel_mac2),     
    .psel4(psel_mac3),     
    .psel5(),     
    .psel6(),    
    .psel7(),   
    .psel8(),  
    .penable(penable)     
);

alut_veneer i_alut_veneer (
        //inputs
        . n_p_reset(n_preset),
        . pclk(pclk),
        . psel(psel_alut),
        . penable(penable),
        . pwrite(pwrite),
        . paddr(paddr[6:0]),
        . pwdata(pwdata),

        //outputs
        . prdata(prdata_alut)
);

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

  .psel00(psel_alut),
	.psel01(psel_mac0),
	.psel02(psel_mac1),
	.psel03(psel_mac2),
	.psel04(psel_mac3),
	.psel05(psel05),
	.psel06(psel06),
	.psel07(psel07),
	.psel08(psel08),
	.psel09(psel09),
	.psel10(psel10),
	.psel11(psel11),
	.psel12(psel12),
	.psel13(psel13),
	.psel14(psel14),
	.psel15(psel15),

   .prdata00(prdata_alut), // Read Data from peripheral ALUT

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
   .ahb2apb_hsel(ahb2apb1_hsel));



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
        .hsel_i(ahb2apb1_hsel)
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




endmodule
