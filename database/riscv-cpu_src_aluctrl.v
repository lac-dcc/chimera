// This program was cloned from: https://github.com/matiasilva/riscv-cpu
// License: GNU General Public License v3.0

/*
	this module produces the required ctrl signal for the ALU

	[aluop] is a 2-bit signal coming from the main ctrl unit

	00 -> ADD (for lw, sw)
	10 -> hand over ctrl to funct (essentially passthrough)
	11 -> not implemented
	01 -> SLTU (for beq)

	
	[funct] combines bit 5 of the funct7 field with all 3 bits of funct3
	TODO: can this be improved? we're wasting 6 out of 16 options

	[aluctrl_out] needs to be 4 bits wide to fit 10 operations
*/

module aluctrl (
    input  [1:0] ctrl_aluop_i,
    input  [3:0] funct_i,
    output [3:0] aluctrl_ctrl_o
);

  localparam ALUOP_ADD   = 2'b00;
  localparam ALUOP_FUNCT = 2'b10;
  localparam ALUOP_SLTU  = 2'b01;

  localparam ADD = 4'b0000;
  localparam SETLESSTHANUNSIGNED = 4'b0011;

  reg [3:0] ctrl;

  always @(*) begin
    ctrl = 4'hx;
    case (ctrl_aluop_i)
      ALUOP_ADD: begin
        // SW/LW -> add
        ctrl = ADD;
      end
      ALUOP_SLTU: begin
        ctrl = SETLESSTHANUNSIGNED;
      end
      ALUOP_FUNCT: begin
        ctrl = funct_i;
      end
    endcase
  end

  assign aluctrl_ctrl_o = ctrl;

endmodule
