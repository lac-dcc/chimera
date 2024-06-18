// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

`define G2YDELAY 3
`define Y2RDELAY 2

module traffic_light_control(highway, small_road, sensor, clk, clr);
	
	input sensor, clk, clr;
	output reg [1:0] highway, small_road;
	
	parameter RED=2'd0, YELLOW=2'd1, GREEN=2'd2;
	
	parameter S0=3'd0,
              S1=3'd1,
              S2=3'd2,
              S3=3'd3,
              S4=3'd4;
	
	reg[2:0] state, next_state;
	
	always@(posedge clk)
		if(clr)
			state<=S0;
		else
			state<=next_state;
			
	always@(state) begin
		highway= GREEN;
		small_road= RED;
            
            case(state)
                S0:;
                S1: highway= YELLOW;
                S2: highway= RED;
                S3: begin
                        highway= RED;
                        small_road= GREEN;
                     end
                S4: begin
                        highway= RED;
                        small_road= YELLOW;
                     end
            endcase
    end
	
	always@(state or sensor) begin
		case(state)
		S0: if(sensor)
				next_state= S1;
			 else
				next_state= S0;
		S1: begin
				repeat (`G2YDELAY) next_state= S1;
				next_state= S2;
			 end
		S2: begin
				repeat (`Y2RDELAY) next_state= S2;
				next_state= S3;
			 end
		S3: begin
				if(sensor)
					next_state= S3;
				else
					next_state= S4;
			 end
		S4: begin
				repeat (`G2YDELAY) next_state= S4;
				next_state= S0;
			 end
		default: next_state= S0;
		endcase
	end
endmodule
