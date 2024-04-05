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

module lock(  // Inputs
              // and
              // Outputs
            );

    // We need a register for the leds to be assigned to
    // And a register for the password

    // We will be making a state machine, therefore require a register
    // to keep track of the current state and the next state



  // State Machine //
  always @ (posedge clk) begin

    // Always assign state to become the state_next to avoid blocking
    state <= state_next;

    // If the count = 0 then iniate variables, and seting state_next to 4'b0000
    // Also set the password here

    // Then we have an initial state
    if (state == 4'b0000) begin
      // If the next button is pressed
      if(next_ed == 1) begin
        // Move led around, looping around when you are about to go off the display
      end
      // else if the enter button is pressed
      else if (enter_ed == 1) begin
        // reset the counter to 1
        // If password is correct set next_state to correct_1
        // Else if wrong move to wrong_1
      end
    end

    // correct_1
    if (state == 4'b0001) begin
      // Continue moving led around on next
      // Else move to correct_2 if next part of password is entered correctly or move to wrong_2
    end

    // correct_2
    if (state == 4'b0010) begin
      //
    end

    // correct_3
    if (state == 4'b0011) begin
      //
      // If last part correct send to unlock
      // else increment lockout_check register and send to the state lockout_check
    end

    // wrong_1
    if (state == 4'b0100) begin
      // we wouldn't want somebody to know if they'd entered a digit wrong, therefore we put up the pretense that everything is normal
      // Whichever number they enter they are sent to wrong_2
    end

    // wrong_2
    if (state == 4'b0101) begin
      //
    end

    // wrong_3
    if (state == 4'b0110) begin
      // finally you increment the lockout_check register and send to the state lockout_check
    end

    // lockout_check
    if (state == 4'b0111) begin
      // If they've fasely entered the password 3 times lockout_check = 3, then send them to lockout
      // else send back to the intial state
    end

    // lockout
    if (state == 4'b1000) begin
      // lock up the device, by flashing all the leds on
    end

    // unlock
    if (state == 4'b1001) begin
      // display you're secret code
    end

  end

endmodule
