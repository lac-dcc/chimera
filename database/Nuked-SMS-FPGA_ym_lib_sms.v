// This program was cloned from: https://github.com/nukeykt/Nuked-SMS-FPGA
// License: GNU General Public License v2.0

module ymn_sr_bit #(parameter SR_LENGTH = 1)
	(
	input MCLK,
	input c1,
	input c2,
	input inp,
	output val,
	output nval
	);
	
	reg [SR_LENGTH-1:0] v1 = 0;
	reg [SR_LENGTH-1:0] v2 = 0;
	
	wire [SR_LENGTH-1:0] v2_assign = c2 ? v1 : v2;
	
	//assign sr_out = v2_assign[SR_LENGTH-1];
	assign val = v2[SR_LENGTH-1];
	assign nval = ~val;
	
	always @(posedge MCLK)
	begin
		if (c1)
		begin
			if (SR_LENGTH == 1)
				v1 <= inp;
			else
				v1 <= { v2[SR_LENGTH-2:0], inp };
		end
		v2 <= v2_assign;
	end
endmodule

module ymn_sr_bit_array #(parameter SR_LENGTH = 1, DATA_WIDTH = 1)
	(
	input MCLK,
	input c1,
	input c2,
	input [DATA_WIDTH-1:0] inp,
	output [DATA_WIDTH-1:0] val
	);
	
	wire out[0:DATA_WIDTH-1];
	
	generate
		genvar i;
		for (i = 0; i < DATA_WIDTH; i = i + 1)
		begin : l1
			ymn_sr_bit #(.SR_LENGTH(SR_LENGTH)) sr (
			.MCLK(MCLK),
			.c1(c1),
			.c2(c2),
			.inp(inp[i]),
			.val(out[i])
			);
			
			assign val[i] = out[i];
		end
	endgenerate

endmodule

module ymn_dlatch #(parameter DATA_WIDTH = 1)
	(
	input MCLK,
	input en,
	input [DATA_WIDTH-1:0] inp,
	output [DATA_WIDTH-1:0] val,
	output [DATA_WIDTH-1:0] nval
	);
	
	reg [DATA_WIDTH-1:0] mem = {DATA_WIDTH{1'h0}};
	
	wire [DATA_WIDTH-1:0] mem_assign = en ? inp : mem;
	
	always @(posedge MCLK)
	begin
		mem <= mem_assign;
	end
	
	//assign val = mem_assign;
	//assign nval = ~mem_assign;
	assign val = mem;
	assign nval = ~mem;
	
endmodule

module ymn_slatch #(parameter DATA_WIDTH = 1)
	(
	input MCLK,
	input en,
	input [DATA_WIDTH-1:0] inp,
	output [DATA_WIDTH-1:0] val,
	output [DATA_WIDTH-1:0] nval
	);
	
	reg [DATA_WIDTH-1:0] mem = {DATA_WIDTH{1'h0}};
	
	wire [DATA_WIDTH-1:0] mem_assign = en ? inp : mem;
	
	always @(posedge MCLK)
	begin
		mem <= mem_assign;
	end
	
	//assign val = mem_assign;
	//assign nval = ~mem_assign;
	assign val = mem;
	assign nval = ~mem;
	
endmodule

module ymn_rs_trig
	(
	input MCLK,
	input set,
	input rst,
	output reg q = 1'h0,
	output reg nq = 1'h1
	);
	
	always @(posedge MCLK)
	begin
		q <= rst ? 1'h0 : (set ? 1'h1 : q);
		nq <= set ? 1'h0 : (rst ? 1'h1 : ~q); 
	end
	
endmodule

module ymn_rs_trig2
	(
	input MCLK,
	input set,
	input rst,
	output reg q = 1'h0,
	output reg nq = 1'h1
	);
	
	always @(posedge MCLK)
	begin
		q <= set ? 1'h1 : (rst ? 1'h0 : q);
		nq <= rst ? 1'h1 : (set ? 1'h0 : ~q); 
	end
	
endmodule

module ymn_slatch_r #(parameter DATA_WIDTH = 1)
	(
	input MCLK,
	input en,
	input rst,
	input [DATA_WIDTH-1:0] inp,
	output [DATA_WIDTH-1:0] val,
	output [DATA_WIDTH-1:0] nval
	);
	
	reg [DATA_WIDTH-1:0] mem = {DATA_WIDTH{1'h0}};
	
	wire [DATA_WIDTH-1:0] mem_assign = rst ? {DATA_WIDTH{1'h0}} : (en ? inp : mem);
	
	always @(posedge MCLK)
	begin
		mem <= mem_assign;
	end
	
	//assign val = mem_assign;
	//assign nval = ~mem_assign;
	assign val = mem;
	assign nval = ~mem;
	
endmodule

module ymn_slatch_r2 #(parameter DATA_WIDTH = 1)
	(
	input MCLK,
	input en,
	input rst,
	input [DATA_WIDTH-1:0] inp,
	output [DATA_WIDTH-1:0] val,
	output [DATA_WIDTH-1:0] nval
	);
	
	reg [DATA_WIDTH-1:0] mem = {DATA_WIDTH{1'h0}};
	
	wire [DATA_WIDTH-1:0] mem_assign = en ? inp : (rst ? {DATA_WIDTH{1'h0}} : mem);
	
	always @(posedge MCLK)
	begin
		mem <= mem_assign;
	end
	
	//assign val = mem_assign;
	//assign nval = ~mem_assign;
	assign val = mem;
	assign nval = ~mem;
	
endmodule