// This program was cloned from: https://github.com/chipsalliance/yosys-f4pga-plugins
// License: Apache License 2.0

// Copyright 2020-2022 F4PGA Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
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
    input clk,
    input cpu_reset,
    input data_in,
    output [5:0] data_out
);

  wire [5:0] data_out;
  wire builder_pll_fb;
  wire fdce_0_out, fdce_1_out;
  wire main_locked;

  FDCE FDCE_0 (
      .D  (data_in),
      .C  (clk),
      .CE (1'b1),
      .CLR(1'b0),
      .Q  (fdce_0_out)
  );

  FDCE FDCE_1 (
      .D  (fdce_0_out),
      .C  (clk),
      .CE (1'b1),
      .CLR(1'b0),
      .Q  (data_out[0])
  );

  PLLE2_ADV #(
      .CLKFBOUT_MULT(4'd12),
      .CLKFBOUT_PHASE(90.0),
      .CLKIN1_PERIOD(10.0),
      .CLKOUT0_DIVIDE(4'd12),
      .CLKOUT0_PHASE(90.0),
      .CLKOUT1_DIVIDE(3'd6),
      .CLKOUT1_PHASE(0.0),
      .CLKOUT2_DIVIDE(2'd3),
      .CLKOUT2_PHASE(90.0),
      .REF_JITTER1(0.01),
      .STARTUP_WAIT("FALSE")
  ) PLLE2_ADV (
      .CLKFBIN(builder_pll_fb),
      .CLKIN1(clk),
      .RST(cpu_reset),
      .CLKFBOUT(builder_pll_fb),
      .CLKOUT0(main_clkout_x1),
      .CLKOUT1(main_clkout_x2),
      .CLKOUT2(main_clkout_x4),
      .LOCKED(main_locked)
  );

  FDCE FDCE_PLLx1_PH90 (
      .D  (data_in),
      .C  (main_clkout_x1),
      .CE (1'b1),
      .CLR(1'b0),
      .Q  (data_out[1])
  );

  FDCE FDCE_PLLx4_PH0_0 (
      .D  (data_in),
      .C  (main_clkout_x2),
      .CE (1'b1),
      .CLR(1'b0),
      .Q  (data_out[2])
  );

  FDCE FDCE_PLLx4_PH0_1 (
      .D  (data_in),
      .C  (main_clkout_x2),
      .CE (1'b1),
      .CLR(1'b0),
      .Q  (data_out[3])
  );

  FDCE FDCE_PLLx4_PH0_2 (
      .D  (data_in),
      .C  (main_clkout_x2),
      .CE (1'b1),
      .CLR(1'b0),
      .Q  (data_out[4])
  );

  FDCE FDCE_PLLx2_PH90_0 (
      .D  (data_in),
      .C  (main_clkout_x4),
      .CE (1'b1),
      .CLR(1'b0),
      .Q  (data_out[5])
  );
endmodule
