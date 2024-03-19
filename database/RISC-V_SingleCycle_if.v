/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.

 * Description:
 * This file controls signal PC, it needs to send PC+4 and instruction to id.v
 * through inst_mem.v. For 5 stage stall, it need to keep PC.

 * Details:
 * - PC + 4 per cycle;
 * - PC value send to inst_mem as the address of instruction, then send the
 *   instruction to decode module;
 * - If current instruction is beq, blt or jal, update PC immediately.

 * History:
 * - 19/12/05: Create this file, add PC module;
 * - 19/12/23: Add UpdatePC module;
 * - 19/12/26: Edit module and change input/output;
 * - 19/12/18: Finished!

 * Notes:
 * - Take care that the module name can't be "if". Maybe it's a keep word.
 */

module PC(

	input	wire 		clk,
	input	wire		rst,
	input 	wire		Branch,  // if branch or not
	input 	wire[31:0] 	Addr,	 // target address
	output 	reg 	 	ce,
	output	reg [31:0] 	PC

);

/*
 * This always part controls the signal ce.
 */
always @ (posedge clk) begin
	if (rst)
		ce <= 1'b0;
	else
		ce <= 1'b1;
end

/*
 * This always part controls the signal PC.
 */
always @ (posedge clk) begin
	if (!ce)
		PC <= 32'b0;
	else if (Branch)
		PC <= Addr;
	else
		PC <= PC + 4'h4;  // New PC equals ((old PC) + 4) per cycle.
end

endmodule