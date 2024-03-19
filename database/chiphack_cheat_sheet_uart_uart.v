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
              output reg UART_TX, // ** These are the ports used on the de0_nano
              output UART_GND);   // possibly use i_tx(/rx) from PMOD3/4?

  // Some register and wire declarations
  reg [3:0] transmit_state;
  reg [7:0] transmit_data;
  reg 	     key1_reg;
  reg [3:0] word_state;


  // Reset
  wire 					reset;
  assign reset = ~button;

  // Tie UART_GND low
  assign UART_GND = 0;

  assign led = word_state;

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
            if (next_ed == 1) begin
              transmit_state <= 1;
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
 		    /* Fill me in - drive the final bit onto UART_TX. */
            UART_TX <= 1;
            transmit_state <= 0;
            if (word_state == 15) begin
              word_state <= 1;
 		        end
            else
              word_state <= word_state + 1;
            begin
            if (word_state == 1) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h48; //H
            end
            if (word_state == 2) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h65; //e
            end
            if (word_state == 3) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h6c; //l
            end
            if (word_state == 4) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h6c; //l
            end
            if (word_state == 5) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h6f; //o
            end
            if (word_state == 6) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h2c; //,
            end
            if (word_state == 7) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h20; //
            end
            if (word_state == 8) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h57; //W
            end
            if (word_state == 9) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h6f; //o
            end
            if (word_state == 10) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h72; //r
            end
            if (word_state == 11) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h6c; //l
            end
            if (word_state == 12) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h64; //d
            end
            if (word_state == 13) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'h21; //!
            end
            if (word_state == 14) begin
              transmit_state <= 1;
              word_state <= word_state + 1;
              transmit_data <= 8'hA; //
            end
            if (word_state == 15) begin
              transmit_state <= 0;
              word_state <= 1;
              transmit_data <= 8'hD; //
            end
          end
        end

 	       default:
 		       // Shouldn't reach here, but just incase, go back to idle!
 		       transmit_state <= 0;
 	     endcase
 	  end
  end

endmodule
