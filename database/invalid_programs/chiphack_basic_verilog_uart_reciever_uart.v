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

// Copied over uart from original chiphack
// have had little luck in finding the right ports to use on the blackice board
// as cannot seem to use the one programming.

module uart(  input clk,
              input next_ed,
              input button,
              output [3:0] led,
              output reg UART_TX,   // ** These are the ports used on the de0_nano
              output UART_GND,      // possibly use i_tx(/rx) from PMOD3/4?
              input  UART_RX
              );




  // Reset
  wire 					  reset;
  assign reset = ~button;

  assign led[3:0] = recieve_state;
  assign led[2]   = UART_TX;
  assign led[3]   = UART_RX;

  // Tie UART_GND low
  assign UART_GND = 0;

// Recieve logic

// UART_RX state machine
// A register for the recieve state
// Somewhere to store what you recieve

  always @(posedge clk or posedge reset) begin 		// Recieve
    if (reset) begin
     // Reset to the "IDLE" state
    end
    else begin
      case (recieve_state)

        0:
          begin

            // set write enable to off
            // wait for an UP on UART_RX before incrementing state

          end
        1,2,3,4,5,6,7,8:
          begin

            //Store current bit on UART_TX, and increment state

          end
        9:
          begin

            // Now allow to transmit data recieved
            // reset recieve state, to listen for more data.

          end
        default:

          // Set the default state

      endcase
    end
  end

 // What to recieve and how to confirm this is up to you,
 // You could use your previous UART transmitter, to print what you type
 // Or for some LEDs to light up if you recieve a certain character.

endmodule
