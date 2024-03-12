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
//      Checked In          : $Date: 2013-04-10 15:07:36 +0100 (Wed, 10 Apr 2013) $
//
//      Revision            : $Revision: 243494 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AHB to APB bridge
//-----------------------------------------------------------------------------
// The bridge allows HCLK being asynchronous to PCLK
//

module cmsdk_ahb_to_apb_async #(
  // Parameter to define address width
  // 16 = 2^16 = 64KB APB address space
  parameter     ADDRWIDTH = 16)
 (
  // -------------------------------------------------------
  // I/O declarations
  input  wire                 HCLK,      // Clock
  input  wire                 HRESETn,   // Reset

  input  wire                 HSEL,      // Device select
  input  wire [ADDRWIDTH-1:0] HADDR,     // Address
  input  wire           [1:0] HTRANS,    // Transfer control
  input  wire          [2:0]  HSIZE,     // Transfer size
  input  wire          [3:0]  HPROT,     // Protection control
  input  wire                 HWRITE,    // Write control
  input  wire                 HREADY,    // Transfer phase done
  input  wire          [31:0] HWDATA,    // Write data

  output wire                 HREADYOUT, // Device ready
  output wire          [31:0] HRDATA,    // Read data output
  output wire                 HRESP,     // Device response

  input  wire                 PCLK,      // Clock
  input  wire                 PRESETn,   // Reset

                                         // APB Output
  output wire [ADDRWIDTH-1:0] PADDR,     // APB Address
  output wire                 PENABLE,   // APB Enable
  output wire           [3:0] PSTRB,     // APB Byte Strobe
  output wire           [2:0] PPROT,     // APB Prot
  output wire                 PWRITE,    // APB Write
  output wire          [31:0] PWDATA,    // APB write data
  output wire                 PSEL,      // APB Select

  input  wire          [31:0] PRDATA,    // APB Input
  input  wire                 PREADY,
  input  wire                 PSLVERR,

  output wire                 APBACTIVE); // APB bus is active, for clock gating
                                          // of APB bus
  // -------------------------------------------------------
  // internal wires declarations
  // Sampled signals
  wire   [ADDRWIDTH-3:0] s_addr;     // Sampled address
  wire                   s_trans_valid;// Transfer Valid
  wire                   s_write;    // Write control
  wire            [31:0] s_wdata;    // Write data
  wire             [1:0] s_prot;     // PROT information
  wire             [3:0] s_strb;     // Byte strobe information

  wire            [31:0] s_rdata;    // Read data
  wire                   s_resp;     // Transfer response

  // Handshaking signals
  wire                   s_req_h;    // Transfer request in HCLK domain
  wire                   s_req_p;    // Transfer request in PCLK domain
  wire                   s_ack_h;    // Transfer acknowledge in HCLK domain
  wire                   s_ack_p;    // Transfer acknowledge in PCLK domain

  // -------------------------------------------------------
  // AHB domain blockswdata
  cmsdk_ahb_to_apb_async_h #(.ADDRWIDTH(ADDRWIDTH))
   u_ahb_to_apb_async_h (
    .HCLK                (HCLK),
    .HRESETn             (HRESETn),

    .HADDR               (HADDR),   // Inputs
    .HSEL                (HSEL),
    .HTRANS              (HTRANS),
    .HSIZE               (HSIZE),
    .HPROT               (HPROT),
    .HWRITE              (HWRITE),
    .HWDATA              (HWDATA),
    .HREADY              (HREADY),

    .HREADYOUT           (HREADYOUT), // Outputs
    .HRDATA              (HRDATA),
    .HRESP               (HRESP),

    .s_addr              (s_addr),  // Outputs
    .s_trans_valid       (s_trans_valid),
    .s_write             (s_write),
    .s_prot              (s_prot),
    .s_strb              (s_strb),
    .s_wdata             (s_wdata),

    .s_rdata             (s_rdata), // Inputs
    .s_resp              (s_resp),

    .s_req_h             (s_req_h),  // Output
    .s_ack_h             (s_ack_h)   // Input
    );

  // -------------------------------------------------------
  // Synchronisers

  // Request synchronize from AHB to APB
  cmsdk_ahb_to_apb_async_syn u_ahb_to_apb_async_syn_1
  (
    .clk                 (PCLK),
    .resetn              (PRESETn),
    .enable              (1'b1),
    .d_in                (s_req_h),
    .d_out               (s_req_p)
   );

  // Request synchronize from APB to AHB
  cmsdk_ahb_to_apb_async_syn u_ahb_to_apb_async_syn_2
  (
    .clk                 (HCLK),
    .resetn              (HRESETn),
    .enable              (1'b1),
    .d_in                (s_ack_p),
    .d_out               (s_ack_h)
   );

  // -------------------------------------------------------
  // APB domain block

  cmsdk_ahb_to_apb_async_p #(.ADDRWIDTH(ADDRWIDTH))
   u_ahb_to_apb_async_p (
    .PCLK                (PCLK),
    .PRESETn             (PRESETn),

    .s_addr              (s_addr),  // Inputs
    .s_trans_valid       (s_trans_valid),
    .s_write             (s_write),
    .s_prot              (s_prot),
    .s_strb              (s_strb),
    .s_wdata             (s_wdata),

    .s_rdata             (s_rdata), // Outputs
    .s_resp              (s_resp),

    .PADDR               (PADDR),  // Output
    .PSEL                (PSEL),
    .PENABLE             (PENABLE),
    .PWRITE              (PWRITE),
    .PPROT               (PPROT),
    .PSTRB               (PSTRB),
    .PWDATA              (PWDATA),

    .PRDATA              (PRDATA), // Inputs
    .PREADY              (PREADY),
    .PSLVERR             (PSLVERR),

    .APBACTIVE           (APBACTIVE),

    .s_req_p             (s_req_p),  // Input
    .s_ack_p             (s_ack_p)   // Output
    );

   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
`ifdef ARM_AHB_ASSERT_ON
`include "std_ovl_defines.h"


  // Sampling signals at HCLK
  reg     ovl_reg_last_s_req_h;
  reg     ovl_reg_last_s_ack_h;
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    begin
    ovl_reg_last_s_req_h <= 1'b0;
    ovl_reg_last_s_ack_h <= 1'b0;
    end
  else
    begin
    ovl_reg_last_s_req_h <= s_req_h;
    ovl_reg_last_s_ack_h <= s_ack_h;
    end
  end

  // Sampling signals at PCLK
  reg     ovl_reg_last_s_req_p;
  reg     ovl_reg_last_s_ack_p;
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    begin
    ovl_reg_last_s_req_p <= 1'b0;
    ovl_reg_last_s_ack_p <= 1'b0;
    end
  else
    begin
    ovl_reg_last_s_req_p <= s_req_p;
    ovl_reg_last_s_ack_p <= s_ack_p;
    end
  end

   // Test 4 phase hande shaking - phase 1
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Req rising edge should only take place when Ack is low")
   u_ovl_handshake_1
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr(s_req_h & (~ovl_reg_last_s_req_h) & s_ack_h)
      );

   // Test 4 phase hande shaking - phase 2
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Ack rising edge should only take place when Reg is high")
   u_ovl_handshake_2
     (.clk(PCLK), .reset_n(PRESETn),
      .test_expr(s_ack_p & (~ovl_reg_last_s_ack_p) & (~s_req_p) & HRESETn)
      );

   // Test 4 phase hande shaking - phase 3
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Req falling edge should only take place when Ack is high")
   u_ovl_handshake_3
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((~s_req_h) & ovl_reg_last_s_req_h & (~s_ack_h) & PRESETn)
      );

   // Test 4 phase hande shaking - phase 4
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Ack falling edge should only take place when Reg is low")
   u_ovl_handshake_4
     (.clk(PCLK), .reset_n(PRESETn),
      .test_expr((~s_ack_p) & ovl_reg_last_s_ack_p & s_req_p)
      );

   // Capture last read APB data
  reg [31:0] ovl_last_read_apb_data_reg;
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    ovl_last_read_apb_data_reg <= {32{1'b0}};
  else if (PREADY & PENABLE & (~PWRITE) & PSEL)
    ovl_last_read_apb_data_reg <= PRDATA;
  end

  // Capture last APB response
  reg        ovl_last_read_apb_resp_reg;
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    ovl_last_read_apb_resp_reg <= 1'b0;
  else if (PREADY & PENABLE & PSEL)
    ovl_last_read_apb_resp_reg <= PSLVERR;
  end

  // Create signal to indicate data phase
  reg        ovl_ahb_data_phase_reg;
  reg        ovl_ahb_data_phase_wr_ctrl;
  wire       ovl_ahb_data_phase_nxt = HSEL & HTRANS[1];

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    begin
    ovl_ahb_data_phase_reg <= 1'b0;
    ovl_ahb_data_phase_wr_ctrl <= 1'b0;
    end
  else if (HREADY)
    begin
    ovl_ahb_data_phase_reg <= ovl_ahb_data_phase_nxt;
    ovl_ahb_data_phase_wr_ctrl <= HWRITE;
    end
  end

  // Last read APB data should be the same as HRDATA, unless there is an error response
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Read data mismatch")
   u_ovl_read_data_mistmatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_ahb_data_phase_reg & (~ovl_ahb_data_phase_wr_ctrl) & HREADYOUT & (~HRESP)),
      .consequent_expr(ovl_last_read_apb_data_reg==HRDATA)
      );

  // AHB response should match APB response
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Response mismatch")
   u_ovl_resp_mistmatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_ahb_data_phase_reg & HREADYOUT),
      .consequent_expr(ovl_last_read_apb_resp_reg==HRESP)
      );

  // APBACTIVE should be high before and during APB transfers
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "APBACTIVE should be active when handshaking in progress")
   u_ovl_apbactive_1
     (.clk(PCLK), .reset_n(PRESETn),
      .antecedent_expr((s_req_p != s_ack_p)),
      .consequent_expr(APBACTIVE)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "APBACTIVE should be active when PSEL is 1")
   u_ovl_apbactive_2
     (.clk(PCLK), .reset_n(PRESETn),
      .antecedent_expr(PSEL),
      .consequent_expr(APBACTIVE)
      );

   // Capture write data
  reg [31:0] ovl_last_write_ahb_data_reg;
  wire       ovl_nxt_sample_wdata_for_check;
  reg        ovl_reg_sample_wdata_for_check;

  assign ovl_nxt_sample_wdata_for_check = HSEL & HTRANS[1] & HWRITE & HREADY;
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    ovl_reg_sample_wdata_for_check <= 1'b0;
  else
    ovl_reg_sample_wdata_for_check <= ovl_nxt_sample_wdata_for_check;
  end

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    ovl_last_write_ahb_data_reg <= {32{1'b0}};
  else if (ovl_reg_sample_wdata_for_check)
    ovl_last_write_ahb_data_reg <= HWDATA;
  end

  // Write data mismatch
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "APBACTIVE should be active")
   u_ovl_write_data_mismatch
     (.clk(PCLK), .reset_n(PRESETn),
      .antecedent_expr(PSEL & PWRITE),
      .consequent_expr(ovl_last_write_ahb_data_reg == PWDATA)
      );

`endif

`ifdef ARM_APB_ASSERT_ON
   ApbPC #(
      .ADDR_WIDTH                   (ADDRWIDTH),
      .DATA_WIDTH                   (32),
      .SEL_WIDTH                    (1),

    // OVL instances property_type (0=assert, 1=assume, 2=ignore)
      .MASTER_REQUIREMENT_PROPTYPE  (0),
      .SLAVE_REQUIREMENT_PROPTYPE   (0),

      .PREADY_FUNCTIONAL            (1),
      .PSLVERR_FUNCTIONAL           (1),
      .PPROT_FUNCTIONAL             (1),
      .PSTRB_FUNCTIONAL             (1)

   ) u_Apb4PC_ahb_to_apb (
      //Clock and resets
      .PCLK      (PCLK),
      .PRESETn   (PRESETn),

      .PADDR     (PADDR),
      .PPROT     (PPROT),
      .PSELx     (PSEL),
      .PENABLE   (PENABLE),
      .PWRITE    (PWRITE),
      .PSTRB     (PSTRB),
      .PREADY    (PREADY),
      .PSLVERR   (PSLVERR),
      .PWDATA    (PWDATA),
      .PRDATA    (PRDATA)
  );

`endif

endmodule
