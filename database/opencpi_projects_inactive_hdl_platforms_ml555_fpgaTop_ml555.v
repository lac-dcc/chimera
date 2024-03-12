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

// fpgaTop_ml555.v - ssiegel 2009-03-17

module fpgaTop(
  input  wire        sys0_clkp,     // sys0 Clock +
  input  wire        sys0_clkn,     // sys0 Clock -
  input  wire        pci0_clkp,     // PCIe Clock +
  input  wire        pci0_clkn,     // PCIe Clock -
  input  wire        pci0_rstn,     // PCIe Reset
  output wire [7:0]  pci_exp_txp,   // PCIe lanes...
  output wire [7:0]  pci_exp_txn,
  input  wire [7:0]  pci_exp_rxp,
  input  wire [7:0]  pci_exp_rxn,
  output wire [2:0]  led,            // LEDs ml555
  input  wire        ppsExtIn,       // PPS in
  output wire        ppsOut          // PPS out
);

// Instance and connect mkFTop...
 mkFTop_ml555 ftop(
  .sys0_clkp         (sys0_clkp),
  .sys0_clkn         (sys0_clkn),
  .pci0_clkp         (pci0_clkp),
  .pci0_clkn         (pci0_clkn),
  .pci0_rstn         (pci0_rstn),
  .pcie_rxp_i        (pci_exp_rxp),
  .pcie_rxn_i        (pci_exp_rxn),
  .pcie_txp          (pci_exp_txp),
  .pcie_txn          (pci_exp_txn),
  .led               (led),
  .gps_ppsSyncIn_x   (ppsExtIn),
  .gps_ppsSyncOut    (ppsOut) 
);

endmodule
