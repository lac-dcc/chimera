// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

`timescale 1ns/1ns
module pkt_input_ctrl(
                    	     clk,
				              reset,
 				              cdp2um_tx_enable,
				              cdp2um_data_valid,
				              cdp2um_data,
				              
				              pkt_input_ctrl_wrreq,
				              pkt_input_ctrl_data,
				              pkt_input_ctrl_usedw,
				              pkt_input_ctrl_valid_wrreq,
				              pkt_input_ctrl_valid
  );
input clk;
input reset;
input pkt_input_ctrl_wrreq;
input [138:0] pkt_input_ctrl_data;
output  [7:0] pkt_input_ctrl_usedw;
input pkt_input_ctrl_valid_wrreq;
input pkt_input_ctrl_valid;

input cdp2um_tx_enable;
output cdp2um_data_valid;
output [138:0] cdp2um_data;

reg    [138:0] cdp2um_data;
reg    cdp2um_data_valid;

reg [2:0] state;
parameter idle=3'b000,
          transmit=3'b001,
          tail=3'b010;

always@(posedge clk or negedge reset)
if(!reset)
begin
  cdp2um_data_valid<=1'b0;
  state<=idle;
end
else 
begin
  case(state)
       idle:
           begin
             if(cdp2um_tx_enable)
              begin
               if((!pkt_input_ctrl_valid_empty)&&(pkt_input_ctrl_valid_q==1'b1))
                begin 
                  pkt_input_ctrl_valid_rdreq<=1'b1;
                  pkt_input_ctrl_rdreq<=1'b1;
                  state<=transmit;
                end
               else
                begin
					 state<=idle;
					 end
              end
             else
				  begin
              state<=idle;
				  end
           end
       transmit:
          begin
            pkt_input_ctrl_valid_rdreq<=1'b0;
            pkt_input_ctrl_rdreq<=1'b0;
            if(pkt_input_ctrl_q[138:136]==3'b110)//tail
             begin
               pkt_input_ctrl_rdreq<=1'b0;
               cdp2um_data_valid<=1'b1;  
               cdp2um_data<=pkt_input_ctrl_q;
               state<=tail;
             end
            else
             begin
               pkt_input_ctrl_rdreq<=1'b1;
               cdp2um_data_valid<=1'b1;  
               cdp2um_data<=pkt_input_ctrl_q;
               state<=transmit;
              end
            end
          tail:
            begin
               pkt_input_ctrl_rdreq<=1'b0;
					cdp2um_data_valid<=1'b0;  
               state<=idle;
            end
          default:
            begin
               cdp2um_data_valid<=1'b0;  
               state<=idle;
            end
			endcase
		end
    reg pkt_input_ctrl_rdreq;
    wire [138:0]pkt_input_ctrl_q;
    wire [7:0]pkt_input_ctrl_usedw;
    reg pkt_input_ctrl_valid_rdreq;
    wire pkt_input_ctrl_valid_q;
    wire pkt_input_ctrl_valid_empty;
fifo_256_139 pkt_input_ctrl_fifo(
	.aclr(!reset),
	.clock(clk),
	.data(pkt_input_ctrl_data),
	.rdreq(pkt_input_ctrl_rdreq),
	.wrreq(pkt_input_ctrl_wrreq),
	.q(pkt_input_ctrl_q),
	.usedw(pkt_input_ctrl_usedw)
   );     
fifo_64_1 pkt_input_ctrl_valid_fifo(
	.aclr(!reset),
	.clock(clk),
	.data(pkt_input_ctrl_valid),
	.rdreq(pkt_input_ctrl_valid_rdreq),
	.wrreq(pkt_input_ctrl_valid_wrreq),
	.empty(pkt_input_ctrl_valid_empty),
	.q(pkt_input_ctrl_valid_q)
   );
endmodule 