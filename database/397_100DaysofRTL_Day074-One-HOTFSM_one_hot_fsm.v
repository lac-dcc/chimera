// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module one_hot_fsm (
  input clk, reset,
  output reg [3:0] state,
  output reg [1:0]out);

parameter [3:0] IDLE = 4'b0001,
                STATE1 = 4'b0010,
                STATE2 = 4'b0100,
                STATE3 = 4'b1000;

always @(posedge clk, posedge reset) begin
  if (reset) 
    begin
        state <= IDLE;
        out<= 2'b00;
    end 
    
  else 
    begin
    
    case(state)
    
      IDLE: begin
        out<= 2'b00;
        state <= STATE1;
      end
      
      STATE1: begin
        out<= 2'b01;
        state <= STATE2;
      end
      
      STATE2: begin
        out<= 2'b10;
        state <= STATE3;
      end
      
      STATE3: begin
        out<= 2'b11;
        state <= IDLE;
      end
      
      default: state <= IDLE;
      
    endcase
  end
end
endmodule