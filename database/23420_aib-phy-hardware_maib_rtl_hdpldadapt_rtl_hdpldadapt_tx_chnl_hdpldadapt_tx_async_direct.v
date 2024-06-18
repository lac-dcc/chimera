// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
module hdpldadapt_tx_async_direct (
// PLD IF
input  wire            pld_pma_txdetectrx,

// AIB IF
input  wire            aib_fabric_pld_pma_fpll_lc_lock,

// PLD IF
output   wire          pld_pma_fpll_lc_lock,

// AIB IF
output   wire          aib_fabric_pld_pma_txdetectrx
);

assign aib_fabric_pld_pma_txdetectrx = pld_pma_txdetectrx;
assign pld_pma_fpll_lc_lock          = aib_fabric_pld_pma_fpll_lc_lock;

endmodule
