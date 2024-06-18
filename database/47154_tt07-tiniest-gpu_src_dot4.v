// This program was cloned from: https://github.com/pongsagon/tt07-tiniest-gpu
// License: Apache License 2.0

//`timescale 1ns / 1ps

// Q8.8
//fix   dot4(Vec4f v1, Vec4f v2){
//  return  multfix(v1.x,v2.x)+multfix(v1.y,v2.y)+multfix(v1.z,v2.z)+multfix(v1.w,v2.w);
//}


module dot4(
	input clk,
	input reset,
	input start,
	input signed [15:0] v1_x,
	input signed [15:0] v1_y,
	input signed [15:0] v1_z,
	input signed [15:0] v1_w,
	input signed [15:0] v2_x,
	input signed [15:0] v2_y,
	input signed [15:0] v2_z,
	input signed [15:0] v2_w,
	output reg done,
	output reg signed [15:0] result
	);

	
	reg signed [15:0] mul_a;  
	reg signed [15:0] mul_b;  
    wire signed [31:0] mul_result;  
    reg mul_start;
    wire mul_done;
    slowmpy #(.LGNA(4),.NA(16)) mul2 (.i_clk (clk), .i_reset(reset), .i_stb(mul_start),.i_a(mul_a)
    			,.i_b(mul_b),.i_aux(1'b0),.o_done(mul_done),.o_p(mul_result));


    reg [2:0] state;		// 5 states
    reg signed [15:0] tmp_vs_mul1;

    always @(posedge clk) begin
    	if (reset) begin
    		mul_a <= 0;
			mul_b <= 0;
			mul_start <= 0;
			//
			state <= 0;
			tmp_vs_mul1 <= 0;
			//
			done <= 0;
			result <= 0;
    	end
    	else begin
    		case (state)
    			0: begin
    				if (start) begin
    					mul_a <= v1_x;								
						mul_b <= v2_x;
						mul_start <= 1;
						done <= 0;
						state <= 1;
    				end
    			end 
    			1: begin
					mul_start <= 0;
					if (mul_done) begin
						tmp_vs_mul1 <= mul_result[23:8];		
						mul_a <= v1_y;					
						mul_b <= v2_y;		
						mul_start <= 1;
						state <= 2;
					end
				end
				2: begin
					mul_start <= 0;
					if (mul_done) begin
						tmp_vs_mul1 <= tmp_vs_mul1 + mul_result[23:8];		
						mul_a <= v1_z;					
						mul_b <= v2_z;		
						mul_start <= 1;
						state <= 3;
					end 
				end
				3: begin
					mul_start <= 0;
					if (mul_done) begin
						tmp_vs_mul1 <= tmp_vs_mul1 + mul_result[23:8];		
						mul_a <= v1_w;					
						mul_b <= v2_w;		
						mul_start <= 1;
						state <= 4;
					end 
				end
				4: begin
					mul_start <= 0;
					if (mul_done) begin
						result <= tmp_vs_mul1 + mul_result[23:8];		
						done <= 1;
						state <= 0;
					end 
				end
	    		default: begin
					
				end
			endcase
    	end

    end 


endmodule

