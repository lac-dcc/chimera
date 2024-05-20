// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module alu (
	output reg [63:0] c, 		// 64-bit result
	input wire [4:0] op_code, 	// 5-bit opcode
	input wire [31:0] a,		// 32-bit operand A (from y)
	input wire [31:0] b,		// 32-bit operand B (from bus)
	input wire clk
);

// Intermediate wires for various operations
wire [31:0] and_result;
wire [31:0] or_result;
wire [31:0] add_result;	wire [0:0] add_carry;
wire [31:0] sub_result;
wire [63:0] mul_result;
wire [63:0] div_result;
wire [31:0] shr_result;
wire [31:0] shra_result;
wire [31:0] shl_result;
wire [31:0] ror_result;
wire [31:0] rol_result;
wire [31:0] neg_result;
wire [31:0] not_result;

// Instantiation of modules for operations
logical_and and_op(.a(a), .b(b), .result(and_result));
logical_or or_op(.a(a), .b(b), .result(or_result));
add add_op(.a(a), .b(b), .cin(0), .sum(add_result), .cout(add_carry));
sub sub_op(.a(a), .b(b), .cin(0), .sum(sub_result), .cout(cout));
mul mul_op(.m(a), .q(b), .out(mul_result));
div div_op(.a(a), .b(b), .result(div_result));
shr shr_op(.a(a), .b(b), .result(shr_result));
shra shra_op(.a(a), .b(b), .result(shra_result));
shl shl_op(.a(a), .b(b), .result(shl_result));
ror ror_op(.a(a), .b(b), .result(ror_result));
rol rol_op(.a(a), .b(b), .result(rol_result));
logical_neg neg_op(.b(b), .result(neg_result));
logical_not not_op(.b(b), .result(not_result));

// Opcodes for operations
localparam ld_opcode = 5'b00000;
localparam ldi_opcode = 5'b00001;
localparam st_opcode = 5'b00010;
localparam add_opcode = 5'b00011;
localparam sub_opcode = 5'b00100;
localparam shr_opcode = 5'b00101;
localparam shra_opcode = 5'b00110;
localparam shl_opcode = 5'b00111;
localparam ror_opcode = 5'b01000;
localparam rol_opcode = 5'b01001;
localparam and_opcode = 5'b01010;
localparam or_opcode = 5'b01011;
localparam addi_opcode = 5'b01100;
localparam andi_opcode = 5'b01101;
localparam ori_opcode = 5'b01110;
localparam mul_opcode = 5'b01111;
localparam div_opcode = 5'b10000;
localparam neg_opcode = 5'b10001;
localparam not_opcode = 5'b10010;

localparam branch_opcode = 5'b10011;

localparam jr_opcode = 5'b10100;
localparam jal_opcode = 5'b10101;

// Select the internal result based on the opcode
always @(*) begin
	case (op_code) 
		// FIXME: This is temporary for phase 1. This is to pass b to c when no op is selected
		ld_opcode: begin
			c[31:0] = add_result[31:0];
			c[63:32] = 32'b0;
		end

		ldi_opcode: begin
			c[31:0] = add_result[31:0];
			c[63:32] = 32'b0;
		end

		st_opcode: begin
			c[31:0] = add_result[31:0];
			c[63:32] = 32'b0;
		end

		and_opcode: begin
			c[31:0] = and_result;
			c[63:32] = 32'b0;
		end

		or_opcode: begin
			c[31:0] = or_result;
			c[63:32] = 32'b0;
		end

		add_opcode: begin
			c[31:0] = add_result;
			c[63:32] = 32'b0;
		end

		addi_opcode: begin
			c[31:0] = add_result;
			c[63:32] = 32'b0;
		end

		andi_opcode: begin
			c[31:0] = and_result;
			c[63:32] = 32'b0;
		end

		ori_opcode: begin
			c[31:0] = or_result;
			c[63:32] = 32'b0;
		end

		sub_opcode: begin
			c[31:0] = sub_result;
			c[63:32] = 32'b0;
		end

		mul_opcode: begin
			c[31:0] = mul_result[31:0];
			c[63:32] = mul_result[63:32];
		end

		div_opcode: begin
			c[31:0] = div_result[31:0];
			c[63:32] = div_result[63:32];
		end

		shr_opcode: begin
			c[31:0] = shr_result;
			c[63:32] = 32'b0;
		end

		shra_opcode: begin
			c[31:0] = shra_result;
			c[63:32] = 32'b0;
		end

		shl_opcode: begin
			c[31:0] = shl_result;
			c[63:32] = 32'b0;
		end

		ror_opcode: begin
			c[31:0] = ror_result;
			c[63:32] = 32'b0;
		end

		rol_opcode: begin
			c[31:0] = rol_result;
			c[63:32] = 32'b0;
		end

		neg_opcode: begin
			c[31:0] = neg_result;
			c[63:32] = 32'b0;
		end

		not_opcode: begin
			c[31:0] = not_result;
			c[63:32] = 32'b0;
		end

		branch_opcode: begin
			c[31:0] = add_result[31:0];
			c[63:32] = 32'b0;
		end

		jr_opcode: begin
			c[31:0] = add_result[31:0];
			c[63:32] = 32'b0;
		end

		jal_opcode: begin
			c[31:0] = add_result[31:0];
			c[63:32] = 32'b0;
		end
	endcase
end

endmodule
