// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License


`include "project_defines.v"

module bipolar_micro_stepper #(
    parameter           CLOCK_DIV = 16
)(
  input               clk,
  input               rst,

  //Control
  input               i_go,
  output              o_busy,
  input               i_stop,

  //Position
  input       [31:0]  i_current_position,
  output      [31:0]  o_current_position,

  input       [7:0]   i_step_pos,
  output      [7:0]   o_step_pos,
  output      [31:0]  o_step_count,
  output  reg         o_move_strobe,

  //Step Modifiers
  input               i_continuous,
  input               i_direction,
  input       [31:0]  i_steps,
  input       [31:0]  i_micro_step_hold,

  //Counts
  input       [31:0]  i_current_period,

  //Pins
  output              o_hbridge0_l,
  output              o_hbridge0_r,
  output              o_hbridge1_l,
  output              o_hbridge1_r
);

//Local Parameters
localparam  IDLE                      = 4'h0;
localparam  PREPARE_STEP              = 4'h1;
localparam  PROCESS_STEP              = 4'h2;
localparam  FINISHED                  = 4'h3;

localparam  PWM_PERIOD                = 256;
localparam  PWM_STEP_POS_MAX          = 16;

//Registers/Wires
reg     [3:0]         state           = IDLE;
reg                   direction;
reg                   continuous;
reg     [31:0]        step_pos;
wire    [31:0]        in_steps;
wire    [31:0]        in_micro_steps;

reg     [31:0]        current_period_count;

reg     [31:0]        current_position;
reg     [31:0]        step_count;
reg     [31:0]        total_step_count;
reg     [31:0]        micro_step_count ;
reg     [31:0]        final_micro_step_count ;

wire    [3:0]         step_path  [7:0];
wire    [7:0]         micro_step_duty [15:0];
wire    [31:0]        step_inc_map    [3:0];
wire    [31:0]        max_pos_map     [3:0];

wire    [1:0]         micro_step_hbridge_pwm  [7:0];
wire    [7:0]         micro_step_hbridge_dir;

reg                   micro_step_pwm_en;
wire    [31:0]        micro_step_pwm_duty;
wire    [31:0]        micro_step_pwm_period;
wire                  micro_step_pwm;
wire    [31:0]        micro_current_period;
reg     [31:0]        micro_current_period_count;

reg     [3:0]         hbridge_map;

reg     [31:0]        pwm_step_pos;
wire                  pwm_direction;

wire    [31:0]        steps_left;
wire    [31:0]        pwm_period;
wire    [31:0]        ms_step_pwm_duty;

//Submodules
pwm micro_pwm(
  .clk          (clk                              ),
  .rst          (rst                              ),

  .en           (micro_step_pwm_en                ),
  .period       (pwm_period                       ),
  .duty_cycle   (ms_step_pwm_duty                 ),

  .out          (micro_step_pwm                   )
);

assign pwm_period                 = PWM_PERIOD  << CLOCK_DIV;
assign ms_step_pwm_duty           = micro_step_pwm_duty <<  CLOCK_DIV;

//Asynchronous Logic
assign o_busy                     = (i_go | (state != IDLE));
assign o_step_pos                 = step_pos;
assign o_current_position         = current_position;

assign  steps_left                = total_step_count - step_count;

assign step_path[0]               = 4'b1000;
assign step_path[1]               = 4'b1010;
assign step_path[2]               = 4'b0010;
assign step_path[3]               = 4'b0110;
assign step_path[4]               = 4'b0100;
assign step_path[5]               = 4'b0101;
assign step_path[6]               = 4'b0001;
assign step_path[7]               = 4'b1001;

assign micro_step_duty[0]         = 8'h00;
assign micro_step_duty[1]         = 8'h18;
assign micro_step_duty[2]         = 8'h31;
assign micro_step_duty[3]         = 8'h4A;
assign micro_step_duty[4]         = 8'h61;
assign micro_step_duty[5]         = 8'h78;
assign micro_step_duty[6]         = 8'h8D;
assign micro_step_duty[7]         = 8'hA1;
assign micro_step_duty[8]         = 8'hB4;
assign micro_step_duty[9]         = 8'hC5;
assign micro_step_duty[10]        = 8'hD4;
assign micro_step_duty[11]        = 8'hE0;
assign micro_step_duty[12]        = 8'hEB;
assign micro_step_duty[13]        = 8'hF4;
assign micro_step_duty[14]        = 8'hFA;
assign micro_step_duty[15]        = 8'hFD;

assign micro_step_hbridge_pwm[0]  = 2'h0;
assign micro_step_hbridge_pwm[1]  = 2'h1;
assign micro_step_hbridge_pwm[2]  = 2'h3;
assign micro_step_hbridge_pwm[3]  = 2'h2;
assign micro_step_hbridge_pwm[4]  = 2'h1;
assign micro_step_hbridge_pwm[5]  = 2'h0;
assign micro_step_hbridge_pwm[6]  = 2'h2;
assign micro_step_hbridge_pwm[7]  = 2'h3;

assign micro_step_hbridge_dir[0]  = 1'b0; //pos      neutral
assign micro_step_hbridge_dir[1]  = 1'b1; //pos      pos
assign micro_step_hbridge_dir[2]  = 1'b0; //neutral  pos
assign micro_step_hbridge_dir[3]  = 1'b1; //neg      pos
assign micro_step_hbridge_dir[4]  = 1'b0; //neg      neutral
assign micro_step_hbridge_dir[5]  = 1'b1; //neg      neg
assign micro_step_hbridge_dir[6]  = 1'b0; //neutral  neg
assign micro_step_hbridge_dir[7]  = 1'b1; //pos      neg

assign o_hbridge0_l               = hbridge_map[3];
assign o_hbridge0_r               = hbridge_map[2];
assign o_hbridge1_l               = hbridge_map[1];
assign o_hbridge1_r               = hbridge_map[0];


assign micro_step_pwm_duty  = {24'h0, micro_step_duty[pwm_step_pos]};

assign in_steps             =  {8'h0, i_steps[31:8]};
assign in_micro_steps       =  {28'h0, i_steps[7:4]};

assign pwm_direction        = (micro_step_hbridge_dir[step_pos] ~^ direction);
assign micro_current_period = (i_current_period >> 4); //divide the step period by 16 so that there is enough time to execute each of the micro step
assign o_step_count         = step_count;



//Synchronous Logig
always @ (posedge clk) begin
  if (rst) begin
    state                           <=  IDLE;

    step_pos                        <=  0;
    current_position                <=  0;

    current_period_count            <=  0;

    step_count                      <=  0;
    total_step_count                <=  0;
    final_micro_step_count          <=  0;
    micro_step_count                <=  0;

    micro_step_pwm_en               <=  0;
    hbridge_map                     <=  4'b0000;
    direction                       <=  0;
    continuous                      <=  0;
    o_move_strobe                   <=  0;
  end
  else begin
    o_move_strobe                   <=  0;

    if (micro_current_period_count < micro_current_period) begin
      micro_current_period_count   <=  micro_current_period_count + 1;
    end
    case (state)
      IDLE: begin
        hbridge_map                 <=  4'b0000;
        current_position            <=  i_current_position;
        step_pos                    <=  i_step_pos;
        current_period_count        <=  0;
        step_count                  <=  0;
        micro_step_count            <=  0;
        if (i_go) begin
          hbridge_map               <=  step_path[step_pos];
          total_step_count          <=  in_steps;
          final_micro_step_count    <=  in_micro_steps;
          direction                 <=  i_direction;
          continuous                <=  i_continuous;

          state                     <=  PREPARE_STEP;
        end
      end
      PREPARE_STEP: begin
        if (i_stop || (step_count >= total_step_count)) begin
          //we are above the amount of steps given to us, we are done
          state                     <=  FINISHED;
        end
        else begin
          current_period_count      <=  0;
          micro_current_period_count<=  0;
          micro_step_pwm_en         <=  0;
          hbridge_map               <=  step_path[step_pos];
          o_move_strobe             <=  1;
          state                     <= PROCESS_STEP;

          if (pwm_direction) begin
            pwm_step_pos            <=  0;
          end
          else begin
            pwm_step_pos            <=  PWM_STEP_POS_MAX - 1;
          end


        end
      end
      PROCESS_STEP: begin
        micro_step_pwm_en           <=  1;

        //Micro Step Count
        if (micro_current_period_count >= micro_current_period) begin
          o_move_strobe             <=  1;
          if (pwm_direction) begin
            pwm_step_pos            <=  pwm_step_pos + 1;
          end
          else begin
            pwm_step_pos            <=  pwm_step_pos - 1;
          end
          micro_current_period_count   <=  0;
        end

        //Full Step Period Count
        if (current_period_count < i_current_period) begin
          current_period_count     <=  current_period_count + 1;
          if ((current_period_count + i_micro_step_hold) < i_current_period) begin
            hbridge_map[micro_step_hbridge_pwm[step_pos]] <=  micro_step_pwm;
          end
          else begin

            hbridge_map             <=  step_path[step_pos];
          end
        end
        else begin
          state                     <=  PREPARE_STEP;
          hbridge_map               <=  step_path[step_pos];
          if (direction) begin
            //Positive
            if (step_pos >= 7) begin
              step_pos              <=  0;
            end
            else begin
              step_pos              <=  step_pos + 1;
            end
          end
          else begin
            //Negative
            if (step_pos == 0) begin
              step_pos              <=  7;
            end
            else begin
              step_pos              <=  step_pos - 1;
            end
          end
          if (step_count < total_step_count) begin
            micro_step_count        <=  PWM_STEP_POS_MAX;
          end
          else if (final_micro_step_count > 0) begin
            micro_step_count        <=  final_micro_step_count;
            final_micro_step_count  <=  0;
          end
          else begin
            state                   <= FINISHED;
          end

          if (!continuous) begin
            step_count              <=  step_count + 1;
          end


        end
      end
      FINISHED: begin
        hbridge_map                 <=  4'b0000;
        if (!i_go) begin
          state                     <=  IDLE;
        end
      end
      default: begin
        state                       <=  FINISHED;
      end
    endcase
    if (i_stop) begin
      state                         <=  IDLE;
    end
  end
end


endmodule
