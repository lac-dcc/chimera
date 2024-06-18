// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

/*
main function:
1)allocate cpuid for pkt by the key
2)round robin mode & port bind mode in this module 

modify:
1)add in_fpgaac_cpuid_cs, module can work when this signal is valid  0:bit:round robin   1:port bind
tips: all fifo are showahead mode
*/
`timescale 1 ps / 1 ps
module DISPATHER_CPUID(
input clk,
input reset,

input in_fpgaac_cpuid_cs,
input [5:0] in_fpgaac_channel_num,
input [31:0] cpuid_valid,
input [4:0] in_input_key,
input in_input_ctl,
output reg out_input_ack,
output reg out_input_valid,
output reg [4:0] out_input_cpuid
);
reg current_cpuid_valid;
reg [4:0] cpuid_reg;
reg [2:0] current_state;
parameter	idle_s	=	3'd0,
			match_s	=	3'd1,
			judge_s = 3'd2,
			wait_s	=	3'd3;

always@(posedge clk or negedge reset) begin
	if(!reset) begin
		out_input_ack<=1'b0;
		out_input_valid<=1'b0;
		out_input_cpuid<=5'd0;
		cpuid_reg<=5'd0;
		current_state <= idle_s;
	end
	else begin
		case(current_state)	
			idle_s: begin//wait for the req signal(in_input_ctl) from Input module 
				out_input_ack<=1'b0;
				out_input_valid<=1'b0;
				current_cpuid_valid<=1'b0;
				if(in_input_ctl==1'b0) begin//Input module have not req for cpuid
					current_state <= idle_s;
				end
				else begin//
					if(in_fpgaac_cpuid_cs==1'b0) begin//round robin mode
						out_input_cpuid<=cpuid_reg;
					end
					else begin//port bind mode
						out_input_cpuid<=in_input_key;
					end
					current_state <= match_s;
				end
			end
			
			match_s: begin
					case(out_input_cpuid)
						5'd0: current_cpuid_valid <= cpuid_valid[0];
						5'd1: current_cpuid_valid <= cpuid_valid[1];
						5'd2: current_cpuid_valid <= cpuid_valid[2];
						5'd3: current_cpuid_valid <= cpuid_valid[3];
						5'd4: current_cpuid_valid <= cpuid_valid[4];
						5'd5: current_cpuid_valid <= cpuid_valid[5];
						5'd6: current_cpuid_valid <= cpuid_valid[6];
						5'd7: current_cpuid_valid <= cpuid_valid[7];
						5'd8: current_cpuid_valid <= cpuid_valid[8];
						5'd9: current_cpuid_valid <= cpuid_valid[9];
						5'd10: current_cpuid_valid <= cpuid_valid[10];
						5'd11: current_cpuid_valid <= cpuid_valid[11];
						5'd12: current_cpuid_valid <= cpuid_valid[12];
						5'd13: current_cpuid_valid <= cpuid_valid[13];
						5'd14: current_cpuid_valid <= cpuid_valid[14];
						5'd15: current_cpuid_valid <= cpuid_valid[15];
						5'd16: current_cpuid_valid <= cpuid_valid[16];
						5'd17: current_cpuid_valid <= cpuid_valid[17];
						5'd18: current_cpuid_valid <= cpuid_valid[18];
						5'd19: current_cpuid_valid <= cpuid_valid[19];
						5'd20: current_cpuid_valid <= cpuid_valid[20];
						5'd21: current_cpuid_valid <= cpuid_valid[21];
						5'd22: current_cpuid_valid <= cpuid_valid[22];
						5'd23: current_cpuid_valid <= cpuid_valid[23];
						5'd24: current_cpuid_valid <= cpuid_valid[24];
						5'd25: current_cpuid_valid <= cpuid_valid[25];
						5'd26: current_cpuid_valid <= cpuid_valid[26];
						5'd27: current_cpuid_valid <= cpuid_valid[27];
						5'd28: current_cpuid_valid <= cpuid_valid[28];
						5'd29: current_cpuid_valid <= cpuid_valid[29];
						5'd30: current_cpuid_valid <= cpuid_valid[30];
						5'd31: current_cpuid_valid <= cpuid_valid[31];
					endcase
					current_state <= judge_s;
			end
			
			judge_s: begin
				if(in_fpgaac_cpuid_cs==1'b0) begin//round robin mode
					if(cpuid_reg<in_fpgaac_channel_num-6'd1) begin//cpuid start from 0,and the num guide by software start from 1
						cpuid_reg<=cpuid_reg+5'd1;//round robin mode 
					end
					else begin//cpuid can't > the num guide by software     
						cpuid_reg<=5'd0;
					end
					if(current_cpuid_valid==1'b0) begin
						out_input_ack<=1'b0;
						out_input_valid<=1'b0;
						current_state <= idle_s;
					end
					else begin
						out_input_ack<=1'b1;//cpuid is valid,Input module can get it
						out_input_valid<=1'b1;
						current_state <= wait_s;
					end
				end
				else begin//port bind mode
					out_input_ack<=1'b1;//cpuid is valid,Input module can get it
					if(current_cpuid_valid==1'b0) begin
						out_input_valid<=1'b0;
					end
					else begin
						out_input_valid<=1'b1;
					end
					current_state <= wait_s;
				end
			end
			
			wait_s: begin//wait for req signal invalid after allocated cpuid
				if(in_input_ctl==1'b1) begin
					out_input_ack<=1'b1;
					current_state <= wait_s;
				end
				else begin
					out_input_ack<=1'b0;//cpuid is invalid
					current_state <= idle_s;
				end
			end
			
			
			default: begin
				out_input_ack<=1'b0;
				out_input_cpuid<=5'b0;
				cpuid_reg<=5'b0;
				current_state <= idle_s;
			end
		endcase
	end
end

endmodule