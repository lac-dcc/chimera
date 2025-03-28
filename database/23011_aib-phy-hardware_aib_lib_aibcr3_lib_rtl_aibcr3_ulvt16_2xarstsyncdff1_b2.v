// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
module aibcr3_ulvt16_2xarstsyncdff1_b2 (CLR_N, CK, D, SE, SI, Q);
    input CLR_N, CK, D, SE, SI;
    output reg Q;
    wire data;
    reg flop_0;

        assign data = SE ?  SI : D ; 
	
	always @(posedge CK or negedge CLR_N)
		if (!CLR_N) {Q,flop_0} <= 0;
		else if (CLR_N) {Q,flop_0} <= {flop_0,data};
		else {Q,flop_0} <= 0;
endmodule
