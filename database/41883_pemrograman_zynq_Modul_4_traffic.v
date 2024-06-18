// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

module traffic(clock,rst,en,state);

   input clock;
   input rst;
   input en;
   
   output state;
   
   parameter IDLE   = 2'd0;
   parameter GREEN  = 2'd1;
   parameter YELLOW = 2'd2;
   parameter RED    = 2'd3;
   
   reg  [1:0] state;
   wire [1:0] nextState;
   
   //state transition
   always@(posedge clock)
   begin
      if(!rst)
          state <= IDLE;
      else if(!en)
          state <= IDLE;
      else
          state <= nextState;
   end
   
   //next state logic
   assign nextState = (state == IDLE)&en   ? GREEN:
                      (state == GREEN)&en  ? YELLOW:
                      (state == YELLOW)&en ? RED:
                                             state; 
   
endmodule
