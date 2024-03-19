/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.

 * Description:
 * This file controls signal PC, it need to send PC+4 and instruction to id.v
 * through inst_mem.v. For 5 stage stall, it need to keep PC.

 * Details:
 * - PC + 4 per cycle;
 * - PC value send to inst_mem as the address of instruction, then send the
 *   instruction to decode module;
 * - If current instruction is beq, blt or jal, update PC immediately.

 * History:
 * - 19/12/27: Create this pipeline files;
 * - 19/12/28: Add branch predict;
 * - 19/12/29: Finished!

 * Notes:
 * - Take care that the module name can't be "if". Maybe it's a keep word.
 */

module PC(

	input	wire 		clk,
	input	wire		rst,
	input 	wire		Branch,
	input 	wire[31:0] 	Addr,
	input	wire[5:0]	stall,
	input	wire		PreBranch,  // predict
	input	wire[31:0]	PreAddr,
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
	else if (!(stall[0])) begin
		if (Branch)
			PC <= Addr;
		else if (PreBranch)
			PC <= PreAddr;
		else
			PC <= PC + 4'h4;  // New PC equals ((old PC) + 4) per cycle.
	end
end

endmodule