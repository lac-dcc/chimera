// This program was cloned from: https://github.com/matiasilva/riscv-cpu
// License: GNU General Public License v3.0

`timescale 1ns / 10ps

module alu_tb;

	localparam ALUCTRL_WIDTH = 4;
	localparam OP_ADD = 4'b0000;
	localparam OP_SUB = 4'b1000;
	localparam OP_SLT = 4'b0010;
	localparam OP_SLTU = 4'b0011;
	localparam OP_AND = 4'b0111;
	localparam OP_OR = 4'b0110;
	localparam OP_XOR = 4'b0100;
	localparam OP_SLL = 4'b0001;
	localparam OP_SRL = 4'b0101;
	localparam OP_SRA = 4'b1101;

	reg clk;
	reg rst_n;
	reg [31:0] a;
	reg [31:0] b;
	reg [ALUCTRL_WIDTH-1:0] aluctrl;

	wire [31:0] out;

	reg [255:0] wavetext;
	reg cond;
	integer scratch1;
	integer op_id;

	localparam CLK = 10;
	localparam HCLK = CLK * 0.5;
	localparam DLY = CLK * 0.01;
	localparam N_TESTS = 100;
	localparam N_OPS = 10;

	alu alu_u (
		.clk           (clk),
		.rst_n         (rst_n),
		.alu_a_i       (a),
		.alu_b_i       (b),
		.aluctrl_ctrl_i(aluctrl),
		.alu_out_o     (out)
	);

	initial begin
		$dumpfile("build/alu_tb.fst");
		$dumpvars(0, alu_tb);

	end

	function [ALUCTRL_WIDTH-1 : 0] get_op;
		input [3:0] id;
		begin
			case (id)
				0: get_op = OP_ADD;
				1: get_op = OP_SUB;
				2: get_op = OP_SLT;
				3: get_op = OP_SLTU;
				4: get_op = OP_AND;
				5: get_op = OP_OR;
				6: get_op = OP_XOR;
				7: get_op = OP_SLL;
				8: get_op = OP_SRL;
				9: get_op = OP_SRA;
			endcase
		end
	endfunction

	task assert_cond(input condition, input [255:0] str);
	begin
		if (!condition) begin 
			$strobe("ASSERTION FAILED! %s %b", str, condition); 
			wavetext <= str; 
			#HCLK $finish; 
		end
	end
	endtask

	task test_alu();
		begin
			for (integer i = 0; i < N_TESTS; i++) begin
				a <= $urandom;
				b <= $urandom;
				op_id = get_op(i % N_OPS);
				aluctrl <= op_id;
				@(posedge clk);
				#DLY; // wait for calculation to become available
				case (op_id)
					OP_ADD: assert_cond(out == (a+b), "a + b !== out");	 
					OP_SUB: assert_cond(out == (a-b), "a - b !== out");
					OP_SLT: assert_cond(out == ($signed(a)<$signed(b)), "a NOT < b");
					OP_SLTU: assert_cond(out == (a<b), "a NOT < b");
					OP_AND: assert_cond(out == (a&b), "a NOT & b");
					OP_OR: assert_cond(out == (a|b), "a NOT | b");
					OP_XOR: assert_cond(out == (a^b), "a ^ b !== out");
					OP_SLL: assert_cond(out == (a<<b[4:0]), "a SLL b !== out");
					OP_SRL: assert_cond(out == (a>>b[4:0]), "a SRL b !== out");
					OP_SRA: assert_cond(out == $unsigned($signed(a) >>> b[4:0]), "a SRA b !== out");
				endcase 

			end
		end
	endtask

	task init();
		begin
			@(posedge clk) rst_n <= 0;
			@(negedge clk) rst_n <= 1;
		end
	endtask

	initial begin
		a <= 0;
		b <= 0;
		aluctrl <= 0;
		clk <= 0;
		rst_n <= 1;
		init();
		wavetext <= "start of test";
		test_alu();
		$finish;
	end

	always #HCLK clk = ~clk;

endmodule