// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input clk,
    input in,
	output [7:0] out_byte,
    input reset,    // Synchronous reset
    output done
); 

	parameter A=0,B=1,C=2,D=3,E=4,F=5,G=6,H=7,I=8,J=9,K=10,L=11;
	reg[3:0] state,next_state;
	reg[7:0] store;
	always @(*) begin
		case(state)
			A: begin
				// Case A or start
				next_state<=B;
			end
			B: begin
				// Case 1
				next_state<=C;
			end
			C: begin
				// Case 2
				next_state<=D;
			end
			D: begin
				// Case 3
				next_state<=E;
			end
			E: begin
				// Case 4
				next_state<=F;
			end
			F: begin
				// Case 5
				next_state<=G;
			end
			G: begin
				// Case 6
				next_state<=H;
			end
			H: begin
				// Case 7
				next_state<=I;
			end
			I: begin
				// Case 8
				next_state<=(in)?J:L;
			end
			J: begin
				// Case J or end
				next_state<=(~in)?A:K;
			end
			K: begin
				// Idle case
				next_state<=(~in)?A:K;
			end
			L: begin
				//error
				next_state<=(in)?K:L;
			end
			default:
				next_state<=K;
		endcase
	end

	always @(posedge clk) begin
		if(reset)
			state<=K;
		else
			state<=next_state;
	end
	assign done = (state==J);
	
	always @(posedge clk) begin
		if(reset)
			store<=8'd0;
		else if(next_state>A && next_state<J)
			//Note that the serial protocol sends the least significant bit first. 
			//store<={store[6:0],in};
			store<={in,store[7:1]};
	end
	assign out_byte=store;



endmodule
