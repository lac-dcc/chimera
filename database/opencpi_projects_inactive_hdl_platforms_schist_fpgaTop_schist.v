/*
 * This file is protected by Copyright. Please refer to the COPYRIGHT file
 * distributed with this source distribution.
 *
 * This file is part of OpenCPI <http://www.opencpi.org>
 *
 * OpenCPI is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * OpenCPI is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// fpgaTop_shist.v - "shist"

module fpgaTop(
  input  wire        sys0_clkp,     // sys0 Clock +
  input  wire        sys0_clkn,     // sys0 Clock -
  input  wire        sys1_clkp,     // sys1 Clock +
  input  wire        sys1_clkn,     // sys1 Clock -
  input  wire        pci0_clkp,     // PCIe Clock +
  input  wire        pci0_clkn,     // PCIe Clock -
  input  wire        pci0_rstn,     // PCIe Reset
  output wire [7:0]  pci_exp_txp,   // PCIe lanes...
  output wire [7:0]  pci_exp_txn,
  input  wire [7:0]  pci_exp_rxp,
  input  wire [7:0]  pci_exp_rxn,
  output wire [2:0]  led,            // LEDs ml555
  //input  wire        ppsExtIn,       // PPS in
  //output wire        ppsOut,         // PPS out

  input  wire        dac_clkp,
  input  wire        dac_clkn,
  input  wire        dac0_syncInp,
  input  wire        dac0_syncInn,
  output wire        dac0_syncOutp,
  output wire        dac0_syncOutn,
  output wire        dac0_syncMutep,
  output wire        dac0_syncMuten,
  output wire [11:0] dac0_dap, 
  output wire [11:0] dac0_dan, 
  output wire [11:0] dac0_dbp, 
  output wire [11:0] dac0_dbn, 
  output wire [11:0] dac0_dcp, 
  output wire [11:0] dac0_dcn, 
  output wire [11:0] dac0_ddp, 
  output wire [11:0] dac0_ddn, 
  output wire        dac0_dacClkDiv, 
  output wire        dac0_dacDelay, 
  output wire        dac0_dacRf, 
  output wire        dac0_dacRz, 
  output wire        dac0_dacCal,

  output wire        adx_sclk,
  output wire        adx_csb,
  output wire        adx_sdo,
  input  wire        adx_sdi,
  output wire        adx_funct,
  input  wire        adx_status,
  input  wire        adc_clkn,
  input  wire        adc_clkp,
  input  wire        adc0_clkn,
  input  wire        adc0_clkp,
  output wire        adc0_oe,
  input  wire [6:0]  adc0_ddn,
  input  wire [6:0]  adc0_ddp,
  output wire        adc0_reset,
  output wire        adc0_sclk,
  output wire        adc0_sen,
  output wire        adc0_sdata,
  input  wire        adc0_sdout,
  input  wire        adc1_clkn,
  input  wire        adc1_clkp,
  output wire        adc1_oe,
  input  wire [6:0]  adc1_ddn,
  input  wire [6:0]  adc1_ddp,
  output wire        adc1_reset,
  output wire        adc1_sclk,
  output wire        adc1_sen,
  output wire        adc1_sdata,
  input  wire        adc1_sdout,

  inout  wire [31:0] ddr2_dq,
  output wire [12:0] ddr2_a,
  output wire [1:0]  ddr2_ba,
  output wire        ddr2_ras_n,
  output wire        ddr2_cas_n,
  output wire        ddr2_we_n,
  output wire [1:0]  ddr2_cs_n,
  output wire [1:0]  ddr2_odt,
  output wire [1:0]  ddr2_cke,
  output wire [3:0]  ddr2_dm,
  inout  wire [3:0]  ddr2_dqs_p,
  inout  wire [3:0]  ddr2_dqs_n,
  output wire [1:0]  ddr2_ck_p,
  output wire [1:0]  ddr2_ck_n
);

wire ppsIn, ppsOut;
IBUFDS#() IBUFDS_ppsin (.O(ppsIn),  .I(dac0_syncInp),   .IB(dac0_syncInn)); 
OBUFDS#() OBUFDS_ppsout(.O(dac0_syncOutp), .OB(dac0_syncOutn), .I(ppsOut)); 

// Instance and connect mkFTop...
 mkFTop_schist ftop(
  .sys0_clkp         (sys0_clkp),
  .sys0_clkn         (sys0_clkn),
  .sys1_clkp         (sys1_clkp),
  .sys1_clkn         (sys1_clkn),
  .pci0_clkp         (pci0_clkp),
  .pci0_clkn         (pci0_clkn),
  .pci0_rstn         (pci0_rstn),
  .pcie_rxp_i        (pci_exp_rxp),
  .pcie_rxn_i        (pci_exp_rxn),
  .pcie_txp          (pci_exp_txp),
  .pcie_txn          (pci_exp_txn),
  .led               (led),
  .gps_ppsSyncIn_x   (ppsIn),
  .gps_ppsSyncOut    (ppsOut),

  .dac_clkp          (dac_clkp),
  .dac_clkn          (dac_clkn),
//  .dac0_syncInp      (dac0_syncInp),
//  .dac0_syncInn      (dac0_syncInn),
  .dac0_syncOutp     (dac0_syncOutp_NoConnect),
  .dac0_syncOutn     (dac0_syncOutn_NoConnect),
  .dac0_syncMutep    (dac0_syncMutep),
  .dac0_syncMuten    (dac0_syncMuten),
  .dac0_dap          (dac0_dap), 
  .dac0_dan          (dac0_dan), 
  .dac0_dbp          (dac0_dbp), 
  .dac0_dbn          (dac0_dbn), 
  .dac0_dcp          (dac0_dcp), 
  .dac0_dcn          (dac0_dcn), 
  .dac0_ddp          (dac0_ddp), 
  .dac0_ddn          (dac0_ddn), 
  .dac0_dacClkDiv    (dac0_dacClkDiv), 
  .dac0_dacDelay     (dac0_dacDelay),
  .dac0_dacRf        (dac0_dacRf),
  .dac0_dacRz        (dac0_dacRz),
  .dac0_dacCal       (dac0_dacCal),

  .adx_sclkn         (adx_sclk),
  .adx_csb           (adx_csb),
  .adx_sdo           (adx_sdo),
  .adx_sdi_arg       (adx_sdi),
  .adx_funct         (adx_funct),
  .adx_status_arg    (adx_status),
  .adc_clkn          (adc_clkn),
  .adc_clkp          (adc_clkp),
  .adc0_clkn         (adc0_clkn),
  .adc0_clkp         (adc0_clkp),
  .adc0_oe           (adc0_oe),
  .adc0_ddn_arg      (adc0_ddn),
  .adc0_ddp_arg      (adc0_ddp),
  .adc0_resetp       (adc0_reset),
  .adc0_sclk         (adc0_sclk),
  .adc0_sen          (adc0_sen),
  .adc0_sdata        (adc0_sdata),
  .adc0_sdout_arg    (adc0_sdout),
  .adc1_clkn         (adc1_clkn),
  .adc1_clkp         (adc1_clkp),
  .adc1_oe           (adc1_oe),
  .adc1_ddn_arg      (adc1_ddn),
  .adc1_ddp_arg      (adc1_ddp),
  .adc1_resetp       (adc1_reset),
  .adc1_sclk         (adc1_sclk),
  .adc1_sen          (adc1_sen),
  .adc1_sdata        (adc1_sdata),
  .adc1_sdout_arg    (adc1_sdout),

  .dram_io_dq        (ddr2_dq),
  .dram_addr         (ddr2_a), 
  .dram_ba           (ddr2_ba), 
  .dram_ras_n        (ddr2_ras_n),
  .dram_cas_n        (ddr2_cas_n),
  .dram_we_n         (ddr2_we_n),
  .dram_cs_n         (ddr2_cs_n),
  .dram_odt          (ddr2_odt),
  .dram_cke          (ddr2_cke),
  .dram_dm           (ddr2_dm),
  .dram_io_dqs_p     (ddr2_dqs_p),
  .dram_io_dqs_n     (ddr2_dqs_n),
  .dram_ck_p         (ddr2_ck_p),
  .dram_ck_n         (ddr2_ck_n)
);

endmodule

