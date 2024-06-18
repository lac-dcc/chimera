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

module stepper (
  input               clk,
  input               rst,

  //Stepper selector
  input               i_bipolar_stepper,
  input               i_unipolar_stepper,

  input               i_go,
  input               i_stop,
  output              o_busy,

  //Errors
  output              o_err_bad_step,

  input               i_full_step,
  input               i_half_step,
  input               i_micro_step,

  input               i_continuous,
  input               i_direction,
  input       [31:0]  i_steps,
  output              o_move_strobe,

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
//Local Registers/Wires
wire                  bp_go;
wire                  bp_stop;
wire                  bp_busy;

wire                  bp_err_bad_step;

wire                  bp_full_step;
wire                  bp_half_step;
wire                  bp_micro_step;
wire                  bp_continuous;
wire                  bp_direction;
wire        [31:0]    bp_steps;
wire                  bp_move_strobe;


wire        [31:0]    bp_step_run_period;
wire        [31:0]    bp_step_walk_period;
wire        [31:0]    bp_step_accelleration;

wire        [31:0]    bp_shoot_through_period;

wire                  bp_hbridge0_l;
wire                  bp_hbridge0_r;
wire                  bp_hbridge1_l;
wire                  bp_hbridge1_r;


wire                  up_go;
wire                  up_busy;
wire                  up_stop;

wire                  up_err_bad_step;

wire                  up_full_step;
wire                  up_half_step;
wire                  up_micro_step;
wire                  up_continuous;
wire                  up_direction;
wire       [31:0]     up_steps;

wire        [31:0]    up_step_run_period;
wire        [31:0]    up_step_walk_period;
wire        [31:0]    up_step_accelleration;


wire        [31:0]    up_shoot_through_period;

wire                  up_hbridge0_l;
wire                  up_hbridge0_r;
wire                  up_hbridge1_l;
wire                  up_hbridge1_r;


//Submodules
bipolar_stepper bps(
  .clk                    (clk                    ),
  .rst                    (rst                    ),

  .i_go                   (bp_go                  ),
  .o_busy                 (bp_busy                ),
  .i_stop                 (bp_stop                ),

  .o_err_bad_step         (bp_err_bad_step        ),

  .i_full_step            (bp_full_step           ),
  .i_half_step            (bp_half_step           ),
  .i_micro_step           (bp_micro_step          ),

  .i_continuous           (bp_continuous          ),
  .i_direction            (bp_direction           ),
  .i_steps                (bp_steps               ),
  .o_move_strobe          (bp_move_strobe         ),

  .i_step_run_period      (bp_step_run_period     ),
  .i_step_walk_period     (bp_step_walk_period    ),
  .i_step_accelleration   (bp_step_accelleration  ),
  .i_micro_step_hold      (i_micro_step_hold      ),

  .i_shoot_through_period (bp_shoot_through_period),

  .o_hbridge0_l           (bp_hbridge0_l          ),
  .o_hbridge0_r           (bp_hbridge0_r          ),
  .o_hbridge1_l           (bp_hbridge1_l          ),
  .o_hbridge1_r           (bp_hbridge1_r          )
);

//Asynchronous Logic

assign bp_full_step       = i_full_step;
assign bp_half_step       = i_half_step;
assign bp_micro_step      = i_micro_step;
assign bp_direction       = i_direction;
assign bp_continuous      = i_continuous;

assign  bp_go                   = (i_bipolar_stepper)   ? i_go    :
                                  1'b0;
assign  o_move_strobe           = (i_bipolar_stepper)   ? bp_move_strobe :
                                  1'b0;

assign  bp_stop                 = (i_bipolar_stepper)   ? i_stop    :
                                  1'b0;

assign  bp_steps                = (i_bipolar_stepper)   ? i_steps    :
                                 1'b0;

assign  bp_step_run_period      = (i_bipolar_stepper)  ? i_step_run_period :
                                  1'b0;

assign  bp_step_walk_period     = (i_bipolar_stepper)  ? i_step_walk_period :
                                  1'b0;

assign  bp_step_accelleration   = (i_bipolar_stepper)  ? i_step_accelleration :
                                  1'b0;


assign  bp_shoot_through_period = (i_bipolar_stepper) ? i_shoot_through_period :
                                  1'b0;

assign  o_busy                  = (i_bipolar_stepper)   ? bp_busy :
                                  (i_unipolar_stepper)  ? up_busy :
                                  1'b0;

assign  o_err_bad_step          = (i_bipolar_stepper)   ? bp_err_bad_step :
                                  (i_unipolar_stepper)  ? up_err_bad_step :
                                  1'b0;

assign  o_hbridge0_l            = (i_bipolar_stepper)   ? bp_hbridge0_l :
                                  (i_unipolar_stepper)  ? up_hbridge0_l :
                                  1'b0;

assign  o_hbridge0_r            = (i_bipolar_stepper)   ? bp_hbridge0_r :
                                  (i_unipolar_stepper)  ? up_hbridge0_r :
                                  1'b0;

assign  o_hbridge1_l            = (i_bipolar_stepper)   ? bp_hbridge1_l :
                                  (i_unipolar_stepper)  ? up_hbridge1_l :
                                  1'b0;

assign  o_hbridge1_r            = (i_bipolar_stepper)   ? bp_hbridge1_r :
                                  (i_unipolar_stepper)  ? up_hbridge1_r :
                                  1'b0;



assign  up_busy         = 1'b0;
assign  up_err_bad_step = 1'b0;

assign  up_hbridge0_l   = 1'b0;
assign  up_hbridge0_r   = 1'b0;
assign  up_hbridge1_l   = 1'b0;
assign  up_hbridge1_r   = 1'b0;
//Synchronous Logic
endmodule
