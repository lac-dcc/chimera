/******************************************************************************
*                                                                             *
* Copyright 2016 myStorm Copyright and related                                *
* rights are licensed under the Solderpad Hardware License, Version 0.51      *
* (the “License”); you may not use this file except in compliance with        *
* the License. You may obtain a copy of the License at                        *
* http://solderpad.org/licenses/SHL-0.51. Unless required by applicable       *
* law or agreed to in writing, software, hardware and materials               *
* distributed under this License is distributed on an “AS IS” BASIS,          *
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or             *
* implied. See the License for the specific language governing                *
* permissions and limitations under the License.                              *
*                                                                             *
******************************************************************************/

module chip (
    // 100MHz clock input
    input  clk,
    // SRAM Memory lines
    output [18:0] ADR,
    output [15:0] DAT,
    output RAMOE,
    output RAMWE,
    output RAMCS,
    // All PMOD outputs
    output [55:0] PMOD,
    input [1:0] BUT,
    input [3:0] DIP
  );

  // SRAM signals are not use in this design, lets set them to default values
  assign ADR[18:0] = {19{1'b0}};
  assign DAT[15:0] = {16{1'b0}};
  assign RAMOE = 1'b1;
  assign RAMWE = 1'b1;
  assign RAMCS = 1'b1;

  assign PMOD[51:0] = {51{1'b0}};

  wire OUT;

  wire enter_ed;
  wire next_ed;

  wire clk_slow;
  reg [31:0] counter_slow;

  always @(posedge clk) begin
    counter_slow <= counter_slow + 1;
  end

  assign clk_slow = counter_slow[20];

  lock my_lock (
    .clk   (clk_slow),
    .led (PMOD[55:52]),
    .next_ed (next_ed),
    .enter_ed (enter_ed)
  );

  edge_detect next_edge_detect (
    .clk   (clk_slow),
    .IN (BUT[1]),
    .OUT (next_ed)
  );

  edge_detect enter_edge_detect (
    .clk   (clk_slow),
    .IN (BUT[0]),
    .OUT (enter_ed)
  );

endmodule
