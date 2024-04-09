// MonPro module
// follow this algorithm: http://cs.ucsb.edu/~koc/cs290g/docs/w01/mon1.pdf
`include "_parameter.v"

module monpro
(
	input clk,
	input reset
);

	reg [`DATA_WIDTH - 1 : 0] x [`TOTAL_ADDR - 1 : 0];
	reg [`DATA_WIDTH - 1 : 0] y [`TOTAL_ADDR - 1 : 0];
	reg [`DATA_WIDTH - 1 : 0] res [`TOTAL_ADDR - 1 : 0];	// result
	
	reg [`DATA_WIDTH - 1 : 0] nprime0 [0 : 0];	// a memory must have unpacked array!
	reg [`DATA_WIDTH - 1 : 0] n [`TOTAL_ADDR - 1 : 0];
	
	reg [`DATA_WIDTH - 1 : 0] z;
	reg [`DATA_WIDTH - 1 : 0] v [`TOTAL_ADDR + 1 : 0];
	reg [`DATA_WIDTH - 1 : 0] m;
	reg [2 : 0] state;	// can store 8 different states
	// Declare states
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7;
	
	integer i;	// big loop i
	integer j;
	integer k;
	
	initial begin	// set to 0 
		$readmemh("m.txt", x);
		$readmemh("e.txt", y);
		$readmemh("nprime0.txt", nprime0);
		$readmemh("n.txt", n);
		$readmemh("v.txt", v);
		
		z = 8'h00000000;	// initial C = 0
		i = 0;
		j = 0;
		k = 0;
		state = S0;
	end
	
	reg [`DATA_WIDTH - 1 : 0] x0;
	reg [`DATA_WIDTH - 1 : 0] y0;
	reg [`DATA_WIDTH - 1 : 0] z0;
	reg [`DATA_WIDTH - 1 : 0] last_c0;
	wire [`DATA_WIDTH - 1 : 0] s0;
	wire [`DATA_WIDTH - 1 : 0] c0;
	mul_add mul_add0 (.clk(clk), .x(x0), .y(y0), .z(z0), .last_c(last_c0), 
                .s(s0), .c(c0));
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			i <= 0;
			j <= 0;
			k <= 0;
			state <= S0;
		end
		else begin
			case (state)
				S0: 
				begin	// vector(v) = x[0] * y + prev[vector(v)] + z
					if(k == 0) begin	// first clock: initial input 
						// initial a new multiplier computation
						x0 <= x[i];
						y0 <= y[j];
						z0 <= v[j];
						last_c0 <= z;
						k = 1;
					end 
					else if(k == 1) begin	// second clock: store output
						// store the output of multiplier
						v[j] <= s0;
						z <= c0;
						j = j + 1;
						if(j == `TOTAL_ADDR) begin	// loop end
							j = 0;
							state = 1;
						end
						k = 0;
					end 
				end
				
				S1:
				begin // (C, S) = v[s] + C, v[s] = S, v[s + 1] = C
					if(k == 0) begin	// first clock: initial input 
						x0 <= 8'h00000000;
						y0 <= 8'h00000000;
						z0 <= v[`TOTAL_ADDR];
						last_c0 <= z;
						k = 1;
					end 
					else if(k == 1) begin
						v[`TOTAL_ADDR] <= s0;
						v[`TOTAL_ADDR + 1] <= c0;
						state = S2;
						k = 0;
					end 
				end
				
				S2:
				begin // m = (v[0] * n0_prime) mod 2^w
					if(k == 0) begin	// first clock: initial input 
						x0 <= v[0];
						y0 <= nprime0[0];
						z0 <= 8'h00000000;
						last_c0 <= 8'h00000000;
						k = 1;
					end
					else if(k == 1) begin
						m <= s0;	
						state = S3;
						k = 0;
					end
				end
				
				S3:	
				begin // vector(v) = (m * vector(n) + vector(v)) >> WIDTH
				// (C, S) = v[0] + m * n[0]
					if(j == 0) begin
						if(k == 0) begin	// first clock: initial input 
							x0 <= m;
							y0 <= n[0];
							z0 <= v[0];
							last_c0 <= 8'h00000000;
							k = 1;
						end		
						else if(k == 1) begin
							z <= c0;	
							j = j + 1;
							k = 0;
						end
					end
					else begin
						if(k == 0) begin
							x0 <= m;
							y0 <= n[j];
							z0 <= v[j];
							last_c0 <= z;
							k = 1;
						end
						else if(k == 1) begin
							v[j - 1] <= s0;
							z <= c0;	
							j = j + 1;						
							if(j == `TOTAL_ADDR) begin
								j = 0;
								state = S4;
							end
							k = 0;
						end
					end
				end
				
				S4:
				begin //	(C, S) = v[s] + C, v[s - 1] = S
					if(k == 0) begin
						x0 <= 8'h00000000;
						y0 <= 8'h00000000;
						z0 <= v[`TOTAL_ADDR];
						last_c0 <= z;
						k = 1;
					end
					else if(k == 1) begin
						v[`TOTAL_ADDR - 1] <= s0;
						z <= c0;	
						state = S5;
						k = 0;
					end
				end
				
				S5:
				begin // v[s] = v[s + 1] + C
					if(k == 0) begin
						x0 <= 8'h00000000;
						y0 <= 8'h00000000;
						z0 <= v[`TOTAL_ADDR + 1];
						last_c0 <= z;
						k = 1;
					end
					else if(k == 1) begin
						v[`TOTAL_ADDR] <= s0;
						i = i + 1;
						state = S0;
						if(i >= `TOTAL_ADDR) begin	// end
							state = S6;
							i = 0;
						end
						k = 0;
					end
				end
				
				S6:
				begin
					$display("In State S6!");
					// prepaer end state, update output
					for(i = 0; i < `TOTAL_ADDR; i = i + 1) begin
						res[i] <= v[i];
					end
					i = 0;
					$writememh("MonProResult.txt", res);
					state = S7;
				end
				
				S7:
				begin
					// end state
					// empty
				end
				
			endcase					
		end
	end
	
endmodule
	