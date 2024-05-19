// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//bipolar stepper
/*
Distributed under the MIT license.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/*
* Control Scheme
*
* use i_go to start and when o_busy is high de-assert i_go, the bipoller
* stepper will not accept new commands until i_go is low
* Use the stop to stop all the motor regardless of position
*
* set i_full_step or i_half_step or i_micro_step to set the size of the step
* set the i_continuous to continue rotating until i_go goes low
* set the i_direction to set which direction the stepper will go
* set the i_step to set the number of steps of full, half or micro to go
*
*
* ??? HOW TO CONVERT BETWEEN A FULL STEP AND HALF STEP POSITION or MICROSTEP
* POSITIONS
* ??? Do I want to turn the motors off or will there be an application where
* I should keep the motors on
*
*
* i_steps:
*   00 00 00 00 [31..8 Half  Steps]
*               [ 7..0 Micro Steps]
*/


`include "project_defines.v"

module bipolar_stepper (
  input               clk,
  input               rst,

  //Control
  input               i_go,
  output              o_busy,
  input               i_stop,

  //Position

  //Errors
  output  reg         o_err_bad_step,

  //Type of step
  input               i_full_step,
  input               i_half_step,
  input               i_micro_step,

  //Step Modifiers
  input               i_continuous,
  input               i_direction,
  input       [31:0]  i_steps,
  output              o_move_strobe,

  //Counts
  input       [31:0]  i_step_run_period,
  input       [31:0]  i_step_walk_period,
  input       [31:0]  i_step_accelleration,
  input       [31:0]  i_micro_step_hold,

  input       [31:0]  i_shoot_through_period,

  //Pins
  output              o_hbridge0_l,
  output              o_hbridge0_r,
  output              o_hbridge1_l,
  output              o_hbridge1_r
);

//Local Parameters
//States
localparam  IDLE                      = 4'h0;
localparam  PROCESS_STEP              = 4'h1;
localparam  PROCESS_SLEEP             = 4'h2;
localparam  PROCESS_SHOOT_THROUGH     = 4'h3;
localparam  PREPARE_MICRO_STEP        = 4'h4;
localparam  PROCESS_MICRO_STEP        = 4'h5;
localparam  FINISHED                  = 4'h6;

//Type of steps
localparam  FULL_STEP                 = 4'h0;
localparam  HALF_STEP                 = 4'h1;
localparam  MICRO_STEP                = 4'h2;
localparam  UNDEFINED_STEP            = 4'h3;

//Step sizes for bipolar stepper
//NOTE: This is the full size, not offset from 0 (IE 8 is eight steps not 9)
localparam  MAX_FULL_STEP_SIZE        = 4;
localparam  MAX_HALF_STEP_SIZE        = 8;
localparam  MAX_MICRO_STEP_SIZE       = 8;

localparam  FULL_STEP_INC             = 32'h00000200;
localparam  HALF_STEP_INC             = 32'h00000100;
localparam  MICRO_STEP_INC            = 32'h00000010;


//Local Registers/Wires
reg     [3:0]         state         = IDLE;

reg     [7:0]         step_pos;
wire    [31:0]        in_full_steps;
wire    [31:0]        in_half_steps;
wire    [7:0]         full_step_pos;
wire    [7:0]         half_step_pos;

wire    [3:0]         full_step_path[3:0];
wire    [3:0]         half_step_path[7:0];

reg                   continuous;
reg                   direction;
reg     [31:0]        max_step_count;
reg     [31:0]        step_count;
wire    [31:0]        steps_left;

reg     [31:0]        run_period;
reg     [31:0]        step_delay;
reg     [3:0]         step_type     = UNDEFINED_STEP;


reg     [31:0]        shoot_through_period;
reg     [31:0]        shoot_through_count;

wire    [31:0]        step_inc_map  [3:0];
wire    [31:0]        max_pos_map   [3:0];

reg     [3:0]         hbridge_map;
reg                   move_strobe;
reg     [31:0]        current_position;


//Accelleration Controller
reg     [31:0]        accelleration;
reg     [31:0]        current_period;
reg     [31:0]        walk_period;
reg     [31:0]        prev_step_count;
wire                  step_change;
reg     [31:0]        velocity;

//Micro Stepping Registers

wire    [3:0]         micro_hbridge_map;
wire                  micro_busy;
wire    [31:0]        micro_position;
wire    [31:0]        micro_step_count;
wire    [7:0]         micro_step_pos;
wire                  micro_move_strobe;

//Submodules
bipolar_micro_stepper #(
  `ifdef SIM
  .CLOCK_DIV          (1                        )
  `else
  .CLOCK_DIV          (4                        )
  `endif
)bms(
  .clk                (clk                      ),
  .rst                (rst                      ),


  .i_go               (i_go && i_micro_step     ),
  .o_busy             (micro_busy               ),
  .i_stop             (i_stop                   ),

  .i_micro_step_hold  (i_micro_step_hold        ),
  .i_current_position (current_position         ),
  .o_current_position (micro_position           ),

  .i_step_pos         (step_pos                 ),
  .o_step_pos         (micro_step_pos           ),
  .o_step_count       (micro_step_count         ),
  .o_move_strobe      (micro_move_strobe        ),

  .i_continuous       (i_continuous             ),
  .i_direction        (i_direction              ),
  .i_steps            (i_steps                  ),

  .i_current_period   (current_period           ),

  .o_hbridge0_l       (micro_hbridge_map[3]     ),
  .o_hbridge0_r       (micro_hbridge_map[2]     ),
  .o_hbridge1_l       (micro_hbridge_map[1]     ),
  .o_hbridge1_r       (micro_hbridge_map[0]     )
);

//Asynchronous Logic
//step path [ o_hbridge1_r, o_hbridge1_l, o_hbridge0_r, o_hbridge0_l]
assign full_step_path[0]          = 4'b1010;
assign full_step_path[1]          = 4'b0110;
assign full_step_path[2]          = 4'b0101;
assign full_step_path[3]          = 4'b1001;

assign half_step_path[0]          = 4'b1000;
assign half_step_path[1]          = 4'b1010;
assign half_step_path[2]          = 4'b0010;
assign half_step_path[3]          = 4'b0110;
assign half_step_path[4]          = 4'b0100;
assign half_step_path[5]          = 4'b0101;
assign half_step_path[6]          = 4'b0001;
assign half_step_path[7]          = 4'b1001;

assign step_inc_map[0]            = FULL_STEP_INC;
assign step_inc_map[1]            = HALF_STEP_INC;
assign step_inc_map[2]            = MICRO_STEP_INC;
assign step_inc_map[3]            = 32'h0;

assign max_pos_map[0]             = MAX_FULL_STEP_SIZE - 1;
assign max_pos_map[1]             = MAX_HALF_STEP_SIZE - 1;
assign max_pos_map[2]             = MAX_HALF_STEP_SIZE - 1;
assign max_pos_map[3]             = 32'h0;

//Use the half step path to get the values of the hbridge sides
//PWM Hbridge (0:L0, 1:R0, 2:L1, 3:R1), Direction
assign o_busy                     = (state != IDLE);

assign o_hbridge0_l               = (step_type == MICRO_STEP) ? micro_hbridge_map[3] : hbridge_map[3];
assign o_hbridge0_r               = (step_type == MICRO_STEP) ? micro_hbridge_map[2] : hbridge_map[2];
assign o_hbridge1_l               = (step_type == MICRO_STEP) ? micro_hbridge_map[1] : hbridge_map[1];
assign o_hbridge1_r               = (step_type == MICRO_STEP) ? micro_hbridge_map[0] : hbridge_map[0];

assign in_full_steps              =  {9'h0, i_steps[31:9]};
assign in_half_steps              =  {8'h0, i_steps[31:8]};

assign step_change                = (i_micro_step) ?
                                      (prev_step_count != micro_step_count):
                                      (prev_step_count != step_count);
assign steps_left                 = (i_micro_step) ?
                                      (max_step_count - micro_step_count):
                                      (max_step_count - step_count);

assign o_move_strobe              = i_micro_step ? micro_move_strobe : move_strobe;

//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    state                     <=  IDLE;
    hbridge_map               <=  4'b0000;

    step_type                 <=  UNDEFINED_STEP;
    continuous                <=  0;
    direction                 <=  0;
    max_step_count            <=  0;
    step_count                <=  0;
    o_err_bad_step            <=  0;

    step_delay                <=  0;

    step_pos                  <=  0;

    shoot_through_period      <=  0;
    shoot_through_count       <=  0;

    current_position          <=  0;
    move_strobe               <=  0;
  end
  else begin
    move_strobe               <=  0;
    case (state)
      IDLE: begin
        //Localize all inputs so the user cannot suddenly change the state of
        //the motor and cause poop to hit fans (what a terrible image) O_O
        continuous            <=  0;
        step_count            <=  0;
        max_step_count        <=  0;

        step_delay            <=  0;
        o_err_bad_step        <=  0;
        direction             <=  0;

        if (i_go) begin
          if (i_full_step) begin
            step_type         <=  FULL_STEP;
            state             <=  PROCESS_STEP;
            max_step_count    <=  in_full_steps;
          end
          else if (i_half_step) begin
            step_type         <=  HALF_STEP;
            state             <=  PROCESS_STEP;
            max_step_count    <=  in_half_steps;
          end
          else if (i_micro_step) begin
            step_type         <=  MICRO_STEP;
            state             <=  FINISHED;
            max_step_count    <=  in_half_steps;
          end
          else begin
            //USER DID NOT SPECIFY A STEP TYPE!
            step_type         <=  UNDEFINED_STEP;
            o_err_bad_step    <=  1;
            state             <=  FINISHED;
          end
          if (i_continuous) begin
            continuous        <=  1;
          end
          shoot_through_period<=  i_shoot_through_period;
          direction           <=  i_direction;
        end
      end
      PROCESS_STEP: begin
        if (i_stop || (step_count >= max_step_count)) begin
          //we are above the amount of steps given to us, we are done
          state               <=  FINISHED;
        end
        else begin
          step_delay          <=  0;
          case (step_type)
            FULL_STEP: begin
              if (step_count < max_step_count) begin
                hbridge_map   <=  full_step_path[step_pos];
                state         <=  PROCESS_SLEEP;
              end
              else begin
                state         <=  FINISHED;
              end
            end
            HALF_STEP: begin
              if (step_count < max_step_count) begin
                hbridge_map   <=  half_step_path[step_pos];
                state         <=  PROCESS_SLEEP;
              end
              else begin
                state         <=  FINISHED;
              end
            end
            default: begin
              //It shouldn't be possible to get here but this is just an error
              //checking step
              o_err_bad_step  <=  1;
              state           <=  FINISHED;
            end
          endcase
        end
      end
      PROCESS_SLEEP: begin
        if (step_delay < current_period) begin
          step_delay          <=  step_delay + 1;
        end
        else begin
          if (!continuous) begin
            step_count        <=  step_count + 1;
          end
          move_strobe         <=  1;
          if (direction) begin
            //Positive Direction
            if (step_pos >= max_pos_map[step_type]) begin
              step_pos        <=  0;
            end
            else begin
              step_pos        <=  step_pos + 1;
            end
          end
          else begin
            //Negative Direction
            if (step_pos == 0) begin
              step_pos        <=  max_pos_map[step_type];
            end
            else begin
              step_pos        <=  step_pos - 1;
            end
          end

          if (shoot_through_period > 0) begin
            shoot_through_count   <=  0;
            state                 <=  PROCESS_SHOOT_THROUGH;
          end
          else begin
            state                 <=  PROCESS_STEP;
          end
        end
      end
      PROCESS_SHOOT_THROUGH: begin
        if (shoot_through_count < shoot_through_period) begin
          shoot_through_count     <=  shoot_through_count + 1;
          hbridge_map             <=  4'b0000;
        end
        else begin
          state                   <=  PROCESS_STEP;
        end
      end
      FINISHED: begin
        hbridge_map               <=  4'b0000;
        if (!i_go && !micro_busy) begin
          if (step_type == MICRO_STEP) begin
            current_position      <=  micro_position;
          end
          state                   <=  IDLE;
        end
      end
      default: begin
        state                     <=  FINISHED;
      end
    endcase
    if (i_stop) begin
      state                       <=  IDLE;
    end
  end
end

//Accelleration control
always @ (posedge clk) begin
  if (rst) begin
    accelleration         <=  0;
    current_period        <=  0;
    velocity              <=  0;
    prev_step_count       <=  0;
    run_period            <=  0;
    walk_period           <=  0;
  end
  else begin
    if (i_go) begin
      accelleration       <=  i_step_accelleration;
      if (i_full_step) begin
        run_period        <=  i_step_run_period   << 1;
        walk_period       <=  i_step_walk_period  << 1;
        current_period      <=  i_step_walk_period << 1;
      end
      else begin
        run_period        <=  i_step_run_period;
        walk_period       <=  i_step_walk_period;
        current_period    <=  i_step_walk_period;
      end
    end

    if (step_change) begin
      if ((velocity < steps_left) && (current_period > run_period)) begin
        velocity            <= velocity + 1;
        if ((current_period - accelleration) < run_period) begin
          current_period    <= run_period;
        end
        else begin
          if (velocity + 1 < steps_left) begin
            current_period <= current_period - accelleration;
          end
        end
      end
      else if ((velocity >= steps_left) && (velocity > 0))begin
        velocity            <=  velocity - 1;
        if ((current_period + accelleration) > walk_period) begin
          current_period    <=  walk_period;
        end
        else begin
          current_period    <=  current_period + accelleration;
        end
      end
    end

    //Use to find transitions
    if (i_micro_step) begin
      prev_step_count       <=  micro_step_count;
    end
    else begin
      prev_step_count       <=  step_count;
    end
  end
end


endmodule
