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

module uart(  input clk,
              input next_ed,
              input button,
              output reg UART_TX, // ** These are the ports used on the de0_nano
              output UART_GND);   // possibly use i_tx(/rx) from PMOD3/4?

// Some register and wire declarations

  // a register to keep track of the current state of your state machine

  // a register for the 8bit data you are transmitting

  // set up a register to keep count of the where in the message you are


  // Reset, our reset condition is the opposite button to the edge detect
  wire 					reset;
  assign reset = ~button;

  // Tie UART_GND low
  assign UART_GND = 0;

  always @(posedge clk or posedge reset) begin
 	  if (reset) begin
       // On reset set the intial state and set UART_TX to up
       // Also set the intial word
 	  end
 	  else begin
 	     case (transmit_state)
 	       0:
 		      begin
            // Wait here for the edge detect to be detected, then move on to the next state
 		      end
 	       1:
 		      begin
 		    // Once transmition begins set start bit to zero
        // Then move on to the next transmit_state
 		       end
 	       2,3,4,5,6,7,8,9:
 		      begin
 		    //cycle through the character being transmitted a bit at a time
        // making UART_TX a bit at a time and incrementing the state
 		      end
 	       10:
 		      begin

       // Finish by setting UART_TX to up

 		   // Once you have finished transmiting current character, set the next character to be transmitted, if the full sentence has not finished then carry on printing else stop and wait for another press of the edge detect e.g. set to the intial state

          end

 	       default:
 		       // Shouldn't reach here, but just incase, go back to idle!
 		       transmit_state <= 0;
 	     endcase
 	  end
  end

endmodule
