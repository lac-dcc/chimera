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

module pwm #(
  parameter CORE_WIDTH        = 4 ,
  parameter PWM_COUNTER_WIDTH = 16
) (
  input                                       clk   ,
  input                                       rst   ,
  //PWM
  input      [         PWM_COUNTER_WIDTH-1:0] period,
  input      [PWM_COUNTER_WIDTH*CORE_WIDTH:0] duty  ,
  output reg [                CORE_WIDTH-1:0] pwm
);


  reg[PWM_COUNTER_WIDTH-1:0] counter;


  initial begin
    counter = 0;
    pwm = 0;
  end

  genvar i;
  generate
    for(i=0; i < CORE_WIDTH ; i=i+1) begin:pwm_out
      always@(*)begin
        if(counter < duty[((i+1)*PWM_COUNTER_WIDTH)-1-:16])
          pwm[i] = 1'b1;
        else
          pwm[i] = 1'b0;
      end
    end
  endgenerate

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      counter <= 0;
    end else begin
      if(counter > period )
        counter <= 0;
      else
        counter <= counter + 1;
    end
  end



endmodule



