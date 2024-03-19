module act_led(
       clk,
reset,
gmii_rxen,
gmii_txen,
r_act_sfp);
input clk;
input reset;
input gmii_rxen;
input gmii_txen;
output r_act_sfp;

reg [23:0] count_led;
reg r_act_sfp;
reg  [1:0]current_state;
parameter idle=2'b0,
          first =2'b01,
          second=2'b10;

always@(posedge clk or negedge reset)
   if(!reset)
	 begin
	  count_led <= 24'b0;
	  r_act_sfp <= 1'b1;		  
	  current_state <= idle;  
	 end
	 else
	 begin
      case(current_state)
       idle:
           begin 
            count_led <= 24'b0;           
            if((gmii_rxen == 1'b1)||(gmii_txen == 1'b1))
             begin
              r_act_sfp <= 1'b0;
             
              current_state <= first;
             end
             else
              begin
               r_act_sfp <= 1'b1;
               current_state <= idle;
              end
           end
        first:
           begin
            count_led <= count_led+1'b1; 
             if(count_led[23] == 1'b1)
              begin
               r_act_sfp <= 1'b1;
               count_led <= 24'b0;
               current_state <= second;
              end
              else
              begin
               current_state <= first;
              end
           end
         second:
            begin
             if(count_led[23] == 1'b1)
              begin              
               current_state <= idle;
              end
              else
               begin
                count_led <= count_led+1'b1; 
                current_state <= second;
               end
            end
         default:
            begin
             current_state <= idle;
            end 
       endcase
     end
 endmodule 