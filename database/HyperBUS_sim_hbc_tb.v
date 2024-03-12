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

`timescale 1ns/1ps 

module hbc_tb;

// Inputs
	reg i_clk;
	reg i_rstn;
	reg i_cfg_access;
	reg i_mem_valid;
	reg [3:0] i_mem_wstrb;
	reg [31:0] i_mem_addr;
	reg [31:0] i_mem_wdata;

	// Outputs
	wire o_mem_ready;
	wire [31:0] o_mem_rdata;
	wire o_csn0;
	wire o_csn1;
	wire o_clk;
	wire o_clkn;
	wire o_resetn;

	// Bidirs
	wire [7:0] io_dq;
	wire io_rwds;
	
	reg   [31:0] test_data [0:31];
	integer i, k;
	integer uint8_addr = 0;
	integer uint16_addr = 128;
	integer uint32_addr = 256;

hbc_wrapper hbc (
    .i_clk(i_clk), 
    .i_rstn(i_rstn), 
    .i_cfg_access(i_cfg_access), 
    .i_mem_valid(i_mem_valid), 
    .o_mem_ready(o_mem_ready), 
    .i_mem_wstrb(i_mem_wstrb), 
    .i_mem_addr(i_mem_addr), 
    .i_mem_wdata(i_mem_wdata), 
    .o_mem_rdata(o_mem_rdata), 
    .o_csn0(o_csn0), 
    .o_csn1(o_csn1), 
    .o_clk(o_clk), 
    .o_clkn(o_clkn), 
    .io_dq(io_dq), 
    .io_rwds(io_rwds), 
    .o_resetn(o_resetn)
    );
	 
s27kl0641 
	#(
	.TimingModel("S27KL0641DABHI000"))
	hyperram (
    .DQ7(io_dq[7]), 
    .DQ6(io_dq[6]), 
    .DQ5(io_dq[5]), 
    .DQ4(io_dq[4]), 
    .DQ3(io_dq[3]), 
    .DQ2(io_dq[2]), 
    .DQ1(io_dq[1]), 
    .DQ0(io_dq[0]), 
    .RWDS(io_rwds), 
    .CSNeg(o_csn0), 
    .CK(o_clk), 
    .RESETNeg(o_resetn)
    );


	initial begin
		// Initialize Inputs
		i_clk = 0;
		i_rstn = 0;
		i_cfg_access = 0;
		i_mem_valid = 0;
		i_mem_wstrb = 0;
		i_mem_addr = 0;
		i_mem_wdata = 0;

		
		#100;
      i_rstn = 1; 
		
		$display("Waiting for device power-up...");
		#160e6;
		$display("Reading the ID/CFG registers");
		
		i_cfg_access = 1;
		i_mem_valid  = 1;
		i_mem_wstrb  = 0;
		i_mem_addr   = 0;
		#10;
		i_mem_valid  = 0;
		wait(o_mem_ready == 1);
		$display("ID0: 0x%H", o_mem_rdata[15:0]);
		#20;
		i_mem_valid  = 1;
		i_mem_wstrb  = 0;
		i_mem_addr   = 2;
		#10;
		i_mem_valid  = 0;
		wait(o_mem_ready == 1);
		$display("ID1: 0x%H", o_mem_rdata[15:0]);
		#20;
		i_mem_valid  = 1;
		i_mem_wstrb  = 0;
		i_mem_addr   = 2048;
		#10;
		i_mem_valid  = 0;
		wait(o_mem_ready == 1);
		$display("CFG0: 0x%H", o_mem_rdata[15:0]);
		#20;
		i_mem_valid  = 1;
		i_mem_wstrb  = 0;
		i_mem_addr   = 2049;
		#10;
		i_mem_valid  = 0;
		wait(o_mem_ready == 1);
		$display("CFG1: 0x%H", o_mem_rdata[15:0]);
		#20;
		i_cfg_access = 0;
		test_data[0] = 32'hDEADBEEF;
		for(i = 1; i < 32; i = i + 1) begin
			test_data[i] = {test_data[i - 1][27:0], test_data[i - 1][31:28]};
		end
		#20;
		$display("UINT8_t test");
		for(i = 0; i < 32; i = i + 1) begin
			i_mem_wdata = test_data[i];
			i_mem_addr  = uint8_addr + (i << 2);
			for(k = 0; k < 4; k = k + 1) begin
				i_mem_valid = 1;
				i_mem_wstrb = (1 << k);
				#10;
				i_mem_valid = 0;
				wait(o_mem_ready == 1);
				#20;
			end
		end
		#20;
		$display("expected\tread\t\tstatus");
		i_mem_wstrb = 0;
		for(i = 0; i < 32; i = i + 1) begin
			i_mem_addr  = uint8_addr + (i << 2);
			for(k = 0; k < 4; k = k + 1) begin
				i_mem_valid = 1;
				#10;
				i_mem_valid = 0;
				wait(o_mem_ready == 1);
				if((o_mem_rdata & (255 << k*8)) == (test_data[i] & (255 << k*8))) begin
					$display("0x%H\t0x%H\tOK", (test_data[i] & (255 << k*8)), (o_mem_rdata & (255 << k*8)));
				end else begin
					$display("0x%H\t0x%H\tFAIL", (test_data[i] & (255 << k*8)), (o_mem_rdata & (255 << k*8)));
				end
				#20;
			end
		end
		#20;
		$display("UINT16_t test");
		for(i = 0; i < 32; i = i + 1) begin
			i_mem_wdata = test_data[i];
			i_mem_addr  = uint16_addr + (i << 2);
			for(k = 0; k < 2; k = k + 1) begin
				i_mem_valid = 1;
				i_mem_wstrb = (3 << (k*2));
				#10;
				i_mem_valid = 0;
				wait(o_mem_ready == 1);
				#20;
			end
		end
		#20;
		$display("expected\tread\t\tstatus");
		i_mem_wstrb = 0;
		for(i = 0; i < 32; i = i + 1) begin
			i_mem_addr  = uint8_addr + (i << 2);
			for(k = 0; k < 2; k = k + 1) begin
				i_mem_valid = 1;
				#10;
				i_mem_valid = 0;
				wait(o_mem_ready == 1);
				if((o_mem_rdata & (16'hFFFF << k*16)) == (test_data[i] & (16'hFFFF << k*16))) begin
					$display("0x%H\t0x%H\tOK", (test_data[i] & (16'hFFFF << k*16)), (o_mem_rdata & (16'hFFFF << k*16)));
				end else begin
					$display("0x%H\t0x%H\tFAIL", (test_data[i] & (16'hFFFF << k*16)), (o_mem_rdata & (16'hFFFF << k*16)));
				end
				#20;
			end
		end
		#20;
		$display("UINT32_t test");
		for(i = 0; i < 32; i = i + 1) begin
			i_mem_wdata = test_data[i];
			i_mem_addr  = uint32_addr + (i << 2);
			i_mem_valid = 1;
			i_mem_wstrb = 15;
			#10;
			i_mem_valid = 0;
			wait(o_mem_ready == 1);
			#20;
		end
		#20;
		$display("expected\tread\t\tstatus");
		i_mem_wstrb = 0;
		for(i = 0; i < 32; i = i + 1) begin
			i_mem_addr  = uint8_addr + (i << 2);
			i_mem_valid = 1;
			#10;
			i_mem_valid = 0;
			wait(o_mem_ready == 1);
			if(o_mem_rdata == test_data[i]) begin
				$display("0x%H\t0x%H\tOK", (test_data[i]), (o_mem_rdata));
			end else begin
				$display("0x%H\t0x%H\tFAIL", (test_data[i]), (o_mem_rdata));
			end
			#20;
		end
		#20;
		$stop;
	end
	
	always @(*) begin
		i_clk <= #5 ~i_clk;
	end 
	
endmodule