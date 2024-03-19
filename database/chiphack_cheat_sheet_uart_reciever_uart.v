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
              input  UART_RX
              );




  // Reset
  wire 					  reset;
  assign reset = ~button;

  assign led[3:0] = recieve_state;
//  assign led[2]   = UART_TX;
//  assign led[3]   = UART_RX;

// Transmit logic

  // Some register and wire declarations
  reg [3:0] transmit_state;
  reg [7:0] transmit_data;
  reg 	     key1_reg;
  reg [3:0] word_state;

  always @(posedge clk or posedge reset) begin
 	  if (reset) begin
 	     // Reset to the "IDLE" state
 	     transmit_state <= 0;

 	     // The UART line is set to '1' when idle, or reset
 	     UART_TX <= 1;

 	     // Data we'll transmit - start at ASCII '0'
 	     transmit_data <= 8'h30;
 	  end
 	  else begin
 	     // What follows is the skeleton of the state machine to control
 	     // the bits going onto the UART transmit line.
 	     // You will want to, from the idle state:
 	     // 1. detect the pushbutton press and go to the the start bit state
 	     // 2. then the 8 data bits (LSB first)
 	     // 3. finally the stop bit
 	     // 4. return to this state ready for the next transmit
 	     case (transmit_state)
 	       0:
 		      begin
 		    // Idle state - We want to transition to the start bit state
 		    //              when the pushbutton is pressed. (A signal
 		    //              detecting this is provided - "key1_edge_detect".)
            if (write_enable == 1) begin
              transmit_state <= 1;
              transmit_data <= recieved;
            end
 		      end
 	       1:
 		      begin
 		    // Start bit state, and progress onto the next state
              UART_TX <= 0;
              transmit_state <= 2;
 		       end
 	       2,3,4,5,6,7,8,9:
 		      begin
 		    // Data bits
 		    // when transmit_state is 2 we want transmit_data[0]
 		    // when transmit_state is 3 we want transmit_data[1]
 		    // ...
 		    // when transmit_state is 9 we want transmit_data[7]
         UART_TX <= transmit_data[transmit_state - 2];
         transmit_state <= transmit_state + 1;
 		      end
 	       10:
 		      begin
 		    // Stop bit, and transition back to idle (0)
            UART_TX <= 1;
            transmit_state <= 0;
          end

 	       default:
 		       // Shouldn't reach here, but just incase, go back to idle!
 		       transmit_state <= 0;
 	     endcase
 	  end
  end

// Recieve logic

// UART_RX state machine

  reg [5:0] 	recieve_state;
  reg [7:00] 	recieved;
  reg 				write_enable;
  reg [5:0] 	transmit_data_state;

  always @(posedge clk or posedge reset) begin 		// Recieve
    if (reset) begin
     // Reset to the "IDLE" state
      recieve_state <= 0;
    end
    else begin
      case (recieve_state)

        0:
          begin
            write_enable = 0;
            if (UART_RX == 0)
              recieve_state <= 1;

          end
        1,2,3,4,5,6,7,8:
          begin
            recieved[recieve_state - 1] = UART_RX;
            recieve_state <= recieve_state + 1;

          end
        9:
          begin
            recieve_state <= 0;
            write_enable = 1;
          end
        default:
          recieve_state <= 0;
      endcase
    end
  end

endmodule
