// Copyright 2017 Gnarly Grey LLC

// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:

// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


module hbc
	(
		input 			i_clk,
		input 			i_rstn,
		
		input 		  	i_cfg_access,
		input         	i_mem_valid,
		output        	o_mem_ready,
		input  [3:0]  	i_mem_wstrb,
		input  [31:0] 	i_mem_addr,
		input  [31:0] 	i_mem_wdata,
		output [31:0] 	o_mem_rdata,
		
		output       	o_csn0,
		output		 	o_csn1,
		output       	o_clk,
		output       	o_clkn,
		output [7:0] 	o_dq,
		input  [7:0] 	i_dq,
		output       	o_dq_de,
		output       	o_rwds,
		input        	i_rwds,
		output       	o_rwds_de,
		output       	o_resetn
	);
	
	// fsm states
	parameter IDLE 			= 0;
	parameter CAs 			= 1;
	parameter WR_LATENCY 	= 2;
	parameter WRITE 		= 3;
	parameter READ 			= 4;
	parameter DONE 			= 5;
	
	// write latency
	parameter WRITE_LATENCY = 6*2+10 - 1;
	
	reg 	[2:0] 	state;
	reg 	[47:0] 	ca;
	reg 	[31:0] 	wdata;
	reg 	[3:0]	wstrb;
	integer 		counter;

	reg 			mem_ready;
	reg 	[31:0] 	mem_rdata;
	reg 			rwds_d;
	wire 			rwds_valid;

	wire 	[7:0] 	ca_words[5:0];
	wire 	[7:0] 	wdata_words[3:0];
	wire 	[3:0] 	wstrb_words;
	
	// fsm
	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			ca 			<= 48'h0;
			state 		<= IDLE;
			mem_ready 	<= 1'b0;
			mem_rdata 	<= 0;
			counter 	<= 0;
		end else begin
			rwds_d <= i_rwds;
			case (state)
				IDLE : begin// wait for mem transaction
					mem_ready 		<= 1'b0;
					if(i_mem_valid && !mem_ready) begin
						ca[47] 		<= ~(|i_mem_wstrb);
						ca[46] 		<= i_cfg_access;
						ca[45] 		<= (|i_mem_wstrb) & i_cfg_access;
						ca[44:16] 	<= i_mem_addr[31:3];
						ca[15:3] 	<= 0;
						ca[2:0] 	<= i_mem_addr[2:0];
						wdata 		<= i_mem_wdata;
						wstrb 		<= i_mem_wstrb;
						counter		<= 5;
						state 		<= CAs;
					end
				end
				CAs: begin
					if(counter) begin
						counter 	<= counter - 1;
					end else if(ca[47]) begin // read
						counter 	<= 3;
						state   	<= READ;
					end else begin
						if (ca[46]) begin // write to register
							counter <= 1;
							state 	<= WRITE;
						end else begin // write to memory
							counter <= WRITE_LATENCY;
							state   <= WR_LATENCY;
						end
					end
				end
				WR_LATENCY: begin
					if(counter) begin
						counter <= counter - 1;
					end else begin
						counter <= 3;
						state 	<= WRITE;
					end 
				end
				WRITE: begin
					if(counter) begin
						counter <= counter - 1;
					end else begin
						state 	<= DONE;
					end 
				end 
				READ : begin
					if(rwds_valid) begin
						case (counter) 
							3: mem_rdata[15:8] 	<= i_dq;
							2: mem_rdata[7:0] 	<= i_dq;
							1: mem_rdata[31:24] <= i_dq;
							0: mem_rdata[23:16] <= i_dq;
						endcase	
						if(counter) begin
							counter <= counter - 1;
						end else begin 
							state 	<= DONE;
						end
					end
				end
				DONE: begin
					mem_ready 	<= 1'b1;
					state 		<= IDLE;
				end
			endcase 
		end 	
	end
	
	assign rwds_valid 		= (rwds_d | i_rwds);
	assign ca_words[5] 		= ca[47:40];
	assign ca_words[4] 		= ca[39:32];
	assign ca_words[3] 		= ca[31:24];
	assign ca_words[2] 		= ca[23:16];
	assign ca_words[1] 		= ca[15:8];
	assign ca_words[0] 		= ca[7:0];
	assign wdata_words[3] 	= wdata[15:8];
	assign wdata_words[2] 	= wdata[7:0];
	assign wdata_words[1] 	= ca[46]?wdata[15:8]:wdata[31:24];
	assign wdata_words[0] 	= ca[46]?wdata[7:0]:wdata[23:16];
	assign wstrb_words 		= {wstrb[1], wstrb[0], wstrb[3], wstrb[2]};
	
	reg bus_clk;
	always @(negedge i_clk or negedge i_rstn) begin
		if(!i_rstn)
			bus_clk <= 0;
		else
			bus_clk <= o_csn0 ? 0 : ~bus_clk;
	end
	
	assign o_csn0 		= 	(state == IDLE || state == DONE);
	assign o_csn1 		= 	1'b1;
	assign o_clk 		= 	bus_clk;
	assign o_clkn 		= 	~o_clk;
	assign o_resetn 	= 	i_rstn;
	assign o_dq 		= 	(state == CAs)?		ca_words[counter]:
							(state == WRITE)?	wdata_words[counter]:8'h0;
	assign o_rwds 		= 	(state == WRITE)?	~wstrb_words[counter]:1'b0;
	assign o_dq_de 		= 	(state == WRITE || state == CAs);
	assign o_rwds_de 	= 	(state == WRITE) && (~ca[46]);
	assign o_mem_ready 	=	mem_ready;
	assign o_mem_rdata 	= 	mem_rdata;

endmodule


