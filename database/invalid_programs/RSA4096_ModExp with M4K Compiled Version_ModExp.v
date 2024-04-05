// MonPro module
// follow this algorithm: http://cs.ucsb.edu/~koc/cs290g/docs/w01/mon1.pdf
`include "_parameter.v"

module ModExp
(
	input clk,
	input reset,
	output reg [`DATA_WIDTH - 1 : 0] res_out
);

	reg [`DATA_WIDTH - 1 : 0] m_in [`TOTAL_ADDR - 1 : 0];	// for m input
	reg [`DATA_WIDTH - 1 : 0] r_in [`TOTAL_ADDR - 1 : 0];	// for r input
	reg [`DATA_WIDTH - 1 : 0] t_in [`TOTAL_ADDR - 1 : 0];	// for t input
	reg [`DATA_WIDTH - 1 : 0] e_in [`TOTAL_ADDR - 1 : 0];	// for e input
	reg [`DATA_WIDTH - 1 : 0] nprime0 [0 : 0];	// a memory must have unpacked array! for readmemh
	reg [`DATA_WIDTH - 1 : 0] n_in [`TOTAL_ADDR - 1 : 0];	// for n input
	
	reg [`DATA_WIDTH - 1 : 0] m_bar [`TOTAL_ADDR - 1 : 0];	// multiple usage, to save regs
	reg [`DATA_WIDTH - 1 : 0] c_bar [`TOTAL_ADDR - 1 : 0];	// multiple usage, to save regs
	
	reg [`DATA_WIDTH - 1 : 0] z;
	reg [`DATA_WIDTH - 1 : 0] v [`TOTAL_ADDR + 1 : 0];
	reg [`DATA_WIDTH - 1 : 0] m;
	reg [2 : 0] state;	// for MonPro, can store 8 different states
	// Declare states
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7;
	
	reg [2 : 0] exp_state;	//	for MonExp
	parameter ES00 = 7, ES0 = 0, ES1 = 1, ES2 = 2, ES3 = 3, ES4 = 4, ES5 = 5, ES6 = 6;
							
	integer i;	// big loop i
	integer j;
	integer k;
	integer k_e1;
	integer k_e2;
	integer flag;
	
	reg [`DATA_WIDTH - 1 : 0] x0;
	reg [`DATA_WIDTH - 1 : 0] y0;
	reg [`DATA_WIDTH - 1 : 0] z0;
	reg [`DATA_WIDTH - 1 : 0] last_c0;
	wire [`DATA_WIDTH - 1 : 0] s0;
	wire [`DATA_WIDTH - 1 : 0] c0;
	mul_add mul_add0 (.clk(clk), .x(x0), .y(y0), .z(z0), .last_c(last_c0), 
                .s(s0), .c(c0));
	
	// for data initialization
	reg [`ADDR_WIDTH - 1 : 0] addr_buf;
	wire [`DATA_WIDTH - 1 : 0] m_buf;
	wire [`DATA_WIDTH - 1 : 0] r_buf;
	wire [`DATA_WIDTH - 1 : 0] e_buf;
	wire [`DATA_WIDTH - 1 : 0] t_buf;
	wire [`DATA_WIDTH - 1 : 0] nprime0_buf;
	wire [`DATA_WIDTH - 1 : 0] n_buf;
	reg [`DATA_WIDTH - 1 : 0] res_buf;
	m_mem m_mem0 (.address(addr_buf), .clock(clk), .q(m_buf));
	r_mem r_mem0 (.address(addr_buf), .clock(clk), .q(r_buf));
	e_mem e_mem0 (.address(addr_buf), .clock(clk), .q(e_buf));
	t_mem t_mem0 (.address(addr_buf), .clock(clk), .q(t_buf));
	nprime0_mem nprime0_mem0 (.address(addr_buf), .clock(clk), .q(nprime0_buf));
	n_mem n_mem0 (.address(addr_buf), .clock(clk), .q(n_buf));
	res_mem res_mem0 (.address(addr_buf), .clock(clk), .data(res_buf));
	
	
	initial begin	// set to 0 
		for(i = 0; i < `TOTAL_ADDR + 2; i = i + 1) begin
			v[i] = 8'h00000000;
		end
		
		res_out = 8'h00000000;
		
		z = 8'h00000000;	// initial C = 0
		i = 0;
		j = 0;
		k = 0;
		state = S0;
		exp_state = ES00;
		k_e1 = `TOTAL_ADDR - 1;
		k_e2 = `DATA_WIDTH - 1;
	end
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin	// reset all...
			res_out = 8'h00000000;
			z = 8'h00000000;	// initial C = 0
			i = 0;
			j = 0;
			k = 0;
			state = S0;
			exp_state = ES00;
			k_e1 = `TOTAL_ADDR - 1;
			k_e2 = `DATA_WIDTH - 1;
		end
		else begin
			case (exp_state)
				ES00:	// read in and initialize m, e, r, t, nprime0, n
				begin		// this 
					if(i <= `TOTAL_ADDR) begin
						if(k == 0) begin
							addr_buf = i;
							k = 1;
						end
						else begin
							k = 0;
							if(i == 0) begin
								m_in[0] = m_buf;
								r_in[0] = r_buf;
								e_in[0] = e_buf;
								t_in[0] = t_buf;
								n_in[0] = n_buf;
							end
							else begin	
								if(i == 1) begin
									nprime0[0] = nprime0_buf;
								end
														
								m_in[i - 1] = m_buf;
								r_in[i - 1] = r_buf;
								e_in[i - 1] = e_buf;
								t_in[i - 1] = t_buf;
								n_in[i - 1] = n_buf;
							end
							i = i + 1;
						end
					end
					else begin
						i = 0; 
						k = 0;
						exp_state = ES0;
					end
				end
				
				ES0:	// calculate m_bar = MonPro(m, t) and copy: c_bar = r
				begin
					case (state)
						S0: 
						begin	// vector(v) = x[0] * y + prev[vector(v)] + z
							if(k == 0) begin	// first clock: initial input 
								// initial a new multiplier computation
								x0 <= m_in[i];
								y0 <= t_in[j];
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
									state = S1;
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
									y0 <= n_in[0];
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
									y0 <= n_in[j];
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
							$display("Exp_state=ES0\tIn State S6!");
							// prepaer end state, update output, and set all to default
							// store into m_bar and c_bar
							for(i = 0; i < `TOTAL_ADDR; i = i + 1) begin
								m_bar[i] = v[i];
							end
							for(i = 0; i < `TOTAL_ADDR; i = i + 1) begin
								c_bar[i] = r_in[i];
							end
							for(i = 0; i < `TOTAL_ADDR + 2; i = i + 1) begin
								v[i] = 8'h00000000;
							end
							i = 0;
							j = 0;
							k = 0;
							state = S7;
						end
						
						S7:
						begin
							exp_state = ES1;	// go to next state
							state = S0;
						end
					endcase
				end
			
				ES1:	// a clock to initial the leftmost 1 in e = k_e
				begin
					if(e_in[k_e1][k_e2] == 1) begin
						$display("e_in[%d][%d] = %d", k_e1, k_e2, e_in[k_e1][k_e2]);
						exp_state = ES2;
					end
					else begin
						if(k_e2 == 0) begin
							k_e1 = k_e1 - 1;
							k_e2 = `DATA_WIDTH - 1;
						end
						else begin
							k_e2 = k_e2 - 1;
						end
					end
				end
			
				ES2:	// for i = k_e1 * `DATA_WIDTH + k_e2 downto 0
				begin
					case (state)	// c_bar = MonPro(c_bar, c_bar)
						S0: 
						begin	// vector(v) = x[0] * y + prev[vector(v)] + z
							if(k == 0) begin	// first clock: initial input 
								// initial a new multiplier computation
								x0 <= c_bar[i];
								y0 <= c_bar[j];
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
									state = S1;
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
									y0 <= n_in[0];
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
									y0 <= n_in[j];
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
							$display("Exp_state=ES2\tIn State S6!");
							// prepaer end state, update output, and set all to default
							// store into m_bar and c_bar
							for(i = 0; i < `TOTAL_ADDR; i = i + 1) begin
								c_bar[i] = v[i];
							end
							for(i = 0; i < `TOTAL_ADDR + 2; i = i + 1) begin
								v[i] = 8'h00000000;
							end
							i = 0;
							j = 0;
							k = 0;
							state = S7;
						end
						
						S7:
						begin
							$display("k_e1: %d, k_e2: %d", k_e1, k_e2);
							if(e_in[k_e1][k_e2] == 1) begin
								exp_state = ES3;	// go to c_bar = MonPro(c_bar, m_bar)
							end
							else begin
								if(k_e1 <= 0 && k_e2 <= 0)
									exp_state = ES4;
								else if(k_e2 == 0) begin	// down 1 of e
									k_e1 = k_e1 - 1;
									k_e2 = `DATA_WIDTH - 1;
								end else
									k_e2 = k_e2 - 1;
							end
							state = S0;
						end
					endcase				
				end
				
				ES3:	// c_bar = MonPro(c_bar, m_bar)
				begin
					case (state)	// c_bar = MonPro(c_bar, c_bar)
						S0: 
						begin	// vector(v) = x[0] * y + prev[vector(v)] + z
							if(k == 0) begin	// first clock: initial input 
								// initial a new multiplier computation
								x0 <= c_bar[i];
								y0 <= m_bar[j];
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
									y0 <= n_in[0];
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
									y0 <= n_in[j];
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
							$display("Exp_state=ES3\tIn State S6!");
							// prepaer end state, update output, and set all to default
							// store into m_bar and c_bar
							for(i = 0; i < `TOTAL_ADDR; i = i + 1) begin
								c_bar[i] = v[i];
							end
							for(i = 0; i < `TOTAL_ADDR + 2; i = i + 1) begin
								v[i] = 8'h00000000;
							end
							i = 0;
							j = 0;
							k = 0;
							state = S7;
						end
						
						S7:
						begin
							if(k_e1 <= 0 && k_e2 <= 0) begin
								exp_state = ES4;
								state = S0;
							end
							else begin
								if(k_e2 == 0) begin	// down 1 of e
									k_e1 = k_e1 - 1;
									k_e2 = `DATA_WIDTH - 1;
								end else
									k_e2 = k_e2 - 1;
								exp_state = ES2;
								state = S0;
							end
						end
					endcase					
				end
				
				ES4:	// c = MonPro(1, c_bar)
				begin
					case (state)	// c_bar = MonPro(c_bar, c_bar)
						S0: 
						begin	// vector(v) = x[0] * y + prev[vector(v)] + z
							if(i == 0) begin
								if(k == 0) begin	// first clock: initial input 
									// initial a new multiplier computation
									x0 <= 8'h00000001;
									y0 <= c_bar[j];
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
										state = S1;
									end
									k = 0;
								end 
							end
							else begin
								if(k == 0) begin	// first clock: initial input 
									// initial a new multiplier computation
									x0 <= 8'h00000000;
									y0 <= c_bar[j];
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
										state = S1;
									end
									k = 0;
								end 	
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
									y0 <= n_in[0];
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
									y0 <= n_in[j];
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
							$display("Exp_state=ES4\tIn State S6!");
							// prepare end state, update output, and set all to default
							// store into m_bar and c_bar
							for(i = 0; i < `TOTAL_ADDR; i = i + 1) begin
								c_bar[i] = v[i];
							end
							for(i = 0; i < `TOTAL_ADDR + 2; i = i + 1) begin
								v[i] = 8'h00000000;
							end
							i = 0;
							j = 0;
							k = 0;
							state = S7;
						end
						
						S7:
						begin
							exp_state = ES5;	// end state of exp!
							state = S0;
						end
					endcase		
				end
				
				ES5:	// output 4096 bits result (c_bar) to output buffer!
				begin
					if(i < `TOTAL_ADDR) begin
						res_out = c_bar[i];
						addr_buf <= i;
						res_buf <= c_bar[i];
						i = i + 1;
					end
					else begin
						exp_state = ES6;
						i = 0;
					end
				end
				
				ES6:
				begin
				
				end
			endcase
		end
	end
	
endmodule
	