// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Copyright 2016-2020 MATRIX Labs
* MATRIX Labs  [http://creator.matrix.one]
* Authors: Andres Calderon <andres.calderon@admobilize.com>
*          Kevin Patiño    <kevin.patino@admobilize.com>        
*
* This file is part of MATRIX Creator HDL for Spartan 6
*
* MATRIX Creator HDL is like free software: you can redistribute
* it and/or modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.

* This program is distributed in the hope that it will be useful, but
* WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.

* You should have received a copy of the GNU General Public License along
* with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

module wb_gpio #(
  parameter ADDR_WIDTH = "mandatory",
  parameter DATA_WIDTH = "mandatory",
  parameter GPIO_WIDTH = "mandatory"
) (
  input                         clk     ,
  input                         rst     ,
  //WishBone Interface
  input      [ADDR_WIDTH-1:0] wb_adr_i,
  input      [DATA_WIDTH-1:0] wb_dat_i,
  input                         wb_we_i ,
  input                         wb_cyc_i,
  input                         wb_stb_i,
  output reg [DATA_WIDTH-1:0] wb_dat_o,
  output reg                  wb_ack_o,
  //I/O PORT
  inout      [  GPIO_WIDTH-1:0] gpio_io
);

  parameter PRESCALER_WIDTH = 4;

  parameter PWM_STAGES        = 4 ;
  parameter PWM_CORE_WIDTH    = 4 ;
  parameter PWM_COUNTER_WIDTH = 16;

  parameter TIMER_STAGES        = 1 ;
  parameter TIMER_CORE_WIDTH    = 4 ;
  parameter TIMER_COUNTER_WIDTH = 16;
//Intial Stage

  initial begin
    wb_dat_o = 0;
    gpio_dir = 0;
    gpio_out = 0;
    gpio_function = 0;
    core_prescaler = 0;
    core_clk_bank = 0;
  end

  reg [                GPIO_WIDTH-1:0] gpio_dir                        ;
  reg [                GPIO_WIDTH-1:0] gpio_out                        ;
  reg [                GPIO_WIDTH-1:0] gpio_function                   ;
  reg [PWM_STAGES*PRESCALER_WIDTH-1:0] core_prescaler                  ;
  reg [                DATA_WIDTH-1:0] pwm_period    [  0:PWM_STAGES-1];
  reg [                DATA_WIDTH-1:0] pwm_duty      [0:4*PWM_STAGES-1];

//Wisbone logical Interface
  wire wb_rd = wb_stb_i & wb_cyc_i & ~wb_we_i & ~wb_ack_o;
  wire wb_wr = wb_stb_i & wb_cyc_i & wb_we_i & ~wb_ack_o ;
// Internal GPIO registers
  wire [GPIO_WIDTH-1:0] gpio_o;
  wire [GPIO_WIDTH-1:0] gpio_i;

// Tristate logic for IO
  genvar    i;
  generate
    for (i=0;i<GPIO_WIDTH;i=i+1)  begin: gpio_tris
      assign gpio_io[i] = (gpio_dir[i]) ? gpio_o[i] : 1'bz;
      assign gpio_i[i]  = gpio_io[i];
    end
  endgenerate

//Prescaler CLK
  wire [(2**PRESCALER_WIDTH)-1:0] core_clk;
  core_clk #(.PRESCALER(2**PRESCALER_WIDTH)) coreclk0(.clk(clk),.rst(rst),.core_clk(core_clk));

  genvar k;
  generate
    for (k=0; k<PWM_STAGES; k=k+1) begin:clk_selector
      always @(posedge clk or posedge rst)
        if(rst)
          core_clk_bank[k] <= 0;
        else
          core_clk_bank[k] <= core_clk[core_prescaler[4*k+3-:4]];
      end
    endgenerate

//PWM

    wire [(4*PWM_STAGES)-1:0] pwm_out;
    reg  [PWM_STAGES-1:0] core_clk_bank;

    genvar j;
    generate
      for (j=0; j<PWM_STAGES; j=j+1)
        begin:pwm_stage
          pwm #(
            .CORE_WIDTH       (PWM_CORE_WIDTH   ),
            .PWM_COUNTER_WIDTH(PWM_COUNTER_WIDTH)
          ) pwm0 (
            .clk   (core_clk_bank[j]                                               ),
            .rst   (rst                                                            ),
            
            .period(pwm_period[j]                                                  ),
            .duty  ({pwm_duty[4*j+3],pwm_duty[4*j+2],pwm_duty[4*j+1],pwm_duty[4*j]}),
            .pwm   (pwm_out[ (PWM_STAGES*j+3) -: 4]                                )
          );
        end
    endgenerate

//TIMER
    wire [TIMER_STAGES*DATA_WIDTH*TIMER_CORE_WIDTH-1:0] timer_register;
    wire [                        (4*TIMER_STAGES)-1:0] timer_input   ;
    reg  [                              DATA_WIDTH-1:0] timer_conf    ; //TODO:kevin.patino:improve quality of parameters

    genvar n;
    generate
      for (n=0; n<TIMER_STAGES; n=n+1)
        begin:timer_stage
          timer #(
            .CORE_WIDTH         (TIMER_CORE_WIDTH   ),
            .TIMER_COUNTER_WIDTH(TIMER_COUNTER_WIDTH)
          ) timer0 (
            .clk         (clk                               ),
            .rst         (rst                               ),
            .ps_clk      (core_clk_bank[n]                  ),
            
            .timer_input (timer_input[TIMER_STAGES*n+3 -: 4]),
            .timer_conf  (timer_conf[TIMER_STAGES*n+7 -: 8] ),
            .timer_result(timer_register[n*64+63 -: 64]     )
          );
        end
    endgenerate

// MUX Output
    mux_io mux_in (.sig2(16'h00), .sig1(gpio_i), .select(~gpio_dir&gpio_function), .mux_out(timer_input));

// MUX Input
    mux_io mux_out (.sig2(gpio_out), .sig1(pwm_out), .select(gpio_dir&gpio_function), .mux_out(gpio_o));

    always @(posedge clk  or posedge rst)begin
      if (rst)begin
        wb_ack_o <= 0;
        gpio_dir <= 0;
        gpio_out <= 0;
        gpio_function <= 0;
        core_prescaler <= 0;
        timer_conf   <= 0;
        pwm_period[0] <= 0;
        pwm_period[1] <= 0;
        pwm_period[2] <= 0;
        pwm_period[3] <= 0;
        pwm_duty[0] <= 0;
        pwm_duty[1] <= 0;
        pwm_duty[2] <= 0;
        pwm_duty[3] <= 0;
        pwm_duty[4] <= 0;
        pwm_duty[5] <= 0;
        pwm_duty[6] <= 0;
        pwm_duty[7] <= 0;
        pwm_duty[8] <= 0;
        pwm_duty[9] <= 0;
        pwm_duty[10] <= 0;
        pwm_duty[11] <= 0;
        pwm_duty[12] <= 0;
        pwm_duty[13] <= 0;
        pwm_duty[14] <= 0;
        pwm_duty[15] <= 0;
      end else begin
        wb_ack_o <= 0;
        if (wb_rd) begin             //Read cycle
          wb_ack_o <= 1;
          case(wb_adr_i[5:0])
            6'h00: wb_dat_o <= gpio_dir;
            6'h01: wb_dat_o <= gpio_i;
            6'h6: wb_dat_o <= timer_register[15-:16];
            6'h7: wb_dat_o <= timer_register[31-:16];
            6'h8: wb_dat_o <= timer_register[47-:16];
            6'h9: wb_dat_o <= timer_register[63-:16];
            default: wb_dat_o <= wb_dat_o;
          endcase

        end else if (wb_wr) begin //Write cycle
          wb_ack_o <= 1;
          case(wb_adr_i[4:0])
            5'h0: gpio_dir <= wb_dat_i;
            5'h1: gpio_out <= wb_dat_i;

            5'h2: gpio_function[GPIO_WIDTH-1 : 0] <= wb_dat_i;

            5'h3: core_prescaler <= wb_dat_i;

            5'h4: timer_conf   <= wb_dat_i;

            5'h5: pwm_period[0] <= wb_dat_i;
            5'h6: pwm_duty[0] <= wb_dat_i;
            5'h7: pwm_duty[1] <= wb_dat_i;
            5'h8: pwm_duty[2] <= wb_dat_i;
            5'h9: pwm_duty[3] <= wb_dat_i;

            5'hB: pwm_period[1] <= wb_dat_i;
            5'hC: pwm_duty[4] <= wb_dat_i;
            5'hD: pwm_duty[5] <= wb_dat_i;
            5'hE: pwm_duty[6] <= wb_dat_i;
            5'hF: pwm_duty[7] <= wb_dat_i;

            5'h11: pwm_period[2] <= wb_dat_i;
            5'h12: pwm_duty[8]  <= wb_dat_i;
            5'h13: pwm_duty[9] <= wb_dat_i;
            5'h14: pwm_duty[10] <= wb_dat_i;
            5'h15: pwm_duty[11] <= wb_dat_i;

            5'h17: pwm_period[3] <= wb_dat_i;
            5'h18: pwm_duty[12] <= wb_dat_i;
            5'h19: pwm_duty[13] <= wb_dat_i;
            5'h1A: pwm_duty[14] <= wb_dat_i;
            5'h1B: pwm_duty[15] <= wb_dat_i;
            default: begin
              wb_ack_o <= 0;
              gpio_dir <= gpio_dir;
              gpio_out <= gpio_out;
              gpio_function <= gpio_function;
              core_prescaler <= core_prescaler;
              timer_conf   <= timer_conf;
              pwm_period[0] <= pwm_period[0];
              pwm_period[1] <= pwm_period[1];
              pwm_period[2] <= pwm_period[2];
              pwm_period[3] <= pwm_period[3];
              pwm_duty[0] <= pwm_duty[0];
              pwm_duty[1] <= pwm_duty[1];
              pwm_duty[2] <= pwm_duty[2];
              pwm_duty[3] <= pwm_duty[3];
              pwm_duty[4] <= pwm_duty[4];
              pwm_duty[5] <= pwm_duty[5];
              pwm_duty[6] <= pwm_duty[6];
              pwm_duty[7] <= pwm_duty[7];
              pwm_duty[8] <= pwm_duty[8];
              pwm_duty[9] <= pwm_duty[9];
              pwm_duty[10] <= pwm_duty[10];
              pwm_duty[11] <= pwm_duty[11];
              pwm_duty[12] <= pwm_duty[12];
              pwm_duty[13] <= pwm_duty[13];
              pwm_duty[14] <= pwm_duty[14];
              pwm_duty[15] <= pwm_duty[15];
            end
          endcase
        end
      end
    end

  endmodule 
