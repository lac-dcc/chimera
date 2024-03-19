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

module lock(  input clk,
              output [3:0] led,
              input next_ed,
              input enter_ed
            );

  reg [03:00] count;
  reg [3:0] state_next, state;
  reg [03:00] password[03:00];
  reg [3:0] lockout_check;

  wire clk;

  assign led[3:0] = count;

  // state_next machine
  always @ (posedge clk) begin
    state <= state_next;

    if (count == 0) begin
      count <= 1;
      state_next <= 4'b0000;
      lockout_check = 0;
      password[0] <= 1;
      password[1] <= 2;
      password[2] <= 4;
      password[3] <= 8;
    end

    if (state == 4'b0000) begin
      if(next_ed == 1) begin                              // move led along
        if (count == 4'b1000) count <= 4'b0001;           // loop around when at 4th position
        else count <= count << 1;                         // shift left
      end
      else if (enter_ed == 1) begin                       // check if entered correctly and change a accordingly
        count <= 4'b0001;                                 // reset led position
        if (password[0] == count) state_next = 4'b0001;   // state_next becomes correct_1
        else state_next <= 4'b0100;                       // state_next becomes wrong_1
      end
    end

    // correct_1
    if (state == 4'b0001) begin
      if(next_ed == 1) begin                              // move led along
        if (count == 4'b1000) count <= 4'b0001;           // loop around when at 4th position
        else count <= count << 1;                         // shift left
      end
      else if (enter_ed == 1) begin                       // check if entered correctly and change a accordingly
        count <= 4'b0001;                                 // reset led position
        if (password[1] == count) state_next = 4'b0010;   // state_next becomes correct_2
        else state_next <= 4'b0101;                       // state_next becomes wrong_2
      end
    end

    // correct_2
    if (state == 4'b0010) begin
      if(next_ed == 1) begin                              // move led along
        if (count == 4'b1000) count <= 4'b0001;           // loop around when at 4th position
        else count <= count << 1;                         // shift left
      end
      else if (enter_ed == 1) begin                       // check if entered correctly and change a accordingly
        count <= 4'b0001;                                 // reset led position
        if (password[2] == count) state_next = 4'b0011;   // state_next becomes correct_3
        else state_next <= 4'b0110;                       // state_next becomes wrong_3
      end
    end

    // correct_3
    if (state == 4'b0011) begin
      if(next_ed == 1) begin                               // move led along
        if (count == 4'b1000) count <= 4'b0001;            // loop around when at 4th position
        else count <= count << 1;                          // shift left
      end
      else if (enter_ed == 1) begin                        // check if entered correctly and change a accordingly
        count <= 4'b0001;                                  // reset led position
        if (password[3] == count) state_next = 4'b1001;    // state_next becomes unlock
        else state_next <= 4'b0111;                        // state_next becomes lockout_check
        lockout_check <= lockout_check + 1;
      end
    end

    // wrong_1
    if (state == 4'b0100) begin
      if (next_ed == 1) begin
        if (count == 4'b1000) count <= 4'b0001;   // loop around when at 4th position
        else count <= count << 1;                 // shift left            // else increment
      end
      else if (enter_ed == 1) begin
        count <= 1;
        state_next <= 4'b0101;                    // straight to wrong_2, do not pass go
      end
    end

    // wrong_2
    if (state == 4'b0101) begin
      if (next_ed == 1) begin
        if (count == 4'b1000) count <= 4'b0001;   // loop around when at 4th position
        else count <= count << 1;                 // shift left            // else increment
      end
      else if (enter_ed == 1) begin
        count <= 1;
        state_next <= 4'b0110;                    // change state to wrong_3
      end
    end

    // wrong_3
    if (state == 4'b0110) begin
      if (next_ed == 1) begin
        if (count == 4'b1000) count <= 4'b0001;   // loop around when at 4th position
        else count <= count << 1;                 // shift left            // else increment
      end
      else if (enter_ed == 1) begin
        count <= 1;
        state_next <= 4'b0111;                     // send to lockout_check
        lockout_check <= lockout_check + 1;
      end
    end

    // lockout_check
    if (state == 4'b0111) begin
      if (lockout_check == 3) begin // Does not behave? adding more than one.
        state_next <= 4'b1000;
      end
      else begin
        state_next <= 4'b0000;
      end
    end

    // lockout
    if (state == 4'b1000) begin
      count <= 15;
    end

    // unlock
    if (state == 4'b1001) begin
      count <= 12;
    end

  end

endmodule
