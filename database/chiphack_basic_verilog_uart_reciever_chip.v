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

  //UART(/slow) clock
  // We need to create a slow clokc for the uart to communicate over
  // We will be creating and then using a 115200 baud clock

  // The current clock is 100MHz
  // to get the divider counter we need to take the current clock and divide by twice the clock rate desired
  // e.g. 50x10^6/115200 = 434

  // UART ports!
  // You can assign two PMODs to be the UART_GND and UART_TX as both are outputs
  // And for recieveing we need a UART_RX

  uart my_uart (
      // Here you need to put the inputs and outputs
      // Including the clock
      // the UART wires
      // and the button inputs
  );

  // ensure both modules are running using the same clock
  edge_detect next_edge_detect (
    // Here go the usual inputs for the edge detect.s
  );

endmodule
