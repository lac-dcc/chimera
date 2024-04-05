// MonPro module
// follow this algorithm: http://cs.ucsb.edu/~koc/cs290g/docs/w01/mon1.pdf
`include "_parameter.v"

module ModExp
(
	input clk,
	input reset,
	input startInput,	// tell FPGA to start input 
	input startCompute,	// tell FPGA to start compute
	input getResult,	// tell FPGA to output result
	input [`DATA_WIDTH - 1 : 0] m_buf,	
	input [`DATA_WIDTH - 1 : 0] e_buf, 
	output reg [3 : 0] state,
	output reg [4 : 0] exp_state,	//	for MonExp
	output reg [`DATA_WIDTH - 1 : 0] res_out
);

	reg [`DATA_WIDTH - 1 : 0] m_in [`TOTAL_ADDR - 1 : 0];	// for m input
	reg [`DATA_WIDTH - 1 : 0] r_in [`TOTAL_ADDR - 1 : 0];	// for r input
	reg [`DATA_WIDTH - 1 : 0] t_in [`TOTAL_ADDR - 1 : 0];	// for t input
	reg [`DATA_WIDTH - 1 : 0] e_in [`TOTAL_ADDR - 1 : 0];	// for e input
	reg [`DATA_WIDTH - 1 : 0] nprime0;	// a memory must have unpacked array! for readmemh
	reg [`DATA_WIDTH - 1 : 0] n_in [`TOTAL_ADDR - 1 : 0];	// for n input
	
	reg [`DATA_WIDTH - 1 : 0] m_bar [`TOTAL_ADDR - 1 : 0];	// multiple usage, to save regs
	reg [`DATA_WIDTH - 1 : 0] c_bar [`TOTAL_ADDR - 1 : 0];	// multiple usage, to save regs
	
	reg [`DATA_WIDTH - 1 : 0] z;
	reg [`DATA_WIDTH - 1 : 0] v [`TOTAL_ADDR + 1 : 0];
	reg [`DATA_WIDTH - 1 : 0] m;
	// Declare states
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7;
	
	parameter INIT_STATE = 0, LOAD_M_E = 1, LOAD_N = 2, WAIT_COMPUTE = 3, CALC_M_BAR = 4, GET_K_E = 5, BIGLOOP = 6, CALC_C_BAR_M_BAR = 7, CALC_C_BAR_1 = 8, COMPLETE = 9, OUTPUT_RESULT = 10, TERMINAL = 11;
							
	integer i;	// big loop i
	integer j;
	integer k;
	integer k_e1;
	integer k_e2;
	
	reg [`DATA_WIDTH - 1 : 0] x0;
	reg [`DATA_WIDTH - 1 : 0] y0;
	reg [`DATA_WIDTH - 1 : 0] z0;
	reg [`DATA_WIDTH - 1 : 0] last_c0;
	wire [`DATA_WIDTH - 1 : 0] s0;
	wire [`DATA_WIDTH - 1 : 0] c0;
	mul_add mul_add0 (.clk(clk), .x(x0), .y(y0), .z(z0), .last_c(last_c0), 
                .s(s0), .c(c0));

	// for data initialization
	reg [`ADDR_WIDTH32 - 1 : 0] addr_buf;
	reg [1 : 0] addr_buf2;
	wire [`DATA_WIDTH32 - 1 : 0] r_buf;
	wire [`DATA_WIDTH32 - 1 : 0] t_buf;
	wire [`DATA_WIDTH32 - 1 : 0] nprime0_buf;
	wire [`DATA_WIDTH32 - 1 : 0] n_buf;
	reg [`DATA_WIDTH32 - 1 : 0] res_buf;
	r_mem r_mem0 (.address(addr_buf), .clock(clk), .q(r_buf));
	t_mem t_mem0 (.address(addr_buf), .clock(clk), .q(t_buf));
	nprime0_mem nprime0_mem0 (.address(addr_buf2), .clock(clk), .q(nprime0_buf));
	n_mem n_mem0 (.address(addr_buf), .clock(clk), .q(n_buf));
	
	initial begin	// set to 0 
		for(i = 0; i < `TOTAL_ADDR + 2; i = i + 1) begin
			v[i] = 64'h0000000000000000;
		end
		for(i = 0; i < `TOTAL_ADDR; i = i + 1) begin
			m_in[i] = 64'h0000000000000000;
			e_in[i] = 64'h0000000000000000;
		end
		res_out = 64'h0000000000000000;
		
		z = 64'h0000000000000000;	// initial C = 0
		i = 0;
		j = 0;
		k = 0;
		state = S0;
		exp_state = INIT_STATE;
		k_e1 = `TOTAL_ADDR - 1;
		k_e2 = `DATA_WIDTH - 1;
	end
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin	// reset all...
			for(i = 0; i < `TOTAL_ADDR + 2; i = i + 1) begin
				v[i] = 64'h0000000000000000;
			end
			for(i = 0; i < `TOTAL_ADDR; i = i + 1) begin
				m_in[i] = 64'h0000000000000000;
				e_in[i] = 64'h0000000000000000;
			end
			res_out = 64'h0000000000000000;
			z = 64'h0000000000000000;	// initial C = 0
			i = 0;
			j = 0;
			k = 0;
			state = S0;
			exp_state = INIT_STATE;
			k_e1 = `TOTAL_ADDR - 1;
			k_e2 = `DATA_WIDTH - 1;
		end
		else begin
			case (exp_state)
				INIT_STATE: // initial state
				begin
					if(startInput)
						exp_state = LOAD_M_E;
				end
			
				LOAD_M_E:	// read in and initialize m, e
				begin		
					if(i <= `TOTAL_ADDR) begin
						m_in[i] = m_buf;
						e_in[i] = e_buf;
						
						i = i + 1;
					end
					else begin
						i = 0;
						exp_state = LOAD_N;
					end
				end
				
				LOAD_N:		// read and initialize r, t, nprime0, n
				begin
					if(i <= `TOTAL_ADDR32) begin
						if(k == 0) begin
							addr_buf = i;
							if(i <= 2)
								addr_buf2 = i;
							else 
								addr_buf2 = 0;
							k = 1;
						end
						else begin
							k = 0;
							if(i > 0) begin
								if(i == 1)
									nprime0[0 +: `DATA_WIDTH32] = nprime0_buf;
								else if(i == 2)
									nprime0[`DATA_WIDTH32 +: `DATA_WIDTH32] = nprime0_buf;
									
								if((i - 1) % 2 == 0) begin
									t_in[(i - 1) / 2][0 +: `DATA_WIDTH32] = t_buf;
									n_in[(i - 1) / 2][0 +: `DATA_WIDTH32] = n_buf;
									r_in[(i - 1) / 2][0 +: `DATA_WIDTH32] = r_buf;
								end
								else if((i - 1) % 2 == 1) begin
									t_in[(i - 1) / 2][`DATA_WIDTH32 +: `DATA_WIDTH32] = t_buf;
									n_in[(i - 1) / 2][`DATA_WIDTH32 +: `DATA_WIDTH32] = n_buf;
									r_in[(i - 1) / 2][`DATA_WIDTH32 +: `DATA_WIDTH32] = r_buf;
								end
							end
							i = i + 1;
						end
					end
					else begin
						i = 0;
						j = 0;
						k = 0;
						exp_state = WAIT_COMPUTE;
					end				
				end
			
				WAIT_COMPUTE:
				begin
					if(startCompute) begin
						exp_state = CALC_M_BAR;		
					end					
				end
				
				CALC_M_BAR:	// calculate m_bar = MonPro(m, t) and copy: c_bar = r
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								y0 <= nprime0;
								z0 <= 64'h0000000000000000;
								last_c0 <= 64'h0000000000000000;
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
									last_c0 <= 64'h0000000000000000;
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								v[i] = 64'h0000000000000000;
							end
							z = 64'h0000000000000000;
							i = 0;
							j = 0;
							k = 0;
							state = S7;
						end
						
						S7:
						begin
							exp_state = GET_K_E;	// go to next state
							state = S0;
						end
					endcase
				end
			
				GET_K_E:	// a clock to initial the leftmost 1 in e = k_e
				begin
					if(e_in[k_e1][k_e2] == 1) begin
						$display("e_in[%d][%d] = %d", k_e1, k_e2, e_in[k_e1][k_e2]);
						exp_state = BIGLOOP;
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
			
				BIGLOOP:	// for i = k_e1 * `DATA_WIDTH + k_e2 downto 0
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								y0 <= nprime0;
								z0 <= 64'h0000000000000000;
								last_c0 <= 64'h0000000000000000;
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
									last_c0 <= 64'h0000000000000000;
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								v[i] = 64'h0000000000000000;
							end
							z = 64'h0000000000000000;
							i = 0;
							j = 0;
							k = 0;
							state = S7;
						end
						
						S7:
						begin
							$display("k_e1: %d, k_e2: %d", k_e1, k_e2);
							if(e_in[k_e1][k_e2] == 1) begin
								exp_state = CALC_C_BAR_M_BAR;	// go to c_bar = MonPro(c_bar, m_bar)
							end
							else begin
								if(k_e1 <= 0 && k_e2 <= 0)
									exp_state = CALC_C_BAR_1;
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
				
				CALC_C_BAR_M_BAR:	// c_bar = MonPro(c_bar, m_bar)
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								y0 <= nprime0;
								z0 <= 64'h0000000000000000;
								last_c0 <= 64'h0000000000000000;
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
									last_c0 <= 64'h0000000000000000;
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								v[i] = 64'h0000000000000000;
							end
							z = 64'h0000000000000000;
							i = 0;
							j = 0;
							k = 0;
							state = S7;
						end
						
						S7:
						begin
							if(k_e1 <= 0 && k_e2 <= 0) begin
								exp_state = CALC_C_BAR_1;
								state = S0;
							end
							else begin
								if(k_e2 == 0) begin	// down 1 of e
									k_e1 = k_e1 - 1;
									k_e2 = `DATA_WIDTH - 1;
								end else
									k_e2 = k_e2 - 1;
								exp_state = BIGLOOP;
								state = S0;
							end
						end
					endcase					
				end
				
				CALC_C_BAR_1:	// c = MonPro(1, c_bar)
				begin
					case (state)	// c_bar = MonPro(c_bar, c_bar)
						S0: 
						begin	// vector(v) = x[0] * y + prev[vector(v)] + z
							if(i == 0) begin
								if(k == 0) begin	// first clock: initial input 
									// initial a new multiplier computation
									x0 <= 64'h0000000000000001;
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
									x0 <= 64'h0000000000000000;
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								y0 <= nprime0;
								z0 <= 64'h0000000000000000;
								last_c0 <= 64'h0000000000000000;
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
									last_c0 <= 64'h0000000000000000;
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								x0 <= 64'h0000000000000000;
								y0 <= 64'h0000000000000000;
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
								v[i] = 0;
							end
							z = 64'h0000000000000000;
							i = 0;
							j = 0;
							k = 0;
							state = S7;
						end
						
						S7:
						begin
							exp_state = COMPLETE;	// end state of exp!
							state = S0;
						end
					endcase		
				end
				
				COMPLETE:
				begin
					if(getResult) begin
						exp_state = OUTPUT_RESULT;
					end				
				end
				
				OUTPUT_RESULT:	// output 4096 bits result (c_bar) to output buffer!
				begin
					if(i < `TOTAL_ADDR) begin
						res_out = c_bar[i];
						
						i = i + 1;
					end
					else begin
						exp_state = TERMINAL;
						i = 0;
						res_out = 64'h0000000000000000;
					end
				end
				
				TERMINAL:
				begin
					res_out = 64'h0000000000000000;
				end
			endcase
		end
	end
	
endmodule
	