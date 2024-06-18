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
module timer_core #(
  parameter TIMER_COUNTER_WIDTH = 16
)(
  input clk,
  input rst,
  input ps_clk,
  
  input enable_signal,
  input final_signal,
  
  //TIMER
  output reg [TIMER_COUNTER_WIDTH-1:0] counter_result);

initial begin
enable_counter = 0;
reset_counter  = 0;
done           = 0;
counter        = 0;
state          = 0;
counter_result = 0;
end

reg [TIMER_COUNTER_WIDTH-1:0] counter;
reg enable_counter;
reg reset_counter;
reg done;

always @(posedge ps_clk or posedge rst) begin
  if(rst|reset_counter) begin
    counter <= 0;
  end else begin
    if(enable_counter)
      counter <= counter + 1;      
  end
end

always @(negedge clk or posedge rst) begin
  if(rst) begin
    counter_result <= 0;
  end else begin
    if(done)
      counter_result <= counter;      
  end
end

parameter [2:0] S_IDLE = 2'd0;
parameter [2:0] S_COUNTER=2'd1;
parameter [2:0] S_RESULT=2'd2;


reg [2:0] state;

always @(state) begin
  case(state)
    S_IDLE:
      {enable_counter,reset_counter,done} = {1'b0,1'b1,1'b0};
    
    S_COUNTER:
      {enable_counter,reset_counter,done} = {1'b1,1'b0,1'b0};
    
    S_RESULT:
      {enable_counter,reset_counter,done} = {1'b0,1'b0,1'b1};
    
    default:
      {enable_counter,reset_counter,done} = {1'b0,1'b1,1'b0};
    
  endcase
end


always @(posedge clk or posedge rst) begin
  if(rst)
    state <= S_IDLE;
  else begin
    case(state) 
      S_IDLE:
        if( enable_signal )
          state <= S_COUNTER; 
        else
          state <= S_IDLE;
          
      S_COUNTER:
        if( final_signal )
          state <= S_RESULT; 
        else
          state <= S_COUNTER;
          
      S_RESULT:
        state <= S_IDLE;
        
      
      default:
          state <= S_IDLE; 
    endcase 
  end 
end 


  
endmodule 
