// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wb_stepper.v
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
  Self Defining Bus (SDB)

  Set the Vendor ID (Hexidecimal 64-bit Number)
  SDB_VENDOR_ID:0x800000000000C594

  Set the Device ID (Hexcidecimal 32-bit Number)
  SDB_DEVICE_ID:0x00000009

  Set the version of the Core XX.XXX.XXX Example: 01.000.000
  SDB_CORE_VERSION:00.000.001

  Set the Device Name: (19 UNICODE characters)
  SDB_NAME:wb_stepper

  Set the class of the device (16 bits) Set as 0
  SDB_ABI_CLASS:0

  Set the ABI Major Version: (8-bits)
  SDB_ABI_VERSION_MAJOR:0x11

  Set the ABI Minor Version (8-bits)
  SDB_ABI_VERSION_MINOR:0x01

  Set the Module URL (63 Unicode Characters)
  SDB_MODULE_URL:http://www.example.com

  Set the date of module YYYY/MM/DD
  SDB_DATE:2015/01/07

  Device is executable (True/False)
  SDB_EXECUTABLE:True

  Device is readable (True/False)
  SDB_READABLE:True

  Device is writeable (True/False)
  SDB_WRITEABLE:True

  Device Size: Number of Registers
  SDB_SIZE:13
*/

/*
*
* CONFIGURATION:  (bit controlled register value)
*   0: unipolar stepper select
*   1: bipolar stepper select
*   2: enable_interrupt
* CONTROL:  (bit controlled register value)
*   0: direction
*     0: Reverse
*     1: Forward
*   1: continuous rotation
*   [5:4]: Step Type
*     0: Full Step
*     1: Half Step
*     2: Micro Step
* COMMAND:  (value)
*   0x01: Go
*   0x02: Stop
* STATUS: (bit field)
*   0: Busy
*   8: error bad command
*   9: error bad step configuration
*   10: bad configuration
* RUN_PERIOD: (value)
*   Count between steps
* SHOOT_THROUGH_DELAY: (value)
*   Count of dead space between steps
* CURRENT_POSITION:
*   Current position of the stepper
* PWM_UNIT_PERIOD:
*   period of a
* CLOCK_RATE:
* WALK_PERIOD:
* STEP_ACCELLERATION:
*/

`include "project_defines.v"

module wb_stepper #(
  parameter           DEFAULT_MAX_POSITION = (32'd200) << 9
)(
  input               clk,
  input               rst,

  //Add signals to control your device here

  //Wishbone Bus Signals
  input               i_wbs_we,
  input               i_wbs_cyc,
  input       [3:0]   i_wbs_sel,
  input       [31:0]  i_wbs_dat,
  input               i_wbs_stb,
  output  reg         o_wbs_ack,
  output  reg [31:0]  o_wbs_dat,
  input       [31:0]  i_wbs_adr,

  output  reg         o_wbs_int,

  output              o_hbridge0_l,
  output              o_hbridge0_r,
  output              o_hbridge1_l,
  output              o_hbridge1_r
);

//Local Parameters
localparam    CONFIGURATION         = 32'h00000000;
localparam    CONTROL               = 32'h00000001;
localparam    COMMAND               = 32'h00000002;
localparam    STATUS                = 32'h00000003;
localparam    CLOCK_RATE            = 32'h00000004;
localparam    STEPS                 = 32'h00000005;
localparam    WALK_PERIOD           = 32'h00000006;
localparam    RUN_PERIOD            = 32'h00000007;
localparam    STEP_ACCELLERATION    = 32'h00000008;
localparam    MICRO_STEP_HOLD       = 32'h00000009;
localparam    SHOOT_THROUGH_DELAY   = 32'h0000000A;
localparam    CURRENT_POSITION      = 32'h0000000B;
localparam    MAX_POSITION          = 32'h0000000C;

//configuration
localparam    CONFIG_UNIPOLAR       = 0;
localparam    CONFIG_BIPOLAR        = 1;
localparam    CONFIG_ENABLE_INT     = 2;

//control
localparam    CONTROL_DIRECTION     = 0;
localparam    CONTROL_CONTINUOUS    = 1;
localparam    CONTROL_FULL_STEP     = 4;
localparam    CONTROL_HALF_STEP     = 5;
localparam    CONTROL_MICRO_STEP    = 6;
localparam    CONTROL_DUMMY_STEP    = 7;  //Don't use this step position

//commands
localparam    COMMAND_GO            = 32'h00000001;
localparam    COMMAND_STOP          = 32'h00000002;

//status
localparam    STATUS_BUSY           = 0;
//errors
localparam    STATUS_ERR_BAD_CMD    = 8;
localparam    STATUS_ERR_BAD_STEP   = 9;
localparam    STATUS_ERR_BAD_CONFIG = 10;

//Local Registers/Wires
reg           [2:0]   configuration;
reg           [6:0]   control;
wire          [31:0]  status;
reg           [31:0]  steps;
reg           [31:0]  step_run_period;
reg           [31:0]  step_walk_period;
reg           [31:0]  shoot_through_period;
reg           [31:0]  micro_step_hold;
reg           [31:0]  accelleration;
reg           [31:0]  max_position;

//Configuration
wire                  bipolar_stepper;
wire                  unipolar_stepper;
wire                  enable_interrupt;

//Commands
reg                   go;
reg                   stop;
wire                  busy;

//Control
wire                  continuous;
wire                  direction;
wire                  full_step;
wire                  half_step;
wire                  micro_step;

//Status
wire                  stepper_err_bad_step;
reg                   err_bad_step;
reg                   err_bad_command;
reg                   err_bad_config;
wire                  bad_config;
wire                  err_condition;
wire                  move_strobe;

//Step/Position information
wire          [31:0]  micro_step_count;
wire          [31:0]  half_step_count;
wire          [31:0]  full_step_count;
reg           [31:0]  curr_pos;

reg                   prev_busy;

//Submodules
stepper stpr (
  .clk                    (clk                    ),
  .rst                    (rst                    ),

  .i_bipolar_stepper      (bipolar_stepper        ),
  .i_unipolar_stepper     (unipolar_stepper       ),

  .i_go                   (go                     ),
  .i_stop                 (stop                   ),
  .o_busy                 (busy                   ),

  .o_err_bad_step         (stepper_err_bad_step   ),

  .i_full_step            (full_step              ),
  .i_half_step            (half_step              ),
  .i_micro_step           (micro_step             ),

  .i_continuous           (continuous             ),
  .i_direction            (direction              ),
  .i_steps                (steps                  ),
  .o_move_strobe          (move_strobe            ),


  .i_step_run_period      (step_run_period        ),
  .i_step_walk_period     (step_walk_period       ),
  .i_step_accelleration   (accelleration          ),
  .i_micro_step_hold      (micro_step_hold        ),
  .i_shoot_through_period (shoot_through_period   ),

  .o_hbridge0_l           (o_hbridge0_l           ),
  .o_hbridge0_r           (o_hbridge0_r           ),
  .o_hbridge1_l           (o_hbridge1_l           ),
  .o_hbridge1_r           (o_hbridge1_r           )
);

//Asynchronous Logic
//Status
assign  unipolar_stepper              = configuration[CONFIG_UNIPOLAR];
assign  bipolar_stepper               = configuration[CONFIG_BIPOLAR];
assign  enable_interrupt              = configuration[CONFIG_ENABLE_INT];

assign  status[STATUS_BUSY]           = busy;
assign  status[7:1]                   = 0;
assign  status[STATUS_ERR_BAD_CMD]    = err_bad_command;
assign  status[STATUS_ERR_BAD_STEP]   = err_bad_step;
assign  status[STATUS_ERR_BAD_CONFIG] = err_bad_config;
assign  status[31:11]                 = 0;



assign  direction                   = control[CONTROL_DIRECTION];
assign  continuous                  = control[CONTROL_CONTINUOUS];
assign  full_step                   = control[6:4] == 1;
assign  half_step                   = control[6:4] == 2;
assign  micro_step                  = control[6:4] == 3;

assign  bad_config                  = (( i_wbs_dat[CONFIG_UNIPOLAR] && i_wbs_dat[CONFIG_BIPOLAR]) |
                                       ((i_wbs_dat[CONFIG_UNIPOLAR] || i_wbs_dat[CONFIG_BIPOLAR]) == 0));
assign  err_condition               = err_bad_config || err_bad_command;

assign  micro_step_count            = 32'h00000010;
assign  half_step_count             = 32'h00000100;
assign  full_step_count             = 32'h00000200;

//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat           <= 32'h0;
    o_wbs_ack           <= 0;
    o_wbs_int           <= 0;

    configuration       <= 0;
    control             <= 0;
    steps               <= 0;
    step_walk_period    <= 0;
    step_run_period     <= 0;
    accelleration       <= 0;
    shoot_through_period<= 0;
    micro_step_hold     <= 0;
    max_position        <= DEFAULT_MAX_POSITION;

    go                  <= 0;
    stop                <= 0;

    err_bad_step        <= 0;
    err_bad_command     <= 0;
    err_bad_config      <= 0;

    prev_busy           <= 0;
  end
  else begin

    //when the master acks our ack, then put our ack down
    if (o_wbs_ack && ~i_wbs_stb)begin
      o_wbs_ack <= 0;
    end

    //Use feedback to deassert commands
    if (busy) begin
      go                <=  0;
      stop              <=  0;
    end

    if (prev_busy & !busy) begin
      if (enable_interrupt) begin
        o_wbs_int       <=  1;
      end
    end

    if (i_wbs_stb && i_wbs_cyc) begin
      //master is requesting somethign

      //If the user request anything reset the interrtupt
      o_wbs_int         <=  0;
      if (i_wbs_we) begin
        //write request
        case (i_wbs_adr)
          CONFIGURATION: begin
            configuration         <=  i_wbs_dat[2:0];
            if (bad_config) begin
              err_bad_config      <=  1;
            end
          end
          CONTROL: begin
            control               <=  i_wbs_dat[6:0];
          end
          COMMAND: begin
            case (i_wbs_dat)
              COMMAND_GO: begin
                if (!err_condition) begin
                  //only go if the configuration is good
                  go              <=  1;
                end
              end
              COMMAND_STOP: begin
                stop              <=  1;
              end
              default: begin
                err_bad_command   <=  1;
              end
            endcase
          end
          STEPS: begin
            steps                 <=  i_wbs_dat;
          end
          WALK_PERIOD: begin
            step_walk_period      <=  i_wbs_dat;
          end
          RUN_PERIOD: begin
            step_run_period       <=  i_wbs_dat;
          end
          STEP_ACCELLERATION: begin
            accelleration         <=  i_wbs_dat;
          end
          SHOOT_THROUGH_DELAY: begin
            shoot_through_period  <=  i_wbs_dat;
          end
          MICRO_STEP_HOLD: begin
            micro_step_hold       <=  i_wbs_dat;
          end
          MAX_POSITION: begin
            max_position          <=  i_wbs_dat;
          end
          default: begin
          end
        endcase
      end

      else begin
        if (!o_wbs_ack) begin //Fix double reads
          //read request
          case (i_wbs_adr)
            CONFIGURATION: begin
              o_wbs_dat           <=  configuration;
            end
            CONTROL: begin
              o_wbs_dat           <=  control;
            end
            COMMAND: begin
              o_wbs_dat           <=  {30'h0, stop, go};
            end
            STATUS: begin
              o_wbs_dat           <=  status;
              //deassert errors on status return
              err_bad_command     <=  0;
              err_bad_step        <=  0;
              err_bad_config      <=  0;
            end
            STEPS: begin
              o_wbs_dat           <=  steps;
            end
            WALK_PERIOD: begin
              o_wbs_dat           <=  step_walk_period;
            end
            RUN_PERIOD: begin
              o_wbs_dat           <=  step_run_period;
            end
            STEP_ACCELLERATION: begin
              o_wbs_dat           <=  accelleration;
            end
            MICRO_STEP_HOLD: begin
              o_wbs_dat           <=  micro_step_hold;
            end
            SHOOT_THROUGH_DELAY: begin
              o_wbs_dat           <=  shoot_through_period;
            end
            CURRENT_POSITION: begin
              o_wbs_dat           <=  curr_pos;
            end
            CLOCK_RATE: begin
              o_wbs_dat           <=  `CLOCK_RATE;
            end
            MAX_POSITION: begin
             o_wbs_dat            <=   max_position;
            end
            default: begin
              o_wbs_dat           <=  0;
            end
          endcase
        end
      end
      o_wbs_ack                   <= 1;
    end
    prev_busy                     <=  busy;
  end
end


always @ (posedge clk) begin
  if (rst) begin
    curr_pos                      <=  0;
  end
  else begin
    if (max_position == 0) begin
      curr_pos                    <=  0;
    end
    else begin
      if (move_strobe) begin
        if (direction) begin
          if (micro_step) begin
            if (curr_pos + micro_step_count > max_position) begin
              curr_pos <= (curr_pos + micro_step_count) - max_position;
            end
            else begin
              curr_pos <= curr_pos + micro_step_count;
            end
          end
          else if (half_step) begin
            if ((curr_pos + half_step_count) > max_position) begin
              curr_pos <= (curr_pos + half_step_count) - max_position;
            end
            else begin
              curr_pos <= curr_pos + half_step_count;
            end
          end
          else if (full_step) begin
            if (curr_pos + full_step_count > max_position) begin
              curr_pos <= (curr_pos + full_step_count) - max_position;
            end
            else begin
              curr_pos <= curr_pos + full_step_count;
            end
          end
        end
        else begin
          if (micro_step) begin
            if (micro_step_count > curr_pos) begin
              curr_pos  <=  max_position - (micro_step_count - curr_pos);
            end
            else begin
              curr_pos  <=  curr_pos - micro_step_count;
            end
          end
          else if (half_step) begin
            if (half_step_count > curr_pos) begin
              curr_pos  <=  max_position - (half_step_count - curr_pos);
            end
            else begin
              curr_pos  <=  curr_pos - half_step_count;
            end

          end
          else if (full_step) begin
            if (full_step_count > curr_pos) begin
              curr_pos  <=  max_position - (full_step_count - curr_pos);
            end
            else begin
              curr_pos  <=  curr_pos - full_step_count;
            end
          end
        end
      end
    end
  end
end

endmodule
