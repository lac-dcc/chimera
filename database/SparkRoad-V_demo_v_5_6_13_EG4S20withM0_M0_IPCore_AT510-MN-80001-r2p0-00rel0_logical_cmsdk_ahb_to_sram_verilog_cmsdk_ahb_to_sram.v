// ----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//        (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2012-09-18 17:14:17 +0100 (Tue, 18 Sep 2012) $
//
//      Revision            : $Revision: 223062 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
// ----------------------------------------------------------------------------
//  Purpose : AHB OnChip RAM interface. Also suitable for FPGA RAM implmentation
// ----------------------------------------------------------------------------

module cmsdk_ahb_to_sram #(
// --------------------------------------------------------------------------
// Parameter Declarations
// --------------------------------------------------------------------------
  parameter AW       = 16) // Address width
 (
// --------------------------------------------------------------------------
// Port Definitions
// --------------------------------------------------------------------------
  input  wire          HCLK,      // system bus clock
  input  wire          HRESETn,   // system bus reset
  input  wire          HSEL,      // AHB peripheral select
  input  wire          HREADY,    // AHB ready input
  input  wire    [1:0] HTRANS,    // AHB transfer type
  input  wire    [2:0] HSIZE,     // AHB hsize
  input  wire          HWRITE,    // AHB hwrite
  input  wire [AW-1:0] HADDR,     // AHB address bus
  input  wire   [31:0] HWDATA,    // AHB write data bus
  output wire          HREADYOUT, // AHB ready output to S->M mux
  output wire          HRESP,     // AHB response
  output wire   [31:0] HRDATA,    // AHB read data bus

  input  wire   [31:0] SRAMRDATA, // SRAM Read Data
  output wire [AW-3:0] SRAMADDR,  // SRAM address
  output wire    [3:0] SRAMWEN,   // SRAM write enable (active high)
  output wire   [31:0] SRAMWDATA, // SRAM write data
  output wire          SRAMCS);   // SRAM Chip Select  (active high)

   // ----------------------------------------------------------
   // Internal state
   // ----------------------------------------------------------
   reg  [(AW-3):0]           buf_addr;        // Write address buffer
   reg  [ 3:0]               buf_we;          // Write enable buffer (data phase)
   reg                       buf_hit;         // High when AHB read address
                                              // matches buffered address
   reg  [31:0]               buf_data;        // AHB write bus buffered
   reg                       buf_pend;        // Buffer write data valid
   reg                       buf_data_en;     // Data buffer write enable (data phase)

   // ----------------------------------------------------------
   // Read/write control logic
   // ----------------------------------------------------------

   wire        ahb_access   = HTRANS[1] & HSEL & HREADY;
   wire        ahb_write    = ahb_access &  HWRITE;
   wire        ahb_read     = ahb_access & (~HWRITE);

   // Stored write data in pending state if new transfer is read
   //   buf_data_en indicate new write (data phase)
   //   ahb_read    indicate new read  (address phase)
   //   buf_pend    is registered version of buf_pend_nxt
   wire        buf_pend_nxt = (buf_pend | buf_data_en) & ahb_read;

   // RAM write happens when
   // - write pending (buf_pend), or
   // - new AHB write seen (buf_data_en) at data phase,
   // - and not reading (address phase)
   wire        ram_write    = (buf_pend | buf_data_en)  & (~ahb_read); // ahb_write

   // RAM WE is the buffered WE
   assign      SRAMWEN  = {4{ram_write}} & buf_we[3:0];

   // RAM address is the buffered address for RAM write otherwise HADDR
   assign      SRAMADDR = ahb_read ? HADDR[AW-1:2] : buf_addr;

   // RAM chip select during read or write
   assign      SRAMCS   = ahb_read | ram_write;

   // ----------------------------------------------------------
   // Byte lane decoder and next state logic
   // ----------------------------------------------------------

   wire       tx_byte    = (~HSIZE[1]) & (~HSIZE[0]);
   wire       tx_half    = (~HSIZE[1]) &  HSIZE[0];
   wire       tx_word    =   HSIZE[1];

   wire       byte_at_00 = tx_byte & (~HADDR[1]) & (~HADDR[0]);
   wire       byte_at_01 = tx_byte & (~HADDR[1]) &   HADDR[0];
   wire       byte_at_10 = tx_byte &   HADDR[1]  & (~HADDR[0]);
   wire       byte_at_11 = tx_byte &   HADDR[1]  &   HADDR[0];

   wire       half_at_00 = tx_half & (~HADDR[1]);
   wire       half_at_10 = tx_half &   HADDR[1];

   wire       word_at_00 = tx_word;

   wire       byte_sel_0 = word_at_00 | half_at_00 | byte_at_00;
   wire       byte_sel_1 = word_at_00 | half_at_00 | byte_at_01;
   wire       byte_sel_2 = word_at_00 | half_at_10 | byte_at_10;
   wire       byte_sel_3 = word_at_00 | half_at_10 | byte_at_11;

   // Address phase byte lane strobe
   wire [3:0] buf_we_nxt = { byte_sel_3 & ahb_write,
                             byte_sel_2 & ahb_write,
                             byte_sel_1 & ahb_write,
                             byte_sel_0 & ahb_write };

   // ----------------------------------------------------------
   // Write buffer
   // ----------------------------------------------------------

   // buf_data_en is data phase write control
   always @(posedge HCLK or negedge HRESETn)
     if (~HRESETn)
       buf_data_en <= 1'b0;
     else
       buf_data_en <= ahb_write;

   always @(posedge HCLK)
     if(buf_we[3] & buf_data_en)
       buf_data[31:24] <= HWDATA[31:24];

   always @(posedge HCLK)
     if(buf_we[2] & buf_data_en)
       buf_data[23:16] <= HWDATA[23:16];

   always @(posedge HCLK)
     if(buf_we[1] & buf_data_en)
       buf_data[15: 8] <= HWDATA[15: 8];

   always @(posedge HCLK)
     if(buf_we[0] & buf_data_en)
       buf_data[ 7: 0] <= HWDATA[ 7: 0];

   // buf_we keep the valid status of each byte (data phase)
   always @(posedge HCLK or negedge HRESETn)
     if (~HRESETn)
       buf_we <= 4'b0000;
     else if(ahb_write)
       buf_we <= buf_we_nxt;

   always @(posedge HCLK or negedge HRESETn)
     begin
     if (~HRESETn)
       buf_addr <= {(AW-2){1'b0}};
     else if (ahb_write)
         buf_addr <= HADDR[(AW-1):2];
     end
   // ----------------------------------------------------------
   // Buf_hit detection logic
   // ----------------------------------------------------------

   wire  buf_hit_nxt = (HADDR[AW-1:2] == buf_addr[AW-3:0]);

   // ----------------------------------------------------------
   // Read data merge : This is for the case when there is a AHB
   // write followed by AHB read to the same address. In this case
   // the data is merged from the buffer as the RAM write to that
   // address hasn't happened yet
   // ----------------------------------------------------------

   wire [ 3:0] merge1  = {4{buf_hit}} & buf_we; // data phase, buf_we indicates data is valid

   assign HRDATA =
              { merge1[3] ? buf_data[31:24] : SRAMRDATA[31:24],
                merge1[2] ? buf_data[23:16] : SRAMRDATA[23:16],
                merge1[1] ? buf_data[15: 8] : SRAMRDATA[15: 8],
                merge1[0] ? buf_data[ 7: 0] : SRAMRDATA[ 7: 0] };

   // ----------------------------------------------------------
   // Synchronous state update
   // ----------------------------------------------------------

   always @(posedge HCLK or negedge HRESETn)
     if (~HRESETn)
       buf_hit <= 1'b0;
     else if(ahb_read)
       buf_hit <= buf_hit_nxt;

   always @(posedge HCLK or negedge HRESETn)
     if (~HRESETn)
       buf_pend <= 1'b0;
     else
       buf_pend <= buf_pend_nxt;

   // if there is an AHB write and valid data in the buffer, RAM write data
   // comes from the buffer. otherwise comes from the HWDATA
   assign SRAMWDATA = (buf_pend) ? buf_data : HWDATA[31:0];

   // ----------------------------------------------------------
   // Assign outputs
   // ----------------------------------------------------------
   assign HREADYOUT = 1'b1;
   assign HRESP     = 1'b0;

`ifdef ARM_AHB_ASSERT_ON

   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
   //
`include "std_ovl_defines.h"

   reg ovl_ahb_read_reg;  // Last cycle has an AHB read in address phase
   reg ovl_ahb_write_reg; // Last cycle has an AHB write in address phase
   reg ovl_buf_pend_reg;  // Value of buf_pend in the last cycle

   always @(posedge HCLK or negedge HRESETn)
   begin
   if (~HRESETn)
     begin
     ovl_ahb_read_reg  <= 1'b0;
     ovl_ahb_write_reg <= 1'b0;
     ovl_buf_pend_reg  <= 1'b0;
     end
   else
     begin
     ovl_ahb_read_reg  <= ahb_read;
     ovl_ahb_write_reg <= ahb_write;
     ovl_buf_pend_reg  <= buf_pend;
     end
   end

   // -----------------------------------------------------------------------------
   // OVLs for read operations
   // -----------------------------------------------------------------------------

   // Check during a read (address phase), SRAMADDR must match
   // HADDR unless it is reading a word that is already inside the buffer.
   // Note:This interface module still generate a read to the SRAM although
   // strictly speaking it is not required.

   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "SRAMADDR read incorrect")
   u_ovl_sramaddr_read_transfer_error
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr(HTRANS[1] & HSEL & HREADY & (~HWRITE) & (SRAMADDR != HADDR[(AW-1):2]))
      );

   // Check during a read (address phase), SRAMWEN must be low
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "SRAMWEN read incorrect")
   u_ovl_sramwen_read_transfer_error
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr(HTRANS[1] & HSEL & HREADY & (~HWRITE) & (SRAMWEN!=4'b0000))
      );

   // Check during a read (address phase), SRAMCS must be high
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "SRAMCS read incorrect")
   u_ovl_sramcs_read_transfer_error
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr(HTRANS[1] & HSEL & HREADY & (~HWRITE) & (SRAMCS!=1'b1))
      );

   // -----------------------------------------------------------------------------
   // OVLs for write operations
   // -----------------------------------------------------------------------------

   // Check during a write (data phase), if there is no read in address phase
   // SRAMADDR should be same as buffered address
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "SRAMADDR write incorrect")
   u_ovl_sramaddr_wr_transfer_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_ahb_write_reg & // write data phase
        (ahb_read==1'b0)), // no read
      .consequent_expr(SRAMADDR==buf_addr)
      );

   // Check during a write (data phase), if there is no read in address phase
   // SRAMCS should be high
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "SRAMCS write incorrect")
   u_ovl_sramcs_wr_transfer_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_ahb_write_reg & // write data phase
        (ahb_read==1'b0)), // no read
      .consequent_expr(SRAMCS)
      );

   // Check during a write (data phase), if there is no read in address phase
   // SRAMWEN should be active
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "SRAMWEN write incorrect")
   u_ovl_sramwen_wr_transfer_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_ahb_write_reg & // write data phase
        (ahb_read==1'b0)), // no read
      .consequent_expr(SRAMWEN==buf_we)
      );

   // Check during a write (data phase), if there is no read in address phase
   // SRAMWDATA should be same as HWDATA
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "SRAMWDATA write incorrect")
   u_ovl_sramwdata_wr_transfer_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_ahb_write_reg & // write data phase
        (ahb_read==1'b0)),  // no read
      .consequent_expr(buf_pend == 1'b0) // Instead of checking SRAMWDATA and HWDATA
      ); // which can be X, check buf_pend instead. Otherwise OVL_ERROR will be
         // generated when write data is unknown.

   // -----------------------------------------------------------------------------
   // OVLs for buffered write operations
   // -----------------------------------------------------------------------------

   // Check during a write (address phase) or idle, if there is a buffered write
   // SRAMADDR should be same as buffered address
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "SRAMADDR buffer write incorrect")
   u_ovl_sramaddr_bufwr_transfer_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((~(HTRANS[1] & HSEL & HREADY))|(HWRITE)) & // Idle or write
        (buf_pend==1'b1)), // buffered write pending
      .consequent_expr(SRAMADDR==buf_addr)
      );

   // Check during a write (address phase) or idle, if there is a buffered write
   // SRAMWDATA should be same as buffered write data
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "SRAMWDATA buffer write incorrect")
   u_ovl_sramwdata_bufwr_transfer_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((~(HTRANS[1] & HSEL & HREADY))|(HWRITE)) & // Idle or write
        (buf_pend==1'b1)),  // buffered write pending
      .consequent_expr(SRAMWDATA==buf_data)
      );

   // Check during a write (address phase) or idle, if there is a buffered write
   // SRAMCS should be high
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "SRAMWDATA buffer write incorrect")
   u_ovl_sramcs_bufwr_transfer_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((~(HTRANS[1] & HSEL & HREADY))|(HWRITE)) & // Idle or write
        (buf_pend==1'b1)),  // buffered write pending
      .consequent_expr(SRAMCS)
      );

   // Check during a write (address phase) or idle, if there is a buffered write
   // SRAMWEN should be high
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "SRAMWEN buffer write incorrect")
   u_ovl_sramwen_bufwr_transfer_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((~(HTRANS[1] & HSEL & HREADY))|(HWRITE)) & // Idle or write
        (buf_pend==1'b1)), // buffered write pending
      .consequent_expr(SRAMWEN==buf_we)
      );

   // -----------------------------------------------------------------------------
   // OVLs for write buffer status
   // -----------------------------------------------------------------------------

   // Check if last cycle is an AHB write (address phase) and this cycle
   // we have an AHB read, then buf_pend_nxt should be high
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "buf_pend not staying high at read")
   u_ovl_buf_pend_nxt_set_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_ahb_write_reg & ahb_read),
      .consequent_expr(buf_pend_nxt)
      );

   // Check if last cycle is an AHB read and last buf_pend was high, then
   // buf_pend should still be high this cycle
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "buf_pend not staying high at read")
   u_ovl_buf_pend_stay_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_ahb_read_reg & ovl_buf_pend_reg),
      .consequent_expr(buf_pend)
      );

   // Check if last cycle is an AHB write (address phase) or idle, then
   // buf_pend should be low this cycle
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "buf_pend not clear")
   u_ovl_buf_pend_clear_error
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_ahb_write_reg | (~ovl_ahb_read_reg)),
      .consequent_expr(~buf_pend)
      );

`endif

endmodule
