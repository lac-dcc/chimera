// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// *                                                                           *
// * C-Sky Microsystems Confidential                                           *
// * -------------------------------                                           *
// * This file and all its contents are properties of C-Sky Microsystems. The  *
// * information contained herein is confidential and proprietary and is not   *
// * to be disclosed outside of C-Sky Microsystems except under a              *
// * Non-Disclosure Agreement (NDA).                                           *
// *                                                                           *
// *****************************************************************************
// FILE NAME       : gpio
// AUTHOR          : Yande Xiang
// ORIGINAL TIME   :
// FUNCTION        : gpio top module
// RESET           : asynchronism
// DFT             :
// DFP             :
// VERIFICATION    :
// RELEASE HISTORY :
// *****************************************************************************


// &ModuleBeg; @22
module gpio(
  b_pad_gpio_porta,
  gpio_intr,
  paddr,
  pclk,
  pclk_intr,
  penable,
  prdata,
  presetn,
  psel,
  pready,
  pslverr,
  pwdata,
  pwrite
);

// &Ports; @23
input   [6 :2]  paddr;             
input           pclk;              
input           pclk_intr;         
input           penable;           
input           presetn;           
input           psel;              
input   [31:0]  pwdata;            
input           pwrite;            
output  [7 :0]  gpio_intr;         
output  [31:0]  prdata; 
output 		pready;
output		pslverr;           
inout   [7 :0]  b_pad_gpio_porta;  

// &Regs; @24

// &Wires; @25
wire    [7 :0]  b_pad_gpio_porta;  
wire    [7 :0]  gpio_ext_porta;    
wire    [7 :0]  gpio_ext_porta_rb; 
wire    [7 :0]  gpio_int_polarity; 
wire    [7 :0]  gpio_inten;        
wire    [7 :0]  gpio_intmask;      
wire    [7 :0]  gpio_intr;         
wire            gpio_intr_flag_int; 
wire            gpio_intrclk_en;   
wire    [7 :0]  gpio_intstatus;    
wire    [7 :0]  gpio_inttype_level; 
wire            gpio_ls_sync;      
wire    [7 :0]  gpio_porta_ddr;    
wire    [7 :0]  gpio_porta_dr;     
wire    [7 :0]  gpio_porta_eoi;    
wire    [7 :0]  gpio_porta_oe;     
wire    [7 :0]  gpio_raw_intstatus; 
wire    [7 :0]  gpio_swporta_ctl;  
wire    [7 :0]  gpio_swporta_ddr;  
wire    [7 :0]  gpio_swporta_dr;   
wire    [6 :2]  paddr;             
wire            pclk;              
wire            pclk_intr;         
wire            penable;           
wire    [31:0]  prdata;            
wire            presetn;           
wire            psel;              
wire    [31:0]  pwdata;            
wire            pwrite;            


// &Force("nonport", "gpio_intstatus"); @27
// &Force("nonport", "gpio_intr_flag"); @28
// &Force("nonport", "gpio_intr_flag_n"); @29
// &Force("nonport", "gpio_intr_int"); @30
// &Force("nonport", "gpio_intr_n"); @31
// &Force("nonport", "gpio_intr_flag_int"); @32
// &Force("nonport", "gpio_intrclk_en"); @33
// &Force("inout", "b_pad_gpio_porta"); @34

// &Instance("gpio_apbif"); @36
gpio_apbif  x_gpio_apbif (
  .gpio_ext_porta_rb  (gpio_ext_porta_rb ),
  .gpio_int_polarity  (gpio_int_polarity ),
  .gpio_inten         (gpio_inten        ),
  .gpio_intmask       (gpio_intmask      ),
  .gpio_intstatus     (gpio_intstatus    ),
  .gpio_inttype_level (gpio_inttype_level),
  .gpio_ls_sync       (gpio_ls_sync      ),
  .gpio_porta_eoi     (gpio_porta_eoi    ),
  .gpio_raw_intstatus (gpio_raw_intstatus),
  .gpio_swporta_ctl   (gpio_swporta_ctl  ),
  .gpio_swporta_ddr   (gpio_swporta_ddr  ),
  .gpio_swporta_dr    (gpio_swporta_dr   ),
  .paddr              (paddr             ),
  .pclk               (pclk              ),
  .penable            (penable           ),
  .prdata             (prdata            ),
  .presetn            (presetn           ),
  .psel               (psel              ),
  .pwdata             (pwdata            ),
  .pwrite             (pwrite            )
);

// &Instance("gpio_ctrl"); @37
gpio_ctrl  x_gpio_ctrl (
  .gpio_ext_porta     (gpio_ext_porta    ),
  .gpio_ext_porta_rb  (gpio_ext_porta_rb ),
  .gpio_int_polarity  (gpio_int_polarity ),
  .gpio_inten         (gpio_inten        ),
  .gpio_intmask       (gpio_intmask      ),
  .gpio_intr          (gpio_intr         ),
  .gpio_intr_flag_int (gpio_intr_flag_int),
  .gpio_intr_int      (gpio_intstatus    ),
  .gpio_intrclk_en    (gpio_intrclk_en   ),
  .gpio_inttype_level (gpio_inttype_level),
  .gpio_ls_sync       (gpio_ls_sync      ),
  .gpio_porta_ddr     (gpio_porta_ddr    ),
  .gpio_porta_dr      (gpio_porta_dr     ),
  .gpio_porta_eoi     (gpio_porta_eoi    ),
  .gpio_raw_intstatus (gpio_raw_intstatus),
  .gpio_swporta_ctl   (gpio_swporta_ctl  ),
  .gpio_swporta_ddr   (gpio_swporta_ddr  ),
  .gpio_swporta_dr    (gpio_swporta_dr   ),
  .pclk               (pclk              ),
  .pclk_intr          (pclk_intr         ),
  .presetn            (presetn           )
);



assign pready = 1'b1;
assign pslverr = 1'b0;
// &Connect(.gpio_intr_int(gpio_intstatus)); @38

assign gpio_porta_oe[0] = gpio_porta_ddr[0];
assign gpio_ext_porta[0] = b_pad_gpio_porta[0];
assign b_pad_gpio_porta[0] = gpio_porta_oe[0] ? gpio_porta_dr[0] : 1'bz;

assign gpio_porta_oe[1] = gpio_porta_ddr[1];
assign gpio_ext_porta[1] = b_pad_gpio_porta[1];
assign b_pad_gpio_porta[1] = gpio_porta_oe[1] ? gpio_porta_dr[1] : 1'bz;

assign gpio_porta_oe[2] = gpio_porta_ddr[2];
assign gpio_ext_porta[2] = b_pad_gpio_porta[2];
assign b_pad_gpio_porta[2] = gpio_porta_oe[2] ? gpio_porta_dr[2] : 1'bz;

assign gpio_porta_oe[3] = gpio_porta_ddr[3];
assign gpio_ext_porta[3] = b_pad_gpio_porta[3];
assign b_pad_gpio_porta[3] = gpio_porta_oe[3] ? gpio_porta_dr[3] : 1'bz;

assign gpio_porta_oe[4] = gpio_porta_ddr[4];
assign gpio_ext_porta[4] = b_pad_gpio_porta[4];
assign b_pad_gpio_porta[4] = gpio_porta_oe[4] ? gpio_porta_dr[4] : 1'bz;

assign gpio_porta_oe[5] = gpio_porta_ddr[5];
assign gpio_ext_porta[5] = b_pad_gpio_porta[5];
assign b_pad_gpio_porta[5] = gpio_porta_oe[5] ? gpio_porta_dr[5] : 1'bz;

assign gpio_porta_oe[6] = gpio_porta_ddr[6];
assign gpio_ext_porta[6] = b_pad_gpio_porta[6];
assign b_pad_gpio_porta[6] = gpio_porta_oe[6] ? gpio_porta_dr[6] : 1'bz;

assign gpio_porta_oe[7] = gpio_porta_ddr[7];
assign gpio_ext_porta[7] = b_pad_gpio_porta[7];
assign b_pad_gpio_porta[7] = gpio_porta_oe[7] ? gpio_porta_dr[7] : 1'bz;

// &ModuleEnd; @72
endmodule


