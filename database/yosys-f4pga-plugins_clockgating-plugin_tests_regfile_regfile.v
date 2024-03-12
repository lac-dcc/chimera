// Copyright 2022 AUC Open Source Hardware Lab
//
// Licensed under the Apache License, Version 2.0 (the "License"); 
// you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at:
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
// See the License for the specific language governing permissions and 
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0

module top (
	input			HCLK,							
	input			WR,
	input [ 5:0]	RA,
	input [ 5:0]	RB,
	input [ 5:0]	RW,
	input [63:0]	DW, 
	output [63:0]	DA, 
	output [63:0]	DB
);
 	reg [63:0] RF [63:0];

	assign DA = RF[RA] & {64{~(RA==6'd0)}};
	assign DB = RF[RB] & {64{~(RB==6'd0)}};
	
	always @ (posedge HCLK) 
		if(WR)
			if(RW!=6'd0) begin 
				RF[RW] <= DW;
			end
endmodule
