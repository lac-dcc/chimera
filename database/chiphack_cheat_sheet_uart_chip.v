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

  assign PMOD[49:0] = {50{1'b0}};

  wire OUT;

  wire enter_ed;
  wire next_ed;

  //UART(/slow) clock

  reg [9:0] clock_divider_counter;
  reg uart_clock;

  always @(posedge clk) begin
  // 	if (reset == 1'b1)
  // 	  clock_divider_counter <= 0;
   	if (clock_divider_counter == 434)
   	  clock_divider_counter <= 0;
   	else
   	  // Otherwise increment the counter
   	  clock_divider_counter <= clock_divider_counter + 1;
  end

    // Generate a clock (toggle this register)
  always @(posedge clk) begin
 	  //if (reset == 1'b1)
 	  //  uart_clock <= 0;
 	  if (clock_divider_counter == 434)
 	    uart_clock <= ~uart_clock;
    end

  uart my_uart (
    .clk   (uart_clock),
    .led (PMOD[55:52]),
    .next_ed (next_ed),
    .button (BUT[1]),
    .UART_TX (PMOD[50]),
    .UART_GND (PMOD[51])
  );

  edge_detect next_edge_detect (
    .clk   (uart_clock),
    .IN (BUT[0]),
    .OUT (next_ed)
  );

endmodule
