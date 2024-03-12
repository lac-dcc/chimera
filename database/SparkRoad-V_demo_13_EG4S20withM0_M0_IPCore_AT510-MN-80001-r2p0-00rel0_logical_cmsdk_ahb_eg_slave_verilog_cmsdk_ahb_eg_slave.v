//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2012-07-30 18:07:21 +0100 (Mon, 30 Jul 2012) $
//
//      Revision            : $Revision: 216980 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AHB-lite example slave, support 4 32-bit register read and write,
//            each register can be accessed by byte, half word or word.
//            The example slave always output ready and OKAY response to the master
//-----------------------------------------------------------------------------
module cmsdk_ahb_eg_slave #(
  // Parameter for address width
  parameter    ADDRWIDTH =12)
 (
  input  wire                  HCLK,       // Clock
  input  wire                  HRESETn,    // Reset

  input  wire  [3:0]           ECOREVNUM, // Engineering-change-order revision bits

  // AHB connection to master
  input  wire                  HSELS,
  input  wire  [ADDRWIDTH-1:0] HADDRS,
  input  wire  [1:0]           HTRANSS,
  input  wire  [2:0]           HSIZES,
  input  wire                  HWRITES,
  input  wire                  HREADYS,
  input  wire  [31:0]          HWDATAS,

  output wire                  HREADYOUTS,
  output wire                  HRESPS,
  output wire  [31:0]          HRDATAS);


  // ----------------------------------------
  // Internal wires declarations

  // Register module interface signals
  wire  [ADDRWIDTH-1:0]  reg_addr;
  wire                   reg_read_en;
  wire                   reg_write_en;
  wire  [3:0]            reg_byte_strobe;
  wire  [31:0]           reg_wdata;
  wire  [31:0]           reg_rdata;

  //-----------------------------------------------------------
  // Module logic start
  //----------------------------------------------------------


  // Interface block to convert AHB transfers to simple read/write
  // controls.
  cmsdk_ahb_eg_slave_interface
   #(.ADDRWIDTH (ADDRWIDTH))
    u_ahb_eg_slave_interface (
  .hclk         (HCLK),
  .hresetn      (HRESETn),

  // Input slave port: 32 bit data bus interface
  .hsels        (HSELS),
  .haddrs       (HADDRS),
  .htranss      (HTRANSS),
  .hsizes       (HSIZES),
  .hwrites      (HWRITES),
  .hreadys      (HREADYS),
  .hwdatas      (HWDATAS),

  .hreadyouts   (HREADYOUTS),
  .hresps       (HRESPS),
  .hrdatas      (HRDATAS),

  // Register interface
  .addr         (reg_addr),
  .read_en      (reg_read_en),
  .write_en     (reg_write_en),
  .byte_strobe  (reg_byte_strobe),
  .wdata        (reg_wdata),
  .rdata        (reg_rdata)
  );

  // Simple data register block with four 32-bit registers
  cmsdk_ahb_eg_slave_reg
   #(.ADDRWIDTH (ADDRWIDTH))
    u_ahb_eg_slave_reg (

  .hclk         (HCLK),
  .hresetn      (HRESETn),

   // Register interface
  .addr         (reg_addr),
  .read_en      (reg_read_en),
  .write_en     (reg_write_en),
  .byte_strobe  (reg_byte_strobe),
  .wdata        (reg_wdata),
  .ecorevnum    (ECOREVNUM),
  .rdata        (reg_rdata)

  );

  //-----------------------------------------------------------
  //Module logic end
  //----------------------------------------------------------
`ifdef ARM_AHB_ASSERT_ON

 `include "std_ovl_defines.h"
  // ------------------------------------------------------------
  // Assertions
  // ------------------------------------------------------------

  wire     ovl_trans_req = HREADYS & HSELS & HTRANSS[1];

   // Check the reg_write_en signal generated
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "Error! register write signal was not generated! "
      )
    u_ovl_ahb_eg_slave_reg_write
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event ((ovl_trans_req & HWRITES)),
     .test_expr   (reg_write_en == 1'b1)
     );


  // Check the reg_read_en signal generated
  assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "Error! register read signal was not generated! "
      )
    u_ovl_ahb_eg_slave_reg_read
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event ((ovl_trans_req & (~HWRITES))),
     .test_expr   (reg_read_en == 1'b1)
     );



  // Check register read and write operation won't assert at the same cycle
    assert_never
     #(`OVL_ERROR,
       `OVL_ASSERT,
       "Error! register read and write active at the same cycle!")
    u_ovl_ahb_eg_slave_rd_wr_illegal
     (.clk(HCLK),
      .reset_n(HRESETn),
      .test_expr((reg_write_en & reg_read_en))
      );

`endif

endmodule

