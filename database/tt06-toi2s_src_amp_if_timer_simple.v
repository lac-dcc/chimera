// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

module timer_simple(
     input clk_in, 
     input resetb,
     input timer_start,
     output timer_timeout 
     );
   parameter RELOAD_VAL = 16'h5000;
   reg [15:0] counter_reg; 
   reg timer_state_run;
   assign timer_timeout = (counter_reg == RELOAD_VAL) ?1'b1:1'b0; 
   
   always @(posedge clk_in)
   begin
       if (!resetb)
       begin 
         timer_state_run <= 0;
         counter_reg     <= RELOAD_VAL; 
       end 
       else
       begin 
         if (timer_state_run) 
         begin 
           counter_reg    <= counter_reg - 16'h0001 ;
           timer_state_run <= 1;
           if (counter_reg == 0)
           begin
             timer_state_run <= 0; 
           end  
           
         end 
         else 
         begin 
           counter_reg     <= RELOAD_VAL;
           timer_state_run <= 0;   
           if (timer_start) 
           begin 
             timer_state_run <= 1;   
             counter_reg    <= counter_reg - 16'h0001 ;
           end
         end 
       end
   
   end
endmodule
