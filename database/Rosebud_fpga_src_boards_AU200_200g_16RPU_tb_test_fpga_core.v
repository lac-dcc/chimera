// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2021 Moein Khazraee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

module test_fpga_core;

// Parameters
parameter AXIS_PCIE_DATA_WIDTH = 512;
parameter AXIS_PCIE_KEEP_WIDTH = (AXIS_PCIE_DATA_WIDTH/32);
parameter AXIS_PCIE_RC_USER_WIDTH = 161;
parameter AXIS_PCIE_RQ_USER_WIDTH = 137;
parameter AXIS_PCIE_CQ_USER_WIDTH = 183;
parameter AXIS_PCIE_CC_USER_WIDTH = 81;
parameter RQ_SEQ_NUM_WIDTH        = 6;
parameter BAR0_APERTURE = 24;
parameter AXIS_ETH_DATA_WIDTH = 512;
parameter AXIS_ETH_KEEP_WIDTH = AXIS_ETH_DATA_WIDTH/8;

parameter TB_LOG    = 0;
parameter INIT_ROMS = 0;

reg pcie_clk;
reg pcie_rst;

wire [31:0] msi_irq;
wire ext_tag_enable;

pcie_us_cfg #(
    .PF_COUNT(1),
    .VF_COUNT(0),
    .VF_OFFSET(4),
    .PCIE_CAP_OFFSET(12'h070)
)
pcie_us_cfg_inst (
    .clk(pcie_clk),
    .rst(pcie_rst),

    /*
     * Configuration outputs
     */
    .ext_tag_enable(ext_tag_enable),
    .max_read_request_size(),
    .max_payload_size(),

    /*
     * Interface to Ultrascale PCIe IP core
     */
    .cfg_mgmt_addr(),
    .cfg_mgmt_function_number(),
    .cfg_mgmt_write(),
    .cfg_mgmt_write_data(),
    .cfg_mgmt_byte_enable(),
    .cfg_mgmt_read(),
    .cfg_mgmt_read_data(),
    .cfg_mgmt_read_write_done()
);

pcie_us_msi #(
    .MSI_COUNT(32)
)
pcie_us_msi_inst (
    .clk(pcie_clk),
    .rst(pcie_rst),

    .msi_irq(msi_irq),

    .cfg_interrupt_msi_enable(),
    .cfg_interrupt_msi_vf_enable(),
    .cfg_interrupt_msi_mmenable(),
    .cfg_interrupt_msi_mask_update(),
    .cfg_interrupt_msi_data(),
    .cfg_interrupt_msi_select(),
    .cfg_interrupt_msi_int(),
    .cfg_interrupt_msi_pending_status(),
    .cfg_interrupt_msi_pending_status_data_enable(),
    .cfg_interrupt_msi_pending_status_function_num(),
    .cfg_interrupt_msi_sent(),
    .cfg_interrupt_msi_fail(),
    .cfg_interrupt_msi_attr(),
    .cfg_interrupt_msi_tph_present(),
    .cfg_interrupt_msi_tph_type(),
    .cfg_interrupt_msi_tph_st_tag(),
    .cfg_interrupt_msi_function_number()
);

fpga_core #(
    .AXIS_PCIE_DATA_WIDTH(AXIS_PCIE_DATA_WIDTH),
    .AXIS_PCIE_KEEP_WIDTH(AXIS_PCIE_KEEP_WIDTH),
    .AXIS_PCIE_RC_USER_WIDTH(AXIS_PCIE_RC_USER_WIDTH),
    .AXIS_PCIE_RQ_USER_WIDTH(AXIS_PCIE_RQ_USER_WIDTH),
    .AXIS_PCIE_CQ_USER_WIDTH(AXIS_PCIE_CQ_USER_WIDTH),
    .AXIS_PCIE_CC_USER_WIDTH(AXIS_PCIE_CC_USER_WIDTH),
    .RQ_SEQ_NUM_WIDTH(RQ_SEQ_NUM_WIDTH),
    .BAR0_APERTURE(BAR0_APERTURE),
    .AXIS_ETH_DATA_WIDTH(AXIS_ETH_DATA_WIDTH),
    .AXIS_ETH_KEEP_WIDTH(AXIS_ETH_KEEP_WIDTH),
    .SEPARATE_CLOCKS(0)
) UUT (
    .pcie_clk(pcie_clk),
    .pcie_rst(pcie_rst),
    .sys_clk(pcie_clk),
    .sys_rst(pcie_rst),
    .core_clk(pcie_clk),
    .core_rst(pcie_rst),

    .sw(),
    .led(),

    .i2c_scl_i(),
    .i2c_scl_o(),
    .i2c_scl_t(),
    .i2c_sda_i(),
    .i2c_sda_o(),
    .i2c_sda_t(),

    .m_axis_rq_tdata(),
    .m_axis_rq_tkeep(),
    .m_axis_rq_tlast(),
    .m_axis_rq_tready(),
    .m_axis_rq_tuser(),
    .m_axis_rq_tvalid(),

    .s_axis_rc_tdata(),
    .s_axis_rc_tkeep(),
    .s_axis_rc_tlast(),
    .s_axis_rc_tready(),
    .s_axis_rc_tuser(),
    .s_axis_rc_tvalid(),

    .s_axis_cq_tdata(),
    .s_axis_cq_tkeep(),
    .s_axis_cq_tlast(),
    .s_axis_cq_tready(),
    .s_axis_cq_tuser(),
    .s_axis_cq_tvalid(),

    .m_axis_cc_tdata(),
    .m_axis_cc_tkeep(),
    .m_axis_cc_tlast(),
    .m_axis_cc_tready(),
    .m_axis_cc_tuser(),
    .m_axis_cc_tvalid(),

    .s_axis_rq_seq_num_0(),
    .s_axis_rq_seq_num_valid_0(),
    .s_axis_rq_seq_num_1(),
    .s_axis_rq_seq_num_valid_1(),

    .pcie_tx_fc_nph_av(),
    .pcie_tx_fc_ph_av(),
    .pcie_tx_fc_pd_av(),

    .cfg_max_payload(),
    .cfg_max_read_req(),
    .ext_tag_enable(ext_tag_enable),
    .msi_irq(msi_irq),

    .status_error_cor(),
    .status_error_uncor(),

    .qsfp0_tx_clk(),
    .qsfp0_tx_rst(),
    .qsfp0_tx_axis_tdata(),
    .qsfp0_tx_axis_tkeep(),
    .qsfp0_tx_axis_tvalid(),
    .qsfp0_tx_axis_tready(),
    .qsfp0_tx_axis_tlast(),
    .qsfp0_tx_axis_tuser(),
    .qsfp0_rx_clk(),
    .qsfp0_rx_rst(),
    .qsfp0_rx_axis_tdata(),
    .qsfp0_rx_axis_tkeep(),
    .qsfp0_rx_axis_tvalid(),
    .qsfp0_rx_axis_tlast(),
    .qsfp0_rx_axis_tuser(),
    .qsfp0_modprsl(),
    .qsfp0_modsell(),
    .qsfp0_resetl(),
    .qsfp0_intl(),
    .qsfp0_lpmode(),

    .qsfp1_tx_clk(),
    .qsfp1_tx_rst(),
    .qsfp1_tx_axis_tdata(),
    .qsfp1_tx_axis_tkeep(),
    .qsfp1_tx_axis_tvalid(),
    .qsfp1_tx_axis_tready(),
    .qsfp1_tx_axis_tlast(),
    .qsfp1_tx_axis_tuser(),
    .qsfp1_rx_clk(),
    .qsfp1_rx_rst(),
    .qsfp1_rx_axis_tdata(),
    .qsfp1_rx_axis_tkeep(),
    .qsfp1_rx_axis_tvalid(),
    .qsfp1_rx_axis_tlast(),
    .qsfp1_rx_axis_tuser(),
    .qsfp1_modprsl(),
    .qsfp1_modsell(),
    .qsfp1_resetl(),
    .qsfp1_intl(),
    .qsfp1_lpmode()
);

integer i, f;
initial begin
  if (TB_LOG) begin
    f = $fopen("ctrl_log.txt","w");
    $timeformat(-9, 0, "ns", 8);
  end
  if (INIT_ROMS) begin
    `include "init_roms.v"
  end
  $dumpfile ("sim_build/test_fpga_core.fst");
  $dumpvars (0,test_fpga_core);
  #1;
end

if (TB_LOG) begin

  wire [3:0] ctrl_s_type      = UUT.lb_PR_inst.ctrl_s_axis_tdata[35:32];
  wire [3:0] ctrl_s_dest_core = UUT.lb_PR_inst.ctrl_s_axis_tdata[27:24];
  wire [3:0] ctrl_s_src_slot  = UUT.lb_PR_inst.ctrl_s_axis_tdata[19:16];
  wire [3:0] ctrl_s_src_core  = UUT.lb_PR_inst.ctrl_s_axis_tuser;

  always @ (posedge UUT.lb_PR_inst.clk) begin
    if (UUT.lb_PR_inst.ctrl_s_axis_tvalid && UUT.lb_PR_inst.ctrl_s_axis_tready)
      case (ctrl_s_type)
        4'd0: $fwrite(f,"%t %x,%x sent\n",  $time, ctrl_s_src_core, ctrl_s_src_slot);
        4'd1: $fwrite(f,"%t %x,%x ready\n", $time, ctrl_s_src_core, ctrl_s_src_slot);
        4'd2: $fwrite(f,"%t %x,%x -> %x \n", $time, ctrl_s_src_core, ctrl_s_src_slot, ctrl_s_dest_core);
        4'd3: $fwrite(f,"%t %x has %x slots\n", $time, ctrl_s_src_core, ctrl_s_src_slot);
      endcase
    if (UUT.lb_PR_inst.ctrl_m_axis_tvalid && UUT.lb_PR_inst.ctrl_m_axis_tready)
      $fwrite(f,"%t sent msg to   %x : 0x%x\n",$time, UUT.lb_PR_inst.ctrl_m_axis_tdest, UUT.lb_PR_inst.ctrl_m_axis_tdata);
  end
end

endmodule

`resetall
