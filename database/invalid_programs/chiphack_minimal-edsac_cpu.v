module cpu #(parameter ABITS=10) (
	input clk,
	input rst,
	output memrd, memwr,
	input memwait,
	output [ABITS-1:0] memaddr,
	input [15:0] memrdata,
	output [15:0] memwdata,
	output [7:0] txdata,
	input [7:0] rxdata,
	input rxwait, txwait,
	output reg txstart, rxstart,
	output [ABITS-1:0] iaddrout,
	output [31:0] accout,
);

`define MULTICYCLE 1
	reg [31:0] acc;           // accumulator
	reg [ABITS-1:0] iaddr;    // instruction address
	reg [10:0] opr;           // decoded instruction operation
	reg [10:0] operand;       // decoded instruction operand
	reg [2:0] state;          // state of instruction cycle
	reg [5:0] xcycles;        // number of execute subcycles to perform

	assign iaddrout = iaddr;
	assign accout = acc;

	parameter HALTED = 0, FETCH = 1, DECODE = 2, EXECUTE = 3, RWMEM = 4;
	parameter OP_A = 1, OP_C = 2, OP_S = 3, OP_L = 4, OP_R = 5, OP_V = 6, OP_T = 7;
	parameter Mfetch = 3, Mstore = 4, Input = 5, Output = 6, Branch = 7, Brcond = 8, Halt = 9;

	// CPU control state machine
	wire [9:0] opdecode;
	wire [31:0] alu_output;
	wire iowait;
	always @(posedge clk)
	if (rst) begin
		iaddr <= 0;
		state <= FETCH;
		txstart <= 0;
		rxstart <= 0;
	end else begin
		if (~iowait) case (state)
		HALTED:
				;
		FETCH: begin
				txstart <= 0;
				if (~memwait) state <= DECODE;
			end
		DECODE: begin
				opr <= opdecode;
				operand <= memrdata[10:0];
				rxstart <= opdecode[Input];
				state <= opdecode[Halt] ? HALTED : 
					(opdecode[Mfetch]|opdecode[Mstore]) ? RWMEM :
					EXECUTE;
			end
		RWMEM: if (~memwait) state <= EXECUTE;
		EXECUTE: begin
				rxstart <= 0;
				txstart <= opr[Output];
				if (opr[Input])
					acc <= {8'b0,rxdata,16'b0};
				else
					acc <= alu_output;
				if (xcycles == 1) begin
					if (opr[Branch] & (acc[31] ~^ opr[Brcond]))
						iaddr <= operand[ABITS-1:0];
					else
						iaddr <= iaddr + 1;
					state <= FETCH;
				end
			end
		endcase
	end

	// memory and i/o signals
	assign memrd = (state == FETCH || (state == RWMEM && opr[Mfetch]));
	assign memwr = (state == RWMEM && opr[Mstore]);
	assign memaddr = state == FETCH ? iaddr : operand[ABITS-1:0];
	assign memwdata = acc[31:16];
	wire [31:0] opdata = {memrdata,16'b0};
	assign txdata = opdata[23:16];
	assign iowait = (rxstart&rxwait) | txwait;

	// Instruction decoder (combinational)
	wire [5:0] opcode = memrdata[15:11];
	always @* case (opcode)
		"A"-"@":	opdecode = OP_A | (1<<Mfetch);
		"C"-"@":	opdecode = OP_C | (1<<Mfetch);
		"E"-"@":	opdecode = (1<<Branch) | (0<<Brcond);
		"G"-"@":	opdecode = (1<<Branch) | (1<<Brcond);
		"I"-"@":	opdecode = (1<<Input);
		"L"-"@":	opdecode = OP_L;
		"O"-"@":	opdecode = (1<<Mfetch) | (1<<Output);
		"R"-"@":	opdecode = OP_R;
		"S"-"@":	opdecode = OP_S | (1<<Mfetch);
		"T"-"@":	opdecode = OP_T | (1<<Mstore);
		"U"-"@":	opdecode = (1<<Mstore);
		"V"-"@":	opdecode = OP_V | (1<<Mfetch);
		"Z"-"@":	opdecode = (1<<Halt);
		default:	opdecode = 0;
	endcase

	// Arithmetic logic unit (combinational)
	wire [31:0] partialproduct;
	wire [31:0] acc_tophalf = {{16{acc[31]}},acc[31:16]};
	wire [31:0] opdata_tophalf = {{16{opdata[31]}},opdata[31:16]};
	always @* case (opr[2:0])
		OP_A:	alu_output = acc + opdata;
		OP_C:	alu_output = {acc[31:16]&opdata[31:16],acc[15:0]};
		OP_S:	alu_output = acc - opdata;
`ifdef MULTICYCLE
		OP_L:	alu_output = acc << 1;
		OP_R: 	alu_output = $signed(acc) >> 1;
		OP_V:	alu_output = xcycles == 33 ? 0 : acc + partialproduct;
`else
		OP_L:	alu_output = acc << memrdata[5:0];
		OP_R: 	alu_output = $signed(acc) >> memrdata[5:0];
		OP_V:	alu_output = acc_tophalf * opdata_tophalf;
`endif
		OP_T:	alu_output = 0;
		default:	alu_output = acc;
	endcase

`ifdef MULTICYCLE
	// Sequential multiplier & shifter
	reg [31:0] multiplicand, multiplier;
	assign partialproduct = multiplier[0] ? multiplicand : 0;
	always @(posedge clk) case (state)
	DECODE:
		case (opdecode[2:0])
			OP_L, OP_R:
				xcycles <= memrdata[5:0];
			OP_V:
				xcycles <= 33;
			default:
				xcycles <= 1;
		endcase
	EXECUTE: begin
			if (xcycles == 33) begin
				multiplicand <= acc_tophalf;
				multiplier <= opdata_tophalf;
			end else begin
				multiplicand <= multiplicand << 1;
				multiplier <= multiplier >> 1;
			end
			xcycles <= xcycles - 1;
		end
	endcase
`else
	always @*
		xcycles = 1;
`endif

endmodule
