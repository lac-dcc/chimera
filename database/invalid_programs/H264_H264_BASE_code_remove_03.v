`include "timescale.v"
`include "define.v"

module remove_03(
input clk,reset_n,

input ai_we,                 
input [15:0] ai_data, 
output ao_next,


input bi_next, 
output bo_we,                
output reg [15:0] bo_data,

output reg [1:0] remove_03_flag

);

localparam
     STATE_D = 0,
     STATE_A = 1,
     STATE_B = 2;

reg [15:0] last;
reg [1:0]  state_next,state;

wire found03,found03_j,found03_k;

assign found03_j = (last[15:0] == 16'h0000) && (ai_data[15:8] == 8'h03   );
assign found03_k = (last[ 7:0] == 8'h00  ) && (ai_data[15:0] == 16'h0003);
assign found03   = found03_j || found03_k;

assign bo_we   = !((state == STATE_D) && found03) && ai_we ;
assign ao_next = bi_next || ((state == STATE_D) && found03);

always @(posedge clk  or negedge reset_n)
      if (reset_n == 0) 
         state <= STATE_D;
      else if (ai_we && ao_next) //&& (bo_we && bi_next))
           state <= state_next;


always @(state or found03_k or found03_j)   
	case (state)
        STATE_D: 
           if (found03_k) 	state_next = STATE_A;
           else if (found03_j)  state_next = STATE_B;
	   else			state_next = STATE_D;
        STATE_A: 
          state_next = STATE_B;
        STATE_B: 
           if (found03_k)  	state_next = STATE_D;
           else if (found03_j)  state_next = STATE_D;
	   else			state_next = STATE_B;
        default: 
          state_next = STATE_D;
      endcase

always @(state or ai_data or last)   
      case (state)
        STATE_D: bo_data = ai_data;
        STATE_A: bo_data = {last[15:8], ai_data[15:8]};
        STATE_B: 
          if (found03_j)
            bo_data = {last[ 7:0], ai_data[ 7:0]};
          else
            bo_data = {last[ 7:0], ai_data[15:8]};
        default: bo_data = ai_data;
      endcase



always @(posedge clk  or negedge reset_n)
	if (reset_n == 0)  
        	last <= 1;
	else if (ai_we && ao_next) 
		last <= ai_data;

reg last_state_D,last_state_B;
always @(posedge clk  or negedge reset_n)
	if (reset_n == 0) 
		last_state_D <= 0;
	else if(state == STATE_D)
		last_state_D <= 1;
	else 	
		last_state_D <= 0;

always@(posedge clk  or negedge reset_n)
	if (reset_n == 0) 
		last_state_B <= 0;
	else if(state == STATE_B && found03_k)
		last_state_B <= 1;
	else 	
		last_state_B <= 0;



always @(state or last_state_D or last_state_B or found03_j)   
	case (state)
	STATE_D:remove_03_flag = last_state_B ? 1 : 0;
	STATE_A:remove_03_flag = 2;
	STATE_B:remove_03_flag = last_state_D ? 1 : found03_j ? 2 : 0;
	default:;
	endcase
	






endmodule
